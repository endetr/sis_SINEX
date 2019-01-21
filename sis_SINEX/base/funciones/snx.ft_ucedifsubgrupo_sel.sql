-- FUNCTION: snx.ft_ucedifsubgrupo_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_ucedifsubgrupo_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_ucedifsubgrupo_sel(
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
 FUNCION: 		snx.ft_ucedifsubgrupo_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tucedifsubgrupo'
 AUTOR: 		 (admin)
 FECHA:	        27-07-2018 14:52:38
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				27-07-2018 14:52:38								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tucedifsubgrupo'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_ucedifsubgrupo_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_UDSG_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		27-07-2018 14:52:38
	***********************************/

	if(p_transaccion='SNX_UDSG_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						udsg.id_ucedifsubgrupo,
						udsg.id_ucedifgrupo,
						udsg.ucedifsubgrupo,
						udsg.estado_reg,
						udsg.id_usuario_ai,
						udsg.id_usuario_reg,
						udsg.usuario_ai,
						udsg.fecha_reg,
						udsg.fecha_mod,
						udsg.id_usuario_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
						cast(sum(valoc.preciounitariorlp * udoc.cantidadobracivil) as numeric(18,2)) as valortotalrlp,
						cast(sum(valoc.preciounitariorcb * udoc.cantidadobracivil) as numeric(18,2)) as valortotalrcb,
						cast(sum(valoc.preciounitariorsc * udoc.cantidadobracivil) as numeric(18,2)) as valortotalrsc
						from snx.tucedifsubgrupo udsg
						inner join segu.tusuario usu1 on usu1.id_usuario = udsg.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = udsg.id_usuario_mod
						left join snx.tucedifobracivil udoc on udoc.id_ucedifsubgrupo = udsg.id_ucedifsubgrupo
						left join snx.tobracivilmoe obc on obc.id_obracivilmoe = udoc.id_obracivilmoe
						left join snx.calcularvaloresobracivilmoe(obc.id_obracivilmoe) valoc ON obc.id_obracivilmoe = valoc.id_obracivilmoe
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;			
			v_consulta:=v_consulta||' GROUP by udsg.id_ucedifsubgrupo,	udsg.id_ucedifgrupo, udsg.ucedifsubgrupo, udsg.estado_reg, udsg.id_usuario_ai, udsg.id_usuario_reg,
						udsg.usuario_ai, udsg.fecha_reg, udsg.fecha_mod, udsg.id_usuario_mod,usu1.cuenta,usu2.cuenta';
			--v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;
			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UDSG_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		27-07-2018 14:52:38
	***********************************/

	elsif(p_transaccion='SNX_UDSG_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(udsg.id_ucedifsubgrupo)
					    from snx.tucedifsubgrupo udsg
					    inner join segu.tusuario usu1 on usu1.id_usuario = udsg.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = udsg.id_usuario_mod
						left join snx.tucedifobracivil udoc on udoc.id_ucedifsubgrupo = udsg.id_ucedifsubgrupo
						left join snx.tobracivilmoe obc on obc.id_obracivilmoe = udoc.id_obracivilmoe
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

ALTER FUNCTION snx.ft_ucedifsubgrupo_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;