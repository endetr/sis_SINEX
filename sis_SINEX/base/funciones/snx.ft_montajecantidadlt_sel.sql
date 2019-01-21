-- FUNCTION: snx.ft_montajecantidadlt_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_montajecantidadlt_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_montajecantidadlt_sel(
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
 FUNCION: 		snx.ft_montajecantidadlt_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tmontajecantidadlt'
 AUTOR: 		 (admin)
 FECHA:	        19-07-2018 14:51:24
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				19-07-2018 14:51:24								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tmontajecantidadlt'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_montajecantidadlt_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_MONTC_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		19-07-2018 14:51:24
	***********************************/

	if(p_transaccion='SNX_MONTC_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						montc.id_montajecantidadlt,
						montc.estado_reg,
						montc.cantidadmontajelt,
						montc.id_tipoestructura,
						montc.id_tensionservicio,
						montc.id_configuracionlt,
						montc.id_tipolinea,
						montc.id_montajelt,
						montc.fecha_reg,
						montc.usuario_ai,
						montc.id_usuario_reg,
						montc.id_usuario_ai,
						montc.id_usuario_mod,
						montc.fecha_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
						test.tipoestructura,
						tese.tensionservicio,
						conf.configuracionlt,
						tili.tipolinea
						from snx.tmontajecantidadlt montc
						inner join segu.tusuario usu1 on usu1.id_usuario = montc.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = montc.id_usuario_mod
						inner join	snx.ttipoestructura test on montc.id_tipoestructura = test.id_tipoestructura
						inner join	snx.ttensionservicio tese on montc.id_tensionservicio = tese.id_tensionservicio
						inner join	snx.tconfiguracionlt conf on montc.id_configuracionlt = conf.id_configuracionlt
						inner join	snx.ttipolinea tili on montc.id_tipolinea = tili.id_tipolinea
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MONTC_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		19-07-2018 14:51:24
	***********************************/

	elsif(p_transaccion='SNX_MONTC_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_montajecantidadlt)
					    from snx.tmontajecantidadlt montc
					    inner join segu.tusuario usu1 on usu1.id_usuario = montc.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = montc.id_usuario_mod
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

ALTER FUNCTION snx.ft_montajecantidadlt_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;