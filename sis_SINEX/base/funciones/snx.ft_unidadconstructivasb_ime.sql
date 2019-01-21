-- FUNCTION: snx.ft_unidadconstructivasb_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_unidadconstructivasb_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_unidadconstructivasb_ime(
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
 FUNCION: 		snx.ft_unidadconstructivasb_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tunidadconstructivasb'
 AUTOR: 		 (admin)
 FECHA:	        23-07-2018 13:53:45
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				23-07-2018 13:53:45								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tunidadconstructivasb'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_unidadconstructivasb	integer;
	calculoaislamiento numeric;
	id_claseaislacionint integer;
BEGIN

    v_nombre_funcion = 'snx.ft_unidadconstructivasb_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_UCS_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		23-07-2018 13:53:45
	***********************************/

	if(p_transaccion='SNX_UCS_INS')then
					
        begin
			calculoaislamiento := (SELECT COALESCE(NULLIF(regexp_replace(tensionservicio, '\D','','g'), '')::numeric, 0) / (1 - (v_parametros.alturainstalacion - 1000.0) / 10000.0)  AS result FROM snx.ttensionservicio WHERE id_tensionservicio = v_parametros.id_tensionservicio);
			
			id_claseaislacionint := (SELECT	id_claseaislacion
									FROM	(
											SELECT id_claseaislacion,
													CASE REPLACE(claseaislacion,regexp_replace(claseaislacion, '\d+\.?\d*','','g'),'')
														WHEN '' THEN 0
														ELSE REPLACE(claseaislacion,regexp_replace(claseaislacion, '\d+\.?\d*','','g'),'')::numeric
													END AS valor
											FROM snx.tclaseaislacion
											) Valores
									WHERE	(Valores.valor - calculoaislamiento > 0 AND Valores.valor > calculoaislamiento) OR (id_claseaislacion = 9 AND Valores.valor <= calculoaislamiento)
									ORDER BY valor ASC limit 1);
								  
		
        	--Sentencia de la insercion
        	insert into snx.tunidadconstructivasb(
			descripcion,
			id_tensionservicio,
			superficie,
			codigo,
			alturainstalacion,
			id_ubicacion,
			estado_reg,			
			id_claseaislacion,
			distanciatransporte,
			distanciatransportemate,
			numerobahias,
			varloringenieria,
			id_usuario_ai,
			usuario_ai,
			fecha_reg,
			id_usuario_reg,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.descripcion,
			v_parametros.id_tensionservicio,
			v_parametros.superficie,
			v_parametros.codigo,
			v_parametros.alturainstalacion,
			v_parametros.id_ubicacion,
			'activo',			
			id_claseaislacionint,
			v_parametros.distanciatransporte,
			v_parametros.distanciatransportemate,
			v_parametros.numerobahias,
			v_parametros.varloringenieria,
			v_parametros._id_usuario_ai,
			v_parametros._nombre_usuario_ai,
			now(),
			p_id_usuario,
			null,
			null
							
			
			
			)RETURNING id_unidadconstructivasb into v_id_unidadconstructivasb;
			
			
			--Maquinaria
			INSERT INTO snx.tucsbmaquinaria (id_usuario_reg,fecha_reg,estado_reg,id_unidadconstructivasb,id_maquinaria,cantidadmaq)
			SELECT	1 AS id_usuario_reg,
					now() AS fecha_reg,
					'activo' AS estado_reg,					
					v_id_unidadconstructivasb AS id_unidadconstructivasb,
					id_maquinaria,
					0 AS cantidadmaq					
			FROM	snx.tmaquinaria;
			
			--Equipo
			INSERT INTO snx.tucsbequipo (id_usuario_reg,fecha_reg,estado_reg,id_unidadconstructivasb,id_equipo,cantidadequ)
			SELECT	1 AS id_usuario_reg,
					now() AS fecha_reg,
					'activo' AS estado_reg,					
					v_id_unidadconstructivasb AS id_unidadconstructivasb,
					id_equipo,
					0 AS cantidadequ					
			FROM	snx.tequipo equ
			where equ.id_claseaislacion = id_claseaislacionint OR equ.id_claseaislacion = 11;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Unidad constructiva subestaciones almacenado(a) con exito (id_unidadconstructivasb'||v_id_unidadconstructivasb||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivasb',v_id_unidadconstructivasb::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCS_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		23-07-2018 13:53:45
	***********************************/

	elsif(p_transaccion='SNX_UCS_MOD')then

		begin
			calculoaislamiento := (SELECT COALESCE(NULLIF(regexp_replace(tensionservicio, '\D','','g'), '')::numeric, 0) / (1 - (v_parametros.alturainstalacion - 1000.0) / 10000.0)  AS result FROM snx.ttensionservicio WHERE id_tensionservicio = v_parametros.id_tensionservicio);
			
			id_claseaislacionint := (SELECT	id_claseaislacion
									FROM	(
											SELECT id_claseaislacion,
													CASE REPLACE(claseaislacion,regexp_replace(claseaislacion, '\d+\.?\d*','','g'),'')
														WHEN '' THEN 0
														ELSE REPLACE(claseaislacion,regexp_replace(claseaislacion, '\d+\.?\d*','','g'),'')::numeric
													END AS valor
											FROM snx.tclaseaislacion
											) Valores
									WHERE	(Valores.valor - calculoaislamiento > 0 AND Valores.valor > calculoaislamiento) OR (id_claseaislacion = 9 AND Valores.valor <= calculoaislamiento)
									ORDER BY valor ASC limit 1);
			
			--Actualizar Equipos
			PERFORM snx.calcularcantidadequiposusb(v_parametros.id_unidadconstructivasb,id_claseaislacionint);
			
			--Sentencia de la modificacion
			update snx.tunidadconstructivasb set
			descripcion = v_parametros.descripcion,
			id_tensionservicio = v_parametros.id_tensionservicio,
			superficie = v_parametros.superficie,
			codigo = v_parametros.codigo,
			alturainstalacion = v_parametros.alturainstalacion,
			id_ubicacion = v_parametros.id_ubicacion,			
			id_claseaislacion = id_claseaislacionint,
			distanciatransporte = v_parametros.distanciatransporte,
			distanciatransportemate = v_parametros.distanciatransportemate,
			numerobahias = v_parametros.numerobahias,
			varloringenieria = v_parametros.varloringenieria,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_unidadconstructivasb=v_parametros.id_unidadconstructivasb;			
            
			--Actualizar Cálculos
			PERFORM snx.calcularprecioucsbsingle(v_parametros.id_unidadconstructivasb,1,1);
			
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Unidad constructiva subestaciones modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivasb',v_parametros.id_unidadconstructivasb::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCS_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		23-07-2018 13:53:45
	***********************************/

	elsif(p_transaccion='SNX_UCS_ELI')then

		begin
			--Sentencia de la eliminacion	
			
			delete from snx.tunidadconstructivasb
            where id_unidadconstructivasb=v_parametros.id_unidadconstructivasb;
			
			--Maquinaria
			DELETE FROM snx.tucsbmaquinaria
			WHERE id_unidadconstructivasb=v_parametros.id_unidadconstructivasb;			
              
			--Maquinaria
			DELETE FROM snx.tucsbequipo
			WHERE id_unidadconstructivasb=v_parametros.id_unidadconstructivasb;
					
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Unidad constructiva subestaciones eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivasb',v_parametros.id_unidadconstructivasb::varchar);
              
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

ALTER FUNCTION snx.ft_unidadconstructivasb_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;