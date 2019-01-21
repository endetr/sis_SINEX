-- FUNCTION: snx.ft_ocmanoobramoe_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_ocmanoobramoe_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_ocmanoobramoe_ime(
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
 FUNCION: 		snx.ft_ocmanoobramoe_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tocmanoobramoe'
 AUTOR: 		 (admin)
 FECHA:	        30-08-2018 15:37:36
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				30-08-2018 15:37:36								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tocmanoobramoe'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_ocmanoobramoe	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_ocmanoobramoe_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_OCMO_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		30-08-2018 15:37:36
	***********************************/

	if(p_transaccion='SNX_OCMO_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tocmanoobramoe(
			estado_reg,
			id_manoobramoe,
			cantidadmanoobramoe,
			id_obracivilmoe,
			id_usuario_reg,
			usuario_ai,
			fecha_reg,
			id_usuario_ai,
			id_usuario_mod,
			fecha_mod
          	) values(
			'activo',
			v_parametros.id_manoobramoe,
			v_parametros.cantidadmanoobramoe,
			v_parametros.id_obracivilmoe,
			p_id_usuario,
			v_parametros._nombre_usuario_ai,
			now(),
			v_parametros._id_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_ocmanoobramoe into v_id_ocmanoobramoe;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Mano de Obra almacenado(a) con exito (id_ocmanoobramoe'||v_id_ocmanoobramoe||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_ocmanoobramoe',v_id_ocmanoobramoe::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_OCMO_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		30-08-2018 15:37:36
	***********************************/

	elsif(p_transaccion='SNX_OCMO_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tocmanoobramoe set
			id_manoobramoe = v_parametros.id_manoobramoe,
			cantidadmanoobramoe = v_parametros.cantidadmanoobramoe,
			id_obracivilmoe = v_parametros.id_obracivilmoe,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_ocmanoobramoe=v_parametros.id_ocmanoobramoe;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Mano de Obra modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_ocmanoobramoe',v_parametros.id_ocmanoobramoe::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_OCMO_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		30-08-2018 15:37:36
	***********************************/

	elsif(p_transaccion='SNX_OCMO_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tocmanoobramoe
            where id_ocmanoobramoe=v_parametros.id_ocmanoobramoe;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Mano de Obra eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_ocmanoobramoe',v_parametros.id_ocmanoobramoe::varchar);
              
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

ALTER FUNCTION snx.ft_ocmanoobramoe_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;