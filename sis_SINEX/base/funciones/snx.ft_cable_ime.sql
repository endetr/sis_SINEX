-- FUNCTION: snx.ft_cable_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_cable_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_cable_ime(
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
 FUNCION: 		snx.ft_cable_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tcable'
 AUTOR: 		 (admin)
 FECHA:	        07-05-2018 19:37:54
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				07-05-2018 19:37:54								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tcable'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_cable	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_cable_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_CAB_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		07-05-2018 19:37:54
	***********************************/

	if(p_transaccion='SNX_CAB_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tcable(
			estado_reg,
			cable,
			id_usuario_reg,
			fecha_reg,
			usuario_ai,
			id_usuario_ai,
			id_usuario_mod,
			fecha_mod
          	) values(
			'activo',
			v_parametros.cable,
			p_id_usuario,
			now(),
			v_parametros._nombre_usuario_ai,
			v_parametros._id_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_cable into v_id_cable;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Cable almacenado(a) con exito (id_cable'||v_id_cable||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_cable',v_id_cable::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_CAB_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		07-05-2018 19:37:54
	***********************************/

	elsif(p_transaccion='SNX_CAB_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tcable set
			cable = v_parametros.cable,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_cable=v_parametros.id_cable;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Cable modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_cable',v_parametros.id_cable::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_CAB_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		07-05-2018 19:37:54
	***********************************/

	elsif(p_transaccion='SNX_CAB_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tcable
            where id_cable=v_parametros.id_cable;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Cable eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_cable',v_parametros.id_cable::varchar);
              
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

ALTER FUNCTION snx.ft_cable_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;