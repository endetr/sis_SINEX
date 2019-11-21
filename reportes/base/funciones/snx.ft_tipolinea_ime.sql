-- FUNCTION: snx.ft_tipolinea_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_tipolinea_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_tipolinea_ime(
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
 FUNCION: 		snx.ft_tipolinea_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.ttipolinea'
 AUTOR: 		 (admin)
 FECHA:	        19-07-2018 14:03:02
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				19-07-2018 14:03:02								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.ttipolinea'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_tipolinea	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_tipolinea_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_TIPL_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		19-07-2018 14:03:02
	***********************************/

	if(p_transaccion='SNX_TIPL_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.ttipolinea(
			estado_reg,
			tipolinea,
			id_usuario_ai,
			usuario_ai,
			fecha_reg,
			id_usuario_reg,
			id_usuario_mod,
			fecha_mod
          	) values(
			'activo',
			v_parametros.tipolinea,
			v_parametros._id_usuario_ai,
			v_parametros._nombre_usuario_ai,
			now(),
			p_id_usuario,
			null,
			null
							
			
			
			)RETURNING id_tipolinea into v_id_tipolinea;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Tipos de Líneas almacenado(a) con exito (id_tipolinea'||v_id_tipolinea||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_tipolinea',v_id_tipolinea::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_TIPL_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		19-07-2018 14:03:02
	***********************************/

	elsif(p_transaccion='SNX_TIPL_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.ttipolinea set
			tipolinea = v_parametros.tipolinea,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_tipolinea=v_parametros.id_tipolinea;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Tipos de Líneas modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_tipolinea',v_parametros.id_tipolinea::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_TIPL_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		19-07-2018 14:03:02
	***********************************/

	elsif(p_transaccion='SNX_TIPL_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.ttipolinea
            where id_tipolinea=v_parametros.id_tipolinea;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Tipos de Líneas eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_tipolinea',v_parametros.id_tipolinea::varchar);
              
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

ALTER FUNCTION snx.ft_tipolinea_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;