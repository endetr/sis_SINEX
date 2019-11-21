-- FUNCTION: snx.ft_tarifaingsb_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_tarifaingsb_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_tarifaingsb_ime(
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
 FUNCION: 		snx.ft_tarifaingsb_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.ttarifaingsb'
 AUTOR: 		 (admin)
 FECHA:	        14-11-2018 16:12:18
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				14-11-2018 16:12:18								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.ttarifaingsb'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_tarifaingsb	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_tarifaingsb_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_TING_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		14-11-2018 16:12:18
	***********************************/

	if(p_transaccion='SNX_TING_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.ttarifaingsb(
			numerobahias,
			porceidfaenas,
			porceingenieria,
			estado_reg,
			id_usuario_ai,
			id_usuario_reg,
			fecha_reg,
			usuario_ai,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.numerobahias,
			v_parametros.porceidfaenas,
			v_parametros.porceingenieria,
			'activo',
			v_parametros._id_usuario_ai,
			p_id_usuario,
			now(),
			v_parametros._nombre_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_tarifaingsb into v_id_tarifaingsb;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Tarifas Ingeniería almacenado(a) con exito (id_tarifaingsb'||v_id_tarifaingsb||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_tarifaingsb',v_id_tarifaingsb::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_TING_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		14-11-2018 16:12:18
	***********************************/

	elsif(p_transaccion='SNX_TING_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.ttarifaingsb set
			numerobahias = v_parametros.numerobahias,
			porceidfaenas = v_parametros.porceidfaenas,
			porceingenieria = v_parametros.porceingenieria,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_tarifaingsb=v_parametros.id_tarifaingsb;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Tarifas Ingeniería modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_tarifaingsb',v_parametros.id_tarifaingsb::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_TING_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		14-11-2018 16:12:18
	***********************************/

	elsif(p_transaccion='SNX_TING_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.ttarifaingsb
            where id_tarifaingsb=v_parametros.id_tarifaingsb;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Tarifas Ingeniería eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_tarifaingsb',v_parametros.id_tarifaingsb::varchar);
              
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

ALTER FUNCTION snx.ft_tarifaingsb_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;