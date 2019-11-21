-- FUNCTION: snx.ft_ucsbvalorarouc_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_ucsbvalorarouc_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_ucsbvalorarouc_ime(
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
 FUNCION: 		snx.ft_ucsbvalorarouc_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tucsbvalorarouc'
 AUTOR: 		 (admin)
 FECHA:	        13-11-2018 18:53:49
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				13-11-2018 18:53:49								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tucsbvalorarouc'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_ucsbvalorarouc	integer;
	numerobahiasint integer;
	id_revistaint integer;
	distanciatransnacint numeric;
BEGIN

    v_nombre_funcion = 'snx.ft_ucsbvalorarouc_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_SBUC_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		13-11-2018 18:53:49
	***********************************/

	if(p_transaccion='SNX_SBUC_INS')then
					
        begin
			numerobahiasint := (SELECT numerobahias FROM snx.tucsbvalorar WHERE tucsbvalorar.id_ucsbvalorar=v_parametros.id_ucsbvalorar);
			id_revistaint := (SELECT id_revista FROM snx.tucsbvalorar WHERE tucsbvalorar.id_ucsbvalorar=v_parametros.id_ucsbvalorar);
			distanciatransnacint := (SELECT distanciatransnac FROM snx.tucsbvalorar WHERE tucsbvalorar.id_ucsbvalorar=v_parametros.id_ucsbvalorar);
			
        	--Sentencia de la insercion
        	insert into snx.tucsbvalorarouc
			(
				id_ucsbvalorar,
				valortotal,
				codigo,
				descripcion,
				cantidaditem,
				id_otraunidad,
				estado_reg,
				id_usuario_ai,
				id_usuario_reg,
				usuario_ai,
				fecha_reg,
				fecha_mod,
				id_usuario_mod,
				tensionservicio,
				claseaislamiento,
				areasubestacion,
				longitudvias,
				norma,
				porcrepuestos
          	) 
			SELECT		v_parametros.id_ucsbvalorar,
						OUC.valortotal,
						OUC.codigo,
						OUC.descripcion,
						v_parametros.cantidaditem,
						v_parametros.id_otraunidad,
						'activo',
						v_parametros._id_usuario_ai,
						p_id_usuario,
						v_parametros._nombre_usuario_ai,
						now(),
						null,
						null,
						OUC.tensionservicio,
						OUC.claseaislamiento,
						OUC.areasubestacion,
						OUC.longitudvias,
						OUC.norma,
						OUC.porcrepuestos
			FROM		snx.obtenerotrasunidadesconstructivas(v_parametros.id_otraunidad, numerobahiasint, id_revistaint, distanciatransnacint) OUC			
			RETURNING 	id_ucsbvalorarouc into v_id_ucsbvalorarouc;
			
			PERFORM snx.insertarotrasucsb(v_parametros.id_otraunidad, v_id_ucsbvalorarouc, numerobahiasint, id_revistaint, distanciatransnacint);
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Otras unidades constructibas almacenado(a) con exito (id_ucsbvalorarouc'||v_id_ucsbvalorarouc||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_ucsbvalorarouc',v_id_ucsbvalorarouc::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_SBUC_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		13-11-2018 18:53:49
	***********************************/

	elsif(p_transaccion='SNX_SBUC_MOD')then

		begin
			numerobahiasint := (SELECT numerobahias FROM snx.tucsbvalorar WHERE tucsbvalorar.id_ucsbvalorar=v_parametros.id_ucsbvalorar);
			id_revistaint := (SELECT id_revista FROM snx.tucsbvalorar WHERE tucsbvalorar.id_ucsbvalorar=v_parametros.id_ucsbvalorar);
			distanciatransnacint := (SELECT distanciatransnac FROM snx.tucsbvalorar WHERE tucsbvalorar.id_ucsbvalorar=v_parametros.id_ucsbvalorar);
			
			--Sentencia de la modificacion
			update 	snx.tucsbvalorarouc 
			set		id_ucsbvalorar = v_parametros.id_ucsbvalorar,
					valortotal = OUCSB.valortotal,
					codigo = OUCSB.codigo,
					descripcion = OUCSB.descripcion,
					cantidaditem = v_parametros.cantidaditem,
					id_otraunidad = v_parametros.id_otraunidad,
					fecha_mod = now(),
					id_usuario_mod = p_id_usuario,
					id_usuario_ai = v_parametros._id_usuario_ai,
					usuario_ai = v_parametros._nombre_usuario_ai,
					tensionservicio = OUCSB.tensionservicio,
					claseaislamiento = OUCSB.claseaislamiento,
					areasubestacion = OUCSB.areasubestacion,
					longitudvias = OUCSB.longitudvias,
					norma = OUCSB.norma,
					porcrepuestos = OUCSB.porcrepuestos
			FROM	snx.obtenerotrasunidadesconstructivas(v_parametros.id_otraunidad, numerobahiasint, id_revistaint, distanciatransnacint) OUCSB
			where 	tucsbvalorarouc.id_ucsbvalorarouc = v_parametros.id_ucsbvalorarouc;
            
			DELETE FROM snx.tucsbvaloraroucdet WHERE tucsbvaloraroucdet.id_ucsbvalorarouc = v_parametros.id_ucsbvalorarouc;
			DELETE FROM snx.tucsbvaloraroucog WHERE tucsbvaloraroucog.id_ucsbvalorarouc = v_parametros.id_ucsbvalorarouc;
			
			PERFORM snx.insertarotrasucsb(v_parametros.id_otraunidad, v_parametros.id_ucsbvalorarouc, numerobahiasint, id_revistaint, distanciatransnacint);
			
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Otras unidades constructibas modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_ucsbvalorarouc',v_parametros.id_ucsbvalorarouc::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_SBUC_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		13-11-2018 18:53:49
	***********************************/

	elsif(p_transaccion='SNX_SBUC_ELI')then

		begin
			--Sentencia de la eliminacion
			DELETE FROM snx.tucsbvaloraroucdet WHERE tucsbvaloraroucdet.id_ucsbvalorarouc = v_parametros.id_ucsbvalorarouc;
			DELETE FROM snx.tucsbvaloraroucog WHERE tucsbvaloraroucog.id_ucsbvalorarouc = v_parametros.id_ucsbvalorarouc;
			
			DELETE FROM snx.tucsbvalorarouc WHERE id_ucsbvalorarouc=v_parametros.id_ucsbvalorarouc;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Otras unidades constructibas eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_ucsbvalorarouc',v_parametros.id_ucsbvalorarouc::varchar);
              
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

ALTER FUNCTION snx.ft_ucsbvalorarouc_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;
