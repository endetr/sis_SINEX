-- FUNCTION: snx.ft_unidadconstructivaeep_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_unidadconstructivaeep_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_unidadconstructivaeep_ime(
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
 FUNCION: 		snx.ft_unidadconstructivaeep_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tunidadconstructivaeep'
 AUTOR: 		 (admin)
 FECHA:	        11-10-2018 19:56:19
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				11-10-2018 19:56:19								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tunidadconstructivaeep'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_unidadconstructivaeep	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_unidadconstructivaeep_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_UCEE_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		11-10-2018 19:56:19
	***********************************/

	if(p_transaccion='SNX_UCEE_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tunidadconstructivaeep(
			codigo_unieepp,
			norma,
			descripcion,
			id_tensionservicio,
			estado_reg,
			id_usuario_ai,
			fecha_reg,
			usuario_ai,
			id_usuario_reg,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.codigo_unieepp,
			v_parametros.norma,
			v_parametros.descripcion,
			v_parametros.id_tensionservicio,
			'activo',
			v_parametros._id_usuario_ai,
			now(),
			v_parametros._nombre_usuario_ai,
			p_id_usuario,
			null,
			null
							
			
			
			)RETURNING id_unidadconstructivaeep into v_id_unidadconstructivaeep;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Unidad constructiva estudios especiales almacenado(a) con exito (id_unidadconstructivaeep'||v_id_unidadconstructivaeep||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivaeep',v_id_unidadconstructivaeep::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCEE_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		11-10-2018 19:56:19
	***********************************/

	elsif(p_transaccion='SNX_UCEE_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tunidadconstructivaeep set
			codigo_unieepp = v_parametros.codigo_unieepp,
			norma = v_parametros.norma,
			descripcion = v_parametros.descripcion,
			id_tensionservicio = v_parametros.id_tensionservicio,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_unidadconstructivaeep=v_parametros.id_unidadconstructivaeep;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Unidad constructiva estudios especiales modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivaeep',v_parametros.id_unidadconstructivaeep::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCEE_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		11-10-2018 19:56:19
	***********************************/

	elsif(p_transaccion='SNX_UCEE_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tunidadconstructivaeep
            where id_unidadconstructivaeep=v_parametros.id_unidadconstructivaeep;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Unidad constructiva estudios especiales eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivaeep',v_parametros.id_unidadconstructivaeep::varchar);
              
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

ALTER FUNCTION snx.ft_unidadconstructivaeep_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;