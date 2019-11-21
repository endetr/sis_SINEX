-- FUNCTION: snx.ft_materialcantlt_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_materialcantlt_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_materialcantlt_ime(
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

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_ucltvalorar	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_materialcantlt_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	if(p_transaccion='SNX_MTLT_MOD')then

		begin
			--Sentencia de la modificacion
			update	snx.tunidadconstructivalteqmate
			set		id_puestatierra = v_parametros.id_puestatierra,
					id_aislador = v_parametros.id_aislador
			where	id_unidadconstructivalt = v_parametros.id_unidadconstructivalt and id_item = v_parametros.id_item;			
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Sumunistros modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivalt',v_parametros.id_unidadconstructivalt::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;
		
    	raise exception 'Transaccion inexistente: %',p_transaccion;

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

ALTER FUNCTION snx.ft_materialcantlt_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;