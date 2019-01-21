-- FUNCTION: snx.ft_unidadconstructivatablerocpserv_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_unidadconstructivatablerocpserv_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_unidadconstructivatablerocpserv_ime(
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
 FUNCION: 		snx.ft_unidadconstructivatablerocpserv_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tunidadconstructivatablerocpserv'
 AUTOR: 		 (admin)
 FECHA:	        15-11-2018 14:02:13
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				15-11-2018 14:02:13								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tunidadconstructivatablerocpserv'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_unidadconstructivatablerocpserv	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_unidadconstructivatablerocpserv_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_UCTCSERV_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		15-11-2018 14:02:13
	***********************************/

	if(p_transaccion='SNX_UCTCSERV_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tunidadconstructivatablerocpserv(
			id_unidadconstructivaenctablerocp,
			estado_reg,
			cantidadserv,
			precio,
			unidadconstructivatablerocpserv,
			fecha_reg,
			usuario_ai,
			id_usuario_reg,
			id_usuario_ai,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.id_unidadconstructivaenctablerocp,
			'activo',
			v_parametros.cantidadserv,
			v_parametros.precio,
			v_parametros.unidadconstructivatablerocpserv,
			now(),
			v_parametros._nombre_usuario_ai,
			p_id_usuario,
			v_parametros._id_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_unidadconstructivatablerocpserv into v_id_unidadconstructivatablerocpserv;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Servicios UC Tableros almacenado(a) con exito (id_unidadconstructivatablerocpserv'||v_id_unidadconstructivatablerocpserv||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivatablerocpserv',v_id_unidadconstructivatablerocpserv::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCTCSERV_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		15-11-2018 14:02:13
	***********************************/

	elsif(p_transaccion='SNX_UCTCSERV_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tunidadconstructivatablerocpserv set
			id_unidadconstructivaenctablerocp = v_parametros.id_unidadconstructivaenctablerocp,
			cantidadserv = v_parametros.cantidadserv,
			precio = v_parametros.precio,
			unidadconstructivatablerocpserv = v_parametros.unidadconstructivatablerocpserv,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_unidadconstructivatablerocpserv=v_parametros.id_unidadconstructivatablerocpserv;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Servicios UC Tableros modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivatablerocpserv',v_parametros.id_unidadconstructivatablerocpserv::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCTCSERV_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		15-11-2018 14:02:13
	***********************************/

	elsif(p_transaccion='SNX_UCTCSERV_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tunidadconstructivatablerocpserv
            where id_unidadconstructivatablerocpserv=v_parametros.id_unidadconstructivatablerocpserv;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Servicios UC Tableros eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivatablerocpserv',v_parametros.id_unidadconstructivatablerocpserv::varchar);
              
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

ALTER FUNCTION snx.ft_unidadconstructivatablerocpserv_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;