-- FUNCTION: snx.ft_pcu335311335311_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_pcu335311335311_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_pcu335311335311_ime(
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
 FUNCION: 		snx.ft_pcu335311335311_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tpcu335311335311'
 AUTOR: 		 (admin)
 FECHA:	        31-07-2018 15:36:00
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				31-07-2018 15:36:00								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tpcu335311335311'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_pcu335311335311	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_pcu335311335311_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_PCU5311_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		31-07-2018 15:36:00
	***********************************/

	if(p_transaccion='SNX_PCU5311_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tpcu335311335311(
			ano,
			id_mes,
			estado_reg,
			valor,
			id_usuario_ai,
			fecha_reg,
			usuario_ai,
			id_usuario_reg,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.ano,
			v_parametros.id_mes,
			'activo',
			v_parametros.valor,
			v_parametros._id_usuario_ai,
			now(),
			v_parametros._nombre_usuario_ai,
			p_id_usuario,
			null,
			null
							
			
			
			)RETURNING id_pcu335311335311 into v_id_pcu335311335311;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','PCU335311335311 almacenado(a) con exito (id_pcu335311335311'||v_id_pcu335311335311||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_pcu335311335311',v_id_pcu335311335311::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_PCU5311_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		31-07-2018 15:36:00
	***********************************/

	elsif(p_transaccion='SNX_PCU5311_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tpcu335311335311 set
			ano = v_parametros.ano,
			id_mes = v_parametros.id_mes,
			valor = v_parametros.valor,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_pcu335311335311=v_parametros.id_pcu335311335311;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','PCU335311335311 modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_pcu335311335311',v_parametros.id_pcu335311335311::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_PCU5311_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		31-07-2018 15:36:00
	***********************************/

	elsif(p_transaccion='SNX_PCU5311_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tpcu335311335311
            where id_pcu335311335311=v_parametros.id_pcu335311335311;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','PCU335311335311 eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_pcu335311335311',v_parametros.id_pcu335311335311::varchar);
              
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

ALTER FUNCTION snx.ft_pcu335311335311_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;