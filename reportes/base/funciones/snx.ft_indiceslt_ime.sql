-- FUNCTION: snx.ft_indiceslt_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_indiceslt_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_indiceslt_ime(
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
 FUNCION: 		snx.ft_indiceslt_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tindiceslt'
 AUTOR: 		 (admin)
 FECHA:	        23-07-2018 15:53:45
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				23-07-2018 15:53:45								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tindiceslt'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_indicelt	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_indiceslt_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_INDLT_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		23-07-2018 15:53:45
	***********************************/

	if(p_transaccion='SNX_INDLT_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tindiceslt(
			id_indicetipo,
			id_ambitoprecio,
			id_unidad,
			valorindice,
			estado_reg,
			indicelt,
			id_usuario_ai,
			usuario_ai,
			fecha_reg,
			id_usuario_reg,
			id_usuario_mod,
			fecha_mod
          	) values(
			v_parametros.id_indicetipo,
			v_parametros.id_ambitoprecio,
			v_parametros.id_unidad,
			v_parametros.valorindice,
			'activo',
			v_parametros.indicelt,
			v_parametros._id_usuario_ai,
			v_parametros._nombre_usuario_ai,
			now(),
			p_id_usuario,
			null,
			null
							
			
			
			)RETURNING id_indicelt into v_id_indicelt;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Índices Lineas almacenado(a) con exito (id_indicelt'||v_id_indicelt||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_indicelt',v_id_indicelt::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_INDLT_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		23-07-2018 15:53:45
	***********************************/

	elsif(p_transaccion='SNX_INDLT_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tindiceslt set
			id_indicetipo = v_parametros.id_indicetipo,
			id_ambitoprecio = v_parametros.id_ambitoprecio,
			id_unidad = v_parametros.id_unidad,
			valorindice = v_parametros.valorindice,
			indicelt = v_parametros.indicelt,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_indicelt=v_parametros.id_indicelt;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Índices Lineas modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_indicelt',v_parametros.id_indicelt::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_INDLT_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		23-07-2018 15:53:45
	***********************************/

	elsif(p_transaccion='SNX_INDLT_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tindiceslt
            where id_indicelt=v_parametros.id_indicelt;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Índices Lineas eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_indicelt',v_parametros.id_indicelt::varchar);
              
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

ALTER FUNCTION snx.ft_indiceslt_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;