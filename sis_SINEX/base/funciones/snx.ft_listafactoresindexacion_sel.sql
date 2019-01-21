-- FUNCTION: snx.ft_listafactoresindexacion_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_listafactoresindexacion_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_listafactoresindexacion_sel(
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
 FUNCION: 		snx.ft_listafactoresindexacion_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tlistafactoresindexacion'
 AUTOR: 		 (admin)
 FECHA:	        31-07-2018 21:00:40
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				31-07-2018 21:00:40								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tlistafactoresindexacion'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_listafactoresindexacion_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_LIFACIN_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		31-07-2018 21:00:40
	***********************************/

	if(p_transaccion='SNX_LIFACIN_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						lifacin.id_factorindexacion,
						lifacin.estado_reg,
						lifacin.factorindexacion,
						lifacin.id_usuario_ai,
						lifacin.usuario_ai,
						lifacin.fecha_reg,
						lifacin.id_usuario_reg,
						lifacin.id_usuario_mod,
						lifacin.fecha_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod	
						from snx.tlistafactoresindexacion lifacin
						inner join segu.tusuario usu1 on usu1.id_usuario = lifacin.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = lifacin.id_usuario_mod
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_LIFACIN_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		31-07-2018 21:00:40
	***********************************/

	elsif(p_transaccion='SNX_LIFACIN_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_factorindexacion)
					    from snx.tlistafactoresindexacion lifacin
					    inner join segu.tusuario usu1 on usu1.id_usuario = lifacin.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = lifacin.id_usuario_mod
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

ALTER FUNCTION snx.ft_listafactoresindexacion_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;