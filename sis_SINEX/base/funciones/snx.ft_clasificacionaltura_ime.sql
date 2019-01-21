-- FUNCTION: snx.ft_clasificacionaltura_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_clasificacionaltura_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_clasificacionaltura_ime(
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
 FUNCION: 		snx.ft_clasificacionaltura_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tclasificacionaltura'
 AUTOR: 		 (admin)
 FECHA:	        12-06-2018 14:56:15
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				12-06-2018 14:56:15								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tclasificacionaltura'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_clasificacionaltura	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_clasificacionaltura_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_CFA_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		12-06-2018 14:56:15
	***********************************/

	if(p_transaccion='SNX_CFA_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tclasificacionaltura(			
			valoraltura,
			estado_reg,
			id_usuario_ai,
			id_usuario_reg,
			fecha_reg,
			usuario_ai,
			fecha_mod,
			id_usuario_mod
          	) values(			
			v_parametros.valoraltura,
			'activo',
			v_parametros._id_usuario_ai,
			p_id_usuario,
			now(),
			v_parametros._nombre_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_clasificacionaltura into v_id_clasificacionaltura;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Clasificacion altura almacenado(a) con exito (id_clasificacionaltura'||v_id_clasificacionaltura||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_clasificacionaltura',v_id_clasificacionaltura::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_CFA_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		12-06-2018 14:56:15
	***********************************/

	elsif(p_transaccion='SNX_CFA_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tclasificacionaltura set
			valoraltura = v_parametros.valoraltura,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_clasificacionaltura=v_parametros.id_clasificacionaltura;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Clasificacion altura modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_clasificacionaltura',v_parametros.id_clasificacionaltura::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_CFA_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		12-06-2018 14:56:15
	***********************************/

	elsif(p_transaccion='SNX_CFA_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tclasificacionaltura
            where id_clasificacionaltura=v_parametros.id_clasificacionaltura;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Clasificacion altura eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_clasificacionaltura',v_parametros.id_clasificacionaltura::varchar);
              
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

ALTER FUNCTION snx.ft_clasificacionaltura_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;