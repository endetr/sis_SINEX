-- FUNCTION: snx.ft_montajepreciolt_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_montajepreciolt_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_montajepreciolt_ime(
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
 FUNCION: 		snx.ft_montajepreciolt_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tmontajepreciolt'
 AUTOR: 		 (admin)
 FECHA:	        19-07-2018 13:29:16
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				19-07-2018 13:29:16								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tmontajepreciolt'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_montajepreciolt	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_montajepreciolt_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_MONTP_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		19-07-2018 13:29:16
	***********************************/

	if(p_transaccion='SNX_MONTP_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tmontajepreciolt(
			estado_reg,
			valormontajelt,
			fechaprecio,
			proyecto,
			id_moneda,
			id_montajelt,
			fecha_reg,
			usuario_ai,
			id_usuario_reg,
			id_usuario_ai,
			id_usuario_mod,
			fecha_mod
          	) values(
			'activo',
			v_parametros.valormontajelt,
			v_parametros.fechaprecio,
			v_parametros.proyecto,
			v_parametros.id_moneda,
			v_parametros.id_montajelt,
			now(),
			v_parametros._nombre_usuario_ai,
			p_id_usuario,
			v_parametros._id_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_montajepreciolt into v_id_montajepreciolt;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Montaje Precio almacenado(a) con exito (id_montajepreciolt'||v_id_montajepreciolt||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_montajepreciolt',v_id_montajepreciolt::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MONTP_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		19-07-2018 13:29:16
	***********************************/

	elsif(p_transaccion='SNX_MONTP_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tmontajepreciolt set
			valormontajelt = v_parametros.valormontajelt,
			fechaprecio = v_parametros.fechaprecio,
			proyecto = v_parametros.proyecto,
			id_moneda = v_parametros.id_moneda,
			id_montajelt = v_parametros.id_montajelt,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_montajepreciolt=v_parametros.id_montajepreciolt;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Montaje Precio modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_montajepreciolt',v_parametros.id_montajepreciolt::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MONTP_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		19-07-2018 13:29:16
	***********************************/

	elsif(p_transaccion='SNX_MONTP_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tmontajepreciolt
            where id_montajepreciolt=v_parametros.id_montajepreciolt;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Montaje Precio eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_montajepreciolt',v_parametros.id_montajepreciolt::varchar);
              
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

ALTER FUNCTION snx.ft_montajepreciolt_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;