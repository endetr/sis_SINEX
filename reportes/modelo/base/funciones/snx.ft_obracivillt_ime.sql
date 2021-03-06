-- FUNCTION: snx.ft_obracivillt_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_obracivillt_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_obracivillt_ime(
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
 FUNCION: 		snx.ft_obracivillt_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tobracivillt'
 AUTOR: 		 (admin)
 FECHA:	        25-07-2018 14:56:53
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				25-07-2018 14:56:53								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tobracivillt'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_obracivillt	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_obracivillt_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_OCLT_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		25-07-2018 14:56:53
	***********************************/

	if(p_transaccion='SNX_OCLT_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tobracivillt(
			peso,
			id_unidad,
			estado_reg,
			obracivillt,
			id_usuario_ai,
			fecha_reg,
			usuario_ai,
			id_usuario_reg,
			id_usuario_mod,
			fecha_mod
          	) values(
			v_parametros.peso,
			v_parametros.id_unidad,
			'activo',
			v_parametros.obracivillt,
			v_parametros._id_usuario_ai,
			now(),
			v_parametros._nombre_usuario_ai,
			p_id_usuario,
			null,
			null
							
			
			
			)RETURNING id_obracivillt into v_id_obracivillt;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Obra Civil LT almacenado(a) con exito (id_obracivillt'||v_id_obracivillt||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_obracivillt',v_id_obracivillt::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_OCLT_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		25-07-2018 14:56:53
	***********************************/

	elsif(p_transaccion='SNX_OCLT_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tobracivillt set
			peso = v_parametros.peso,
			id_unidad = v_parametros.id_unidad,
			obracivillt = v_parametros.obracivillt,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_obracivillt=v_parametros.id_obracivillt;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Obra Civil LT modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_obracivillt',v_parametros.id_obracivillt::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_OCLT_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		25-07-2018 14:56:53
	***********************************/

	elsif(p_transaccion='SNX_OCLT_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tobracivillt
            where id_obracivillt=v_parametros.id_obracivillt;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Obra Civil LT eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_obracivillt',v_parametros.id_obracivillt::varchar);
              
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

ALTER FUNCTION snx.ft_obracivillt_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;