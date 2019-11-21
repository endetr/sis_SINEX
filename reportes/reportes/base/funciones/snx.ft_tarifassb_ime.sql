-- FUNCTION: snx.ft_tarifassb_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_tarifassb_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_tarifassb_ime(
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
 FUNCION: 		snx.ft_tarifassb_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.ttarifassb'
 AUTOR: 		 (admin)
 FECHA:	        10-10-2018 13:26:46
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				10-10-2018 13:26:46								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.ttarifassb'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_tarifasb	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_tarifassb_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_TAR_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		10-10-2018 13:26:46
	***********************************/

	if(p_transaccion='SNX_TAR_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.ttarifassb(
			id_unidad,
			tarifasb,
			valortarifa,
			estado_reg,
			id_usuario_ai,
			id_usuario_reg,
			usuario_ai,
			fecha_reg,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.id_unidad,
			v_parametros.tarifasb,
			v_parametros.valortarifa,
			'activo',
			v_parametros._id_usuario_ai,
			p_id_usuario,
			v_parametros._nombre_usuario_ai,
			now(),
			null,
			null
							
			
			
			)RETURNING id_tarifasb into v_id_tarifasb;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Tarifas almacenado(a) con exito (id_tarifasb'||v_id_tarifasb||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_tarifasb',v_id_tarifasb::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_TAR_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		10-10-2018 13:26:46
	***********************************/

	elsif(p_transaccion='SNX_TAR_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.ttarifassb set
			id_unidad = v_parametros.id_unidad,
			tarifasb = v_parametros.tarifasb,
			valortarifa = v_parametros.valortarifa,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_tarifasb=v_parametros.id_tarifasb;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Tarifas modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_tarifasb',v_parametros.id_tarifasb::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_TAR_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		10-10-2018 13:26:46
	***********************************/

	elsif(p_transaccion='SNX_TAR_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.ttarifassb
            where id_tarifasb=v_parametros.id_tarifasb;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Tarifas eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_tarifasb',v_parametros.id_tarifasb::varchar);
              
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

ALTER FUNCTION snx.ft_tarifassb_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;