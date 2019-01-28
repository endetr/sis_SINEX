-- FUNCTION: snx.ft_unidadconstructivaedif_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_unidadconstructivaedif_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_unidadconstructivaedif_sel(
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
 FUNCION: 		snx.ft_unidadconstructivaedif_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tunidadconstructivaedif'
 AUTOR: 		 (admin)
 FECHA:	        27-07-2018 14:52:51
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				27-07-2018 14:52:51								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tunidadconstructivaedif'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_unidadconstructivaedif_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_UCE_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		27-07-2018 14:52:51
	***********************************/
	--Obtener otros gastos		
	if(p_transaccion='SNX_OTG_SEL')then
		begin
			v_consulta:='SELECT mcog.id_item,mcog.id_otrauc,mcog.otrosgastos,mcog.cantidadog,mcog.valorunitario,mcog.valorog
							FROM (select
											uce.id_unidadconstructivaedif,
											cast(sum(valoc.preciounitariorlp * udoc.cantidadobracivil) as numeric(18,2)) as valortotalrlp,
											cast(sum(valoc.preciounitariorcb * udoc.cantidadobracivil) as numeric(18,2)) as valortotalrcb,
											cast(sum(valoc.preciounitariorsc * udoc.cantidadobracivil) as numeric(18,2)) as valortotalrsc
								from snx.tunidadconstructivaedif uce	
								left join	snx.tucedifgrupo udg on uce.id_unidadconstructivaedif = udg.id_unidadconstructivaedif
								left join snx.tucedifsubgrupo udsg on udsg.id_ucedifgrupo = udg.id_ucedifgrupo
								left join snx.tucedifobracivil udoc on udoc.id_ucedifsubgrupo = udsg.id_ucedifsubgrupo
								left join snx.tobracivilmoe obc on obc.id_obracivilmoe = udoc.id_obracivilmoe
								left join snx.calcularvaloresobracivilmoe(obc.id_obracivilmoe) valoc ON obc.id_obracivilmoe = valoc.id_obracivilmoe
								GROUP by uce.id_unidadconstructivaedif) uce
			        INNER JOIN snx.calcularotrosgastosotrasuc(uce.id_unidadconstructivaedif, 1, uce.valortotalrlp, 2) mcog ON uce.id_unidadconstructivaedif = mcog.id_otrauc
					where ';
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;

			--Devuelve la respuesta
			return v_consulta;
		end;
		
	elsif(p_transaccion='SNX_OTG_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_unidadconstructivaedif)
					    from snx.tunidadconstructivaedif uce
					    inner join segu.tusuario usu1 on usu1.id_usuario = uce.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = uce.id_usuario_mod';
			
			--Definicion de la respuesta		    
			--v_consulta:=v_consulta||v_parametros.filtro;

			--Devuelve la respuesta
			return v_consulta;

		end;

	elseif(p_transaccion='SNX_UCE_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select 		uce.id_unidadconstructivaedif,
										uce.codigo,
										uce.descripcion,
										uce.estado_reg,
										uce.id_usuario_ai,
										uce.id_usuario_reg,
										uce.fecha_reg,
										uce.usuario_ai,
										uce.fecha_mod,
										uce.id_usuario_mod,
										usu1.cuenta as usr_reg,
										usu2.cuenta as usr_mod,
										cast(sum(valoc.preciounitariorlp * edoc.cantidadobracivil) as numeric(18,2)) + (SELECT SUM(valorog) FROM snx.calcularotrosgastosotrasuc(uce.id_unidadconstructivaedif, 1, cast(sum(valoc.preciounitariorlp * edoc.cantidadobracivil) as numeric(18,2)), 2)) as valortotalrlp,
										cast(sum(valoc.preciounitariorcb * edoc.cantidadobracivil) as numeric(18,2)) + (SELECT SUM(valorog) FROM snx.calcularotrosgastosotrasuc(uce.id_unidadconstructivaedif, 1, cast(sum(valoc.preciounitariorcb * edoc.cantidadobracivil) as numeric(18,2)), 2)) as valortotalrcb,
										cast(sum(valoc.preciounitariorsc * edoc.cantidadobracivil) as numeric(18,2)) + (SELECT SUM(valorog) FROM snx.calcularotrosgastosotrasuc(uce.id_unidadconstructivaedif, 1, cast(sum(valoc.preciounitariorsc * edoc.cantidadobracivil) as numeric(18,2)), 2)) as valortotalrsc						
							from 		snx.tunidadconstructivaedif uce	
							left join	snx.tucedifgrupo udg on uce.id_unidadconstructivaedif = udg.id_unidadconstructivaedif
							left join 	snx.tucedifsubgrupo udsg on udsg.id_ucedifgrupo = udg.id_ucedifgrupo
							left join 	snx.tucedifobracivil edoc on edoc.id_ucedifsubgrupo = udsg.id_ucedifsubgrupo
							left join 	snx.tobracivilmoe obc on obc.id_obracivilmoe = edoc.id_obracivilmoe
							left join 	snx.calcularvaloresobracivilmoe(obc.id_obracivilmoe) valoc ON obc.id_obracivilmoe = valoc.id_obracivilmoe																				  
							inner join 	segu.tusuario usu1 on usu1.id_usuario = uce.id_usuario_reg
							left join 	segu.tusuario usu2 on usu2.id_usuario = uce.id_usuario_mod
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' group by	uce.id_unidadconstructivaedif,uce.codigo,uce.descripcion,uce.estado_reg,uce.id_usuario_ai,uce.id_usuario_reg,uce.fecha_reg,uce.usuario_ai,uce.fecha_mod,uce.id_usuario_mod,usu1.cuenta,usu2.cuenta';
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCE_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		27-07-2018 14:52:51
	***********************************/

	elsif(p_transaccion='SNX_UCE_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_unidadconstructivaedif)
					    from snx.tunidadconstructivaedif uce
					    inner join segu.tusuario usu1 on usu1.id_usuario = uce.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = uce.id_usuario_mod
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

ALTER FUNCTION snx.ft_unidadconstructivaedif_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;