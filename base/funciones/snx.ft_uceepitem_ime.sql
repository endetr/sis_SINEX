-- FUNCTION: snx.ft_uceepitem_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_uceepitem_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_uceepitem_ime(
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
 FUNCION: 		snx.ft_uceepitem_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tuceepitem'
 AUTOR: 		 (admin)
 FECHA:	        11-10-2018 19:56:25
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				11-10-2018 19:56:25								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tuceepitem'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_uceepitem	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_uceepitem_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_UCI_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		11-10-2018 19:56:25
	***********************************/

	if(p_transaccion='SNX_UCI_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tuceepitem(
			id_unidadconstructivaeep,
			valor,
			descripcion,
			estado_reg,
			id_usuario_ai,
			fecha_reg,
			usuario_ai,
			id_usuario_reg,
			fecha_mod,
			id_usuario_mod,
			cantidadeep
          	) values(
			v_parametros.id_unidadconstructivaeep,
			v_parametros.valor,
			v_parametros.descripcion,
			'activo',
			v_parametros._id_usuario_ai,
			now(),
			v_parametros._nombre_usuario_ai,
			p_id_usuario,
			null,
			null,
			v_parametros.cantidadeep
							
			
			
			)RETURNING id_uceepitem into v_id_uceepitem;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Unidad constructiva item almacenado(a) con exito (id_uceepitem'||v_id_uceepitem||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_uceepitem',v_id_uceepitem::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCI_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		11-10-2018 19:56:25
	***********************************/

	elsif(p_transaccion='SNX_UCI_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tuceepitem set
			id_unidadconstructivaeep = v_parametros.id_unidadconstructivaeep,
			valor = v_parametros.valor,
			descripcion = v_parametros.descripcion,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai,
			cantidadeep = v_parametros.cantidadeep
			where id_uceepitem=v_parametros.id_uceepitem;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Unidad constructiva item modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_uceepitem',v_parametros.id_uceepitem::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCI_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		11-10-2018 19:56:25
	***********************************/

	elsif(p_transaccion='SNX_UCI_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tuceepitem
            where id_uceepitem=v_parametros.id_uceepitem;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Unidad constructiva item eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_uceepitem',v_parametros.id_uceepitem::varchar);
              
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

ALTER FUNCTION snx.ft_uceepitem_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;
