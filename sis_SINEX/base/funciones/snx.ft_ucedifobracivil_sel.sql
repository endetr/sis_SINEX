-- FUNCTION: snx.ft_ucedifobracivil_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_ucedifobracivil_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_ucedifobracivil_sel(
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
 FUNCION: 		snx.ft_ucedifobracivil_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tucedifobracivil'
 AUTOR: 		 (admin)
 FECHA:	        27-07-2018 14:52:35
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				27-07-2018 14:52:35								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tucedifobracivil'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_ucedifobracivil_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_UDOC_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		27-07-2018 14:52:35
	***********************************/

	if(p_transaccion='SNX_UDOC_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						udoc.id_ucedifobracivil,
						udoc.id_ucedifsubgrupo,
						udoc.cantidadobracivil,
						udoc.id_obracivilmoe,
						udoc.estado_reg,
						udoc.id_usuario_ai,
						udoc.id_usuario_reg,
						udoc.fecha_reg,
						udoc.usuario_ai,
						udoc.fecha_mod,
						udoc.id_usuario_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
						obc.obracivilmoe as desc_obracivilmoe,
						uni.unidad as unidad,
						cast(valoc.preciounitariorlp * udoc.cantidadobracivil as numeric(18,2)) as valortotalrlp,
						cast(valoc.preciounitariorcb * udoc.cantidadobracivil as numeric(18,2)) as valortotalrcb,
						cast(valoc.preciounitariorsc * udoc.cantidadobracivil as numeric(18,2)) as valortotalrsc,
						valoc.preciounitariorlp,
						valoc.preciounitariorcb,
						valoc.preciounitariorsc
						from snx.tucedifobracivil udoc
						inner join segu.tusuario usu1 on usu1.id_usuario = udoc.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = udoc.id_usuario_mod						
						left join snx.tobracivilmoe obc on obc.id_obracivilmoe = udoc.id_obracivilmoe
						left join snx.tunidad uni on uni.id_unidad = obc.id_unidad
						left join snx.calcularvaloresobracivilmoe(udoc.id_obracivilmoe) valoc ON udoc.id_obracivilmoe = valoc.id_obracivilmoe
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UDOC_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		27-07-2018 14:52:35
	***********************************/

	elsif(p_transaccion='SNX_UDOC_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_ucedifobracivil)
					    from snx.tucedifobracivil udoc
					    inner join segu.tusuario usu1 on usu1.id_usuario = udoc.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = udoc.id_usuario_mod						
						left join snx.tobracivilmoe obc on obc.id_obracivilmoe = udoc.id_obracivilmoe
						left join snx.tunidad uni on uni.id_unidad = obc.id_unidad
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

ALTER FUNCTION snx.ft_ucedifobracivil_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;