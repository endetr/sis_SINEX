-- FUNCTION: snx.ft_revista_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_revista_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_revista_ime(
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
 FUNCION: 		snx.ft_revista_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.trevista'
 AUTOR: 		 (admin)
 FECHA:	        17-09-2018 13:04:24
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				17-09-2018 13:04:24								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.trevista'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_revista	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_revista_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_REV_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		17-09-2018 13:04:24
	***********************************/

	if(p_transaccion='SNX_REV_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.trevista(
			revista,
			estado_reg,
			usuario_ai,
			fecha_reg,
			id_usuario_reg,
			id_usuario_ai,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.revista,
			'activo',
			v_parametros._nombre_usuario_ai,
			now(),
			p_id_usuario,
			v_parametros._id_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_revista into v_id_revista;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Revistas Precios almacenado(a) con exito (id_revista'||v_id_revista||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_revista',v_id_revista::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_REV_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		17-09-2018 13:04:24
	***********************************/

	elsif(p_transaccion='SNX_REV_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.trevista set
			revista = v_parametros.revista,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_revista=v_parametros.id_revista;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Revistas Precios modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_revista',v_parametros.id_revista::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_REV_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		17-09-2018 13:04:24
	***********************************/

	elsif(p_transaccion='SNX_REV_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.trevista
            where id_revista=v_parametros.id_revista;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Revistas Precios eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_revista',v_parametros.id_revista::varchar);
              
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

ALTER FUNCTION snx.ft_revista_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;