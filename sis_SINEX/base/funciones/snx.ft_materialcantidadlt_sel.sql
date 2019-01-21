-- FUNCTION: snx.ft_materialcantidadlt_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_materialcantidadlt_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_materialcantidadlt_sel(
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
 FUNCION: 		snx.ft_materialcantidadlt_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tmaterialcantidadlt'
 AUTOR: 		 (admin)
 FECHA:	        24-07-2018 15:27:55
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				24-07-2018 15:27:55								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tmaterialcantidadlt'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_materialcantidadlt_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_MTCLT_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		24-07-2018 15:27:55
	***********************************/

	if(p_transaccion='SNX_MTCLT_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						mtclt.id_materialcantidadlt,
						mtclt.cantidadmontajelt,
						mtclt.id_materiallt,
						mtclt.id_funcionestructura,
						mtclt.id_hilosguarda,
						mtclt.id_puestatierra,
						mtclt.id_tipoconductor,
						mtclt.id_configuracionlt,
						mtclt.id_aislador,
						mtclt.id_tensionservicio,
						mtclt.id_tipoestructura,
						mtclt.estado_reg,
						mtclt.id_usuario_ai,
						mtclt.fecha_reg,
						mtclt.usuario_ai,
						mtclt.id_usuario_reg,
						mtclt.fecha_mod,
						mtclt.id_usuario_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
						tipco.tipoconductor as desc_tipoconductor,
						conf.configuracionlt as desc_configuracionlt,
						tipes.tipoestructura as desc_tipoestructura,
						tens.tensionservicio as desc_tensionservicio,
						func.funcionestructura as desc_funcionestructura,
						pues.puestatierra as desc_puestatierra,
						ais.aislador as desc_tipoaislador,
						hil.hilosguarda as desc_hilosguarda
						from snx.tmaterialcantidadlt mtclt
						inner join segu.tusuario usu1 on usu1.id_usuario = mtclt.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = mtclt.id_usuario_mod						
						left join snx.ttipoconductor tipco on tipco.id_tipoconductor = mtclt.id_tipoconductor
						left join snx.tconfiguracionlt conf on conf.id_configuracionlt = mtclt.id_configuracionlt
						left join snx.ttipoestructura tipes on tipes.id_tipoestructura = mtclt.id_tipoestructura
						left join snx.ttensionservicio tens on tens.id_tensionservicio = mtclt.id_tensionservicio
						left join snx.tfuncionestructura func on func.id_funcionestructura = mtclt.id_funcionestructura
						left join snx.tspuestatierra pues on pues.id_puestatierra = mtclt.id_puestatierra
						left join snx.taislador ais on ais.id_aislador = mtclt.id_aislador
				        left join snx.thilosguarda hil on mtclt.id_hilosguarda = hil.id_hilosguarda
					   where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MTCLT_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		24-07-2018 15:27:55
	***********************************/

	elsif(p_transaccion='SNX_MTCLT_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_materialcantidadlt)
					    from snx.tmaterialcantidadlt mtclt
					    inner join segu.tusuario usu1 on usu1.id_usuario = mtclt.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = mtclt.id_usuario_mod
						left join snx.ttipoconductor tipco on tipco.id_tipoconductor = mtclt.id_tipoconductor
						left join snx.tconfiguracionlt conf on conf.id_configuracionlt = mtclt.id_configuracionlt
						left join snx.ttipoestructura tipes on tipes.id_tipoestructura = mtclt.id_tipoestructura
						left join snx.ttensionservicio tens on tens.id_tensionservicio = mtclt.id_tensionservicio
						left join snx.tfuncionestructura func on func.id_funcionestructura = mtclt.id_funcionestructura
						left join snx.tspuestatierra pues on pues.id_puestatierra = mtclt.id_puestatierra
						left join snx.taislador ais on ais.id_aislador = mtclt.id_aislador
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

ALTER FUNCTION snx.ft_materialcantidadlt_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;