-- FUNCTION: snx.ft_maquinaria_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_maquinaria_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_maquinaria_sel(
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
 FUNCION: 		snx.ft_maquinaria_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tmaquinaria'
 AUTOR: 		 (admin)
 FECHA:	        22-03-2018 19:06:44
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				22-03-2018 19:06:44								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tmaquinaria'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_maquinaria_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_MAQ_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		22-03-2018 19:06:44
	***********************************/

	if(p_transaccion='SNX_MAQ_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						maq.id_maquinaria,
						maq.estado_reg,
						maq.potencia,
						maq.peso,
						maq.maquinaria,
						maq.usuario_ai,
						maq.fecha_reg,
						maq.id_usuario_reg,
						maq.id_usuario_ai,
						maq.id_usuario_mod,
						maq.fecha_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
						cast(snx.calcularpreciomaquinaria(maq.id_maquinaria) as numeric(18,2)) as valor,
						cast(snx.calcularpreciomaquinariamate(maq.id_maquinaria) as numeric(18,2)) as valormat,
						maq.id_factorindexacion,
						lifacin.factorindexacion as desc_factorindexacion,
						maq.id_tipopreciomaquinaria,
						tpmaq.tipopreciomaquinaria,
						maq.id_ambitoprecio,
						apre.ambitoprecio
						from snx.tmaquinaria maq
						inner join segu.tusuario usu1 on usu1.id_usuario = maq.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = maq.id_usuario_mod
				        left join snx.tlistafactoresindexacion lifacin on maq.id_factorindexacion = lifacin.id_factorindexacion
						left join snx.ttipopreciomaquinaria tpmaq on maq.id_tipopreciomaquinaria = tpmaq.id_tipopreciomaquinaria
						left join snx.tambitoprecio apre on maq.id_ambitoprecio = apre.id_ambitoprecio
						where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MAQ_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		22-03-2018 19:06:44
	***********************************/

	elsif(p_transaccion='SNX_MAQ_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_maquinaria)
					    from snx.tmaquinaria maq
					    inner join segu.tusuario usu1 on usu1.id_usuario = maq.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = maq.id_usuario_mod
					    left join snx.tlistafactoresindexacion lifacin on maq.id_factorindexacion = lifacin.id_factorindexacion
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

ALTER FUNCTION snx.ft_maquinaria_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;