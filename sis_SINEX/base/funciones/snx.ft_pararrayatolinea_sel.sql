-- FUNCTION: snx.ft_pararrayatolinea_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_pararrayatolinea_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_pararrayatolinea_sel(
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
 FUNCION: 		snx.ft_pararrayatolinea_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tpararrayatolinea'
 AUTOR: 		 (admin)
 FECHA:	        07-05-2018 19:37:48
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				07-05-2018 19:37:48								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tpararrayatolinea'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_pararrayatolinea_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_PRL_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		07-05-2018 19:37:48
	***********************************/

	if(p_transaccion='SNX_PRL_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						prl.id_pararrayolinea,
						prl.estado_reg,
						prl.pararrayolinea,
						prl.id_usuario_ai,
						prl.id_usuario_reg,
						prl.usuario_ai,
						prl.fecha_reg,
						prl.id_usuario_mod,
						prl.fecha_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod	
						from snx.tpararrayatolinea prl
						inner join segu.tusuario usu1 on usu1.id_usuario = prl.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = prl.id_usuario_mod
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_PRL_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		07-05-2018 19:37:48
	***********************************/

	elsif(p_transaccion='SNX_PRL_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_pararrayolinea)
					    from snx.tpararrayatolinea prl
					    inner join segu.tusuario usu1 on usu1.id_usuario = prl.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = prl.id_usuario_mod
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

ALTER FUNCTION snx.ft_pararrayatolinea_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;