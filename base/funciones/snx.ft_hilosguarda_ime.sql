-- FUNCTION: snx.ft_hilosguarda_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_hilosguarda_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_hilosguarda_ime(
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
 FUNCION: 		snx.ft_hilosguarda_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.thilosguarda'
 AUTOR: 		 (admin)
 FECHA:	        23-10-2018 13:47:29
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				23-10-2018 13:47:29								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.thilosguarda'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_hilosguarda	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_hilosguarda_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_HDG_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		23-10-2018 13:47:29
	***********************************/

	if(p_transaccion='SNX_HDG_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.thilosguarda(
			cantidadacero,
			cantidadopgw,
			estado_reg,
			hilosguarda,
			id_usuario_ai,
			id_usuario_reg,
			fecha_reg,
			usuario_ai,
			id_usuario_mod,
			fecha_mod
          	) values(
			v_parametros.cantidadacero,
			v_parametros.cantidadopgw,
			'activo',
			v_parametros.hilosguarda,
			v_parametros._id_usuario_ai,
			p_id_usuario,
			now(),
			v_parametros._nombre_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_hilosguarda into v_id_hilosguarda;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Hilos de guarda almacenado(a) con exito (id_hilosguarda'||v_id_hilosguarda||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_hilosguarda',v_id_hilosguarda::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_HDG_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		23-10-2018 13:47:29
	***********************************/

	elsif(p_transaccion='SNX_HDG_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.thilosguarda set
			cantidadacero = v_parametros.cantidadacero,
			cantidadopgw = v_parametros.cantidadopgw,
			hilosguarda = v_parametros.hilosguarda,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_hilosguarda=v_parametros.id_hilosguarda;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Hilos de guarda modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_hilosguarda',v_parametros.id_hilosguarda::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_HDG_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		23-10-2018 13:47:29
	***********************************/

	elsif(p_transaccion='SNX_HDG_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.thilosguarda
            where id_hilosguarda=v_parametros.id_hilosguarda;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Hilos de guarda eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_hilosguarda',v_parametros.id_hilosguarda::varchar);
              
            --Devuelve la respuesta
            return v_resp;

		end;
         
	else
     
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

ALTER FUNCTION snx.ft_hilosguarda_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;