-- FUNCTION: snx.ft_ocmanoobramoe_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_ocmanoobramoe_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_ocmanoobramoe_sel(
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
 FUNCION: 		snx.ft_ocmanoobramoe_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tocmanoobramoe'
 AUTOR: 		 (admin)
 FECHA:	        30-08-2018 15:37:36
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				30-08-2018 15:37:36								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tocmanoobramoe'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_ocmanoobramoe_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_OCMO_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		30-08-2018 15:37:36
	***********************************/

	if(p_transaccion='SNX_OCMO_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						ocmo.id_ocmanoobramoe,
						ocmo.estado_reg,
						ocmo.id_manoobramoe,
						ocmo.cantidadmanoobramoe,
						ocmo.id_obracivilmoe,
						ocmo.id_usuario_reg,
						ocmo.usuario_ai,
						ocmo.fecha_reg,
						ocmo.id_usuario_ai,
						ocmo.id_usuario_mod,
						ocmo.fecha_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
						mao.manoobramoe AS desc_manoobramoe,		
						valmomoe.valorunitariorlpusd,
						valmomoe.valorunitariorcbusd,
						valmomoe.valorunitariorscusd,
						valmomoe.costototalrlp,
						valmomoe.costototalrcb,
						valmomoe.costototalrsc
						from snx.tocmanoobramoe ocmo
						inner join segu.tusuario usu1 on usu1.id_usuario = ocmo.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = ocmo.id_usuario_mod
						inner join snx.tmanoobramoe mao on ocmo.id_manoobramoe = mao.id_manoobramoe
						inner join snx.obtenermanoobramoe(ocmo.id_obracivilmoe) valmomoe on ocmo.id_obracivilmoe = valmomoe.id_obracivilmoe
						where ocmo.id_manoobramoe = valmomoe.id_manoobramoe and valmomoe.id_manoobramoe <> 0 and ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			
			v_consulta:=v_consulta|| '
				UNION ALL
						select  
						valmomoe.id_ocmanoobramoe,
						ocmo.estado_reg,
						valmomoe.id_ocmanoobramoe AS id_manoobramoe,
						valmomoe.cantidadmanoobramoe,
						ocmo.id_obracivilmoe,
						ocmo.id_usuario_reg,
						ocmo.usuario_ai,
						ocmo.fecha_reg,
						ocmo.id_usuario_ai,
						ocmo.id_usuario_mod,
						ocmo.fecha_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
						valmomoe.manoobramoe AS desc_maquinariamoe,		
						valmomoe.valorunitariorlpusd,
						valmomoe.valorunitariorcbusd,
						valmomoe.valorunitariorscusd,
						valmomoe.costototalrlp,
						valmomoe.costototalrcb,
						valmomoe.costototalrsc
						from snx.tobracivilmoe ocmo
						inner join segu.tusuario usu1 on usu1.id_usuario = ocmo.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = ocmo.id_usuario_mod		
						inner join snx.obtenermanoobramoe(ocmo.id_obracivilmoe) valmomoe on ocmo.id_obracivilmoe = valmomoe.id_obracivilmoe
						where valmomoe.id_manoobramoe = 0 and ';
			
			v_consulta:=v_consulta||v_parametros.filtro;
			
		--	v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_OCMO_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		30-08-2018 15:37:36
	***********************************/

	elsif(p_transaccion='SNX_OCMO_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_ocmanoobramoe)
					    from snx.tocmanoobramoe ocmo
					    inner join segu.tusuario usu1 on usu1.id_usuario = ocmo.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = ocmo.id_usuario_mod
					    left join snx.tmanoobramoe mao on ocmo.id_manoobramoe = mao.id_manoobramoe
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

ALTER FUNCTION snx.ft_ocmanoobramoe_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;