-- FUNCTION: snx.ft_materiallt_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_materiallt_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_materiallt_ime(
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
 FUNCION: 		snx.ft_materiallt_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tmateriallt'
 AUTOR: 		 (admin)
 FECHA:	        19-07-2018 14:36:34
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				19-07-2018 14:36:34								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tmateriallt'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_materiallt	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_materiallt_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_MTLT_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		19-07-2018 14:36:34
	***********************************/

	if(p_transaccion='SNX_MTLT_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tmateriallt(
			peso,
			id_unidad,
			estado_reg,
			materiallt,
			id_usuario_ai,
			id_usuario_reg,
			fecha_reg,
			usuario_ai,
			id_usuario_mod,
			fecha_mod,
			id_factorindexacion,
			id_ambitoprecio
          	) values(
			v_parametros.peso,
			v_parametros.id_unidad,
			'activo',
			v_parametros.materiallt,
			v_parametros._id_usuario_ai,
			p_id_usuario,
			now(),
			v_parametros._nombre_usuario_ai,
			null,
			null,
			v_parametros.id_factorindexacion,
			v_parametros.id_ambitoprecio
			
			
			)RETURNING id_materiallt into v_id_materiallt;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Material LT almacenado(a) con exito (id_materiallt'||v_id_materiallt||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_materiallt',v_id_materiallt::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MTLT_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		19-07-2018 14:36:34
	***********************************/

	elsif(p_transaccion='SNX_MTLT_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tmateriallt set
			peso = v_parametros.peso,
			id_unidad = v_parametros.id_unidad,
			materiallt = v_parametros.materiallt,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai,
			id_factorindexacion = v_parametros.id_factorindexacion,
			id_ambitoprecio = v_parametros.id_ambitoprecio
			where id_materiallt=v_parametros.id_materiallt;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Material LT modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_materiallt',v_parametros.id_materiallt::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MTLT_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		19-07-2018 14:36:34
	***********************************/

	elsif(p_transaccion='SNX_MTLT_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tmateriallt
            where id_materiallt=v_parametros.id_materiallt;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Material LT eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_materiallt',v_parametros.id_materiallt::varchar);
              
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

ALTER FUNCTION snx.ft_materiallt_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;