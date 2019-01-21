-- FUNCTION: snx.ft_pcu335313335313_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_pcu335313335313_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_pcu335313335313_ime(
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
 FUNCION: 		snx.ft_pcu335313335313_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tpcu335313335313'
 AUTOR: 		 (admin)
 FECHA:	        31-07-2018 15:35:48
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				31-07-2018 15:35:48								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tpcu335313335313'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_pcu335313335313	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_pcu335313335313_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_PCU5313_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		31-07-2018 15:35:48
	***********************************/

	if(p_transaccion='SNX_PCU5313_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tpcu335313335313(
			ano,
			estado_reg,
			valor,
			id_mes,
			usuario_ai,
			fecha_reg,
			id_usuario_reg,
			id_usuario_ai,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.ano,
			'activo',
			v_parametros.valor,
			v_parametros.id_mes,
			v_parametros._nombre_usuario_ai,
			now(),
			p_id_usuario,
			v_parametros._id_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_pcu335313335313 into v_id_pcu335313335313;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','PCU335313335313 almacenado(a) con exito (id_pcu335313335313'||v_id_pcu335313335313||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_pcu335313335313',v_id_pcu335313335313::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_PCU5313_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		31-07-2018 15:35:48
	***********************************/

	elsif(p_transaccion='SNX_PCU5313_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tpcu335313335313 set
			ano = v_parametros.ano,
			valor = v_parametros.valor,
			id_mes = v_parametros.id_mes,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_pcu335313335313=v_parametros.id_pcu335313335313;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','PCU335313335313 modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_pcu335313335313',v_parametros.id_pcu335313335313::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_PCU5313_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		31-07-2018 15:35:48
	***********************************/

	elsif(p_transaccion='SNX_PCU5313_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tpcu335313335313
            where id_pcu335313335313=v_parametros.id_pcu335313335313;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','PCU335313335313 eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_pcu335313335313',v_parametros.id_pcu335313335313::varchar);
              
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

ALTER FUNCTION snx.ft_pcu335313335313_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;