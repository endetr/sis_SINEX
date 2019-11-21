-- FUNCTION: snx.ft_obracivilmoe_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_obracivilmoe_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_obracivilmoe_ime(
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
 FUNCION: 		snx.ft_obracivilmoe_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tobracivilmoe'
 AUTOR: 		 (admin)
 FECHA:	        30-08-2018 18:19:48
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				30-08-2018 18:19:48								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tobracivilmoe'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_obracivilmoe	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_obracivilmoe_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_OBRCI_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		30-08-2018 18:19:48
	***********************************/

	if(p_transaccion='SNX_OBRCI_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tobracivilmoe(
			porccargasocial,
			id_unidad,			
			porcimpuestos,
			porcimpmanoobra,
			estado_reg,
			porcgastosga,
			porcutilidad,
			obracivilmoe,
			strtransporte,
			porcherramientas,
			id_usuario_ai,
			id_usuario_reg,
			usuario_ai,
			fecha_reg,
			id_usuario_mod,
			fecha_mod
          	) values(
			v_parametros.porccargasocial,
			v_parametros.id_unidad,			
			v_parametros.porcimpuestos,
			v_parametros.porcimpmanoobra,
			'activo',
			v_parametros.porcgastosga,
			v_parametros.porcutilidad,
			v_parametros.obracivilmoe,
			v_parametros.strtransporte,
			v_parametros.porcherramientas,
			v_parametros._id_usuario_ai,
			p_id_usuario,
			v_parametros._nombre_usuario_ai,
			now(),
			null,
			null
							
			
			
			)RETURNING id_obracivilmoe into v_id_obracivilmoe;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Obra Civil almacenado(a) con exito (id_obracivilmoe'||v_id_obracivilmoe||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_obracivilmoe',v_id_obracivilmoe::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_OBRCI_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		30-08-2018 18:19:48
	***********************************/

	elsif(p_transaccion='SNX_OBRCI_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tobracivilmoe set
			porccargasocial = v_parametros.porccargasocial,
			id_unidad = v_parametros.id_unidad,			
			porcimpuestos = v_parametros.porcimpuestos,
			porcimpmanoobra = v_parametros.porcimpmanoobra,
			porcgastosga = v_parametros.porcgastosga,
			porcutilidad = v_parametros.porcutilidad,
			obracivilmoe = v_parametros.obracivilmoe,
			strtransporte = v_parametros.strtransporte,
			porcherramientas = v_parametros.porcherramientas,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_obracivilmoe=v_parametros.id_obracivilmoe;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Obra Civil modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_obracivilmoe',v_parametros.id_obracivilmoe::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_OBRCI_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		30-08-2018 18:19:48
	***********************************/

	elsif(p_transaccion='SNX_OBRCI_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tobracivilmoe
            where id_obracivilmoe=v_parametros.id_obracivilmoe;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Obra Civil eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_obracivilmoe',v_parametros.id_obracivilmoe::varchar);
              
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

ALTER FUNCTION snx.ft_obracivilmoe_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;