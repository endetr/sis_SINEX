-- FUNCTION: snx.ft_tasacambio_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_tasacambio_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_tasacambio_ime(
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
 FUNCION: 		snx.ft_tasacambio_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.ttasacambio'
 AUTOR: 		 (admin)
 FECHA:	        02-04-2018 13:35:50
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				02-04-2018 13:35:50								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.ttasacambio'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_tasacambio	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_tasacambio_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_TAS_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		02-04-2018 13:35:50
	***********************************/

	if(p_transaccion='SNX_TAS_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.ttasacambio(
			id_mes,
			ano,
			id_monedadestino,
			estado_reg,
			valor,
			id_monedaorigen,
			id_usuario_ai,
			fecha_reg,
			usuario_ai,
			id_usuario_reg,
			id_usuario_mod,
			fecha_mod
          	) values(
			v_parametros.id_mes,
			v_parametros.ano,
			v_parametros.id_monedadestino,
			'activo',
			v_parametros.valor,
			v_parametros.id_monedaorigen,
			v_parametros._id_usuario_ai,
			now(),
			v_parametros._nombre_usuario_ai,
			p_id_usuario,
			null,
			null
							
			
			
			)RETURNING id_tasacambio into v_id_tasacambio;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Tasa de Cambio almacenado(a) con exito (id_tasacambio'||v_id_tasacambio||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_tasacambio',v_id_tasacambio::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_TAS_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		02-04-2018 13:35:50
	***********************************/

	elsif(p_transaccion='SNX_TAS_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.ttasacambio set
			id_mes = v_parametros.id_mes,
			ano = v_parametros.ano,
			id_monedadestino = v_parametros.id_monedadestino,
			valor = v_parametros.valor,
			id_monedaorigen = v_parametros.id_monedaorigen,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_tasacambio=v_parametros.id_tasacambio;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Tasa de Cambio modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_tasacambio',v_parametros.id_tasacambio::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_TAS_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		02-04-2018 13:35:50
	***********************************/

	elsif(p_transaccion='SNX_TAS_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.ttasacambio
            where id_tasacambio=v_parametros.id_tasacambio;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Tasa de Cambio eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_tasacambio',v_parametros.id_tasacambio::varchar);
              
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

ALTER FUNCTION snx.ft_tasacambio_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;