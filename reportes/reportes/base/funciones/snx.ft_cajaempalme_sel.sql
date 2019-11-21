CREATE OR REPLACE FUNCTION "snx"."ft_cajaempalme_sel"(	
				p_administrador integer, p_id_usuario integer, p_tabla character varying, p_transaccion character varying)
RETURNS character varying AS
$BODY$
/**************************************************************************
 SISTEMA:		SPVPT
 FUNCION: 		snx.ft_cajaempalme_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tcajaempalme'
 AUTOR: 		 (admin)
 FECHA:	        14-02-2019 17:57:59
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				14-02-2019 17:57:59								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tcajaempalme'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_cajaempalme_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_CEP_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		14-02-2019 17:57:59
	***********************************/

	if(p_transaccion='SNX_CEP_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						cep.id_cajaempalme,
						cep.cajaempalme,
						cep.estado_reg,
						cep.id_usuario_reg,
						cep.usuario_ai,
						cep.fecha_reg,
						cep.id_usuario_ai,
						cep.fecha_mod,
						cep.id_usuario_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod	
						from snx.tcajaempalme cep
						inner join segu.tusuario usu1 on usu1.id_usuario = cep.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = cep.id_usuario_mod
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_CEP_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		14-02-2019 17:57:59
	***********************************/

	elsif(p_transaccion='SNX_CEP_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_cajaempalme)
					    from snx.tcajaempalme cep
					    inner join segu.tusuario usu1 on usu1.id_usuario = cep.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = cep.id_usuario_mod
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
ALTER FUNCTION "snx"."ft_cajaempalme_sel"(integer, integer, character varying, character varying) OWNER TO postgres;
