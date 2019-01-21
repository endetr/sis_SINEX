-- FUNCTION: snx.ft_ucsbvalorarouc_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_ucsbvalorarouc_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_ucsbvalorarouc_sel(
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
 SISTEMA:		SPVPT
 FUNCION: 		snx.ft_ucsbvalorarouc_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tucsbvalorarouc'
 AUTOR: 		 (admin)
 FECHA:	        13-11-2018 18:53:49
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				13-11-2018 18:53:49								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tucsbvalorarouc'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_ucsbvalorarouc_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_SBUC_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		13-11-2018 18:53:49
	***********************************/

	if(p_transaccion='SNX_SBUC_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						sbuc.id_ucsbvalorarouc,
						sbuc.id_ucsbvalorar,
						sbuc.valortotal,
						sbuc.codigo,
						sbuc.descripcion,
						sbuc.cantidaditem,
						sbuc.id_otraunidad,
						sbuc.estado_reg,
						sbuc.id_usuario_ai,
						sbuc.id_usuario_reg,
						sbuc.usuario_ai,
						sbuc.fecha_reg,
						sbuc.fecha_mod,
						sbuc.id_usuario_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
						cast(concat(sbuc.codigo,'' - '', sbuc.descripcion) as varchar) as codigo_descripcion
						from snx.tucsbvalorarouc sbuc
						inner join segu.tusuario usu1 on usu1.id_usuario = sbuc.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = sbuc.id_usuario_mod
				        where  ';
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_SBUC_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		13-11-2018 18:53:49
	***********************************/

	elsif(p_transaccion='SNX_SBUC_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(sbuc.id_ucsbvalorarouc)
					    from snx.tucsbvalorarouc sbuc
					    inner join segu.tusuario usu1 on usu1.id_usuario = sbuc.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = sbuc.id_usuario_mod
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

ALTER FUNCTION snx.ft_ucsbvalorarouc_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;