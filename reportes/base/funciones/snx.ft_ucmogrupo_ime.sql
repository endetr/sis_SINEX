-- FUNCTION: snx.ft_ucmogrupo_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_ucmogrupo_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_ucmogrupo_ime(
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
 FUNCION: 		snx.ft_ucmogrupo_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tucmogrupo'
 AUTOR: 		 (admin)
 FECHA:	        27-07-2018 16:51:55
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				27-07-2018 16:51:55								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tucmogrupo'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_ucmogrupo	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_ucmogrupo_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_UCMOGR_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		27-07-2018 16:51:55
	***********************************/

	if(p_transaccion='SNX_UCMOGR_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tucmogrupo(
			id_unidadconstructivamo,
			estado_reg,
			unmogrupo,
			fecha_reg,
			usuario_ai,
			id_usuario_reg,
			id_usuario_ai,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.id_unidadconstructivamo,
			'activo',
			v_parametros.unmogrupo,
			now(),
			v_parametros._nombre_usuario_ai,
			p_id_usuario,
			v_parametros._id_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_ucmogrupo into v_id_ucmogrupo;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Grupo almacenado(a) con exito (id_ucmogrupo'||v_id_ucmogrupo||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_ucmogrupo',v_id_ucmogrupo::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCMOGR_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		27-07-2018 16:51:55
	***********************************/

	elsif(p_transaccion='SNX_UCMOGR_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tucmogrupo set
			id_unidadconstructivamo = v_parametros.id_unidadconstructivamo,
			unmogrupo = v_parametros.unmogrupo,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_ucmogrupo=v_parametros.id_ucmogrupo;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Grupo modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_ucmogrupo',v_parametros.id_ucmogrupo::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCMOGR_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		27-07-2018 16:51:55
	***********************************/

	elsif(p_transaccion='SNX_UCMOGR_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tucmogrupo
            where id_ucmogrupo=v_parametros.id_ucmogrupo;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Grupo eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_ucmogrupo',v_parametros.id_ucmogrupo::varchar);
              
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

ALTER FUNCTION snx.ft_ucmogrupo_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;