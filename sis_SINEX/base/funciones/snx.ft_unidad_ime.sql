-- FUNCTION: snx.ft_unidad_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_unidad_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_unidad_ime(
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
 FUNCION: 		snx.ft_unidad_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tunidad'
 AUTOR: 		 (admin)
 FECHA:	        21-03-2018 19:24:25
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				21-03-2018 19:24:25								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tunidad'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_unidad	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_unidad_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_UNI_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		21-03-2018 19:24:25
	***********************************/

	if(p_transaccion='SNX_UNI_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tunidad(
			unidad,
			estado_reg,
			unidadabrev,
			id_usuario_reg,
			usuario_ai,
			fecha_reg,
			id_usuario_ai,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.unidad,
			'activo',
			v_parametros.unidadabrev,
			p_id_usuario,
			v_parametros._nombre_usuario_ai,
			now(),
			v_parametros._id_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_unidad into v_id_unidad;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Unidad almacenado(a) con exito (id_unidad'||v_id_unidad||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidad',v_id_unidad::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UNI_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		21-03-2018 19:24:25
	***********************************/

	elsif(p_transaccion='SNX_UNI_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tunidad set
			unidad = v_parametros.unidad,
			unidadabrev = v_parametros.unidadabrev,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_unidad=v_parametros.id_unidad;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Unidad modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidad',v_parametros.id_unidad::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UNI_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		21-03-2018 19:24:25
	***********************************/

	elsif(p_transaccion='SNX_UNI_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tunidad
            where id_unidad=v_parametros.id_unidad;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Unidad eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidad',v_parametros.id_unidad::varchar);
              
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

ALTER FUNCTION snx.ft_unidad_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;