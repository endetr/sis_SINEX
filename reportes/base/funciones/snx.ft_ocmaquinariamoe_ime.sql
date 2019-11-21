-- FUNCTION: snx.ft_ocmaquinariamoe_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_ocmaquinariamoe_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_ocmaquinariamoe_ime(
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
 FUNCION: 		snx.ft_ocmaquinariamoe_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tocmaquinariamoe'
 AUTOR: 		 (admin)
 FECHA:	        30-08-2018 15:37:28
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				30-08-2018 15:37:28								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tocmaquinariamoe'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_ocmaquinariamoe	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_ocmaquinariamoe_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_OCMAQ_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		30-08-2018 15:37:28
	***********************************/

	if(p_transaccion='SNX_OCMAQ_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tocmaquinariamoe(
			estado_reg,
			id_maquinariamoe,
			cantidadmaquinariamoe,
			id_obracivilmoe,
			id_usuario_reg,
			usuario_ai,
			fecha_reg,
			id_usuario_ai,
			id_usuario_mod,
			fecha_mod
          	) values(
			'activo',
			v_parametros.id_maquinariamoe,
			v_parametros.cantidadmaquinariamoe,
			v_parametros.id_obracivilmoe,
			p_id_usuario,
			v_parametros._nombre_usuario_ai,
			now(),
			v_parametros._id_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_ocmaquinariamoe into v_id_ocmaquinariamoe;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Equipo, Maquinaria y Herramientas almacenado(a) con exito (id_ocmaquinariamoe'||v_id_ocmaquinariamoe||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_ocmaquinariamoe',v_id_ocmaquinariamoe::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_OCMAQ_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		30-08-2018 15:37:28
	***********************************/

	elsif(p_transaccion='SNX_OCMAQ_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tocmaquinariamoe set
			id_maquinariamoe = v_parametros.id_maquinariamoe,
			cantidadmaquinariamoe = v_parametros.cantidadmaquinariamoe,
			id_obracivilmoe = v_parametros.id_obracivilmoe,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_ocmaquinariamoe=v_parametros.id_ocmaquinariamoe;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Equipo, Maquinaria y Herramientas modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_ocmaquinariamoe',v_parametros.id_ocmaquinariamoe::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_OCMAQ_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		30-08-2018 15:37:28
	***********************************/

	elsif(p_transaccion='SNX_OCMAQ_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tocmaquinariamoe
            where id_ocmaquinariamoe=v_parametros.id_ocmaquinariamoe;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Equipo, Maquinaria y Herramientas eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_ocmaquinariamoe',v_parametros.id_ocmaquinariamoe::varchar);
              
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

ALTER FUNCTION snx.ft_ocmaquinariamoe_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;