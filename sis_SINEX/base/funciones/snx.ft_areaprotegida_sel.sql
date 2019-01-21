-- FUNCTION: snx.ft_areaprotegida_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_areaprotegida_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_areaprotegida_sel(
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
 FUNCION: 		snx.ft_areaprotegida_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tareaprotegida'
 AUTOR: 		 (admin)
 FECHA:	        05-09-2018 13:04:44
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				05-09-2018 13:04:44								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tareaprotegida'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_areaprotegida_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_ZONP_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		05-09-2018 13:04:44
	***********************************/

	if(p_transaccion='SNX_ZONP_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						zonp.id_areaprotegida,
						zonp.areaprotegida,
						zonp.estado_reg,
						zonp.id_usuario_ai,
						zonp.id_usuario_reg,
						zonp.usuario_ai,
						zonp.fecha_reg,
						zonp.fecha_mod,
						zonp.id_usuario_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod	
						from snx.tareaprotegida zonp
						inner join segu.tusuario usu1 on usu1.id_usuario = zonp.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = zonp.id_usuario_mod
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_ZONP_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		05-09-2018 13:04:44
	***********************************/

	elsif(p_transaccion='SNX_ZONP_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_areaprotegida)
					    from snx.tareaprotegida zonp
					    inner join segu.tusuario usu1 on usu1.id_usuario = zonp.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = zonp.id_usuario_mod
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

ALTER FUNCTION snx.ft_areaprotegida_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;