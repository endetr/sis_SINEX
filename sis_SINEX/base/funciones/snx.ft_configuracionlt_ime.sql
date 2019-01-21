-- FUNCTION: snx.ft_configuracionlt_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_configuracionlt_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_configuracionlt_ime(
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
 FUNCION: 		snx.ft_configuracionlt_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tconfiguracionlt'
 AUTOR: 		 (admin)
 FECHA:	        19-07-2018 14:36:46
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				19-07-2018 14:36:46								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tconfiguracionlt'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_configuracionlt	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_configuracionlt_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_CONFL_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		19-07-2018 14:36:46
	***********************************/

	if(p_transaccion='SNX_CONFL_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tconfiguracionlt(
			estado_reg,
			configuracionlt,
			id_usuario_reg,
			fecha_reg,
			usuario_ai,
			id_usuario_ai,
			id_usuario_mod,
			fecha_mod
          	) values(
			'activo',
			v_parametros.configuracionlt,
			p_id_usuario,
			now(),
			v_parametros._nombre_usuario_ai,
			v_parametros._id_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_configuracionlt into v_id_configuracionlt;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Configuración Línea almacenado(a) con exito (id_configuracionlt'||v_id_configuracionlt||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_configuracionlt',v_id_configuracionlt::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_CONFL_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		19-07-2018 14:36:46
	***********************************/

	elsif(p_transaccion='SNX_CONFL_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tconfiguracionlt set
			configuracionlt = v_parametros.configuracionlt,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_configuracionlt=v_parametros.id_configuracionlt;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Configuración Línea modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_configuracionlt',v_parametros.id_configuracionlt::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_CONFL_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		19-07-2018 14:36:46
	***********************************/

	elsif(p_transaccion='SNX_CONFL_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tconfiguracionlt
            where id_configuracionlt=v_parametros.id_configuracionlt;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Configuración Línea eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_configuracionlt',v_parametros.id_configuracionlt::varchar);
              
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

ALTER FUNCTION snx.ft_configuracionlt_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;