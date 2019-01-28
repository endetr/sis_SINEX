-- FUNCTION: snx.ft_materiallt_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_materiallt_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_materiallt_sel(
	p_administrador integer,
	p_id_usuario integer,
	p_tabla character varying,
	p_transaccion character varying)
    RETURNS character varying
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
AS $BODY$

/**************************************************************************
 SISTEMA:		SINEX
 FUNCION: 		snx.ft_materiallt_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tmateriallt'
 AUTOR: 		 (admin)
 FECHA:	        19-07-2018 14:36:34
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				19-07-2018 14:36:34								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tmateriallt'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_materiallt_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_MTLT_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		19-07-2018 14:36:34
	***********************************/

	if(p_transaccion='SNX_MTLT_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						mtlt.id_materiallt,
						mtlt.peso,
						mtlt.id_unidad,
						mtlt.estado_reg,
						mtlt.materiallt,
						mtlt.id_usuario_ai,
						mtlt.id_usuario_reg,
						mtlt.fecha_reg,
						mtlt.usuario_ai,
						mtlt.id_usuario_mod,
						mtlt.fecha_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
						uni.unidadabrev as unidadabrev,
						cast(snx.calcularpreciomateriallt(mtlt.id_materiallt) as numeric(18,2)) AS valorunitario,
						mtlt.id_factorindexacion,
						lifacin.factorindexacion as desc_factorindexacion,
						mtlt.id_ambitoprecio,
						apre.ambitoprecio
						from snx.tmateriallt mtlt
						inner join segu.tusuario usu1 on usu1.id_usuario = mtlt.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = mtlt.id_usuario_mod
						inner join snx.tunidad uni on uni.id_unidad = mtlt.id_unidad
				        left join snx.tlistafactoresindexacion lifacin on mtlt.id_factorindexacion = lifacin.id_factorindexacion
						left join snx.tambitoprecio apre on mtlt.id_ambitoprecio = apre.id_ambitoprecio
						where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MTLT_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		19-07-2018 14:36:34
	***********************************/

	elsif(p_transaccion='SNX_MTLT_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_materiallt)
					    from snx.tmateriallt mtlt
					    inner join segu.tusuario usu1 on usu1.id_usuario = mtlt.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = mtlt.id_usuario_mod
					    left join snx.tlistafactoresindexacion lifacin on mtlt.id_factorindexacion = lifacin.id_factorindexacion
						where ';
			
			--Definicion de la respuesta		    
			v_consulta:=v_consulta||v_parametros.filtro;

			--Devuelve la respuesta
			return v_consulta;

		end;
					
	else
					     
		raise exception 'Transaccion inexistente';
					         
	end if;
					
EXCEPTION
					
	WHEN OTHERS THEN
			v_resp='';
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje',SQLERRM);
			v_resp = pxp.f_agrega_clave(v_resp,'codigo_error',SQLSTATE);
			v_resp = pxp.f_agrega_clave(v_resp,'procedimientos',v_nombre_funcion);
			raise exception '%',v_resp;
END;

$BODY$;

ALTER FUNCTION snx.ft_materiallt_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;