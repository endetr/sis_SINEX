-- FUNCTION: snx.ft_ucsbvalorar_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_ucsbvalorar_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_ucsbvalorar_sel(
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
 FUNCION: 		snx.ft_ucsbvalorar_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tucsbvalorar'
 AUTOR: 		 (admin)
 FECHA:	        09-11-2018 18:38:43
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				09-11-2018 18:38:43								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tucsbvalorar'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_ucsbvalorar_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_SBV_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		09-11-2018 18:38:43
	***********************************/

	if(p_transaccion='SNX_SBV_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						sbv.id_ucsbvalorar,
						sbv.id_terrenosb,
						sbv.numerobahias,
						sbv.codigoproy,
						sbv.id_revista,
						sbv.distanciatransnac,
						sbv.estado_reg,
						sbv.altura,
						sbv.distanciatransext,
						sbv.nombreproy,
						sbv.id_usuario_reg,
						sbv.fecha_reg,
						sbv.usuario_ai,
						sbv.id_usuario_ai,
						sbv.fecha_mod,
						sbv.id_usuario_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
						terr.terrenosb as desc_terrenosb,
						revi.revista as desc_revista,
						(SELECT coalesce(SUM(cuc.cantidaditem * cuc.valorucsbtotal),0) FROM snx.tucsbvalorarcuc cuc WHERE cuc.id_ucsbvalorar = sbv.id_ucsbvalorar) +
						(SELECT coalesce(SUM(ouc.cantidaditem * ouc.valortotal),0) FROM snx.tucsbvalorarouc ouc WHERE ouc.id_ucsbvalorar = sbv.id_ucsbvalorar) as valortotal	
						from snx.tucsbvalorar sbv
						inner join segu.tusuario usu1 on usu1.id_usuario = sbv.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = sbv.id_usuario_mod
						left join snx.tterrenosb terr on terr.id_terrenosb = sbv.id_terrenosb
						left join snx.trevista revi on revi.id_revista = sbv.id_revista
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;						
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;
			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_SBV_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		09-11-2018 18:38:43
	***********************************/

	elsif(p_transaccion='SNX_SBV_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(sbv.id_ucsbvalorar)
					    from snx.tucsbvalorar sbv
					    inner join segu.tusuario usu1 on usu1.id_usuario = sbv.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = sbv.id_usuario_mod
						left join snx.tterrenosb terr on terr.id_terrenosb = sbv.id_terrenosb
						left join snx.trevista revi on revi.id_revista = sbv.id_revista
						left join snx.tucsbvalorarcuc cuc on cuc.id_ucsbvalorar = sbv.id_ucsbvalorar
						left join snx.tucsbvalorarouc ouc on ouc.id_ucsbvalorar = sbv.id_ucsbvalorar
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

ALTER FUNCTION snx.ft_ucsbvalorar_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;