CREATE OR REPLACE FUNCTION "snx"."ft_unidadconstructivaeta_ime" (	
				p_administrador integer, p_id_usuario integer, p_tabla character varying, p_transaccion character varying)
RETURNS character varying AS
$BODY$

/**************************************************************************
 SISTEMA:		SPVPT
 FUNCION: 		snx.ft_unidadconstructivaeta_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tunidadconstructivaeta'
 AUTOR: 		 (admin)
 FECHA:	        25-02-2019 15:32:13
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				25-02-2019 15:32:13								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tunidadconstructivaeta'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_unidadconstructivaeta	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_unidadconstructivaeta_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_UCBETA_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		25-02-2019 15:32:13
	***********************************/

	if(p_transaccion='SNX_UCBETA_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tunidadconstructivaeta(
			estado_reg,
			unidadconstructivaeta,
			codigo,
			fecha_reg,
			usuario_ai,
			id_usuario_reg,
			id_usuario_ai,
			id_usuario_mod,
			fecha_mod
          	) values(
			'activo',
			v_parametros.unidadconstructivaeta,
			v_parametros.codigo,
			now(),
			v_parametros._nombre_usuario_ai,
			p_id_usuario,
			v_parametros._id_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_unidadconstructivaeta into v_id_unidadconstructivaeta;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Estudios y Trámites Ambientales almacenado(a) con exito (id_unidadconstructivaeta'||v_id_unidadconstructivaeta||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivaeta',v_id_unidadconstructivaeta::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCBETA_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		25-02-2019 15:32:13
	***********************************/

	elsif(p_transaccion='SNX_UCBETA_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tunidadconstructivaeta set
			unidadconstructivaeta = v_parametros.unidadconstructivaeta,
			codigo = v_parametros.codigo,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_unidadconstructivaeta=v_parametros.id_unidadconstructivaeta;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Estudios y Trámites Ambientales modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivaeta',v_parametros.id_unidadconstructivaeta::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCBETA_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		25-02-2019 15:32:13
	***********************************/

	elsif(p_transaccion='SNX_UCBETA_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tunidadconstructivaeta
            where id_unidadconstructivaeta=v_parametros.id_unidadconstructivaeta;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Estudios y Trámites Ambientales eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivaeta',v_parametros.id_unidadconstructivaeta::varchar);
              
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
$BODY$
LANGUAGE 'plpgsql' VOLATILE
COST 100;
ALTER FUNCTION "snx"."ft_unidadconstructivaeta_ime"(integer, integer, character varying, character varying) OWNER TO postgres;
