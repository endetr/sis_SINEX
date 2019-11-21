-- FUNCTION: snx.ft_puc3359293359291_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_puc3359293359291_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_puc3359293359291_ime(
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
 FUNCION: 		snx.ft_puc3359293359291_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tpuc3359293359291'
 AUTOR: 		 (admin)
 FECHA:	        31-07-2018 15:35:43
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				31-07-2018 15:35:43								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tpuc3359293359291'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_puc3359293359291	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_puc3359293359291_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_PCU9291_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		31-07-2018 15:35:43
	***********************************/

	if(p_transaccion='SNX_PCU9291_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tpuc3359293359291(
			id_mes,
			estado_reg,
			valor,
			ano,
			id_usuario_ai,
			fecha_reg,
			usuario_ai,
			id_usuario_reg,
			id_usuario_mod,
			fecha_mod
          	) values(
			v_parametros.id_mes,
			'activo',
			v_parametros.valor,
			v_parametros.ano,
			v_parametros._id_usuario_ai,
			now(),
			v_parametros._nombre_usuario_ai,
			p_id_usuario,
			null,
			null
							
			
			
			)RETURNING id_puc3359293359291 into v_id_puc3359293359291;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','PCU3359293359291 almacenado(a) con exito (id_puc3359293359291'||v_id_puc3359293359291||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_puc3359293359291',v_id_puc3359293359291::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_PCU9291_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		31-07-2018 15:35:43
	***********************************/

	elsif(p_transaccion='SNX_PCU9291_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tpuc3359293359291 set
			id_mes = v_parametros.id_mes,
			valor = v_parametros.valor,
			ano = v_parametros.ano,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_puc3359293359291=v_parametros.id_puc3359293359291;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','PCU3359293359291 modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_puc3359293359291',v_parametros.id_puc3359293359291::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_PCU9291_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		31-07-2018 15:35:43
	***********************************/

	elsif(p_transaccion='SNX_PCU9291_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tpuc3359293359291
            where id_puc3359293359291=v_parametros.id_puc3359293359291;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','PCU3359293359291 eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_puc3359293359291',v_parametros.id_puc3359293359291::varchar);
              
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

ALTER FUNCTION snx.ft_puc3359293359291_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;