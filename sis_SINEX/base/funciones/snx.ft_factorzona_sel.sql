-- FUNCTION: snx.ft_factorzona_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_factorzona_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_factorzona_sel(
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
 FUNCION: 		snx.ft_factorzona_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tfactorzona'
 AUTOR: 		 (admin)
 FECHA:	        12-06-2018 14:56:11
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				12-06-2018 14:56:11								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tfactorzona'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_factorzona_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_FTZ_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		12-06-2018 14:56:11
	***********************************/

	if(p_transaccion='SNX_FTZ_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						ftz.id_factorzona,
						ftz.calificacion,
						ftz.estado_reg,
						ftz.distanciaini,
						ftz.factor,
						ftz.distanciafin,
						ftz.fecha_reg,
						ftz.usuario_ai,
						ftz.id_usuario_reg,
						ftz.id_usuario_ai,
						ftz.fecha_mod,
						ftz.id_usuario_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod	
						from snx.tfactorzona ftz
						inner join segu.tusuario usu1 on usu1.id_usuario = ftz.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = ftz.id_usuario_mod
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_FTZ_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		12-06-2018 14:56:11
	***********************************/

	elsif(p_transaccion='SNX_FTZ_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_factorzona)
					    from snx.tfactorzona ftz
					    inner join segu.tusuario usu1 on usu1.id_usuario = ftz.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = ftz.id_usuario_mod
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

ALTER FUNCTION snx.ft_factorzona_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;