-- FUNCTION: snx.ft_terrenolt_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_terrenolt_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_terrenolt_ime(
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
 FUNCION: 		snx.ft_terrenolt_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tterrenolt'
 AUTOR: 		 (admin)
 FECHA:	        03-08-2018 19:41:41
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				03-08-2018 19:41:41								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tterrenolt'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_terrenolt	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_terrenolt_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_TLT_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		03-08-2018 19:41:41
	***********************************/

	if(p_transaccion='SNX_TLT_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tterrenolt(
			estado_reg,
			terrenolt,
			id_usuario_ai,
			fecha_reg,
			usuario_ai,
			id_usuario_reg,
			id_usuario_mod,
			fecha_mod
          	) values(
			'activo',
			v_parametros.terrenolt,
			v_parametros._id_usuario_ai,
			now(),
			v_parametros._nombre_usuario_ai,
			p_id_usuario,
			null,
			null
							
			
			
			)RETURNING id_terrenolt into v_id_terrenolt;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Terreno LT almacenado(a) con exito (id_terrenolt'||v_id_terrenolt||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_terrenolt',v_id_terrenolt::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_TLT_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		03-08-2018 19:41:41
	***********************************/

	elsif(p_transaccion='SNX_TLT_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tterrenolt set
			terrenolt = v_parametros.terrenolt,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_terrenolt=v_parametros.id_terrenolt;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Terreno LT modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_terrenolt',v_parametros.id_terrenolt::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_TLT_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		03-08-2018 19:41:41
	***********************************/

	elsif(p_transaccion='SNX_TLT_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tterrenolt
            where id_terrenolt=v_parametros.id_terrenolt;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Terreno LT eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_terrenolt',v_parametros.id_terrenolt::varchar);
              
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

ALTER FUNCTION snx.ft_terrenolt_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;