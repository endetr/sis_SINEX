-- FUNCTION: snx.ft_ubicacion_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_ubicacion_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_ubicacion_ime(
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
 FUNCION: 		snx.ft_ubicacion_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tubicacion'
 AUTOR: 		 (admin)
 FECHA:	        21-03-2018 19:24:38
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				21-03-2018 19:24:38								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tubicacion'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_ubicacion	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_ubicacion_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_UBI_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		21-03-2018 19:24:38
	***********************************/

	if(p_transaccion='SNX_UBI_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tubicacion(
			estado_reg,
			ubicacion,
			id_usuario_ai,
			id_usuario_reg,
			usuario_ai,
			fecha_reg,
			id_usuario_mod,
			fecha_mod
          	) values(
			'activo',
			v_parametros.ubicacion,
			v_parametros._id_usuario_ai,
			p_id_usuario,
			v_parametros._nombre_usuario_ai,
			now(),
			null,
			null
							
			
			
			)RETURNING id_ubicacion into v_id_ubicacion;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Ubicacion almacenado(a) con exito (id_ubicacion'||v_id_ubicacion||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_ubicacion',v_id_ubicacion::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UBI_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		21-03-2018 19:24:38
	***********************************/

	elsif(p_transaccion='SNX_UBI_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tubicacion set
			ubicacion = v_parametros.ubicacion,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_ubicacion=v_parametros.id_ubicacion;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Ubicacion modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_ubicacion',v_parametros.id_ubicacion::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UBI_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		21-03-2018 19:24:38
	***********************************/

	elsif(p_transaccion='SNX_UBI_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tubicacion
            where id_ubicacion=v_parametros.id_ubicacion;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Ubicacion eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_ubicacion',v_parametros.id_ubicacion::varchar);
              
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

ALTER FUNCTION snx.ft_ubicacion_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;