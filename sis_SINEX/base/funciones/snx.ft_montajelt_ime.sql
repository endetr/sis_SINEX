-- FUNCTION: snx.ft_montajelt_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_montajelt_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_montajelt_ime(
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
 FUNCION: 		snx.ft_montajelt_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tmontajelt'
 AUTOR: 		 (admin)
 FECHA:	        19-07-2018 12:33:51
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				19-07-2018 12:33:51								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tmontajelt'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_montajelt	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_montajelt_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_MONLT_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		19-07-2018 12:33:51
	***********************************/

	if(p_transaccion='SNX_MONLT_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tmontajelt(
			id_unidad,
			estado_reg,
			montajelt,
			id_usuario_ai,
			id_usuario_reg,
			fecha_reg,
			usuario_ai,
			id_usuario_mod,
			fecha_mod,
			id_factorindexacion
          	) values(
			v_parametros.id_unidad,
			'activo',
			v_parametros.montajelt,
			v_parametros._id_usuario_ai,
			p_id_usuario,
			now(),
			v_parametros._nombre_usuario_ai,
			null,
			null,
			v_parametros.id_factorindexacion
							
			
			
			)RETURNING id_montajelt into v_id_montajelt;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Montaje Líneas almacenado(a) con exito (id_montajelt'||v_id_montajelt||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_montajelt',v_id_montajelt::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MONLT_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		19-07-2018 12:33:51
	***********************************/

	elsif(p_transaccion='SNX_MONLT_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tmontajelt set
			id_unidad = v_parametros.id_unidad,
			montajelt = v_parametros.montajelt,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai,
			id_factorindexacion = v_parametros.id_factorindexacion
			where id_montajelt=v_parametros.id_montajelt;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Montaje Líneas modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_montajelt',v_parametros.id_montajelt::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MONLT_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		19-07-2018 12:33:51
	***********************************/

	elsif(p_transaccion='SNX_MONLT_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tmontajelt
            where id_montajelt=v_parametros.id_montajelt;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Montaje Líneas eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_montajelt',v_parametros.id_montajelt::varchar);
              
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

ALTER FUNCTION snx.ft_montajelt_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;