-- FUNCTION: snx.ft_vegetacion_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_vegetacion_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_vegetacion_sel(
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
 FUNCION: 		snx.ft_vegetacion_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tvegetacion'
 AUTOR: 		 (admin)
 FECHA:	        24-07-2018 14:00:24
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				24-07-2018 14:00:24								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tvegetacion'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_vegetacion_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_VGT_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		24-07-2018 14:00:24
	***********************************/

	if(p_transaccion='SNX_VGT_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						vgt.id_vegetacion,
						vgt.tipovegetacion,
						vgt.costoroce,
						vgt.estado_reg,
						vgt.id_usuario_ai,
						vgt.id_usuario_reg,
						vgt.usuario_ai,
						vgt.fecha_reg,
						vgt.fecha_mod,
						vgt.id_usuario_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod	
						from snx.tvegetacion vgt
						inner join segu.tusuario usu1 on usu1.id_usuario = vgt.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = vgt.id_usuario_mod
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_VGT_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		24-07-2018 14:00:24
	***********************************/

	elsif(p_transaccion='SNX_VGT_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_vegetacion)
					    from snx.tvegetacion vgt
					    inner join segu.tusuario usu1 on usu1.id_usuario = vgt.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = vgt.id_usuario_mod
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

ALTER FUNCTION snx.ft_vegetacion_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;