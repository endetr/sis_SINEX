-- FUNCTION: snx.ft_nivelcontaminacionlt_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_nivelcontaminacionlt_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_nivelcontaminacionlt_ime(
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
 FUNCION: 		snx.ft_nivelcontaminacionlt_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tnivelcontaminacionlt'
 AUTOR: 		 (admin)
 FECHA:	        04-09-2018 18:41:39
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				04-09-2018 18:41:39								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tnivelcontaminacionlt'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_nivelcontaminacionlt	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_nivelcontaminacionlt_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_NIC_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		04-09-2018 18:41:39
	***********************************/

	if(p_transaccion='SNX_NIC_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tnivelcontaminacionlt(
			estado_reg,
			factor,
			nivelcontaminacionlt,
			usuario_ai,
			fecha_reg,
			id_usuario_reg,
			id_usuario_ai,
			id_usuario_mod,
			fecha_mod
          	) values(
			'activo',
			v_parametros.factor,
			v_parametros.nivelcontaminacionlt,
			v_parametros._nombre_usuario_ai,
			now(),
			p_id_usuario,
			v_parametros._id_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_nivelcontaminacionlt into v_id_nivelcontaminacionlt;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Nivel de Contaminación almacenado(a) con exito (id_nivelcontaminacionlt'||v_id_nivelcontaminacionlt||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_nivelcontaminacionlt',v_id_nivelcontaminacionlt::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_NIC_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		04-09-2018 18:41:39
	***********************************/

	elsif(p_transaccion='SNX_NIC_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tnivelcontaminacionlt set
			factor = v_parametros.factor,
			nivelcontaminacionlt = v_parametros.nivelcontaminacionlt,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_nivelcontaminacionlt=v_parametros.id_nivelcontaminacionlt;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Nivel de Contaminación modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_nivelcontaminacionlt',v_parametros.id_nivelcontaminacionlt::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_NIC_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		04-09-2018 18:41:39
	***********************************/

	elsif(p_transaccion='SNX_NIC_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tnivelcontaminacionlt
            where id_nivelcontaminacionlt=v_parametros.id_nivelcontaminacionlt;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Nivel de Contaminación eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_nivelcontaminacionlt',v_parametros.id_nivelcontaminacionlt::varchar);
              
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

ALTER FUNCTION snx.ft_nivelcontaminacionlt_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;
