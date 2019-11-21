-- FUNCTION: snx.ft_maquinariamaterial_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_maquinariamaterial_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_maquinariamaterial_ime(
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
 FUNCION: 		snx.ft_maquinariamaterial_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tmaquinariamaterial'
 AUTOR: 		 (admin)
 FECHA:	        05-07-2018 18:55:02
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				05-07-2018 18:55:02								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tmaquinariamaterial'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_maquinariamaterial	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_maquinariamaterial_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_MAQMA_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		05-07-2018 18:55:02
	***********************************/

	if(p_transaccion='SNX_MAQMA_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tmaquinariamaterial(
			id_material,
			id_maquinaria,
			estado_reg,
			cantidadmate,
			fecha_reg,
			usuario_ai,
			id_usuario_reg,
			id_usuario_ai,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.id_material,
			v_parametros.id_maquinaria,
			'activo',
			v_parametros.cantidadmate,
			now(),
			v_parametros._nombre_usuario_ai,
			p_id_usuario,
			v_parametros._id_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_maquinariamaterial into v_id_maquinariamaterial;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','MaquinariaMaterial almacenado(a) con exito (id_maquinariamaterial'||v_id_maquinariamaterial||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_maquinariamaterial',v_id_maquinariamaterial::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MAQMA_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		05-07-2018 18:55:02
	***********************************/

	elsif(p_transaccion='SNX_MAQMA_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tmaquinariamaterial set
			id_material = v_parametros.id_material,
			id_maquinaria = v_parametros.id_maquinaria,
			cantidadmate = v_parametros.cantidadmate,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_maquinariamaterial=v_parametros.id_maquinariamaterial;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','MaquinariaMaterial modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_maquinariamaterial',v_parametros.id_maquinariamaterial::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MAQMA_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		05-07-2018 18:55:02
	***********************************/

	elsif(p_transaccion='SNX_MAQMA_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tmaquinariamaterial
            where id_maquinariamaterial=v_parametros.id_maquinariamaterial;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','MaquinariaMaterial eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_maquinariamaterial',v_parametros.id_maquinariamaterial::varchar);
              
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

ALTER FUNCTION snx.ft_maquinariamaterial_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;