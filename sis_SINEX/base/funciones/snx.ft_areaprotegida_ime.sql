-- FUNCTION: snx.ft_areaprotegida_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_areaprotegida_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_areaprotegida_ime(
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
 FUNCION: 		snx.ft_areaprotegida_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tareaprotegida'
 AUTOR: 		 (admin)
 FECHA:	        05-09-2018 13:04:44
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				05-09-2018 13:04:44								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tareaprotegida'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_areaprotegida	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_areaprotegida_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_ZONP_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		05-09-2018 13:04:44
	***********************************/

	if(p_transaccion='SNX_ZONP_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tareaprotegida(
			areaprotegida,
			estado_reg,
			id_usuario_ai,
			id_usuario_reg,
			usuario_ai,
			fecha_reg,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.areaprotegida,
			'activo',
			v_parametros._id_usuario_ai,
			p_id_usuario,
			v_parametros._nombre_usuario_ai,
			now(),
			null,
			null
							
			
			
			)RETURNING id_areaprotegida into v_id_areaprotegida;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Zona Protegida almacenado(a) con exito (id_areaprotegida'||v_id_areaprotegida||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_areaprotegida',v_id_areaprotegida::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_ZONP_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		05-09-2018 13:04:44
	***********************************/

	elsif(p_transaccion='SNX_ZONP_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tareaprotegida set
			areaprotegida = v_parametros.areaprotegida,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_areaprotegida=v_parametros.id_areaprotegida;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Zona Protegida modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_areaprotegida',v_parametros.id_areaprotegida::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_ZONP_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		05-09-2018 13:04:44
	***********************************/

	elsif(p_transaccion='SNX_ZONP_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tareaprotegida
            where id_areaprotegida=v_parametros.id_areaprotegida;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Zona Protegida eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_areaprotegida',v_parametros.id_areaprotegida::varchar);
              
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

ALTER FUNCTION snx.ft_areaprotegida_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;