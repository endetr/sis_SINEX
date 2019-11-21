CREATE OR REPLACE FUNCTION snx.ft_unidadconstructivaeta_sel(p_administrador integer, p_id_usuario integer, p_tabla character varying, p_transaccion character varying)
 RETURNS character varying
 LANGUAGE plpgsql
AS $function$
/**************************************************************************
 SISTEMA:		SPVPT
 FUNCION: 		snx.ft_unidadconstructivaeta_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tunidadconstructivaeta'
 AUTOR: 		 (admin)
 FECHA:	        25-02-2019 15:32:13
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				25-02-2019 15:32:13								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tunidadconstructivaeta'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_unidadconstructivaeta_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_UCBETA_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		25-02-2019 15:32:13
	***********************************/

	--Obtener otros gastos		
	if(p_transaccion='SNX_OTG_SEL')then
		begin
			v_consulta:='SELECT mcog.id_item,mcog.id_otrauc,mcog.otrosgastos,mcog.cantidadog,mcog.valorunitario,mcog.valorog
						 FROM (select    ucbeta.id_unidadconstructivaeta,      
						                 0 AS numerobahias,
							  			 coalesce(SUM(items.cantidaditem * items.valorunitario),0) as valoritem
						      from snx.tunidadconstructivaeta ucbeta
						      inner join segu.tusuario usu1 on usu1.id_usuario = ucbeta.id_usuario_reg
						      left join segu.tusuario usu2 on usu2.id_usuario = ucbeta.id_usuario_mod
						      left join snx.tunidadconstructivaetaitem items ON ucbeta.id_unidadconstructivaeta = items.id_unidadconstructivaeta
						      GROUP BY ucbeta.id_unidadconstructivaeta
							  ) mcuc
						left join snx.tunidadconstructivaetaitem items ON mcuc.id_unidadconstructivaeta = items.id_unidadconstructivaeta
						INNER JOIN snx.calcularotrosgastosotrasuc(mcuc.id_unidadconstructivaeta, mcuc.numerobahias, mcuc.valoritem, 9) mcog ON mcuc.id_unidadconstructivaeta = mcog.id_otrauc
						where';
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;

			--Devuelve la respuesta
			return v_consulta;
		end;
		
	elsif(p_transaccion='SNX_OTG_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(ucbeta.id_unidadconstructivaeta)
					    from snx.tunidadconstructivaeta ucbeta
					    inner join segu.tusuario usu1 on usu1.id_usuario = ucbeta.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = ucbeta.id_usuario_mod';
			
			--Definicion de la respuesta		    
			--v_consulta:=v_consulta||v_parametros.filtro;

			--Devuelve la respuesta
			return v_consulta;

		end;

	elseif(p_transaccion='SNX_UCBETA_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						ucbeta.id_unidadconstructivaeta,
						ucbeta.estado_reg,
						ucbeta.unidadconstructivaeta,
						ucbeta.codigo,
						ucbeta.fecha_reg,
						ucbeta.usuario_ai,
						ucbeta.id_usuario_reg,
						ucbeta.id_usuario_ai,
						ucbeta.id_usuario_mod,
						ucbeta.fecha_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
						coalesce(SUM(ucbetai.cantidaditem * ucbetai.valorunitario),0) as valoritem,
						(SELECT	SUM(valorog) FROM	snx.calcularotrosgastosotrasuc(ucbeta.id_unidadconstructivaeta,0,coalesce(SUM(ucbetai.cantidaditem * ucbetai.valorunitario),0),9)) as valorog,
						coalesce(SUM(ucbetai.cantidaditem * ucbetai.valorunitario),0) + (SELECT	SUM(valorog) FROM	snx.calcularotrosgastosotrasuc(ucbeta.id_unidadconstructivaeta,0,coalesce(SUM(ucbetai.cantidaditem * ucbetai.valorunitario),0),9)) as valortotal
						from snx.tunidadconstructivaeta ucbeta
						inner join segu.tusuario usu1 on usu1.id_usuario = ucbeta.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = ucbeta.id_usuario_mod
						left join snx.tunidadconstructivaetaitem ucbetai ON ucbeta.id_unidadconstructivaeta = ucbetai.id_unidadconstructivaeta
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
   			v_consulta:=v_consulta||' group by ucbeta.id_unidadconstructivaeta, ucbeta.estado_reg, ucbeta.unidadconstructivaeta, ucbeta.codigo, ucbeta.fecha_reg, ucbeta.usuario_ai, ucbeta.id_usuario_reg, ucbeta.id_usuario_ai, ucbeta.id_usuario_mod, ucbeta.fecha_mod, usu1.cuenta, usu2.cuenta ';
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCBETA_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		25-02-2019 15:32:13
	***********************************/

	elsif(p_transaccion='SNX_UCBETA_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_unidadconstructivaeta)
					    from snx.tunidadconstructivaeta ucbeta
					    inner join segu.tusuario usu1 on usu1.id_usuario = ucbeta.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = ucbeta.id_usuario_mod
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
