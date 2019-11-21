CREATE OR REPLACE FUNCTION snx.ft_unidadconstructivamo_sel(p_administrador integer, p_id_usuario integer, p_tabla character varying, p_transaccion character varying)
 RETURNS character varying
 LANGUAGE plpgsql
AS $function$

/**************************************************************************
 SISTEMA:		SINEX
 FUNCION: 		snx.ft_unidadconstructivamo_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tunidadconstructivamo'
 AUTOR: 		 (admin)
 FECHA:	        27-07-2018 15:39:11
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				27-07-2018 15:39:11								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tunidadconstructivamo'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_unidadconstructivamo_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_UNCONMO_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		27-07-2018 15:39:11
	***********************************/
	--Obtener otros gastos		
	if(p_transaccion='SNX_OTG_SEL')then
		begin
			v_consulta:='SELECT mcog.id_item,mcog.id_otrauc,mcog.otrosgastos,mcog.cantidadog,mcog.valorunitario,mcog.valorog
						FROM (select unconmo.id_unidadconstructivamo,			
									cast(sum(valoc.preciounitariorlp * mooc.cantidadobra) as numeric(18,2)) as valortotalrlp,
									cast(sum(valoc.preciounitariorcb * mooc.cantidadobra) as numeric(18,2)) as valortotalrcb,
									cast(sum(valoc.preciounitariorsc * mooc.cantidadobra) as numeric(18,2)) as valortotalrsc
								from snx.tunidadconstructivamo unconmo						
								left join snx.tucmogrupo mogr on unconmo.id_unidadconstructivamo = mogr.id_unidadconstructivamo
								left join snx.tucmoobracivil mooc on mogr.id_ucmogrupo = mooc.id_ucmogrupo
								left join snx.tobracivilmoe ocmoe on mooc.id_obracivilmoe = ocmoe.id_obracivilmoe
								left join snx.calcularvaloresobracivilmoe(ocmoe.id_obracivilmoe) valoc ON ocmoe.id_obracivilmoe = valoc.id_obracivilmoe
								GROUP BY unconmo.id_unidadconstructivamo) unconmo
						left JOIN snx.calcularotrosgastosotrasuc(unconmo.id_unidadconstructivamo, 1, unconmo.valortotalrlp, 1) mcog ON unconmo.id_unidadconstructivamo = mcog.id_otrauc
						where ';
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;

			--Devuelve la respuesta
			return v_consulta;
		end;
		
	elsif(p_transaccion='SNX_OTG_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_unidadconstructivamo)
					    from snx.tunidadconstructivamo unconmo';
			
			--Definicion de la respuesta		    
			--v_consulta:=v_consulta||v_parametros.filtro;

			--Devuelve la respuesta
			return v_consulta;

		end;

	elseif(p_transaccion='SNX_UNCONMO_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						unconmo.id_unidadconstructivamo,
						unconmo.codigo,
						unconmo.descripcion,
						unconmo.estado_reg,
						unconmo.id_usuario_ai,
						unconmo.id_usuario_reg,
						unconmo.fecha_reg,
						unconmo.usuario_ai,
						unconmo.fecha_mod,
						unconmo.id_usuario_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,						
						cast(sum(valoc.preciounitariorlp * mooc.cantidadobra) as numeric(18,2)) + (SELECT SUM(valorog) FROM snx.calcularotrosgastosotrasuc(unconmo.id_unidadconstructivamo, 1, cast(sum(valoc.preciounitariorlp * mooc.cantidadobra) as numeric(18,2)), 1)) as valortotalrlp,
						cast(sum(valoc.preciounitariorcb * mooc.cantidadobra) as numeric(18,2)) + (SELECT SUM(valorog) FROM snx.calcularotrosgastosotrasuc(unconmo.id_unidadconstructivamo, 1, cast(sum(valoc.preciounitariorcb * mooc.cantidadobra) as numeric(18,2)), 1)) as valortotalrcb,
						cast(sum(valoc.preciounitariorsc * mooc.cantidadobra) as numeric(18,2)) + (SELECT SUM(valorog) FROM snx.calcularotrosgastosotrasuc(unconmo.id_unidadconstructivamo, 1, cast(sum(valoc.preciounitariorsc * mooc.cantidadobra) as numeric(18,2)), 1)) as valortotalrsc
						from snx.tunidadconstructivamo unconmo
						left join segu.tusuario usu1 on usu1.id_usuario = unconmo.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = unconmo.id_usuario_mod
						left join snx.tucmogrupo mogr on unconmo.id_unidadconstructivamo = mogr.id_unidadconstructivamo
						left join snx.tucmoobracivil mooc on mogr.id_ucmogrupo = mooc.id_ucmogrupo
						left join snx.tobracivilmoe ocmoe on mooc.id_obracivilmoe = ocmoe.id_obracivilmoe
						left join snx.calcularvaloresobracivilmoe(ocmoe.id_obracivilmoe) valoc ON ocmoe.id_obracivilmoe = valoc.id_obracivilmoe
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' group by	unconmo.id_unidadconstructivamo,unconmo.codigo,unconmo.descripcion,unconmo.estado_reg,unconmo.id_usuario_ai,unconmo.id_usuario_reg,unconmo.fecha_reg,unconmo.usuario_ai,unconmo.fecha_mod,unconmo.id_usuario_mod,usu1.cuenta,usu2.cuenta';
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UNCONMO_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		27-07-2018 15:39:11
	***********************************/

	elsif(p_transaccion='SNX_UNCONMO_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_unidadconstructivamo)
					    from snx.tunidadconstructivamo unconmo
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

$function$
;
