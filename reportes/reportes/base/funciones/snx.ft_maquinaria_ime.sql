-- FUNCTION: snx.ft_maquinaria_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_maquinaria_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_maquinaria_ime(
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
 FUNCION: 		snx.ft_maquinaria_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tmaquinaria'
 AUTOR: 		 (admin)
 FECHA:	        22-03-2018 19:06:44
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				22-03-2018 19:06:44								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tmaquinaria'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_maquinaria	integer;
	pesoint numeric;
	
BEGIN

    v_nombre_funcion = 'snx.ft_maquinaria_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_MAQ_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		22-03-2018 19:06:44
	***********************************/

	if(p_transaccion='SNX_MAQ_INS')then					
        begin
			pesoint := (SELECT CASE v_parametros.id_tipopreciomaquinaria
									WHEN 1 THEN v_parametros.peso
									WHEN 2 THEN 0.1 * v_parametros.potencia
									WHEN 3 THEN 2 * v_parametros.potencia
									WHEN 4 THEN 2 * v_parametros.potencia
									WHEN 5 THEN 2 * v_parametros.potencia
								END AS peso							
						);
		
        	--Sentencia de la insercion
        	insert into snx.tmaquinaria(
			estado_reg,
			potencia,
			peso,
			maquinaria,
			usuario_ai,
			fecha_reg,
			id_usuario_reg,
			id_usuario_ai,
			id_usuario_mod,
			fecha_mod,
			id_factorindexacion,
			id_tipopreciomaquinaria,
			id_ambitoprecio
          	) values(
			'activo',
			v_parametros.potencia,
			pesoint,
			v_parametros.maquinaria,
			v_parametros._nombre_usuario_ai,
			now(),
			p_id_usuario,
			v_parametros._id_usuario_ai,
			null,
			null,
			v_parametros.id_factorindexacion,
			v_parametros.id_tipopreciomaquinaria,
			v_parametros.id_ambitoprecio
			
			
			)RETURNING id_maquinaria into v_id_maquinaria;
			
			--Materiales
			INSERT INTO snx.tmaquinariamaterial (cantidadmate, estado_reg, id_maquinaria, id_material,id_usuario_reg, id_usuario_ai,  usuario_ai, fecha_reg, id_usuario_mod, fecha_mod)
			SELECT	0 AS cantidadmate,
					'activo' AS estado_reg,
					v_id_maquinaria as id_maquinaria,
					id_material,
					1 AS id_usuario_reg,
					null AS id_usuario_ai, 
					null AS usuario_ai,
					now() AS fecha_reg,
					null AS id_usuario_mod,
					now() AS fecha_mod
			FROM	snx.tmaterial;
			
			--Obra Civil
			insert into snx.tmaquinariaobracivil(id_obracivil, cantidadmoc, id_maquinaria, estado_reg, id_usuario_ai, fecha_reg, usuario_ai, id_usuario_reg, fecha_mod, id_usuario_mod)
			SELECT	oc.id_obracivil,
					0 AS cantidadmoc,
					v_id_maquinaria as id_maquinaria,
					'activo' AS estado_reg,
					null AS id_usuario_ai, 
					now() AS fecha_reg, 
					null AS usuario_ai, 
					1 AS id_usuario_reg, 
					now() AS fecha_mod, 
					null AS id_usuario_mod
			FROM	snx.tobracivil oc
			WHERE  id_obracivil IN (1,2,3,4,5,6,7); 
			
			--Unidad constructiva maquinaria
			INSERT INTO snx.tucsbmaquinaria(id_usuario_reg,id_unidadconstructivasb,id_maquinaria,cantidadmaq)
			SELECT 1 AS id_usuario_reg,
				   uncnsb.id_unidadconstructivasb,						   
				   v_id_maquinaria AS id_maquinaria,
				   0 AS cantidadmaq
			FROM snx.tunidadconstructivasb uncnsb;	
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Maquinaria almacenado(a) con exito (id_maquinaria'||v_id_maquinaria||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_maquinaria',v_id_maquinaria::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MAQ_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		22-03-2018 19:06:44
	***********************************/

	elsif(p_transaccion='SNX_MAQ_MOD')then

		begin
			pesoint := (SELECT CASE v_parametros.id_tipopreciomaquinaria
										WHEN 1 THEN v_parametros.peso
										WHEN 2 THEN 0.1 * v_parametros.potencia
										WHEN 3 THEN 2 * v_parametros.potencia
										WHEN 4 THEN 2 * v_parametros.potencia
										WHEN 5 THEN 2 * v_parametros.potencia
									END AS peso							
							);
						
			--Sentencia de la modificacion
			update snx.tmaquinaria set
			potencia = v_parametros.potencia,
			peso = pesoint,
			maquinaria = v_parametros.maquinaria,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai,
			id_factorindexacion = v_parametros.id_factorindexacion,
			id_tipopreciomaquinaria = v_parametros.id_tipopreciomaquinaria,
			id_ambitoprecio = v_parametros.id_ambitoprecio
			where id_maquinaria=v_parametros.id_maquinaria;               
						
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Maquinaria modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_maquinaria',v_parametros.id_maquinaria::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MAQ_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		22-03-2018 19:06:44
	***********************************/

	elsif(p_transaccion='SNX_MAQ_ELI')then

		begin
			--Unidad constructiva maquinaria
			DELETE FROM snx.tucsbmaquinaria
			WHERE id_maquinaria=v_parametros.id_maquinaria;
            
			--Materiales
			DELETE FROM snx.tmaquinariamaterial
			WHERE	id_maquinaria=v_parametros.id_maquinaria;
			
			--Obra Civil
			DELETE FROM snx.tmaquinariaobracivil
			WHERE	id_maquinaria=v_parametros.id_maquinaria;
			
			--Sentencia de la eliminacion
			delete from snx.tmaquinaria
            where id_maquinaria=v_parametros.id_maquinaria;
			
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Maquinaria eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_maquinaria',v_parametros.id_maquinaria::varchar);
              
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

ALTER FUNCTION snx.ft_maquinaria_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;
