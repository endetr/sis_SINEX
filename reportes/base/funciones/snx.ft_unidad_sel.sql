-- FUNCTION: snx.ft_unidad_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_unidad_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_unidad_sel(
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
 FUNCION: 		snx.ft_unidad_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tunidad'
 AUTOR: 		 (admin)
 FECHA:	        21-03-2018 19:24:25
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				21-03-2018 19:24:25								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tunidad'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_unidad_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_UNI_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		21-03-2018 19:24:25
	***********************************/

	if(p_transaccion='SNX_UNI_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						uni.id_unidad,
						uni.unidad,
						uni.estado_reg,
						uni.unidadabrev,
						uni.id_usuario_reg,
						uni.usuario_ai,
						uni.fecha_reg,
						uni.id_usuario_ai,
						uni.fecha_mod,
						uni.id_usuario_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod	
						from snx.tunidad uni
						inner join segu.tusuario usu1 on usu1.id_usuario = uni.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = uni.id_usuario_mod
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UNI_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		21-03-2018 19:24:25
	***********************************/

	elsif(p_transaccion='SNX_UNI_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_unidad)
					    from snx.tunidad uni
					    inner join segu.tusuario usu1 on usu1.id_usuario = uni.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = uni.id_usuario_mod
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

ALTER FUNCTION snx.ft_unidad_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;