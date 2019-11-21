-- FUNCTION: snx.ft_ucltvalorar_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_ucltvalorar_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_ucltvalorar_ime(
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
 SISTEMA:		SPVPT
 FUNCION: 		snx.ft_ucltvalorar_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tucltvalorar'
 AUTOR: 		 (admin)
 FECHA:	        01-11-2018 14:22:48
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				01-11-2018 14:22:48								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tucltvalorar'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_ucltvalorar	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_ucltvalorar_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_VPUCLT_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		01-11-2018 14:22:48
	***********************************/

	if(p_transaccion='SNX_VPUCLT_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tucltvalorar(
			codigoproy,
			estado_reg,
			nombreproy,
			id_usuario_reg,
			fecha_reg,
			usuario_ai,
			id_usuario_ai,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.codigoproy,
			'activo',
			v_parametros.nombreproy,
			p_id_usuario,
			now(),
			v_parametros._nombre_usuario_ai,
			v_parametros._id_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_ucltvalorar into v_id_ucltvalorar;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Valorar Proyectos Líneas de Transmisión almacenado(a) con exito (id_ucltvalorar'||v_id_ucltvalorar||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_ucltvalorar',v_id_ucltvalorar::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_VPUCLT_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		01-11-2018 14:22:48
	***********************************/

	elsif(p_transaccion='SNX_VPUCLT_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tucltvalorar set
			codigoproy = v_parametros.codigoproy,
			nombreproy = v_parametros.nombreproy,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_ucltvalorar=v_parametros.id_ucltvalorar;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Valorar Proyectos Líneas de Transmisión modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_ucltvalorar',v_parametros.id_ucltvalorar::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_VPUCLT_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		01-11-2018 14:22:48
	***********************************/

	elsif(p_transaccion='SNX_VPUCLT_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tucltvalorar
            where id_ucltvalorar=v_parametros.id_ucltvalorar;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Valorar Proyectos Líneas de Transmisión eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_ucltvalorar',v_parametros.id_ucltvalorar::varchar);
              
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

ALTER FUNCTION snx.ft_ucltvalorar_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;