-- FUNCTION: snx.ft_tarifassb_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_tarifassb_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_tarifassb_sel(
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
 FUNCION: 		snx.ft_tarifassb_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.ttarifassb'
 AUTOR: 		 (admin)
 FECHA:	        10-10-2018 13:26:46
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				10-10-2018 13:26:46								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.ttarifassb'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_tarifassb_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_TAR_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		10-10-2018 13:26:46
	***********************************/

	if(p_transaccion='SNX_TAR_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						tar.id_tarifasb,
						tar.id_unidad,
						tar.tarifasb,
						tar.valortarifa,
						tar.estado_reg,
						tar.id_usuario_ai,
						tar.id_usuario_reg,
						tar.usuario_ai,
						tar.fecha_reg,
						tar.fecha_mod,
						tar.id_usuario_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
						uni.unidad as desc_unidad
						from snx.ttarifassb tar
						inner join segu.tusuario usu1 on usu1.id_usuario = tar.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = tar.id_usuario_mod
				        left join snx.tunidad uni on tar.id_unidad = uni.id_unidad
						where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_TAR_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		10-10-2018 13:26:46
	***********************************/

	elsif(p_transaccion='SNX_TAR_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_tarifasb)
					    from snx.ttarifassb tar
					    inner join segu.tusuario usu1 on usu1.id_usuario = tar.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = tar.id_usuario_mod
					    left join snx.tunidad uni on tar.id_unidad = uni.id_unidad
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

ALTER FUNCTION snx.ft_tarifassb_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;