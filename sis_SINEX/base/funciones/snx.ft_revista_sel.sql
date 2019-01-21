-- FUNCTION: snx.ft_revista_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_revista_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_revista_sel(
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
 FUNCION: 		snx.ft_revista_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.trevista'
 AUTOR: 		 (admin)
 FECHA:	        17-09-2018 13:04:24
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				17-09-2018 13:04:24								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.trevista'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_revista_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_REV_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		17-09-2018 13:04:24
	***********************************/

	if(p_transaccion='SNX_REV_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						rev.id_revista,
						rev.revista,
						rev.estado_reg,
						rev.usuario_ai,
						rev.fecha_reg,
						rev.id_usuario_reg,
						rev.id_usuario_ai,
						rev.fecha_mod,
						rev.id_usuario_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod	
						from snx.trevista rev
						inner join segu.tusuario usu1 on usu1.id_usuario = rev.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = rev.id_usuario_mod
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_REV_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		17-09-2018 13:04:24
	***********************************/

	elsif(p_transaccion='SNX_REV_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_revista)
					    from snx.trevista rev
					    inner join segu.tusuario usu1 on usu1.id_usuario = rev.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = rev.id_usuario_mod
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

ALTER FUNCTION snx.ft_revista_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;