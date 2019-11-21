CREATE OR REPLACE FUNCTION "snx"."ft_bancoductos_sel"(	
				p_administrador integer, p_id_usuario integer, p_tabla character varying, p_transaccion character varying)
RETURNS character varying AS
$BODY$
/**************************************************************************
 SISTEMA:		SPVPT
 FUNCION: 		snx.ft_bancoductos_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tbancoductos'
 AUTOR: 		 (admin)
 FECHA:	        14-02-2019 17:57:56
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				14-02-2019 17:57:56								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tbancoductos'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_bancoductos_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_BDT_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		14-02-2019 17:57:56
	***********************************/

	if(p_transaccion='SNX_BDT_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						bdt.id_bancoductos,
						bdt.bancoductos,
						bdt.estado_reg,
						bdt.id_usuario_ai,
						bdt.id_usuario_reg,
						bdt.fecha_reg,
						bdt.usuario_ai,
						bdt.fecha_mod,
						bdt.id_usuario_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod	
						from snx.tbancoductos bdt
						inner join segu.tusuario usu1 on usu1.id_usuario = bdt.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = bdt.id_usuario_mod
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_BDT_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		14-02-2019 17:57:56
	***********************************/

	elsif(p_transaccion='SNX_BDT_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_bancoductos)
					    from snx.tbancoductos bdt
					    inner join segu.tusuario usu1 on usu1.id_usuario = bdt.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = bdt.id_usuario_mod
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
$BODY$
LANGUAGE 'plpgsql' VOLATILE
COST 100;
ALTER FUNCTION "snx"."ft_bancoductos_sel"(integer, integer, character varying, character varying) OWNER TO postgres;
