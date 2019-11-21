-- FUNCTION: snx.ft_claseaislacion_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_claseaislacion_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_claseaislacion_ime(
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
 FUNCION: 		snx.ft_claseaislacion_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tclaseaislacion'
 AUTOR: 		 (admin)
 FECHA:	        22-03-2018 12:43:57
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				22-03-2018 12:43:57								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tclaseaislacion'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_claseaislacion	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_claseaislacion_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_CLA_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		22-03-2018 12:43:57
	***********************************/

	if(p_transaccion='SNX_CLA_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tclaseaislacion(
			estado_reg,
			claseaislacion,
			fecha_reg,
			usuario_ai,
			id_usuario_reg,
			id_usuario_ai,
			id_usuario_mod,
			fecha_mod
          	) values(
			'activo',
			v_parametros.claseaislacion,
			now(),
			v_parametros._nombre_usuario_ai,
			p_id_usuario,
			v_parametros._id_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_claseaislacion into v_id_claseaislacion;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Clase de Aislación almacenado(a) con exito (id_claseaislacion'||v_id_claseaislacion||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_claseaislacion',v_id_claseaislacion::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_CLA_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		22-03-2018 12:43:57
	***********************************/

	elsif(p_transaccion='SNX_CLA_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tclaseaislacion set
			claseaislacion = v_parametros.claseaislacion,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_claseaislacion=v_parametros.id_claseaislacion;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Clase de Aislación modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_claseaislacion',v_parametros.id_claseaislacion::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_CLA_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		22-03-2018 12:43:57
	***********************************/

	elsif(p_transaccion='SNX_CLA_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tclaseaislacion
            where id_claseaislacion=v_parametros.id_claseaislacion;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Clase de Aislación eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_claseaislacion',v_parametros.id_claseaislacion::varchar);
              
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

ALTER FUNCTION snx.ft_claseaislacion_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;