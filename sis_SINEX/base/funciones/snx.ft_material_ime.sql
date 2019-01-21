-- FUNCTION: snx.ft_material_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_material_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_material_ime(
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
 FUNCION: 		snx.ft_material_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tmaterial'
 AUTOR: 		 (admin)
 FECHA:	        05-07-2018 13:08:59
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				05-07-2018 13:08:59								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tmaterial'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_material	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_material_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_MAT_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		05-07-2018 13:08:59
	***********************************/

	if(p_transaccion='SNX_MAT_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tmaterial(
			estado_reg,
			peso,
			id_unidad,
			material,
			fecha_reg,
			usuario_ai,
			id_usuario_reg,
			id_usuario_ai,
			id_usuario_mod,
			fecha_mod,
			id_factorindexacion,
			id_ambitoprecio
          	) values(
			'activo',
			v_parametros.peso,
			v_parametros.id_unidad,
			v_parametros.material,
			now(),
			v_parametros._nombre_usuario_ai,
			p_id_usuario,
			v_parametros._id_usuario_ai,
			null,
			null,
			v_parametros.id_factorindexacion,
			v_parametros.id_ambitoprecio							
			
			
			)RETURNING id_material into v_id_material;
			
			
			--Equipo material
			INSERT INTO snx.tequipomaterial(id_usuario_reg,id_equipo,id_material,cantidadequimat)
			SELECT 1 AS id_usuario_reg,
				   equi.id_equipo,						   
				   v_id_material AS id_material,
				   0 AS cantidadequimat
			FROM snx.tequipo equi;				
			
			--Maquinaria material
			INSERT INTO snx.tmaquinariamaterial(id_usuario_reg,id_maquinaria,id_material,cantidadmate)
				SELECT 1 AS id_usuario_reg, 
					   maq.id_maquinaria,						   
					   v_id_material AS id_material,
					   0 AS cantidadmate
			FROM snx.tmaquinaria maq;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Material almacenado(a) con exito (id_material'||v_id_material||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_material',v_id_material::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MAT_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		05-07-2018 13:08:59
	***********************************/

	elsif(p_transaccion='SNX_MAT_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tmaterial set
			peso = v_parametros.peso,
			id_unidad = v_parametros.id_unidad,
			material = v_parametros.material,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai,
			id_factorindexacion = v_parametros.id_factorindexacion,
			id_ambitoprecio = v_parametros.id_ambitoprecio
			where id_material=v_parametros.id_material;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Material modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_material',v_parametros.id_material::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MAT_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		05-07-2018 13:08:59
	***********************************/

	elsif(p_transaccion='SNX_MAT_ELI')then

		begin
			--Equipo material
			DELETE FROM snx.tequipomaterial
			WHERE id_material=v_parametros.id_material;
            
			--Maquinaria material
			DELETE FROM snx.tmaquinariamaterial
			WHERE id_material=v_parametros.id_material;
			
			--Sentencia de la eliminacion
			DELETE FROM snx.tmaterialprecio
            WHERE id_material=v_parametros.id_material;
			
			--Sentencia de la eliminacion
			DELETE FROM snx.tmaterial
            WHERE id_material=v_parametros.id_material;
			
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Material eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_material',v_parametros.id_material::varchar);
              
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

ALTER FUNCTION snx.ft_material_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;