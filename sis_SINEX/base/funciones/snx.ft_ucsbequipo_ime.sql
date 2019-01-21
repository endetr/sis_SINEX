-- FUNCTION: snx.ft_ucsbequipo_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_ucsbequipo_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_ucsbequipo_ime(
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
 FUNCION: 		snx.ft_ucsbequipo_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tucsbequipo'
 AUTOR: 		 (admin)
 FECHA:	        09-07-2018 17:58:19
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				09-07-2018 17:58:19								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tucsbequipo'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_ucsbequipo	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_ucsbequipo_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_UCSBE_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		09-07-2018 17:58:19
	***********************************/

	if(p_transaccion='SNX_UCSBE_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tucsbequipo(
			id_unidadconstructivasb,
			estado_reg,
			cantidadequ,
			id_equipo,
			id_usuario_reg,
			fecha_reg,
			usuario_ai,
			id_usuario_ai,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.id_unidadconstructivasb,
			'activo',
			v_parametros.cantidadequ,
			v_parametros.id_equipo,
			p_id_usuario,
			now(),
			v_parametros._nombre_usuario_ai,
			v_parametros._id_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_ucsbequipo into v_id_ucsbequipo;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','UCSB Equipo almacenado(a) con exito (id_ucsbequipo'||v_id_ucsbequipo||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_ucsbequipo',v_id_ucsbequipo::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCSBE_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		09-07-2018 17:58:19
	***********************************/

	elsif(p_transaccion='SNX_UCSBE_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tucsbequipo set
			id_unidadconstructivasb = v_parametros.id_unidadconstructivasb,
			cantidadequ = v_parametros.cantidadequ,
			id_equipo = v_parametros.id_equipo,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_ucsbequipo=v_parametros.id_ucsbequipo;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','UCSB Equipo modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_ucsbequipo',v_parametros.id_ucsbequipo::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCSBE_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		09-07-2018 17:58:19
	***********************************/

	elsif(p_transaccion='SNX_UCSBE_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tucsbequipo
            where id_ucsbequipo=v_parametros.id_ucsbequipo;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','UCSB Equipo eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_ucsbequipo',v_parametros.id_ucsbequipo::varchar);
              
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

ALTER FUNCTION snx.ft_ucsbequipo_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;