-- FUNCTION: snx.ft_moneda_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_moneda_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_moneda_ime(
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
 FUNCION: 		snx.ft_moneda_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tmoneda'
 AUTOR: 		 (admin)
 FECHA:	        22-03-2018 14:46:38
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				22-03-2018 14:46:38								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tmoneda'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_moneda	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_moneda_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_MON_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		22-03-2018 14:46:38
	***********************************/

	if(p_transaccion='SNX_MON_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tmoneda(
			estado_reg,
			moneda,
			fecha_reg,
			id_usuario_ai,
			usuario_ai,
			id_usuario_reg,
			fecha_mod,
			id_usuario_mod
          	) values(
			'activo',
			v_parametros.moneda,
			now(),
			v_parametros._id_usuario_ai,
			v_parametros._nombre_usuario_ai,
			p_id_usuario,
			null,
			null
							
			
			
			)RETURNING id_moneda into v_id_moneda;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Monedas almacenado(a) con exito (id_moneda'||v_id_moneda||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_moneda',v_id_moneda::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MON_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		22-03-2018 14:46:38
	***********************************/

	elsif(p_transaccion='SNX_MON_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tmoneda set
			moneda = v_parametros.moneda,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_moneda=v_parametros.id_moneda;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Monedas modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_moneda',v_parametros.id_moneda::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MON_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		22-03-2018 14:46:38
	***********************************/

	elsif(p_transaccion='SNX_MON_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tmoneda
            where id_moneda=v_parametros.id_moneda;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Monedas eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_moneda',v_parametros.id_moneda::varchar);
              
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

ALTER FUNCTION snx.ft_moneda_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;