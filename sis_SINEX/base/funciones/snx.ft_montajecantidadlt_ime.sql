-- FUNCTION: snx.ft_montajecantidadlt_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_montajecantidadlt_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_montajecantidadlt_ime(
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
 FUNCION: 		snx.ft_montajecantidadlt_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tmontajecantidadlt'
 AUTOR: 		 (admin)
 FECHA:	        19-07-2018 14:51:24
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				19-07-2018 14:51:24								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tmontajecantidadlt'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_montajecantidadlt	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_montajecantidadlt_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_MONTC_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		19-07-2018 14:51:24
	***********************************/

	if(p_transaccion='SNX_MONTC_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tmontajecantidadlt(
			estado_reg,
			cantidadmontajelt,
			id_tipoestructura,
			id_tensionservicio,
			id_configuracionlt,
			id_tipolinea,
			id_montajelt,
			fecha_reg,
			usuario_ai,
			id_usuario_reg,
			id_usuario_ai,
			id_usuario_mod,
			fecha_mod
          	) values(
			'activo',
			v_parametros.cantidadmontajelt,
			v_parametros.id_tipoestructura,
			v_parametros.id_tensionservicio,
			v_parametros.id_configuracionlt,
			v_parametros.id_tipolinea,
			v_parametros.id_montajelt,
			now(),
			v_parametros._nombre_usuario_ai,
			p_id_usuario,
			v_parametros._id_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_montajecantidadlt into v_id_montajecantidadlt;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Montaje Cantidades almacenado(a) con exito (id_montajecantidadlt'||v_id_montajecantidadlt||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_montajecantidadlt',v_id_montajecantidadlt::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MONTC_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		19-07-2018 14:51:24
	***********************************/

	elsif(p_transaccion='SNX_MONTC_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tmontajecantidadlt set
			cantidadmontajelt = v_parametros.cantidadmontajelt,
			id_tipoestructura = v_parametros.id_tipoestructura,
			id_tensionservicio = v_parametros.id_tensionservicio,
			id_configuracionlt = v_parametros.id_configuracionlt,
			id_tipolinea = v_parametros.id_tipolinea,
			id_montajelt = v_parametros.id_montajelt,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_montajecantidadlt=v_parametros.id_montajecantidadlt;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Montaje Cantidades modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_montajecantidadlt',v_parametros.id_montajecantidadlt::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MONTC_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		19-07-2018 14:51:24
	***********************************/

	elsif(p_transaccion='SNX_MONTC_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tmontajecantidadlt
            where id_montajecantidadlt=v_parametros.id_montajecantidadlt;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Montaje Cantidades eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_montajecantidadlt',v_parametros.id_montajecantidadlt::varchar);
              
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

ALTER FUNCTION snx.ft_montajecantidadlt_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;