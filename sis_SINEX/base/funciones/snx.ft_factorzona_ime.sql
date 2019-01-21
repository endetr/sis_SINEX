-- FUNCTION: snx.ft_factorzona_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_factorzona_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_factorzona_ime(
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
 FUNCION: 		snx.ft_factorzona_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tfactorzona'
 AUTOR: 		 (admin)
 FECHA:	        12-06-2018 14:56:11
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				12-06-2018 14:56:11								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tfactorzona'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_factorzona	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_factorzona_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_FTZ_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		12-06-2018 14:56:11
	***********************************/

	if(p_transaccion='SNX_FTZ_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tfactorzona(
			calificacion,
			estado_reg,
			distanciaini,
			factor,
			distanciafin,
			fecha_reg,
			usuario_ai,
			id_usuario_reg,
			id_usuario_ai,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.calificacion,
			'activo',
			v_parametros.distanciaini,
			v_parametros.factor,
			v_parametros.distanciafin,
			now(),
			v_parametros._nombre_usuario_ai,
			p_id_usuario,
			v_parametros._id_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_factorzona into v_id_factorzona;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Factor zona almacenado(a) con exito (id_factorzona'||v_id_factorzona||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_factorzona',v_id_factorzona::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_FTZ_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		12-06-2018 14:56:11
	***********************************/

	elsif(p_transaccion='SNX_FTZ_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tfactorzona set
			calificacion = v_parametros.calificacion,
			distanciaini = v_parametros.distanciaini,
			factor = v_parametros.factor,
			distanciafin = v_parametros.distanciafin,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_factorzona=v_parametros.id_factorzona;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Factor zona modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_factorzona',v_parametros.id_factorzona::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_FTZ_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		12-06-2018 14:56:11
	***********************************/

	elsif(p_transaccion='SNX_FTZ_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tfactorzona
            where id_factorzona=v_parametros.id_factorzona;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Factor zona eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_factorzona',v_parametros.id_factorzona::varchar);
              
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

ALTER FUNCTION snx.ft_factorzona_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;