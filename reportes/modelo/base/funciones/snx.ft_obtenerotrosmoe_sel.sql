-- FUNCTION: snx.ft_obtenerotrosmoe_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_obtenerotrosmoe_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_obtenerotrosmoe_sel(
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
 FUNCION: 		snx.ft_obtenerotrosmoe_sel
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

	v_nombre_funcion = 'snx.ft_obtenerotrosmoe_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_OBRCI_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		30-08-2018 18:37:14
	***********************************/

	if(p_transaccion='SNX_OBRCI_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						obrci.id_obracivilmoe,
						valotmoe.id_otromoe,
						valotmoe.otromoe,
						valotmoe.cantidadocmoe,
						cast(valotmoe.valorunitariorlpusd as numeric(18,2)) as valorunitariorlpusd,
						cast(valotmoe.valorunitariorcbusd as numeric(18,2)) as valorunitariorcbusd,
						cast(valotmoe.valorunitariorscusd as numeric(18,2)) as valorunitariorscusd,
						cast(valotmoe.costototalrlp as numeric(18,2)) as costototalrlp,
						cast(valotmoe.costototalrcb as numeric(18,2)) as costototalrcb,
						cast(valotmoe.costototalrsc as numeric(18,2)) as costototalrsc
						from snx.tobracivilmoe obrci						
						inner join snx.obtenerotrosmoe(obrci.id_obracivilmoe) valotmoe ON obrci.id_obracivilmoe = valotmoe.id_obracivilmoe
						where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			--v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_OBRCI_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		30-08-2018 18:37:14
	***********************************/

	elsif(p_transaccion='SNX_OBRCI_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(obrci.id_obracivilmoe)
					    from snx.tobracivilmoe obrci
					    left join snx.obtenerotrosmoe(obrci.id_obracivilmoe) valotmoe ON obrci.id_obracivilmoe = valotmoe.id_obracivilmoe					   
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

ALTER FUNCTION snx.ft_obtenerotrosmoe_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;