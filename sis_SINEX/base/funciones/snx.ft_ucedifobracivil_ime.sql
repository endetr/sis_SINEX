-- FUNCTION: snx.ft_ucedifobracivil_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_ucedifobracivil_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_ucedifobracivil_ime(
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
 FUNCION: 		snx.ft_ucedifobracivil_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tucedifobracivil'
 AUTOR: 		 (admin)
 FECHA:	        27-07-2018 14:52:35
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				27-07-2018 14:52:35								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tucedifobracivil'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_ucedifobracivil	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_ucedifobracivil_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_UDOC_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		27-07-2018 14:52:35
	***********************************/

	if(p_transaccion='SNX_UDOC_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tucedifobracivil(
			id_ucedifsubgrupo,
			cantidadobracivil,
			id_obracivilmoe,
			estado_reg,
			id_usuario_ai,
			id_usuario_reg,
			fecha_reg,
			usuario_ai,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.id_ucedifsubgrupo,
			v_parametros.cantidadobracivil,
			v_parametros.id_obracivilmoe,
			'activo',
			v_parametros._id_usuario_ai,
			p_id_usuario,
			now(),
			v_parametros._nombre_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_ucedifobracivil into v_id_ucedifobracivil;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Obra civil almacenado(a) con exito (id_ucedifobracivil'||v_id_ucedifobracivil||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_ucedifobracivil',v_id_ucedifobracivil::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UDOC_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		27-07-2018 14:52:35
	***********************************/

	elsif(p_transaccion='SNX_UDOC_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tucedifobracivil set
			id_ucedifsubgrupo = v_parametros.id_ucedifsubgrupo,
			cantidadobracivil = v_parametros.cantidadobracivil,
			id_obracivilmoe = v_parametros.id_obracivilmoe,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_ucedifobracivil=v_parametros.id_ucedifobracivil;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Obra civil modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_ucedifobracivil',v_parametros.id_ucedifobracivil::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UDOC_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		27-07-2018 14:52:35
	***********************************/

	elsif(p_transaccion='SNX_UDOC_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tucedifobracivil
            where id_ucedifobracivil=v_parametros.id_ucedifobracivil;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Obra civil eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_ucedifobracivil',v_parametros.id_ucedifobracivil::varchar);
              
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

ALTER FUNCTION snx.ft_ucedifobracivil_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;