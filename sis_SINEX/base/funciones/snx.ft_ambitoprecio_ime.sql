-- FUNCTION: snx.ft_ambitoprecio_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_ambitoprecio_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_ambitoprecio_ime(
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
 FUNCION: 		snx.ft_ambitoprecio_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tambitoprecio'
 AUTOR: 		 (admin)
 FECHA:	        23-07-2018 15:53:37
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				23-07-2018 15:53:37								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tambitoprecio'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_ambitoprecio	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_ambitoprecio_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_AMBP_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		23-07-2018 15:53:37
	***********************************/

	if(p_transaccion='SNX_AMBP_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tambitoprecio(
			ambitoprecio,
			estado_reg,
			id_usuario_ai,
			id_usuario_reg,
			usuario_ai,
			fecha_reg,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.ambitoprecio,
			'activo',
			v_parametros._id_usuario_ai,
			p_id_usuario,
			v_parametros._nombre_usuario_ai,
			now(),
			null,
			null
							
			
			
			)RETURNING id_ambitoprecio into v_id_ambitoprecio;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Ámbito Precio almacenado(a) con exito (id_ambitoprecio'||v_id_ambitoprecio||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_ambitoprecio',v_id_ambitoprecio::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_AMBP_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		23-07-2018 15:53:37
	***********************************/

	elsif(p_transaccion='SNX_AMBP_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tambitoprecio set
			ambitoprecio = v_parametros.ambitoprecio,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_ambitoprecio=v_parametros.id_ambitoprecio;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Ámbito Precio modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_ambitoprecio',v_parametros.id_ambitoprecio::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_AMBP_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		23-07-2018 15:53:37
	***********************************/

	elsif(p_transaccion='SNX_AMBP_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tambitoprecio
            where id_ambitoprecio=v_parametros.id_ambitoprecio;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Ámbito Precio eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_ambitoprecio',v_parametros.id_ambitoprecio::varchar);
              
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

ALTER FUNCTION snx.ft_ambitoprecio_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;