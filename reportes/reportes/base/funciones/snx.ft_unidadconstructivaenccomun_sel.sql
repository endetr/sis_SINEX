-- FUNCTION: snx.ft_unidadconstructivaenccomun_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_unidadconstructivaenccomun_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_unidadconstructivaenccomun_sel(
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
 FUNCION: 		snx.ft_unidadconstructivaenccomun_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tunidadconstructivaenccomun'
 AUTOR: 		 (admin)
 FECHA:	        15-11-2018 12:59:55
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				15-11-2018 12:59:55								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tunidadconstructivaenccomun'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_unidadconstructivaenccomun_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_UCCMENC_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		15-11-2018 12:59:55
	***********************************/
	--Obtener otros gastos		
	if(p_transaccion='SNX_OTG_SEL')then
		begin
			v_consulta:='SELECT mcog.id_item,mcog.id_otrauc,mcog.otrosgastos,mcog.cantidadog,mcog.valorunitario,mcog.valorog
			FROM (select    mcuc.id_unidadconstructivaenccomun,      
                            mcuc.numerobahias,
				  			coalesce(SUM(items.cantidadcomun * items.precio),0) as valoritem
                             from snx.tunidadconstructivaenccomun mcuc
                             inner join segu.tusuario usu1 on usu1.id_usuario = mcuc.id_usuario_reg
                             left join segu.tusuario usu2 on usu2.id_usuario = mcuc.id_usuario_mod
                             left join snx.tunidadconstructivacomun items ON mcuc.id_unidadconstructivaenccomun = items.id_unidadconstructivaenccomun
                             GROUP BY mcuc.id_unidadconstructivaenccomun,      
                            		  mcuc.numerobahias) mcuc
		left join snx.tunidadconstructivacomun items ON mcuc.id_unidadconstructivaenccomun = items.id_unidadconstructivaenccomun
		INNER JOIN snx.calcularotrosgastosotrasuc(mcuc.id_unidadconstructivaenccomun, mcuc.numerobahias, mcuc.valoritem) mcog ON mcuc.id_unidadconstructivaenccomun = mcog.id_otrauc
		where';
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;

			--Devuelve la respuesta
			return v_consulta;
		end;
		
	elsif(p_transaccion='SNX_OTG_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_unidadconstructivaenccomun)
					    from snx.tunidadconstructivaenccomun uccmenc
					    inner join segu.tusuario usu1 on usu1.id_usuario = uccmenc.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = uccmenc.id_usuario_mod';
			
			--Definicion de la respuesta		    
			--v_consulta:=v_consulta||v_parametros.filtro;

			--Devuelve la respuesta
			return v_consulta;

		end;

	elseif(p_transaccion='SNX_UCCMENC_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						uccmenc.id_unidadconstructivaenccomun,
						uccmenc.codigo,
						uccmenc.estado_reg,
						uccmenc.numerobahias,
						uccmenc.descripcion,
						uccmenc.id_usuario_reg,
						uccmenc.fecha_reg,
						uccmenc.usuario_ai,
						uccmenc.id_usuario_ai,
						uccmenc.fecha_mod,
						uccmenc.id_usuario_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
						coalesce(SUM(items.cantidadcomun * items.precio),0) as valoritem,
						(SELECT	SUM(valorog) FROM	snx.calcularotrosgastosotrasuc(uccmenc.id_unidadconstructivaenccomun,uccmenc.numerobahias,coalesce(SUM(items.cantidadcomun * items.precio),0))) as valorog,
						coalesce(SUM(items.cantidadcomun * items.precio),0) + (SELECT	SUM(valorog) FROM	snx.calcularotrosgastosotrasuc(uccmenc.id_unidadconstructivaenccomun,uccmenc.numerobahias,coalesce(SUM(items.cantidadcomun * items.precio),0))) AS valortotal
						from snx.tunidadconstructivaenccomun uccmenc
						inner join segu.tusuario usu1 on usu1.id_usuario = uccmenc.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = uccmenc.id_usuario_mod
						left join snx.tunidadconstructivacomun items ON uccmenc.id_unidadconstructivaenccomun = items.id_unidadconstructivaenccomun
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' group by uccmenc.id_unidadconstructivaenccomun, uccmenc.codigo, uccmenc.estado_reg, uccmenc.numerobahias, uccmenc.descripcion, uccmenc.id_usuario_reg, uccmenc.fecha_reg, uccmenc.usuario_ai, uccmenc.id_usuario_ai, uccmenc.fecha_mod, uccmenc.id_usuario_mod, usu1.cuenta, usu2.cuenta ';
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCCMENC_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		15-11-2018 12:59:55
	***********************************/

	elsif(p_transaccion='SNX_UCCMENC_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_unidadconstructivaenccomun)
					    from snx.tunidadconstructivaenccomun uccmenc
					    inner join segu.tusuario usu1 on usu1.id_usuario = uccmenc.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = uccmenc.id_usuario_mod
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

ALTER FUNCTION snx.ft_unidadconstructivaenccomun_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;