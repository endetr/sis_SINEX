-- FUNCTION: snx.ft_ucltvaloraruc_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_ucltvaloraruc_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_ucltvaloraruc_sel(
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
 FUNCION: 		snx.ft_ucltvaloraruc_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tucltvaloraruc'
 AUTOR: 		 (admin)
 FECHA:	        01-11-2018 20:21:15
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				01-11-2018 20:21:15								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tucltvaloraruc'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_ucltvaloraruc_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_VUCLT_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		01-11-2018 20:21:15
	***********************************/

	if(p_transaccion='SNX_VUCLT_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						vuclt.id_ucltvaloraruc,
						vuclt.id_ucltvalorar,
						vuclt.id_tipolinea,
						tlin.tipolinea,
						vuclt.id_tensionservicio,
						tserv.tensionservicio,
						vuclt.descripcion,
						vuclt.numoc,
						vuclt.numingenieria,
						vuclt.codigo,
						vuclt.numadmeje,
						vuclt.numcostototaluc,
						vuclt.id_unidadconstructivalt,
						vuclt.numinspeccion,
						vuclt.numcapred,
						vuclt.numddp,
						vuclt.estado_reg,
						vuclt.numsupero,
						vuclt.longitud,
						vuclt.nummontaje,
						vuclt.numcaamb,
						vuclt.numcfinan,
						vuclt.id_usuario_ai,
						vuclt.fecha_reg,
						vuclt.usuario_ai,
						vuclt.id_usuario_reg,
						vuclt.id_usuario_mod,
						vuclt.fecha_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,						
						CAST(vuclt.longitud * vuclt.numcostototaluc as numeric(18,2)) AS numcostototaluct
						from snx.tucltvaloraruc vuclt
						inner join snx.ttipolinea tlin on vuclt.id_tipolinea = tlin.id_tipolinea
						inner join snx.ttensionservicio tserv on vuclt.id_tensionservicio = tserv.id_tensionservicio
						inner join segu.tusuario usu1 on usu1.id_usuario = vuclt.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = vuclt.id_usuario_mod
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_VUCLT_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		01-11-2018 20:21:15
	***********************************/

	elsif(p_transaccion='SNX_VUCLT_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_ucltvaloraruc)
					    from snx.tucltvaloraruc vuclt
					    inner join segu.tusuario usu1 on usu1.id_usuario = vuclt.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = vuclt.id_usuario_mod
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

ALTER FUNCTION snx.ft_ucltvaloraruc_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;