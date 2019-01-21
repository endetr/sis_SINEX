-- FUNCTION: snx.ft_equipoprecio_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_equipoprecio_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_equipoprecio_ime(
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
 FUNCION: 		snx.ft_equipoprecio_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tequipoprecio'
 AUTOR: 		 (admin)
 FECHA:	        22-03-2018 12:58:10
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				22-03-2018 12:58:10								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tequipoprecio'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_equipoprecio	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_equipoprecio_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_EPR_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		22-03-2018 12:58:10
	***********************************/

	if(p_transaccion='SNX_EPR_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tequipoprecio(
			id_equipo,
			estado_reg,
			valorequipo,
			id_moneda,
			proyecto,
			fechaprecio,
			usuario_ai,
			fecha_reg,
			id_usuario_reg,
			id_usuario_ai,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.id_equipo,
			'activo',
			v_parametros.valorequipo,
			v_parametros.id_moneda,
			v_parametros.proyecto,
			v_parametros.fechaprecio,
			v_parametros._nombre_usuario_ai,
			now(),
			p_id_usuario,
			v_parametros._id_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_equipoprecio into v_id_equipoprecio;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Equipo Precio  almacenado(a) con exito (id_equipoprecio'||v_id_equipoprecio||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_equipoprecio',v_id_equipoprecio::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_EPR_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		22-03-2018 12:58:10
	***********************************/

	elsif(p_transaccion='SNX_EPR_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tequipoprecio set
			id_equipo = v_parametros.id_equipo,
			valorequipo = v_parametros.valorequipo,
			id_moneda = v_parametros.id_moneda,
			proyecto = v_parametros.proyecto,
			fechaprecio = v_parametros.fechaprecio,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_equipoprecio=v_parametros.id_equipoprecio;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Equipo Precio  modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_equipoprecio',v_parametros.id_equipoprecio::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_EPR_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		22-03-2018 12:58:10
	***********************************/

	elsif(p_transaccion='SNX_EPR_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tequipoprecio
            where id_equipoprecio=v_parametros.id_equipoprecio;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Equipo Precio  eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_equipoprecio',v_parametros.id_equipoprecio::varchar);
              
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

ALTER FUNCTION snx.ft_equipoprecio_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;