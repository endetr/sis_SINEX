-- FUNCTION: snx.ft_tensionservicio_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_tensionservicio_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_tensionservicio_ime(
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
 FUNCION: 		snx.ft_tensionservicio_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.ttensionservicio'
 AUTOR: 		 (admin)
 FECHA:	        21-03-2018 19:24:34
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				21-03-2018 19:24:34								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.ttensionservicio'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_tensionservicio	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_tensionservicio_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_NIV_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		21-03-2018 19:24:34
	***********************************/

	if(p_transaccion='SNX_NIV_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.ttensionservicio(
			estado_reg,
			tensionservicio,
			id_usuario_ai,
			id_usuario_reg,
			usuario_ai,
			fecha_reg,
			id_usuario_mod,
			fecha_mod
          	) values(
			'activo',
			v_parametros.tensionservicio,
			v_parametros._id_usuario_ai,
			p_id_usuario,
			v_parametros._nombre_usuario_ai,
			now(),
			null,
			null
							
			
			
			)RETURNING id_tensionservicio into v_id_tensionservicio;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','NivelesTension almacenado(a) con exito (id_tensionservicio'||v_id_tensionservicio||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_tensionservicio',v_id_tensionservicio::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_NIV_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		21-03-2018 19:24:34
	***********************************/

	elsif(p_transaccion='SNX_NIV_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.ttensionservicio set
			tensionservicio = v_parametros.tensionservicio,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_tensionservicio=v_parametros.id_tensionservicio;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','NivelesTension modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_tensionservicio',v_parametros.id_tensionservicio::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_NIV_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		21-03-2018 19:24:34
	***********************************/

	elsif(p_transaccion='SNX_NIV_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.ttensionservicio
            where id_tensionservicio=v_parametros.id_tensionservicio;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','NivelesTension eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_tensionservicio',v_parametros.id_tensionservicio::varchar);
              
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

ALTER FUNCTION snx.ft_tensionservicio_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;