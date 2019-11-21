-- FUNCTION: snx.ft_mcelecapantallamiento_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_mcelecapantallamiento_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_mcelecapantallamiento_sel(
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
 FUNCION: 		snx.ft_mcelecapantallamiento_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tmcelecapantallamiento'
 AUTOR: 		 (admin)
 FECHA:	        16-10-2018 20:00:23
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				16-10-2018 20:00:23								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tmcelecapantallamiento'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_mcelecapantallamiento_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_MCAP_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		16-10-2018 20:00:23
	***********************************/

	if(p_transaccion='SNX_MCAP_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						mcap.id_mcelecapantallamiento,
						mcap.cableporbahia,
						mcap.estado_reg,
						mcap.id_claseaislamiento,
						mcap.id_usuario_ai,
						mcap.id_usuario_reg,
						mcap.fecha_reg,
						mcap.usuario_ai,
						mcap.id_usuario_mod,
						mcap.fecha_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
						clas.claseaislacion as desc_claseaislacion	
						from snx.tmcelecapantallamiento mcap
						inner join segu.tusuario usu1 on usu1.id_usuario = mcap.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = mcap.id_usuario_mod
						left join snx.tclaseaislacion clas on clas.id_claseaislacion = mcap.id_claseaislamiento
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MCAP_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		16-10-2018 20:00:23
	***********************************/

	elsif(p_transaccion='SNX_MCAP_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_mcelecapantallamiento)
					    from snx.tmcelecapantallamiento mcap
					    inner join segu.tusuario usu1 on usu1.id_usuario = mcap.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = mcap.id_usuario_mod
						left join snx.tclaseaislacion clas on clas.id_claseaislacion = mcap.id_claseaislamiento
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

ALTER FUNCTION snx.ft_mcelecapantallamiento_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;