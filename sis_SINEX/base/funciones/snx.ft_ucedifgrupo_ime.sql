-- FUNCTION: snx.ft_ucedifgrupo_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_ucedifgrupo_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_ucedifgrupo_ime(
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
 FUNCION: 		snx.ft_ucedifgrupo_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tucedifgrupo'
 AUTOR: 		 (admin)
 FECHA:	        27-07-2018 14:52:40
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				27-07-2018 14:52:40								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tucedifgrupo'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_ucedifgrupo	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_ucedifgrupo_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_UDG_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		27-07-2018 14:52:40
	***********************************/

	if(p_transaccion='SNX_UDG_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tucedifgrupo(
			estado_reg,
			ucedifgrupo,
			id_unidadconstructivaedif,
			fecha_reg,
			usuario_ai,
			id_usuario_reg,
			id_usuario_ai,
			id_usuario_mod,
			fecha_mod
          	) values(
			'activo',
			v_parametros.ucedifgrupo,
			v_parametros.id_unidadconstructivaedif,
			now(),
			v_parametros._nombre_usuario_ai,
			p_id_usuario,
			v_parametros._id_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_ucedifgrupo into v_id_ucedifgrupo;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Grupos almacenado(a) con exito (id_ucedifgrupo'||v_id_ucedifgrupo||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_ucedifgrupo',v_id_ucedifgrupo::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UDG_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		27-07-2018 14:52:40
	***********************************/

	elsif(p_transaccion='SNX_UDG_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tucedifgrupo set
			ucedifgrupo = v_parametros.ucedifgrupo,
			id_unidadconstructivaedif = v_parametros.id_unidadconstructivaedif,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_ucedifgrupo=v_parametros.id_ucedifgrupo;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Grupos modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_ucedifgrupo',v_parametros.id_ucedifgrupo::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UDG_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		27-07-2018 14:52:40
	***********************************/

	elsif(p_transaccion='SNX_UDG_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tucedifgrupo
            where id_ucedifgrupo=v_parametros.id_ucedifgrupo;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Grupos eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_ucedifgrupo',v_parametros.id_ucedifgrupo::varchar);
              
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

ALTER FUNCTION snx.ft_ucedifgrupo_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;