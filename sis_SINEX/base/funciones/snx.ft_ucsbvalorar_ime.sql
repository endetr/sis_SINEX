-- FUNCTION: snx.ft_ucsbvalorar_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_ucsbvalorar_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_ucsbvalorar_ime(
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
 FUNCION: 		snx.ft_ucsbvalorar_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tucsbvalorar'
 AUTOR: 		 (admin)
 FECHA:	        09-11-2018 18:38:43
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				09-11-2018 18:38:43								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tucsbvalorar'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_ucsbvalorar	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_ucsbvalorar_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_SBV_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		09-11-2018 18:38:43
	***********************************/

	if(p_transaccion='SNX_SBV_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tucsbvalorar(
			id_terrenosb,
			numerobahias,
			codigoproy,
			id_revista,
			distanciatransnac,
			estado_reg,
			altura,
			distanciatransext,
			nombreproy,
			id_usuario_reg,
			fecha_reg,
			usuario_ai,
			id_usuario_ai,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.id_terrenosb,
			v_parametros.numerobahias,
			v_parametros.codigoproy,
			v_parametros.id_revista,
			v_parametros.distanciatransnac,
			'activo',
			v_parametros.altura,
			v_parametros.distanciatransext,
			v_parametros.nombreproy,
			p_id_usuario,
			now(),
			v_parametros._nombre_usuario_ai,
			v_parametros._id_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_ucsbvalorar into v_id_ucsbvalorar;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Subestacion Valor almacenado(a) con exito (id_ucsbvalorar'||v_id_ucsbvalorar||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_ucsbvalorar',v_id_ucsbvalorar::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_SBV_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		09-11-2018 18:38:43
	***********************************/

	elsif(p_transaccion='SNX_SBV_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tucsbvalorar set
			id_terrenosb = v_parametros.id_terrenosb,
			numerobahias = v_parametros.numerobahias,
			codigoproy = v_parametros.codigoproy,
			id_revista = v_parametros.id_revista,
			distanciatransnac = v_parametros.distanciatransnac,
			altura = v_parametros.altura,
			distanciatransext = v_parametros.distanciatransext,
			nombreproy = v_parametros.nombreproy,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_ucsbvalorar=v_parametros.id_ucsbvalorar;
			
			--Actualizar tucsbvalorarcuc
			PERFORM snx.actualizarcotsubestacion(v_parametros.id_ucsbvalorar);			
			
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Subestacion Valor modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_ucsbvalorar',v_parametros.id_ucsbvalorar::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_SBV_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		09-11-2018 18:38:43
	***********************************/

	elsif(p_transaccion='SNX_SBV_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tucsbvalorar
            where id_ucsbvalorar=v_parametros.id_ucsbvalorar;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Subestacion Valor eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_ucsbvalorar',v_parametros.id_ucsbvalorar::varchar);
              
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

ALTER FUNCTION snx.ft_ucsbvalorar_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;