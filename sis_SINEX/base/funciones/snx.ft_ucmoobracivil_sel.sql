-- FUNCTION: snx.ft_ucmoobracivil_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_ucmoobracivil_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_ucmoobracivil_sel(
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
 FUNCION: 		snx.ft_ucmoobracivil_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tucmoobracivil'
 AUTOR: 		 (admin)
 FECHA:	        27-07-2018 16:54:44
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				27-07-2018 16:54:44								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tucmoobracivil'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_ucmoobracivil_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_UCMOOBCI_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		27-07-2018 16:54:44
	***********************************/

	if(p_transaccion='SNX_UCMOOBCI_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						ucmoobci.id_ucmoobracivil,
						ucmoobci.id_obracivilmoe,
						ucmoobci.cantidadobra,
						ucmoobci.estado_reg,
						ucmoobci.id_ucmogrupo,
						ucmoobci.id_usuario_ai,
						ucmoobci.id_usuario_reg,
						ucmoobci.usuario_ai,
						ucmoobci.fecha_reg,
						ucmoobci.id_usuario_mod,
						ucmoobci.fecha_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
						obrci.obracivilmoe as desc_obracivilmoe,
						uni.unidad as unidad,
						cast(valoc.preciounitariorlp * ucmoobci.cantidadobra as numeric(18,2)) as valortotalrlp,
						cast(valoc.preciounitariorcb * ucmoobci.cantidadobra as numeric(18,2)) as valortotalrcb,
						cast(valoc.preciounitariorsc * ucmoobci.cantidadobra as numeric(18,2)) as valortotalrsc,
						valoc.preciounitariorlp,
						valoc.preciounitariorcb,
						valoc.preciounitariorsc
						from snx.tucmoobracivil ucmoobci
						inner join segu.tusuario usu1 on usu1.id_usuario = ucmoobci.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = ucmoobci.id_usuario_mod
				        left join snx.tobracivilmoe obrci on ucmoobci.id_obracivilmoe = obrci.id_obracivilmoe
						left join snx.tunidad uni on uni.id_unidad = obrci.id_unidad
						left join snx.calcularvaloresobracivilmoe(ucmoobci.id_obracivilmoe) valoc ON ucmoobci.id_obracivilmoe = valoc.id_obracivilmoe
					  where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCMOOBCI_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		27-07-2018 16:54:44
	***********************************/

	elsif(p_transaccion='SNX_UCMOOBCI_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_ucmoobracivil)
					    from snx.tucmoobracivil ucmoobci
					    inner join segu.tusuario usu1 on usu1.id_usuario = ucmoobci.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = ucmoobci.id_usuario_mod
						left join snx.tobracivilmoe obrci on ucmoobci.id_obracivilmoe = obrci.id_obracivilmoe
						left join snx.tunidad uni on uni.id_unidad = obrci.id_unidad
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

ALTER FUNCTION snx.ft_ucmoobracivil_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;