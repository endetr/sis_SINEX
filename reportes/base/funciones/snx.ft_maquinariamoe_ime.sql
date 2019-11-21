-- FUNCTION: snx.ft_maquinariamoe_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_maquinariamoe_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_maquinariamoe_ime(
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
 FUNCION: 		snx.ft_maquinariamoe_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tmaquinariamoe'
 AUTOR: 		 (admin)
 FECHA:	        29-08-2018 18:34:19
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				29-08-2018 18:34:19								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tmaquinariamoe'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_maquinariamoe	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_maquinariamoe_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_MAQMOE_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		29-08-2018 18:34:19
	***********************************/

	if(p_transaccion='SNX_MAQMOE_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tmaquinariamoe(
			valorunitariorcb,
			id_unidad,
			valorunitariorlp,
			estado_reg,
			valorunitariorsc,
			maquinariamoe,
			id_usuario_ai,
			usuario_ai,
			fecha_reg,
			id_usuario_reg,
			id_usuario_mod,
			fecha_mod
          	) values(
			v_parametros.valorunitariorcb,
			v_parametros.id_unidad,
			v_parametros.valorunitariorlp,
			'activo',
			v_parametros.valorunitariorsc,
			v_parametros.maquinariamoe,
			v_parametros._id_usuario_ai,
			v_parametros._nombre_usuario_ai,
			now(),
			p_id_usuario,
			null,
			null
							
			
			
			)RETURNING id_maquinariamoe into v_id_maquinariamoe;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Maquinaria almacenado(a) con exito (id_maquinariamoe'||v_id_maquinariamoe||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_maquinariamoe',v_id_maquinariamoe::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MAQMOE_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		29-08-2018 18:34:19
	***********************************/

	elsif(p_transaccion='SNX_MAQMOE_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tmaquinariamoe set
			valorunitariorcb = v_parametros.valorunitariorcb,
			id_unidad = v_parametros.id_unidad,
			valorunitariorlp = v_parametros.valorunitariorlp,
			valorunitariorsc = v_parametros.valorunitariorsc,
			maquinariamoe = v_parametros.maquinariamoe,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_maquinariamoe=v_parametros.id_maquinariamoe;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Maquinaria modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_maquinariamoe',v_parametros.id_maquinariamoe::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MAQMOE_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		29-08-2018 18:34:19
	***********************************/

	elsif(p_transaccion='SNX_MAQMOE_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tmaquinariamoe
            where id_maquinariamoe=v_parametros.id_maquinariamoe;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Maquinaria eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_maquinariamoe',v_parametros.id_maquinariamoe::varchar);
              
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

ALTER FUNCTION snx.ft_maquinariamoe_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;