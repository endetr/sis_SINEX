-- FUNCTION: snx.ft_unidadconstructivatablerocp_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_unidadconstructivatablerocp_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_unidadconstructivatablerocp_sel(
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
 FUNCION: 		snx.ft_unidadconstructivatablerocp_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tunidadconstructivatablerocp'
 AUTOR: 		 (admin)
 FECHA:	        11-10-2018 19:42:39
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				11-10-2018 19:42:39								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tunidadconstructivatablerocp'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_unidadconstructivatablerocp_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_UCTCP_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		11-10-2018 19:42:39
	***********************************/

	if(p_transaccion='SNX_UCTCP_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						uctcp.id_unidadconstructivatablerocp,
						uctcp.id_unidadconstructivaenctablerocp,
						uctcp.precio,
						uctcp.cantidadtablerocp,
						uctcp.estado_reg,
						uctcp.unidadconstructivatablerocp,
						uctcp.id_usuario_ai,
						uctcp.id_usuario_reg,
						uctcp.usuario_ai,
						uctcp.fecha_reg,
						uctcp.id_usuario_mod,
						uctcp.fecha_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
						(uctcp.cantidadtablerocp * uctcp.precio) as valortotaltablerocp
						from snx.tunidadconstructivatablerocp uctcp
						inner join segu.tusuario usu1 on usu1.id_usuario = uctcp.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = uctcp.id_usuario_mod
				       	where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCTCP_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		11-10-2018 19:42:39
	***********************************/

	elsif(p_transaccion='SNX_UCTCP_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_unidadconstructivatablerocp)
					    from snx.tunidadconstructivatablerocp uctcp
					    inner join segu.tusuario usu1 on usu1.id_usuario = uctcp.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = uctcp.id_usuario_mod
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

ALTER FUNCTION snx.ft_unidadconstructivatablerocp_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;