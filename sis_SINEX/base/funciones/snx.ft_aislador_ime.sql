-- FUNCTION: snx.ft_aislador_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_aislador_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_aislador_ime(
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
 FUNCION: 		snx.ft_aislador_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.taislador'
 AUTOR: 		 (admin)
 FECHA:	        07-05-2018 19:37:56
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				07-05-2018 19:37:56								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.taislador'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_aislador	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_aislador_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_AIS_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		07-05-2018 19:37:56
	***********************************/

	if(p_transaccion='SNX_AIS_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.taislador(
			aislador,
			estado_reg,
			id_usuario_reg,
			fecha_reg,
			usuario_ai,
			id_usuario_ai,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.aislador,
			'activo',
			p_id_usuario,
			now(),
			v_parametros._nombre_usuario_ai,
			v_parametros._id_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_aislador into v_id_aislador;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Aislador almacenado(a) con exito (id_aislador'||v_id_aislador||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_aislador',v_id_aislador::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_AIS_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		07-05-2018 19:37:56
	***********************************/

	elsif(p_transaccion='SNX_AIS_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.taislador set
			aislador = v_parametros.aislador,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_aislador=v_parametros.id_aislador;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Aislador modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_aislador',v_parametros.id_aislador::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_AIS_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		07-05-2018 19:37:56
	***********************************/

	elsif(p_transaccion='SNX_AIS_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.taislador
            where id_aislador=v_parametros.id_aislador;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Aislador eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_aislador',v_parametros.id_aislador::varchar);
              
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

ALTER FUNCTION snx.ft_aislador_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;