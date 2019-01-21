-- FUNCTION: snx.ft_tipopreciomaquinaria_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_tipopreciomaquinaria_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_tipopreciomaquinaria_ime(
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
 FUNCION: 		snx.ft_tipopreciomaquinaria_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.ttipopreciomaquinaria'
 AUTOR: 		 (admin)
 FECHA:	        13-11-2018 18:43:45
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				13-11-2018 18:43:45								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.ttipopreciomaquinaria'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_tipopreciomaquinaria	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_tipopreciomaquinaria_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_TPMAQ_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		13-11-2018 18:43:45
	***********************************/

	if(p_transaccion='SNX_TPMAQ_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.ttipopreciomaquinaria(
			estado_reg,
			tipopreciomaquinaria,
			id_usuario_ai,
			usuario_ai,
			fecha_reg,
			id_usuario_reg,
			id_usuario_mod,
			fecha_mod
          	) values(
			'activo',
			v_parametros.tipopreciomaquinaria,
			v_parametros._id_usuario_ai,
			v_parametros._nombre_usuario_ai,
			now(),
			p_id_usuario,
			null,
			null
							
			
			
			)RETURNING id_tipopreciomaquinaria into v_id_tipopreciomaquinaria;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Tipo Precio Maquinaria almacenado(a) con exito (id_tipopreciomaquinaria'||v_id_tipopreciomaquinaria||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_tipopreciomaquinaria',v_id_tipopreciomaquinaria::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_TPMAQ_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		13-11-2018 18:43:45
	***********************************/

	elsif(p_transaccion='SNX_TPMAQ_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.ttipopreciomaquinaria set
			tipopreciomaquinaria = v_parametros.tipopreciomaquinaria,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_tipopreciomaquinaria=v_parametros.id_tipopreciomaquinaria;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Tipo Precio Maquinaria modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_tipopreciomaquinaria',v_parametros.id_tipopreciomaquinaria::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_TPMAQ_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		13-11-2018 18:43:45
	***********************************/

	elsif(p_transaccion='SNX_TPMAQ_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.ttipopreciomaquinaria
            where id_tipopreciomaquinaria=v_parametros.id_tipopreciomaquinaria;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Tipo Precio Maquinaria eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_tipopreciomaquinaria',v_parametros.id_tipopreciomaquinaria::varchar);
              
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

ALTER FUNCTION snx.ft_tipopreciomaquinaria_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;