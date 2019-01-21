-- FUNCTION: snx.ft_ucmoobracivil_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_ucmoobracivil_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_ucmoobracivil_ime(
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
 FUNCION: 		snx.ft_ucmoobracivil_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tucmoobracivil'
 AUTOR: 		 (admin)
 FECHA:	        27-07-2018 16:54:44
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				27-07-2018 16:54:44								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tucmoobracivil'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_ucmoobracivil	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_ucmoobracivil_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_UCMOOBCI_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		27-07-2018 16:54:44
	***********************************/

	if(p_transaccion='SNX_UCMOOBCI_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tucmoobracivil(
			id_obracivilmoe,
			cantidadobra,
			estado_reg,
			id_ucmogrupo,
			id_usuario_ai,
			id_usuario_reg,
			usuario_ai,
			fecha_reg,
			id_usuario_mod,
			fecha_mod
          	) values(
			v_parametros.id_obracivilmoe,
			v_parametros.cantidadobra,
			'activo',
			v_parametros.id_ucmogrupo,
			v_parametros._id_usuario_ai,
			p_id_usuario,
			v_parametros._nombre_usuario_ai,
			now(),
			null,
			null
							
			
			
			)RETURNING id_ucmoobracivil into v_id_ucmoobracivil;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Obra Civil almacenado(a) con exito (id_ucmoobracivil'||v_id_ucmoobracivil||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_ucmoobracivil',v_id_ucmoobracivil::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCMOOBCI_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		27-07-2018 16:54:44
	***********************************/

	elsif(p_transaccion='SNX_UCMOOBCI_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tucmoobracivil set
			id_obracivilmoe = v_parametros.id_obracivilmoe,
			cantidadobra = v_parametros.cantidadobra,
			id_ucmogrupo = v_parametros.id_ucmogrupo,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_ucmoobracivil=v_parametros.id_ucmoobracivil;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Obra Civil modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_ucmoobracivil',v_parametros.id_ucmoobracivil::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCMOOBCI_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		27-07-2018 16:54:44
	***********************************/

	elsif(p_transaccion='SNX_UCMOOBCI_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tucmoobracivil
            where id_ucmoobracivil=v_parametros.id_ucmoobracivil;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Obra Civil eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_ucmoobracivil',v_parametros.id_ucmoobracivil::varchar);
              
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

ALTER FUNCTION snx.ft_ucmoobracivil_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;