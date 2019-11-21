-- FUNCTION: snx.ft_obracivilmoe_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_obracivilmoe_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_obracivilmoe_sel(
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
 FUNCION: 		snx.ft_obracivilmoe_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tobracivilmoe'
 AUTOR: 		 (admin)
 FECHA:	        30-08-2018 18:37:14
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				30-08-2018 18:37:14								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tobracivilmoe'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_obracivilmoe_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_OBRCI_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		30-08-2018 18:37:14
	***********************************/
	if(p_transaccion='SNX_TRANS_SEL')then
		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select cast(transporte.strtransporte as varchar) from (values (cast(''Si'' as varchar)),(cast(''No'' as varchar))) AS transporte(strtransporte) ';
			
			--Definicion de la respuesta		    
			--v_consulta:=v_consulta||v_parametros.filtro;
			--v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
		end;
		
	elsif(p_transaccion='SNX_TRANS_CONT')then
		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(obrci.id_obracivilmoe)
					    from snx.tobracivilmoe obrci';
			
			--Definicion de la respuesta		    
			--v_consulta:=v_consulta||v_parametros.filtro;

			--Devuelve la respuesta
			return v_consulta;

		end;

	elseif(p_transaccion='SNX_OBRCI_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						obrci.id_obracivilmoe,
						obrci.porccargasocial,
						obrci.id_unidad,
						obrci.valorunitario,
						obrci.porcimpuestos,
						obrci.porcimpmanoobra,
						obrci.estado_reg,
						obrci.porcgastosga,
						obrci.porcutilidad,
						obrci.obracivilmoe,
						obrci.strtransporte,
						obrci.porcherramientas,
						obrci.id_usuario_ai,
						obrci.id_usuario_reg,
						obrci.usuario_ai,
						obrci.fecha_reg,
						obrci.id_usuario_mod,
						obrci.fecha_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,						
						uni.unidadabrev as desc_unidadabrev,					
						COALESCE(valoc.preciounitariorlp , 0) as preciounitariorlp,
						COALESCE(valoc.preciounitariorcb, 0) AS preciounitariorcb,
						COALESCE(valoc.preciounitariorsc, 0) AS preciounitariorsc
						from snx.tobracivilmoe obrci
						inner join segu.tusuario usu1 on usu1.id_usuario = obrci.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = obrci.id_usuario_mod
				        left join snx.tunidad uni on obrci.id_unidad = uni.id_unidad
						left join snx.calcularvaloresobracivilmoe(obrci.id_obracivilmoe) valoc ON obrci.id_obracivilmoe = valoc.id_obracivilmoe
						where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;		

	/*********************************    
 	#TRANSACCION:  'SNX_OBRCI_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		30-08-2018 18:37:14
	***********************************/

	elseif(p_transaccion='SNX_OBRCI_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(obrci.id_obracivilmoe)
					    from snx.tobracivilmoe obrci
					    inner join segu.tusuario usu1 on usu1.id_usuario = obrci.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = obrci.id_usuario_mod
					    left join snx.tunidad uni on obrci.id_unidad = uni.id_unidad					   
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

ALTER FUNCTION snx.ft_obracivilmoe_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;