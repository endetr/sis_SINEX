-- FUNCTION: snx.ft_terrenolt_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_terrenolt_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_terrenolt_sel(
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
 FUNCION: 		snx.ft_terrenolt_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tterrenolt'
 AUTOR: 		 (admin)
 FECHA:	        03-08-2018 19:41:41
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				03-08-2018 19:41:41								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tterrenolt'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_terrenolt_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_TLT_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		03-08-2018 19:41:41
	***********************************/

	if(p_transaccion='SNX_TLT_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						tlt.id_terrenolt,
						tlt.estado_reg,
						tlt.terrenolt,
						tlt.id_usuario_ai,
						tlt.fecha_reg,
						tlt.usuario_ai,
						tlt.id_usuario_reg,
						tlt.id_usuario_mod,
						tlt.fecha_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod	
						from snx.tterrenolt tlt
						inner join segu.tusuario usu1 on usu1.id_usuario = tlt.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = tlt.id_usuario_mod
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_TLT_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		03-08-2018 19:41:41
	***********************************/

	elsif(p_transaccion='SNX_TLT_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_terrenolt)
					    from snx.tterrenolt tlt
					    inner join segu.tusuario usu1 on usu1.id_usuario = tlt.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = tlt.id_usuario_mod
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

ALTER FUNCTION snx.ft_terrenolt_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;