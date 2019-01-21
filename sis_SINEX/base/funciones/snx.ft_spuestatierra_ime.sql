-- FUNCTION: snx.ft_spuestatierra_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_spuestatierra_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_spuestatierra_ime(
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
 FUNCION: 		snx.ft_spuestatierra_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tspuestatierra'
 AUTOR: 		 (admin)
 FECHA:	        25-07-2018 13:46:20
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				25-07-2018 13:46:20								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tspuestatierra'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_puestatierra	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_spuestatierra_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_SPT_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		25-07-2018 13:46:20
	***********************************/

	if(p_transaccion='SNX_SPT_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tspuestatierra(
			puestatierra,
			estado_reg,
			id_usuario_ai,
			id_usuario_reg,
			fecha_reg,
			usuario_ai,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.puestatierra,
			'activo',
			v_parametros._id_usuario_ai,
			p_id_usuario,
			now(),
			v_parametros._nombre_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_puestatierra into v_id_puestatierra;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Sistema puesta a tierra almacenado(a) con exito (id_puestatierra'||v_id_puestatierra||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_puestatierra',v_id_puestatierra::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_SPT_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		25-07-2018 13:46:20
	***********************************/

	elsif(p_transaccion='SNX_SPT_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tspuestatierra set
			puestatierra = v_parametros.puestatierra,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_puestatierra=v_parametros.id_puestatierra;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Sistema puesta a tierra modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_puestatierra',v_parametros.id_puestatierra::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_SPT_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		25-07-2018 13:46:20
	***********************************/

	elsif(p_transaccion='SNX_SPT_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tspuestatierra
            where id_puestatierra=v_parametros.id_puestatierra;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Sistema puesta a tierra eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_puestatierra',v_parametros.id_puestatierra::varchar);
              
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

ALTER FUNCTION snx.ft_spuestatierra_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;