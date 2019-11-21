-- FUNCTION: snx.ft_equipomaterial_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_equipomaterial_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_equipomaterial_ime(
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
 FUNCION: 		snx.ft_equipomaterial_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tequipomaterial'
 AUTOR: 		 (admin)
 FECHA:	        09-07-2018 16:12:16
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				09-07-2018 16:12:16								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tequipomaterial'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_equipomaterial	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_equipomaterial_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_EQMA_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		09-07-2018 16:12:16
	***********************************/

	if(p_transaccion='SNX_EQMA_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tequipomaterial(
			cantidadequimat,
			estado_reg,
			id_equipo,
			id_material,
			id_usuario_ai,
			id_usuario_reg,
			usuario_ai,
			fecha_reg,
			id_usuario_mod,
			fecha_mod
          	) values(
			v_parametros.cantidadequimat,
			'activo',
			v_parametros.id_equipo,
			v_parametros.id_material,
			v_parametros._id_usuario_ai,
			p_id_usuario,
			v_parametros._nombre_usuario_ai,
			now(),
			null,
			null
							
			
			
			)RETURNING id_equipomaterial into v_id_equipomaterial;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','EquipoMaterial almacenado(a) con exito (id_equipomaterial'||v_id_equipomaterial||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_equipomaterial',v_id_equipomaterial::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_EQMA_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		09-07-2018 16:12:16
	***********************************/

	elsif(p_transaccion='SNX_EQMA_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tequipomaterial set
			cantidadequimat = v_parametros.cantidadequimat,
			id_equipo = v_parametros.id_equipo,
			id_material = v_parametros.id_material,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_equipomaterial=v_parametros.id_equipomaterial;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','EquipoMaterial modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_equipomaterial',v_parametros.id_equipomaterial::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_EQMA_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		09-07-2018 16:12:16
	***********************************/

	elsif(p_transaccion='SNX_EQMA_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tequipomaterial
            where id_equipomaterial=v_parametros.id_equipomaterial;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','EquipoMaterial eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_equipomaterial',v_parametros.id_equipomaterial::varchar);
              
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

ALTER FUNCTION snx.ft_equipomaterial_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;