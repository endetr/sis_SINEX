-- FUNCTION: snx.ft_terrenosb_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_terrenosb_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_terrenosb_ime(
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
 FUNCION: 		snx.ft_terrenosb_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tterrenosb'
 AUTOR: 		 (admin)
 FECHA:	        03-08-2018 19:41:46
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				03-08-2018 19:41:46								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tterrenosb'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_terrenosb	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_terrenosb_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_TSB_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		03-08-2018 19:41:46
	***********************************/

	if(p_transaccion='SNX_TSB_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tterrenosb(
			terrenosb,
			factor,
			estado_reg,
			id_usuario_ai,
			usuario_ai,
			fecha_reg,
			id_usuario_reg,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.terrenosb,
			v_parametros.factor,
			'activo',
			v_parametros._id_usuario_ai,
			v_parametros._nombre_usuario_ai,
			now(),
			p_id_usuario,
			null,
			null
							
			
			
			)RETURNING id_terrenosb into v_id_terrenosb;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Terreno SB almacenado(a) con exito (id_terrenosb'||v_id_terrenosb||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_terrenosb',v_id_terrenosb::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_TSB_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		03-08-2018 19:41:46
	***********************************/

	elsif(p_transaccion='SNX_TSB_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tterrenosb set
			terrenosb = v_parametros.terrenosb,
			factor = v_parametros.factor,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_terrenosb=v_parametros.id_terrenosb;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Terreno SB modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_terrenosb',v_parametros.id_terrenosb::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_TSB_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		03-08-2018 19:41:46
	***********************************/

	elsif(p_transaccion='SNX_TSB_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tterrenosb
            where id_terrenosb=v_parametros.id_terrenosb;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Terreno SB eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_terrenosb',v_parametros.id_terrenosb::varchar);
              
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

ALTER FUNCTION snx.ft_terrenosb_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;