-- FUNCTION: snx.ft_mcelecapantallamiento_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_mcelecapantallamiento_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_mcelecapantallamiento_ime(
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
 FUNCION: 		snx.ft_mcelecapantallamiento_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tmcelecapantallamiento'
 AUTOR: 		 (admin)
 FECHA:	        16-10-2018 20:00:23
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				16-10-2018 20:00:23								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tmcelecapantallamiento'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_mcelecapantallamiento	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_mcelecapantallamiento_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_MCAP_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		16-10-2018 20:00:23
	***********************************/

	if(p_transaccion='SNX_MCAP_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tmcelecapantallamiento(
			cableporbahia,
			estado_reg,
			id_claseaislamiento,
			id_usuario_ai,
			id_usuario_reg,
			fecha_reg,
			usuario_ai,
			id_usuario_mod,
			fecha_mod
          	) values(
			v_parametros.cableporbahia,
			'activo',
			v_parametros.id_claseaislamiento,
			v_parametros._id_usuario_ai,
			p_id_usuario,
			now(),
			v_parametros._nombre_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_mcelecapantallamiento into v_id_mcelecapantallamiento;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','MC Apantallamiento almacenado(a) con exito (id_mcelecapantallamiento'||v_id_mcelecapantallamiento||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_mcelecapantallamiento',v_id_mcelecapantallamiento::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MCAP_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		16-10-2018 20:00:23
	***********************************/

	elsif(p_transaccion='SNX_MCAP_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tmcelecapantallamiento set
			cableporbahia = v_parametros.cableporbahia,
			id_claseaislamiento = v_parametros.id_claseaislamiento,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_mcelecapantallamiento=v_parametros.id_mcelecapantallamiento;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','MC Apantallamiento modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_mcelecapantallamiento',v_parametros.id_mcelecapantallamiento::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MCAP_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		16-10-2018 20:00:23
	***********************************/

	elsif(p_transaccion='SNX_MCAP_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tmcelecapantallamiento
            where id_mcelecapantallamiento=v_parametros.id_mcelecapantallamiento;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','MC Apantallamiento eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_mcelecapantallamiento',v_parametros.id_mcelecapantallamiento::varchar);
              
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

ALTER FUNCTION snx.ft_mcelecapantallamiento_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;