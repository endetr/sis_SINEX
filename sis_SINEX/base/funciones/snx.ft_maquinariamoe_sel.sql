-- FUNCTION: snx.ft_maquinariamoe_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_maquinariamoe_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_maquinariamoe_sel(
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
 FUNCION: 		snx.ft_maquinariamoe_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tmaquinariamoe'
 AUTOR: 		 (admin)
 FECHA:	        29-08-2018 18:34:19
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				29-08-2018 18:34:19								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tmaquinariamoe'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_maquinariamoe_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_MAQMOE_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		29-08-2018 18:34:19
	***********************************/

	if(p_transaccion='SNX_MAQMOE_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						maqmoe.id_maquinariamoe,
						maqmoe.valorunitariorcb,
						maqmoe.id_unidad,
						maqmoe.valorunitariorlp,
						maqmoe.estado_reg,
						maqmoe.valorunitariorsc,
						maqmoe.maquinariamoe,
						maqmoe.id_usuario_ai,
						maqmoe.usuario_ai,
						maqmoe.fecha_reg,
						maqmoe.id_usuario_reg,
						maqmoe.id_usuario_mod,
						maqmoe.fecha_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
						uni.unidadabrev as desc_unidadabrev
						from snx.tmaquinariamoe maqmoe
						inner join segu.tusuario usu1 on usu1.id_usuario = maqmoe.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = maqmoe.id_usuario_mod
				        left join snx.tunidad uni on maqmoe.id_unidad = uni.id_unidad
					   where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MAQMOE_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		29-08-2018 18:34:19
	***********************************/

	elsif(p_transaccion='SNX_MAQMOE_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_maquinariamoe)
					    from snx.tmaquinariamoe maqmoe
					    inner join segu.tusuario usu1 on usu1.id_usuario = maqmoe.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = maqmoe.id_usuario_mod
					    left join snx.tunidad uni on maqmoe.id_unidad = uni.id_unidad
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

ALTER FUNCTION snx.ft_maquinariamoe_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;