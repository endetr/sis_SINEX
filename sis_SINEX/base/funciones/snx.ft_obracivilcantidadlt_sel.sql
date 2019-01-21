-- FUNCTION: snx.ft_obracivilcantidadlt_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_obracivilcantidadlt_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_obracivilcantidadlt_sel(
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
 FUNCION: 		snx.ft_obracivilcantidadlt_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tobracivilcantidadlt'
 AUTOR: 		 (admin)
 FECHA:	        25-07-2018 18:42:06
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				25-07-2018 18:42:06								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tobracivilcantidadlt'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_obracivilcantidadlt_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_OCCLT_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		25-07-2018 18:42:06
	***********************************/

	if(p_transaccion='SNX_OCCLT_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						occlt.id_obracivilcantidadlt,
						occlt.estado_reg,
						occlt.id_configuracionlt,
						occlt.id_terreno,
						occlt.cantidadobracivillt,
						occlt.id_tipolinea,
						occlt.id_tipoestructura,
						occlt.id_tipocanalizacion,
						occlt.id_tensionservicio,
						occlt.id_obracivillt,
						occlt.id_funcionestructura,
						occlt.id_tipocimentacion,
						occlt.usuario_ai,
						occlt.fecha_reg,
						occlt.id_usuario_reg,
						occlt.id_usuario_ai,
						occlt.id_usuario_mod,
						occlt.fecha_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
						tlinea.tipolinea,
						tense.tensionservicio,
						test.tipoestructura,
						conflt.configuracionlt,
						funes.funcionestructura,
						terr.terrenolt as desc_terreno,
						tcim.tipocimentacion,
						tcan.tipocanalizacion
						from snx.tobracivilcantidadlt occlt
						inner join segu.tusuario usu1 on usu1.id_usuario = occlt.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = occlt.id_usuario_mod
						inner join snx.ttipolinea tlinea on occlt.id_tipolinea = tlinea.id_tipolinea
						inner join snx.ttensionservicio tense on occlt.id_tensionservicio = tense.id_tensionservicio
						inner join snx.ttipoestructura test on occlt.id_tipoestructura = test.id_tipoestructura
						inner join snx.tconfiguracionlt conflt on occlt.id_configuracionlt = conflt.id_configuracionlt					
						inner join snx.tfuncionestructura funes on occlt.id_funcionestructura = funes.id_funcionestructura
						inner join snx.tterrenolt terr on occlt.id_terreno = terr.id_terrenolt
						inner join snx.ttipocimentacion tcim on occlt.id_tipocimentacion = tcim.id_tipocimentacion
						inner join snx.ttipocanalizacion tcan on occlt.id_tipocanalizacion = tcan.id_tipocanalizacion
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_OCCLT_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		25-07-2018 18:42:06
	***********************************/

	elsif(p_transaccion='SNX_OCCLT_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_obracivilcantidadlt)
					    from snx.tobracivilcantidadlt occlt
					    inner join segu.tusuario usu1 on usu1.id_usuario = occlt.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = occlt.id_usuario_mod
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

ALTER FUNCTION snx.ft_obracivilcantidadlt_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;