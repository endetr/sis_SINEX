-- FUNCTION: snx.ft_materialpreciolt_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_materialpreciolt_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_materialpreciolt_ime(
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
 FUNCION: 		snx.ft_materialpreciolt_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tmaterialpreciolt'
 AUTOR: 		 (admin)
 FECHA:	        19-07-2018 14:36:40
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				19-07-2018 14:36:40								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tmaterialpreciolt'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_materialpreciolt	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_materialpreciolt_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_MTPLT_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		19-07-2018 14:36:40
	***********************************/

	if(p_transaccion='SNX_MTPLT_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tmaterialpreciolt(
			id_materiallt,
			estado_reg,
			valormateriallt,
			proyecto,
			id_moneda,
			fechaprecio,
			id_usuario_reg,
			usuario_ai,
			fecha_reg,
			id_usuario_ai,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.id_materiallt,
			'activo',
			v_parametros.valormateriallt,
			v_parametros.proyecto,
			v_parametros.id_moneda,
			v_parametros.fechaprecio,
			p_id_usuario,
			v_parametros._nombre_usuario_ai,
			now(),
			v_parametros._id_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_materialpreciolt into v_id_materialpreciolt;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Material Precio LT almacenado(a) con exito (id_materialpreciolt'||v_id_materialpreciolt||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_materialpreciolt',v_id_materialpreciolt::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MTPLT_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		19-07-2018 14:36:40
	***********************************/

	elsif(p_transaccion='SNX_MTPLT_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tmaterialpreciolt set
			id_materiallt = v_parametros.id_materiallt,
			valormateriallt = v_parametros.valormateriallt,
			proyecto = v_parametros.proyecto,
			id_moneda = v_parametros.id_moneda,
			fechaprecio = v_parametros.fechaprecio,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_materialpreciolt=v_parametros.id_materialpreciolt;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Material Precio LT modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_materialpreciolt',v_parametros.id_materialpreciolt::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MTPLT_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		19-07-2018 14:36:40
	***********************************/

	elsif(p_transaccion='SNX_MTPLT_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tmaterialpreciolt
            where id_materialpreciolt=v_parametros.id_materialpreciolt;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Material Precio LT eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_materialpreciolt',v_parametros.id_materialpreciolt::varchar);
              
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

ALTER FUNCTION snx.ft_materialpreciolt_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;