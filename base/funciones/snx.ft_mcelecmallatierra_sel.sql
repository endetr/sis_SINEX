-- FUNCTION: snx.ft_mcelecmallatierra_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_mcelecmallatierra_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_mcelecmallatierra_sel(
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
 FUNCION: 		snx.ft_mcelecmallatierra_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tmcelecmallatierra'
 AUTOR: 		 (admin)
 FECHA:	        16-10-2018 20:00:20
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				16-10-2018 20:00:20								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tmcelecmallatierra'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_mcelecmallatierra_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_MCMT_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		16-10-2018 20:00:20
	***********************************/

	if(p_transaccion='SNX_MCMT_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						mcmt.id_mcelecmallatierra,
						mcmt.id_claseaislamiento,
						mcmt.factortorre,
						mcmt.cableporbahina,
						mcmt.estado_reg,
						mcmt.id_usuario_ai,
						mcmt.fecha_reg,
						mcmt.usuario_ai,
						mcmt.id_usuario_reg,
						mcmt.fecha_mod,
						mcmt.id_usuario_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
						clas.claseaislacion as desc_claseaislacion	
						from snx.tmcelecmallatierra mcmt
						inner join segu.tusuario usu1 on usu1.id_usuario = mcmt.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = mcmt.id_usuario_mod
						left join snx.tclaseaislacion clas on clas.id_claseaislacion = mcmt.id_claseaislamiento
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MCMT_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		16-10-2018 20:00:20
	***********************************/

	elsif(p_transaccion='SNX_MCMT_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_mcelecmallatierra)
					    from snx.tmcelecmallatierra mcmt
					    inner join segu.tusuario usu1 on usu1.id_usuario = mcmt.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = mcmt.id_usuario_mod
						left join snx.tclaseaislacion clas on clas.id_claseaislacion = mcmt.id_claseaislamiento
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

ALTER FUNCTION snx.ft_mcelecmallatierra_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;