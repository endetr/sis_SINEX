-- FUNCTION: snx.ft_materialcantidadlt_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_materialcantidadlt_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_materialcantidadlt_ime(
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
 FUNCION: 		snx.ft_materialcantidadlt_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tmaterialcantidadlt'
 AUTOR: 		 (admin)
 FECHA:	        24-07-2018 15:27:55
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				24-07-2018 15:27:55								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tmaterialcantidadlt'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_materialcantidadlt	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_materialcantidadlt_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_MTCLT_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		24-07-2018 15:27:55
	***********************************/

	if(p_transaccion='SNX_MTCLT_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tmaterialcantidadlt(
			cantidadmontajelt,
			id_materiallt,
			id_funcionestructura,
			id_hilosguarda,
			id_puestatierra,
			id_tipoconductor,
			id_configuracionlt,
			id_aislador,
			id_tensionservicio,
			id_tipoestructura,
			estado_reg,
			id_usuario_ai,
			fecha_reg,
			usuario_ai,
			id_usuario_reg,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.cantidadmontajelt,
			v_parametros.id_materiallt,
			v_parametros.id_funcionestructura,
			v_parametros.id_hilosguarda,
			v_parametros.id_puestatierra,
			v_parametros.id_tipoconductor,
			v_parametros.id_configuracionlt,
			v_parametros.id_aislador,
			v_parametros.id_tensionservicio,
			v_parametros.id_tipoestructura,
			'activo',
			v_parametros._id_usuario_ai,
			now(),
			v_parametros._nombre_usuario_ai,
			p_id_usuario,
			null,
			null
							
			
			
			)RETURNING id_materialcantidadlt into v_id_materialcantidadlt;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Material Cantidad LT almacenado(a) con exito (id_materialcantidadlt'||v_id_materialcantidadlt||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_materialcantidadlt',v_id_materialcantidadlt::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MTCLT_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		24-07-2018 15:27:55
	***********************************/

	elsif(p_transaccion='SNX_MTCLT_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tmaterialcantidadlt set
			cantidadmontajelt = v_parametros.cantidadmontajelt,
			id_materiallt = v_parametros.id_materiallt,
			id_funcionestructura = v_parametros.id_funcionestructura,
			id_hilosguarda = v_parametros.id_hilosguarda,
			id_puestatierra = v_parametros.id_puestatierra,
			id_tipoconductor = v_parametros.id_tipoconductor,
			id_configuracionlt = v_parametros.id_configuracionlt,
			id_aislador = v_parametros.id_aislador,
			id_tensionservicio = v_parametros.id_tensionservicio,
			id_tipoestructura = v_parametros.id_tipoestructura,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_materialcantidadlt=v_parametros.id_materialcantidadlt;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Material Cantidad LT modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_materialcantidadlt',v_parametros.id_materialcantidadlt::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MTCLT_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		24-07-2018 15:27:55
	***********************************/

	elsif(p_transaccion='SNX_MTCLT_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tmaterialcantidadlt
            where id_materialcantidadlt=v_parametros.id_materialcantidadlt;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Material Cantidad LT eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_materialcantidadlt',v_parametros.id_materialcantidadlt::varchar);
              
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

ALTER FUNCTION snx.ft_materialcantidadlt_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;