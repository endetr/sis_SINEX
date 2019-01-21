-- FUNCTION: snx.ft_ucmogrupo_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_ucmogrupo_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_ucmogrupo_sel(
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
 FUNCION: 		snx.ft_ucmogrupo_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tucmogrupo'
 AUTOR: 		 (admin)
 FECHA:	        27-07-2018 16:51:55
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				27-07-2018 16:51:55								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'snx.tucmogrupo'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'snx.ft_ucmogrupo_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_UCMOGR_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		27-07-2018 16:51:55
	***********************************/

	if(p_transaccion='SNX_UCMOGR_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						ucmogr.id_ucmogrupo,
						ucmogr.id_unidadconstructivamo,
						ucmogr.estado_reg,
						ucmogr.unmogrupo,
						ucmogr.fecha_reg,
						ucmogr.usuario_ai,
						ucmogr.id_usuario_reg,
						ucmogr.id_usuario_ai,
						ucmogr.fecha_mod,
						ucmogr.id_usuario_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
						cast(sum(valoc.preciounitariorlp * obrci.cantidadobra) as numeric(18,2)) as valortotalrlp,
						cast(sum(valoc.preciounitariorcb * obrci.cantidadobra) as numeric(18,2)) as valortotalrcb,
						cast(sum(valoc.preciounitariorsc * obrci.cantidadobra) as numeric(18,2)) as valortotalrsc
						from snx.tucmogrupo ucmogr
						inner join segu.tusuario usu1 on usu1.id_usuario = ucmogr.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = ucmogr.id_usuario_mod
				        left join snx.tucmoobracivil obrci on ucmogr.id_ucmogrupo = obrci.id_ucmogrupo
						left join snx.tobracivilmoe obrcimoe on obrci.id_obracivilmoe = obrcimoe.id_obracivilmoe
						left join snx.calcularvaloresobracivilmoe(obrci.id_obracivilmoe) valoc ON obrci.id_obracivilmoe = valoc.id_obracivilmoe
						where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;			
			v_consulta:=v_consulta||' group by  ucmogr.id_ucmogrupo,
												ucmogr.id_unidadconstructivamo,
												ucmogr.estado_reg,
												ucmogr.unmogrupo,
												ucmogr.fecha_reg,
												ucmogr.usuario_ai,
												ucmogr.id_usuario_reg,
												ucmogr.id_usuario_ai,
												ucmogr.fecha_mod,
												ucmogr.id_usuario_mod,
												usu1.cuenta,
												usu2.cuenta';
												
			--v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;
			
			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCMOGR_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		27-07-2018 16:51:55
	***********************************/

	elsif(p_transaccion='SNX_UCMOGR_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(ucmogr.id_ucmogrupo)
					    from snx.tucmogrupo ucmogr
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

ALTER FUNCTION snx.ft_ucmogrupo_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;