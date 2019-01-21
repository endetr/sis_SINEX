-- FUNCTION: snx.ft_unidadconstructivacomp_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_unidadconstructivacomp_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_unidadconstructivacomp_ime(
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
 FUNCION: 		snx.ft_unidadconstructivacomp_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tunidadconstructivacomp'
 AUTOR: 		 (admin)
 FECHA:	        11-10-2018 19:56:16
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				11-10-2018 19:56:16								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tunidadconstructivacomp'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_unidadconstructivacomp	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_unidadconstructivacomp_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_UCC_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		11-10-2018 19:56:16
	***********************************/

	if(p_transaccion='SNX_UCC_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tunidadconstructivacomp(
			unidadconstructivacomp,
			valor,
			capacidad,
			estado_reg,
			codigo_unicomp,
			id_usuario_ai,
			usuario_ai,
			fecha_reg,
			id_usuario_reg,
			id_usuario_mod,
			fecha_mod
          	) values(
			v_parametros.unidadconstructivacomp,
			v_parametros.valor,
			v_parametros.capacidad,
			'activo',
			v_parametros.codigo_unicomp,
			v_parametros._id_usuario_ai,
			v_parametros._nombre_usuario_ai,
			now(),
			p_id_usuario,
			null,
			null
							
			
			
			)RETURNING id_unidadconstructivacomp into v_id_unidadconstructivacomp;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Unidad constructiva Compensación almacenado(a) con exito (id_unidadconstructivacomp'||v_id_unidadconstructivacomp||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivacomp',v_id_unidadconstructivacomp::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCC_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		11-10-2018 19:56:16
	***********************************/

	elsif(p_transaccion='SNX_UCC_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tunidadconstructivacomp set
			unidadconstructivacomp = v_parametros.unidadconstructivacomp,
			valor = v_parametros.valor,
			capacidad = v_parametros.capacidad,
			codigo_unicomp = v_parametros.codigo_unicomp,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_unidadconstructivacomp=v_parametros.id_unidadconstructivacomp;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Unidad constructiva Compensación modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivacomp',v_parametros.id_unidadconstructivacomp::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCC_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		11-10-2018 19:56:16
	***********************************/

	elsif(p_transaccion='SNX_UCC_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tunidadconstructivacomp
            where id_unidadconstructivacomp=v_parametros.id_unidadconstructivacomp;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Unidad constructiva Compensación eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivacomp',v_parametros.id_unidadconstructivacomp::varchar);
              
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

ALTER FUNCTION snx.ft_unidadconstructivacomp_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;