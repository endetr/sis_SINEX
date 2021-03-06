-- FUNCTION: snx.ft_obracivilpreciolt_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_obracivilpreciolt_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_obracivilpreciolt_ime(
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
 FUNCION: 		snx.ft_obracivilpreciolt_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tobracivilpreciolt'
 AUTOR: 		 (admin)
 FECHA:	        25-07-2018 15:23:24
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				25-07-2018 15:23:24								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tobracivilpreciolt'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_obracivilpreciolt	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_obracivilpreciolt_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_OCLTP_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		25-07-2018 15:23:24
	***********************************/

	if(p_transaccion='SNX_OCLTP_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tobracivilpreciolt(
			id_obracivillt,
			estado_reg,
			valorobracivillt,
			proyecto,
			id_moneda,
			fechaprecio,
			usuario_ai,
			fecha_reg,
			id_usuario_reg,
			id_usuario_ai,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.id_obracivillt,
			'activo',
			v_parametros.valorobracivillt,
			v_parametros.proyecto,
			v_parametros.id_moneda,
			v_parametros.fechaprecio,
			v_parametros._nombre_usuario_ai,
			now(),
			p_id_usuario,
			v_parametros._id_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_obracivilpreciolt into v_id_obracivilpreciolt;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Obra Civil LT Precio almacenado(a) con exito (id_obracivilpreciolt'||v_id_obracivilpreciolt||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_obracivilpreciolt',v_id_obracivilpreciolt::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_OCLTP_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		25-07-2018 15:23:24
	***********************************/

	elsif(p_transaccion='SNX_OCLTP_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tobracivilpreciolt set
			id_obracivillt = v_parametros.id_obracivillt,
			valorobracivillt = v_parametros.valorobracivillt,
			proyecto = v_parametros.proyecto,
			id_moneda = v_parametros.id_moneda,
			fechaprecio = v_parametros.fechaprecio,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_obracivilpreciolt=v_parametros.id_obracivilpreciolt;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Obra Civil LT Precio modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_obracivilpreciolt',v_parametros.id_obracivilpreciolt::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_OCLTP_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		25-07-2018 15:23:24
	***********************************/

	elsif(p_transaccion='SNX_OCLTP_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tobracivilpreciolt
            where id_obracivilpreciolt=v_parametros.id_obracivilpreciolt;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Obra Civil LT Precio eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_obracivilpreciolt',v_parametros.id_obracivilpreciolt::varchar);
              
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

ALTER FUNCTION snx.ft_obracivilpreciolt_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;