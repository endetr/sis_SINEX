-- FUNCTION: snx.ft_unidadconstructivatablerocp_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_unidadconstructivatablerocp_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_unidadconstructivatablerocp_ime(
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
 FUNCION: 		snx.ft_unidadconstructivatablerocp_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tunidadconstructivatablerocp'
 AUTOR: 		 (admin)
 FECHA:	        11-10-2018 19:42:39
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				11-10-2018 19:42:39								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tunidadconstructivatablerocp'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_unidadconstructivatablerocp	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_unidadconstructivatablerocp_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_UCTCP_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		11-10-2018 19:42:39
	***********************************/

	if(p_transaccion='SNX_UCTCP_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tunidadconstructivatablerocp(
			id_unidadconstructivaenctablerocp,
			precio,
			cantidadtablerocp,
			estado_reg,
			unidadconstructivatablerocp,
			id_usuario_ai,
			id_usuario_reg,
			usuario_ai,
			fecha_reg,
			id_usuario_mod,
			fecha_mod
          	) values(
			v_parametros.id_unidadconstructivaenctablerocp,
			v_parametros.precio,
			v_parametros.cantidadtablerocp,
			'activo',
			v_parametros.unidadconstructivatablerocp,
			v_parametros._id_usuario_ai,
			p_id_usuario,
			v_parametros._nombre_usuario_ai,
			now(),
			null,
			null
							
			
			
			)RETURNING id_unidadconstructivatablerocp into v_id_unidadconstructivatablerocp;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Tableros de Control y Protección almacenado(a) con exito (id_unidadconstructivatablerocp'||v_id_unidadconstructivatablerocp||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivatablerocp',v_id_unidadconstructivatablerocp::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCTCP_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		11-10-2018 19:42:39
	***********************************/

	elsif(p_transaccion='SNX_UCTCP_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tunidadconstructivatablerocp set
			id_unidadconstructivaenctablerocp = v_parametros.id_unidadconstructivaenctablerocp,
			precio = v_parametros.precio,
			cantidadtablerocp = v_parametros.cantidadtablerocp,
			unidadconstructivatablerocp = v_parametros.unidadconstructivatablerocp,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_unidadconstructivatablerocp=v_parametros.id_unidadconstructivatablerocp;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Tableros de Control y Protección modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivatablerocp',v_parametros.id_unidadconstructivatablerocp::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCTCP_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		11-10-2018 19:42:39
	***********************************/

	elsif(p_transaccion='SNX_UCTCP_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tunidadconstructivatablerocp
            where id_unidadconstructivatablerocp=v_parametros.id_unidadconstructivatablerocp;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Tableros de Control y Protección eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivatablerocp',v_parametros.id_unidadconstructivatablerocp::varchar);
              
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

ALTER FUNCTION snx.ft_unidadconstructivatablerocp_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;