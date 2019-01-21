-- FUNCTION: snx.ft_equipo_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_equipo_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_equipo_ime(
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
 FUNCION: 		snx.ft_equipo_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tequipo'
 AUTOR: 		 (admin)
 FECHA:	        22-03-2018 12:58:05
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				22-03-2018 12:58:05								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tequipo'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_equipo	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_equipo_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_EQU_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		22-03-2018 12:58:05
	***********************************/

	if(p_transaccion='SNX_EQU_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tequipo(
			equipo,
			id_claseaislacion,
			estado_reg,
			id_usuario_ai,
			id_usuario_reg,
			usuario_ai,
			fecha_reg,
			fecha_mod,
			id_usuario_mod,
			id_factorindexacion,
			id_ambitoprecio
          	) values(
			v_parametros.equipo,
			v_parametros.id_claseaislacion,
			'activo',
			v_parametros._id_usuario_ai,
			p_id_usuario,
			v_parametros._nombre_usuario_ai,
			now(),
			null,
			null,
			v_parametros.id_factorindexacion,
			v_parametros.id_ambitoprecio	
			
			
			)RETURNING id_equipo into v_id_equipo;
									
			--Materiales
			INSERT INTO snx.tequipomaterial (cantidadequimat, estado_reg, id_equipo, id_material, id_usuario_reg,id_usuario_ai, usuario_ai, fecha_reg, id_usuario_mod, fecha_mod)
			SELECT	0 AS cantidadequimat,
					'activo' AS estado_reg,
					v_id_equipo as id_equipo,
					id_material,
					1 AS id_usuario_reg,
					null AS id_usuario_ai, 
					null AS usuario_ai,
					now() AS fecha_reg,
					null AS id_usuario_mod,
					now() AS fecha_mod
			FROM	snx.tmaterial;
			
			--Obra Civil
			insert into snx.tequipoobracivil(id_obracivil, cantidadeoc, id_equipo, estado_reg, id_usuario_ai, fecha_reg, usuario_ai, id_usuario_reg, fecha_mod, id_usuario_mod)
			SELECT	oc.id_obracivil,
					0 AS cantidadeoc,
					v_id_equipo AS id_equipo,
					'activo' AS estado_reg,
					null AS id_usuario_ai, 
					now() AS fecha_reg, 
					null AS usuario_ai, 
					1 AS id_usuario_reg, 
					now() AS fecha_mod, 
					null AS id_usuario_mod
			FROM	snx.tobracivil oc;
			
			--Unidad constructiva equipo
			INSERT INTO snx.tucsbequipo(id_usuario_reg,id_unidadconstructivasb,id_equipo,cantidadequ)
			SELECT 1 AS id_usuario_reg,
				   uncnsb.id_unidadconstructivasb,						   
				   v_id_equipo AS id_equipo,
				   0 AS cantidadequ
			FROM snx.tunidadconstructivasb uncnsb;	
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Equipo almacenado(a) con exito (id_equipo'||v_id_equipo||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_equipo',v_id_equipo::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_EQU_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		22-03-2018 12:58:05
	***********************************/

	elsif(p_transaccion='SNX_EQU_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tequipo set
			equipo = v_parametros.equipo,
			id_claseaislacion = v_parametros.id_claseaislacion,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai,
			id_factorindexacion = v_parametros.id_factorindexacion,
			id_ambitoprecio = v_parametros.id_ambitoprecio
			where id_equipo=v_parametros.id_equipo;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Equipo modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_equipo',v_parametros.id_equipo::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_EQU_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		22-03-2018 12:58:05
	***********************************/

	elsif(p_transaccion='SNX_EQU_ELI')then

		begin		
						
			--Materiales
			DELETE FROM snx.tequipomaterial
			WHERE	id_equipo=v_parametros.id_equipo;
			
			--Obra Civil
			DELETE FROM snx.tequipoobracivil
			WHERE	id_equipo=v_parametros.id_equipo;
             
			--Unidad constructiva equipo
			DELETE FROM snx.tucsbequipo
			WHERE id_equipo=v_parametros.id_equipo;
			
			--Sentencia de la eliminacion
			DELETE FROM snx.tequipoprecio
            WHERE id_equipo=v_parametros.id_equipo;
			
			--Sentencia de la eliminacion
			DELETE FROM snx.tequipo
            WHERE id_equipo=v_parametros.id_equipo;
			
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Equipo eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_equipo',v_parametros.id_equipo::varchar);
              
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

ALTER FUNCTION snx.ft_equipo_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;