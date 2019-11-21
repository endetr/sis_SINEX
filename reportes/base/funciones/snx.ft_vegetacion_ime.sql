-- FUNCTION: snx.ft_vegetacion_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_vegetacion_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_vegetacion_ime(
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
 FUNCION: 		snx.ft_vegetacion_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tvegetacion'
 AUTOR: 		 (admin)
 FECHA:	        24-07-2018 14:00:24
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				24-07-2018 14:00:24								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tvegetacion'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_vegetacion	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_vegetacion_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_VGT_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		24-07-2018 14:00:24
	***********************************/

	if(p_transaccion='SNX_VGT_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tvegetacion(
			tipovegetacion,
			costoroce,
			estado_reg,
			id_usuario_ai,
			id_usuario_reg,
			usuario_ai,
			fecha_reg,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.tipovegetacion,
			v_parametros.costoroce,
			'activo',
			v_parametros._id_usuario_ai,
			p_id_usuario,
			v_parametros._nombre_usuario_ai,
			now(),
			null,
			null
							
			
			
			)RETURNING id_vegetacion into v_id_vegetacion;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Vegetacion almacenado(a) con exito (id_vegetacion'||v_id_vegetacion||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_vegetacion',v_id_vegetacion::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_VGT_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		24-07-2018 14:00:24
	***********************************/

	elsif(p_transaccion='SNX_VGT_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tvegetacion set
			tipovegetacion = v_parametros.tipovegetacion,
			costoroce = v_parametros.costoroce,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_vegetacion=v_parametros.id_vegetacion;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Vegetacion modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_vegetacion',v_parametros.id_vegetacion::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_VGT_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		24-07-2018 14:00:24
	***********************************/

	elsif(p_transaccion='SNX_VGT_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tvegetacion
            where id_vegetacion=v_parametros.id_vegetacion;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Vegetacion eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_vegetacion',v_parametros.id_vegetacion::varchar);
              
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

ALTER FUNCTION snx.ft_vegetacion_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;