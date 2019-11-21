-- FUNCTION: snx.ft_herrajeaccesorio_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_herrajeaccesorio_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_herrajeaccesorio_ime(
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
 FUNCION: 		snx.ft_herrajeaccesorio_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.therrajeaccesorio'
 AUTOR: 		 (admin)
 FECHA:	        07-05-2018 19:37:50
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				07-05-2018 19:37:50								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.therrajeaccesorio'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_herrajeaccesorio	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_herrajeaccesorio_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_HAC_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		07-05-2018 19:37:50
	***********************************/

	if(p_transaccion='SNX_HAC_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.therrajeaccesorio(
			estado_reg,
			herrajeaccesorio,
			usuario_ai,
			fecha_reg,
			id_usuario_reg,
			id_usuario_ai,
			id_usuario_mod,
			fecha_mod
          	) values(
			'activo',
			v_parametros.herrajeaccesorio,
			v_parametros._nombre_usuario_ai,
			now(),
			p_id_usuario,
			v_parametros._id_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_herrajeaccesorio into v_id_herrajeaccesorio;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Herraje accesorio almacenado(a) con exito (id_herrajeaccesorio'||v_id_herrajeaccesorio||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_herrajeaccesorio',v_id_herrajeaccesorio::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_HAC_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		07-05-2018 19:37:50
	***********************************/

	elsif(p_transaccion='SNX_HAC_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.therrajeaccesorio set
			herrajeaccesorio = v_parametros.herrajeaccesorio,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_herrajeaccesorio=v_parametros.id_herrajeaccesorio;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Herraje accesorio modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_herrajeaccesorio',v_parametros.id_herrajeaccesorio::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_HAC_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		07-05-2018 19:37:50
	***********************************/

	elsif(p_transaccion='SNX_HAC_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.therrajeaccesorio
            where id_herrajeaccesorio=v_parametros.id_herrajeaccesorio;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Herraje accesorio eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_herrajeaccesorio',v_parametros.id_herrajeaccesorio::varchar);
              
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

ALTER FUNCTION snx.ft_herrajeaccesorio_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;
