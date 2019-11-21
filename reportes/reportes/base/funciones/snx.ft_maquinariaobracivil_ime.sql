-- FUNCTION: snx.ft_maquinariaobracivil_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_maquinariaobracivil_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_maquinariaobracivil_ime(
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
 FUNCION: 		snx.ft_maquinariaobracivil_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tmaquinariaobracivil'
 AUTOR: 		 (admin)
 FECHA:	        10-07-2018 18:30:04
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				10-07-2018 18:30:04								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tmaquinariaobracivil'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_maquinariaobracivil	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_maquinariaobracivil_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_MOCME_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		10-07-2018 18:30:04
	***********************************/

	if(p_transaccion='SNX_MOCME_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tmaquinariaobracivil(
			id_obracivil,
			id_maquinaria,
			cantidadmoc,
			estado_reg,
			id_usuario_ai,
			usuario_ai,
			fecha_reg,
			id_usuario_reg,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.id_obracivil,
			v_parametros.id_maquinaria,
			v_parametros.cantidadmoc,
			'activo',
			v_parametros._id_usuario_ai,
			v_parametros._nombre_usuario_ai,
			now(),
			p_id_usuario,
			null,
			null
							
			
			
			)RETURNING id_maquinariaobracivil into v_id_maquinariaobracivil;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Obra Civil y Montaje Electromecánico - Maquinaria almacenado(a) con exito (id_maquinariaobracivil'||v_id_maquinariaobracivil||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_maquinariaobracivil',v_id_maquinariaobracivil::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MOCME_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		10-07-2018 18:30:04
	***********************************/

	elsif(p_transaccion='SNX_MOCME_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tmaquinariaobracivil set
			id_obracivil = v_parametros.id_obracivil,
			id_maquinaria = v_parametros.id_maquinaria,
			cantidadmoc = v_parametros.cantidadmoc,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_maquinariaobracivil=v_parametros.id_maquinariaobracivil;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Obra Civil y Montaje Electromecánico - Maquinaria modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_maquinariaobracivil',v_parametros.id_maquinariaobracivil::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MOCME_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		10-07-2018 18:30:04
	***********************************/

	elsif(p_transaccion='SNX_MOCME_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tmaquinariaobracivil
            where id_maquinariaobracivil=v_parametros.id_maquinariaobracivil;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Obra Civil y Montaje Electromecánico - Maquinaria eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_maquinariaobracivil',v_parametros.id_maquinariaobracivil::varchar);
              
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

ALTER FUNCTION snx.ft_maquinariaobracivil_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;