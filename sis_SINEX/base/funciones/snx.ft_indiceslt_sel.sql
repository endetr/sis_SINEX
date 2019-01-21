-- FUNCTION: snx.ft_indiceslt_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_indiceslt_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_indiceslt_sel(
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
 FUNCION: 		snx.ft_indiceslt_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tindiceslt'
 AUTOR: 		 (admin)
 FECHA:	        23-07-2018 15:53:45
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				23-07-2018 15:53:45								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tindiceslt'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_indiceslt_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_INDLT_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		23-07-2018 15:53:45
	***********************************/

	if(p_transaccion='SNX_INDLT_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						indlt.id_indicelt,
						indlt.id_indicetipo,
						indlt.id_ambitoprecio,
						indlt.id_unidad,
						indlt.valorindice,
						indlt.estado_reg,
						indlt.indicelt,
						indlt.id_usuario_ai,
						indlt.usuario_ai,
						indlt.fecha_reg,
						indlt.id_usuario_reg,
						indlt.id_usuario_mod,
						indlt.fecha_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
						amp.ambitoprecio,
						indt.indicetipo,
						uni.unidadabrev
						from snx.tindiceslt indlt
						inner join segu.tusuario usu1 on usu1.id_usuario = indlt.id_usuario_reg
						inner join snx.tambitoprecio amp on indlt.id_ambitoprecio = amp.id_ambitoprecio
						inner join snx.tindicetipo indt on indlt.id_indicetipo = indt.Id_indicetipo
						inner join snx.tunidad uni on indlt.id_unidad = uni.id_unidad
						left join segu.tusuario usu2 on usu2.id_usuario = indlt.id_usuario_mod
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_INDLT_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		23-07-2018 15:53:45
	***********************************/

	elsif(p_transaccion='SNX_INDLT_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_indicelt)
					    from snx.tindiceslt indlt
					    inner join segu.tusuario usu1 on usu1.id_usuario = indlt.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = indlt.id_usuario_mod
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

ALTER FUNCTION snx.ft_indiceslt_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;