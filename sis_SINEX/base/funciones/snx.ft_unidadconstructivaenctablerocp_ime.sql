-- FUNCTION: snx.ft_unidadconstructivaenctablerocp_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_unidadconstructivaenctablerocp_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_unidadconstructivaenctablerocp_ime(
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
 FUNCION: 		snx.ft_unidadconstructivaenctablerocp_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tunidadconstructivaenctablerocp'
 AUTOR: 		 (admin)
 FECHA:	        15-11-2018 13:32:16
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				15-11-2018 13:32:16								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tunidadconstructivaenctablerocp'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_unidadconstructivaenctablerocp	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_unidadconstructivaenctablerocp_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_UCTCPENC_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		15-11-2018 13:32:16
	***********************************/

	if(p_transaccion='SNX_UCTCPENC_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tunidadconstructivaenctablerocp(
			codigo,
			numerobahias,
			descripcion,
			porcrepuestos,
			estado_reg,
			id_usuario_ai,
			id_usuario_reg,
			fecha_reg,
			usuario_ai,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.codigo,
			v_parametros.numerobahias,
			v_parametros.descripcion,
			v_parametros.porcrepuestos,
			'activo',
			v_parametros._id_usuario_ai,
			p_id_usuario,
			now(),
			v_parametros._nombre_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_unidadconstructivaenctablerocp into v_id_unidadconstructivaenctablerocp;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Unidad Constructiva Tableros de Control y protección almacenado(a) con exito (id_unidadconstructivaenctablerocp'||v_id_unidadconstructivaenctablerocp||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivaenctablerocp',v_id_unidadconstructivaenctablerocp::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCTCPENC_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		15-11-2018 13:32:16
	***********************************/

	elsif(p_transaccion='SNX_UCTCPENC_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tunidadconstructivaenctablerocp set
			codigo = v_parametros.codigo,
			numerobahias = v_parametros.numerobahias,
			descripcion = v_parametros.descripcion,
			porcrepuestos = v_parametros.porcrepuestos,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_unidadconstructivaenctablerocp=v_parametros.id_unidadconstructivaenctablerocp;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Unidad Constructiva Tableros de Control y protección modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivaenctablerocp',v_parametros.id_unidadconstructivaenctablerocp::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCTCPENC_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		15-11-2018 13:32:16
	***********************************/

	elsif(p_transaccion='SNX_UCTCPENC_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tunidadconstructivatablerocpserv
            where id_unidadconstructivaenctablerocp=v_parametros.id_unidadconstructivaenctablerocp;
			
			delete from snx.tunidadconstructivatablerocp
            where id_unidadconstructivaenctablerocp=v_parametros.id_unidadconstructivaenctablerocp;
			
			delete from snx.tunidadconstructivaenctablerocp
            where id_unidadconstructivaenctablerocp=v_parametros.id_unidadconstructivaenctablerocp;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Unidad Constructiva Tableros de Control y protección eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivaenctablerocp',v_parametros.id_unidadconstructivaenctablerocp::varchar);
              
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

ALTER FUNCTION snx.ft_unidadconstructivaenctablerocp_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;