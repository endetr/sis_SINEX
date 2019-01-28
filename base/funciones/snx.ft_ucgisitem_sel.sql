CREATE OR REPLACE FUNCTION "snx"."ft_ucgisitem_sel"(	
				p_administrador integer, p_id_usuario integer, p_tabla character varying, p_transaccion character varying)
RETURNS character varying AS
$BODY$
/**************************************************************************
 SISTEMA:		SPVPT
 FUNCION: 		snx.ft_ucgisitem_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tucgisitem'
 AUTOR: 		 (admin)
 FECHA:	        12-10-2018 19:18:29
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				12-10-2018 19:18:29								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tucgisitem'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_ucgisitem_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_GISIT_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		12-10-2018 19:18:29
	***********************************/

	if(p_transaccion='SNX_GISIT_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						gisit.id_item,
						gisit.id_unidadconstructivagis,
						gisit.valor,
						gisit.gisitem,
						gisit.estado_reg,
						gisit.id_usuario_ai,
						gisit.id_usuario_reg,
						gisit.fecha_reg,
						gisit.usuario_ai,
						gisit.id_usuario_mod,
						gisit.fecha_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod	
						from snx.tucgisitem gisit
						inner join segu.tusuario usu1 on usu1.id_usuario = gisit.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = gisit.id_usuario_mod
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_GISIT_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		12-10-2018 19:18:29
	***********************************/

	elsif(p_transaccion='SNX_GISIT_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_item)
					    from snx.tucgisitem gisit
					    inner join segu.tusuario usu1 on usu1.id_usuario = gisit.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = gisit.id_usuario_mod
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
ALTER FUNCTION "snx"."ft_ucgisitem_sel"(integer, integer, character varying, character varying) OWNER TO postgres;
