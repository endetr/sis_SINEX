-- FUNCTION: snx.ft_unidadconstructivaencseraux_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_unidadconstructivaencseraux_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_unidadconstructivaencseraux_sel(
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
 FUNCION: 		snx.ft_unidadconstructivaencseraux_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tunidadconstructivaencseraux'
 AUTOR: 		 (admin)
 FECHA:	        14-11-2018 20:35:13
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				14-11-2018 20:35:13								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tunidadconstructivaencseraux'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_unidadconstructivaencseraux_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_UCSAENC_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		14-11-2018 20:35:13
	***********************************/
	--Obtener otros gastos		
	if(p_transaccion='SNX_OTG_SEL')then
		begin
			v_consulta:='SELECT mcog.id_item,mcog.id_otrauc,mcog.otrosgastos,mcog.cantidadog,mcog.valorunitario,mcog.valorog
			FROM (select    mcuc.unidadconstructivaencseraux,      
                            mcuc.numerobahias,
				  			coalesce(SUM(items.cantidadseraux * items.precio),0)  as totalitems
                             from snx.tunidadconstructivaencseraux mcuc
                             inner join segu.tusuario usu1 on usu1.id_usuario = mcuc.id_usuario_reg
                             left join segu.tusuario usu2 on usu2.id_usuario = mcuc.id_usuario_mod
                             left join snx.tunidadconstructivaseraux items ON mcuc.unidadconstructivaencseraux = items.unidadconstructivaencseraux
                             GROUP BY mcuc.unidadconstructivaencseraux,      
                            		  mcuc.numerobahias) mcuc
		INNER JOIN snx.calcularotrosgastosotrasuc(mcuc.unidadconstructivaencseraux, mcuc.numerobahias, mcuc.totalitems) mcog ON mcuc.unidadconstructivaencseraux = mcog.id_otrauc
		where ';
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;

			--Devuelve la respuesta
			return v_consulta;
		end;
		
	elsif(p_transaccion='SNX_OTG_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(unidadconstructivaencseraux)
					    from snx.tunidadconstructivaencseraux ucsaenc
					    inner join segu.tusuario usu1 on usu1.id_usuario = ucsaenc.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = ucsaenc.id_usuario_mod';
			
			--Definicion de la respuesta		    
			--v_consulta:=v_consulta||v_parametros.filtro;

			--Devuelve la respuesta
			return v_consulta;

		end;

	elseif(p_transaccion='SNX_UCSAENC_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						ucsaenc.unidadconstructivaencseraux,
						ucsaenc.estado_reg,
						ucsaenc.numerobahias,
						ucsaenc.descripcion,
						ucsaenc.codigo,
						ucsaenc.id_usuario_reg,
						ucsaenc.fecha_reg,
						ucsaenc.usuario_ai,
						ucsaenc.id_usuario_ai,
						ucsaenc.id_usuario_mod,
						ucsaenc.fecha_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
						coalesce(SUM(items.cantidadseraux * items.precio),0) as valoritem,
						(SELECT	SUM(valorog) FROM	snx.calcularotrosgastosotrasuc(ucsaenc.unidadconstructivaencseraux,ucsaenc.numerobahias,coalesce(SUM(items.cantidadseraux * items.precio),0))) as valorog,
						coalesce(SUM(items.cantidadseraux * items.precio),0) + (SELECT	SUM(valorog) FROM	snx.calcularotrosgastosotrasuc(ucsaenc.unidadconstructivaencseraux,ucsaenc.numerobahias,coalesce(SUM(items.cantidadseraux * items.precio),0))) as valortotal																															 
						from snx.tunidadconstructivaencseraux ucsaenc
						inner join segu.tusuario usu1 on usu1.id_usuario = ucsaenc.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = ucsaenc.id_usuario_mod
						left join snx.tunidadconstructivaseraux items ON ucsaenc.unidadconstructivaencseraux = items.unidadconstructivaencseraux
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' group by ucsaenc.unidadconstructivaencseraux,ucsaenc.estado_reg,ucsaenc.numerobahias,ucsaenc.descripcion,ucsaenc.codigo,ucsaenc.id_usuario_reg,ucsaenc.fecha_reg,ucsaenc.usuario_ai,ucsaenc.id_usuario_ai,ucsaenc.id_usuario_mod,ucsaenc.fecha_mod,usu1.cuenta,usu2.cuenta ';
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCSAENC_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		14-11-2018 20:35:13
	***********************************/

	elsif(p_transaccion='SNX_UCSAENC_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(unidadconstructivaencseraux)
					    from snx.tunidadconstructivaencseraux ucsaenc
					    inner join segu.tusuario usu1 on usu1.id_usuario = ucsaenc.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = ucsaenc.id_usuario_mod
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

ALTER FUNCTION snx.ft_unidadconstructivaencseraux_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;