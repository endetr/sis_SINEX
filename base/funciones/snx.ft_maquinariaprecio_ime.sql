-- FUNCTION: snx.ft_maquinariaprecio_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_maquinariaprecio_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_maquinariaprecio_ime(
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
 FUNCION: 		snx.ft_maquinariaprecio_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tmaquinariaprecio'
 AUTOR: 		 (admin)
 FECHA:	        22-03-2018 19:06:49
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				22-03-2018 19:06:49								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tmaquinariaprecio'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_maquinariaprecio	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_maquinariaprecio_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_MPR_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		22-03-2018 19:06:49
	***********************************/

	if(p_transaccion='SNX_MPR_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tmaquinariaprecio(
			fechaprecio,
			proyecto,
			id_moneda,
			valormaquinaria,
			estado_reg,
			id_maquinaria,
			id_usuario_ai,
			fecha_reg,
			usuario_ai,
			id_usuario_reg,
			id_usuario_mod,
			fecha_mod
          	) values(
			v_parametros.fechaprecio,
			v_parametros.proyecto,
			v_parametros.id_moneda,
			v_parametros.valormaquinaria,
			'activo',
			v_parametros.id_maquinaria,
			v_parametros._id_usuario_ai,
			now(),
			v_parametros._nombre_usuario_ai,
			p_id_usuario,
			null,
			null
							
			
			
			)RETURNING id_maquinariaprecio into v_id_maquinariaprecio;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Maquinaria Precio almacenado(a) con exito (id_maquinariaprecio'||v_id_maquinariaprecio||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_maquinariaprecio',v_id_maquinariaprecio::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MPR_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		22-03-2018 19:06:49
	***********************************/

	elsif(p_transaccion='SNX_MPR_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tmaquinariaprecio set
			fechaprecio = v_parametros.fechaprecio,
			proyecto = v_parametros.proyecto,
			id_moneda = v_parametros.id_moneda,
			valormaquinaria = v_parametros.valormaquinaria,
			id_maquinaria = v_parametros.id_maquinaria,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_maquinariaprecio=v_parametros.id_maquinariaprecio;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Maquinaria Precio modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_maquinariaprecio',v_parametros.id_maquinariaprecio::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MPR_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		22-03-2018 19:06:49
	***********************************/

	elsif(p_transaccion='SNX_MPR_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tmaquinariaprecio
            where id_maquinariaprecio=v_parametros.id_maquinariaprecio;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Maquinaria Precio eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_maquinariaprecio',v_parametros.id_maquinariaprecio::varchar);
              
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

ALTER FUNCTION snx.ft_maquinariaprecio_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;