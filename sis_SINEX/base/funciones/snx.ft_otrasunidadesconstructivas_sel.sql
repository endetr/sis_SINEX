-- FUNCTION: snx.ft_otrasunidadesconstructivas_sel(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_otrasunidadesconstructivas_sel(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_otrasunidadesconstructivas_sel(
	p_administrador integer,
	p_id_usuario integer,
	p_tabla character varying,
	p_transaccion character varying)
    RETURNS character varying
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
AS $BODY$

DECLARE
	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN
	v_nombre_funcion = 'snx.ft_otrasunidadesconstructivas_sel';
    v_parametros = pxp.f_get_record(p_tabla);
	
	if(p_transaccion='SNX_OUCSB_SEL')then
		begin
    		--Sentencia de la consulta
			v_consulta:='SELECT	OUSB.id_otraunidad,
								OUSB.codigo,
								OUSB.descripcion,
								OUSB.codigo_descripcion,
								OUSB.valortotal
						 FROM 	snx.obtenerotrasunidadesconstructivas('''',1,1) OUSB 
						 WHERE  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;
		
	elsif(p_transaccion='SNX_OUCSB_CONT')then
		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='SELECT count(OUSB.id_otraunidad)
					     FROM 	snx.obtenerotrasunidadesconstructivas('''',1,1) OUSB 
						 WHERE ';
			
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

ALTER FUNCTION snx.ft_otrasunidadesconstructivas_sel(integer, integer, character varying, character varying)
    OWNER TO postgres;