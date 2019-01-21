-- FUNCTION: snx.ft_ucmceitem_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_ucmceitem_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_ucmceitem_ime(
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
 FUNCION: 		snx.ft_ucmceitem_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tucmceitem'
 AUTOR: 		 (admin)
 FECHA:	        16-10-2018 20:00:31
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				16-10-2018 20:00:31								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tucmceitem'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_ucmeitem	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_ucmceitem_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_TUCI_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		16-10-2018 20:00:31
	***********************************/

	if(p_transaccion='SNX_TUCI_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tucmceitem(
			estado_reg,
			precio,
			grupo,
			descripcion,
			id_unidadconstructivamcelec,
			usuario_ai,
			fecha_reg,
			id_usuario_reg,
			id_usuario_ai,
			id_usuario_mod,
			fecha_mod
          	) values(
			'activo',
			v_parametros.precio,
			v_parametros.grupo,
			v_parametros.descripcion,
			v_parametros.id_unidadconstructivamcelec,
			v_parametros._nombre_usuario_ai,
			now(),
			p_id_usuario,
			v_parametros._id_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_ucmeitem into v_id_ucmeitem;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Items almacenado(a) con exito (id_ucmeitem'||v_id_ucmeitem||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_ucmeitem',v_id_ucmeitem::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_TUCI_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		16-10-2018 20:00:31
	***********************************/

	elsif(p_transaccion='SNX_TUCI_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tucmceitem set
			precio = v_parametros.precio,
			grupo = v_parametros.grupo,
			descripcion = v_parametros.descripcion,
			id_unidadconstructivamcelec = v_parametros.id_unidadconstructivamcelec,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_ucmeitem=v_parametros.id_ucmeitem;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Items modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_ucmeitem',v_parametros.id_ucmeitem::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_TUCI_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		16-10-2018 20:00:31
	***********************************/

	elsif(p_transaccion='SNX_TUCI_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tucmceitem
            where id_ucmeitem=v_parametros.id_ucmeitem;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Items eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_ucmeitem',v_parametros.id_ucmeitem::varchar);
              
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

ALTER FUNCTION snx.ft_ucmceitem_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;