-- FUNCTION: snx.ft_ocmaquinariamoe_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_ocmaquinariamoe_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_ocmaquinariamoe_sel(
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
 FUNCION: 		snx.ft_ocmaquinariamoe_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tocmaquinariamoe'
 AUTOR: 		 (admin)
 FECHA:	        30-08-2018 15:37:28
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				30-08-2018 15:37:28								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tocmaquinariamoe'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_ocmaquinariamoe_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_OCMAQ_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		30-08-2018 15:37:28
	***********************************/

	if(p_transaccion='SNX_OCMAQ_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						ocmaq.id_ocmaquinariamoe,
						ocmaq.estado_reg,
						ocmaq.id_maquinariamoe,
						ocmaq.cantidadmaquinariamoe,
						ocmaq.id_obracivilmoe,
						ocmaq.id_usuario_reg,
						ocmaq.usuario_ai,
						ocmaq.fecha_reg,
						ocmaq.id_usuario_ai,
						ocmaq.id_usuario_mod,
						ocmaq.fecha_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
						maq.maquinariamoe as desc_maquinariamoe,
						valmaqmoe.valorunitariorlpusd,
						valmaqmoe.valorunitariorcbusd,
						valmaqmoe.valorunitariorscusd,
						valmaqmoe.costototalrlp,
						valmaqmoe.costototalrcb,
						valmaqmoe.costototalrsc
						from snx.tocmaquinariamoe ocmaq
						inner join segu.tusuario usu1 on usu1.id_usuario = ocmaq.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = ocmaq.id_usuario_mod
				        left join snx.tmaquinariamoe maq on ocmaq.id_maquinariamoe = maq.id_maquinariamoe
						inner join snx.obtenermaquinariamoe(ocmaq.id_obracivilmoe) valmaqmoe on ocmaq.id_obracivilmoe = valmaqmoe.id_obracivilmoe AND ocmaq.id_maquinariamoe = valmaqmoe.id_maquinariamoe
						where  valmaqmoe.id_maquinariamoe <> 0 and ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			
			v_consulta:=v_consulta|| '
								UNION ALL                                                                                       
									  select
									  0 AS id_ocmaquinariamoe,
									  ocmaq.estado_reg,
									  valmaqmoe.id_maquinariamoe,
									  valmaqmoe.cantidadmaquinariamoe,
									  ocmaq.id_obracivilmoe,
									  ocmaq.id_usuario_reg,
									  ocmaq.usuario_ai,
									  ocmaq.fecha_reg,
									  ocmaq.id_usuario_ai,
									  ocmaq.id_usuario_mod,
									  ocmaq.fecha_mod,
									  usu1.cuenta as usr_reg,
									  usu2.cuenta as usr_mod,
									  valmaqmoe.maquinariamoe as desc_maquinariamoe,                                                                               
									  valmaqmoe.valorunitariorlpusd,
									  valmaqmoe.valorunitariorcbusd,
									  valmaqmoe.valorunitariorscusd,
									  valmaqmoe.costototalrlp,
									  valmaqmoe.costototalrcb,
									  valmaqmoe.costototalrsc
									  from snx.tobracivilmoe ocmaq 
									  inner join segu.tusuario usu1 on usu1.id_usuario = ocmaq.id_usuario_reg
						   			  left join segu.tusuario usu2 on usu2.id_usuario = ocmaq.id_usuario_mod
									  inner join snx.obtenermaquinariamoe(ocmaq.id_obracivilmoe) valmaqmoe on ocmaq.id_obracivilmoe = valmaqmoe.id_obracivilmoe
									  where valmaqmoe.id_maquinariamoe = 0 and ';
									  
			v_consulta:=v_consulta||v_parametros.filtro;
			
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_OCMAQ_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		30-08-2018 15:37:28
	***********************************/

	elsif(p_transaccion='SNX_OCMAQ_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_ocmaquinariamoe)
					    from snx.tocmaquinariamoe ocmaq
					    inner join segu.tusuario usu1 on usu1.id_usuario = ocmaq.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = ocmaq.id_usuario_mod
					    left join snx.tmaquinariamoe maq on ocmaq.id_maquinariamoe = maq.id_maquinariamoe
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

ALTER FUNCTION snx.ft_ocmaquinariamoe_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;