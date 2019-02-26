CREATE OR REPLACE FUNCTION snx.ft_unidadconstructivaetaitem_sel(p_administrador integer, p_id_usuario integer, p_tabla character varying, p_transaccion character varying)
 RETURNS character varying
 LANGUAGE plpgsql
AS $function$
/**************************************************************************
 SISTEMA:		SPVPT
 FUNCION: 		snx.ft_unidadconstructivaetaitem_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tunidadconstructivaetaitem'
 AUTOR: 		 (admin)
 FECHA:	        25-02-2019 15:32:16
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				25-02-2019 15:32:16								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tunidadconstructivaetaitem'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_unidadconstructivaetaitem_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_UCBETAI_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		25-02-2019 15:32:16
	***********************************/

	if(p_transaccion='SNX_UCBETAI_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						ucbetai.id_unidadconstructivaetaitem,
						ucbetai.id_unidadconstructivaeta,
						ucbetai.id_unidad,
						ucbetai.valorunitario,
						ucbetai.estado_reg,
						ucbetai.cantidaditem,
						ucbetai.unidadconstructivaetaitem,
						ucbetai.id_usuario_reg,
						ucbetai.fecha_reg,
						ucbetai.usuario_ai,
						ucbetai.id_usuario_ai,
						ucbetai.id_usuario_mod,
						ucbetai.fecha_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
						uni.unidadabrev as desc_unidadabrev,
						cast((ucbetai.cantidaditem * ucbetai.valorunitario) as numeric(18,5)) as valortotaletaitem					
						from snx.tunidadconstructivaetaitem ucbetai
						inner join segu.tusuario usu1 on usu1.id_usuario = ucbetai.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = ucbetai.id_usuario_mod
						inner join snx.tunidad uni on ucbetai.id_unidad = uni.id_unidad
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCBETAI_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		25-02-2019 15:32:16
	***********************************/

	elsif(p_transaccion='SNX_UCBETAI_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_unidadconstructivaetaitem)
					    from snx.tunidadconstructivaetaitem ucbetai
					    inner join segu.tusuario usu1 on usu1.id_usuario = ucbetai.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = ucbetai.id_usuario_mod
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
