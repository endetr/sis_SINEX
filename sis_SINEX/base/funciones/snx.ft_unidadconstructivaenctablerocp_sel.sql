-- FUNCTION: snx.ft_unidadconstructivaenctablerocp_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_unidadconstructivaenctablerocp_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_unidadconstructivaenctablerocp_sel(
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
 FUNCION: 		snx.ft_unidadconstructivaenctablerocp_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tunidadconstructivaenctablerocp'
 AUTOR: 		 (admin)
 FECHA:	        15-11-2018 13:32:16
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				15-11-2018 13:32:16								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tunidadconstructivaenctablerocp'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_unidadconstructivaenctablerocp_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_UCTCPENC_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		15-11-2018 13:32:16
	***********************************/
	--Obtener otros gastos		
	if(p_transaccion='SNX_OTG_SEL')then
		begin
			v_consulta:='SELECT 	mcog.id_item,mcog.id_otrauc,mcog.otrosgastos,mcog.cantidadog,mcog.valorunitario,mcog.valorog
						FROM 	(
								select    	mcuc.id_unidadconstructivaenctablerocp,
											coalesce(SUM(items.valoritem),0) as valoritems,
											mcuc.numerobahias				  			
								from 		snx.tunidadconstructivaenctablerocp mcuc		
								left join 	(
											SELECT 	items.id_unidadconstructivaenctablerocp,
													SUM(items.cantidadtablerocp * items.precio) AS valoritem
											FROM		snx.tunidadconstructivatablerocp items
											GROUP BY	items.id_unidadconstructivaenctablerocp
											UNION ALL
											SELECT	uctcserv.id_unidadconstructivaenctablerocp,
													SUM(uctcserv.cantidadserv * uctcserv.precio) AS valoritem
											FROM	snx.tunidadconstructivatablerocpserv uctcserv
											GROUP BY uctcserv.id_unidadconstructivaenctablerocp
											) items ON mcuc.id_unidadconstructivaenctablerocp = items.id_unidadconstructivaenctablerocp
								GROUP BY 	mcuc.id_unidadconstructivaenctablerocp,mcuc.numerobahias
								) mcuc
						INNER JOIN snx.calcularotrosgastosotrasuc(mcuc.id_unidadconstructivaenctablerocp, mcuc.numerobahias, mcuc.valoritems, 4) mcog ON mcuc.id_unidadconstructivaenctablerocp = mcog.id_otrauc
		where ';
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;

			--Devuelve la respuesta
			return v_consulta;
		end;
		
	elsif(p_transaccion='SNX_OTG_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_unidadconstructivaenctablerocp)
					    from snx.tunidadconstructivaenctablerocp uctcpenc
					    inner join segu.tusuario usu1 on usu1.id_usuario = uctcpenc.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = uctcpenc.id_usuario_mod';
			
			--Definicion de la respuesta		    
			--v_consulta:=v_consulta||v_parametros.filtro;

			--Devuelve la respuesta
			return v_consulta;

		end;

	elseif(p_transaccion='SNX_UCTCPENC_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						uctcpenc.id_unidadconstructivaenctablerocp,
						uctcpenc.codigo,
						uctcpenc.numerobahias,
						uctcpenc.descripcion,
						uctcpenc.porcrepuestos,
						uctcpenc.estado_reg,
						uctcpenc.id_usuario_ai,
						uctcpenc.id_usuario_reg,
						uctcpenc.fecha_reg,
						uctcpenc.usuario_ai,
						uctcpenc.fecha_mod,
						uctcpenc.id_usuario_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
						coalesce(items.valoritem,0) as valoritem,
						coalesce(uctcserv.valorserv,0) as valorserv,
						(SELECT	SUM(valorog) FROM	snx.calcularotrosgastosotrasuc(uctcpenc.id_unidadconstructivaenctablerocp,uctcpenc.numerobahias,coalesce(items.valoritem,0)+coalesce(uctcserv.valorserv,0),4)) as valorog,
						coalesce(items.valoritem,0) + coalesce(uctcserv.valorserv,0) + 
						(SELECT	SUM(valorog) FROM	snx.calcularotrosgastosotrasuc(uctcpenc.id_unidadconstructivaenctablerocp,uctcpenc.numerobahias,coalesce(items.valoritem,0)+coalesce(uctcserv.valorserv,0),4)) AS valortotal
						from snx.tunidadconstructivaenctablerocp uctcpenc
						inner join segu.tusuario usu1 on usu1.id_usuario = uctcpenc.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = uctcpenc.id_usuario_mod
						left join (
								  SELECT 	items.id_unidadconstructivaenctablerocp,
								  			SUM(items.cantidadtablerocp * items.precio) AS valoritem
								  FROM		snx.tunidadconstructivatablerocp items
								  GROUP BY	items.id_unidadconstructivaenctablerocp
								  ) items ON uctcpenc.id_unidadconstructivaenctablerocp = items.id_unidadconstructivaenctablerocp
						left join (
								  SELECT	uctcserv.id_unidadconstructivaenctablerocp,
								  			SUM(uctcserv.cantidadserv * uctcserv.precio) AS valorserv
								  FROM		snx.tunidadconstructivatablerocpserv uctcserv 
								  GROUP BY	uctcserv.id_unidadconstructivaenctablerocp
								  ) uctcserv ON uctcpenc.id_unidadconstructivaenctablerocp = uctcserv.id_unidadconstructivaenctablerocp
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			--v_consulta:=v_consulta||' group by uctcpenc.id_unidadconstructivaenctablerocp,uctcpenc.codigo,uctcpenc.numerobahias,uctcpenc.descripcion,uctcpenc.porcrepuestos,uctcpenc.estado_reg,uctcpenc.id_usuario_ai,uctcpenc.id_usuario_reg,uctcpenc.fecha_reg,uctcpenc.usuario_ai,uctcpenc.fecha_mod,uctcpenc.id_usuario_mod,usu1.cuenta,usu2.cuenta ';
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCTCPENC_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		15-11-2018 13:32:16
	***********************************/

	elsif(p_transaccion='SNX_UCTCPENC_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_unidadconstructivaenctablerocp)
					    from snx.tunidadconstructivaenctablerocp uctcpenc
					    inner join segu.tusuario usu1 on usu1.id_usuario = uctcpenc.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = uctcpenc.id_usuario_mod
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

ALTER FUNCTION snx.ft_unidadconstructivaenctablerocp_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;