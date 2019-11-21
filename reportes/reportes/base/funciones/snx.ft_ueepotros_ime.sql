-- FUNCTION: snx.ft_ueepotros_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_ueepotros_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_ueepotros_ime(
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
 FUNCION: 		snx.ft_ueepotros_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tueepotros'
 AUTOR: 		 (admin)
 FECHA:	        12-10-2018 16:53:37
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				12-10-2018 16:53:37								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tueepotros'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_uceepotros	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_ueepotros_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_TUCO_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		12-10-2018 16:53:37
	***********************************/

	if(p_transaccion='SNX_TUCO_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tueepotros(
			id_unidadconstructivaeep,
			estado_reg,
			valor,
			descripcion,
			id_usuario_reg,
			fecha_reg,
			usuario_ai,
			id_usuario_ai,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.id_unidadconstructivaeep,
			'activo',
			v_parametros.valor,
			v_parametros.descripcion,
			p_id_usuario,
			now(),
			v_parametros._nombre_usuario_ai,
			v_parametros._id_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_uceepotros into v_id_uceepotros;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Otros almacenado(a) con exito (id_uceepotros'||v_id_uceepotros||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_uceepotros',v_id_uceepotros::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_TUCO_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		12-10-2018 16:53:37
	***********************************/

	elsif(p_transaccion='SNX_TUCO_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tueepotros set
			id_unidadconstructivaeep = v_parametros.id_unidadconstructivaeep,
			valor = v_parametros.valor,
			descripcion = v_parametros.descripcion,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_uceepotros=v_parametros.id_uceepotros;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Otros modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_uceepotros',v_parametros.id_uceepotros::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_TUCO_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		12-10-2018 16:53:37
	***********************************/

	elsif(p_transaccion='SNX_TUCO_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tueepotros
            where id_uceepotros=v_parametros.id_uceepotros;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Otros eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_uceepotros',v_parametros.id_uceepotros::varchar);
              
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

ALTER FUNCTION snx.ft_ueepotros_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;