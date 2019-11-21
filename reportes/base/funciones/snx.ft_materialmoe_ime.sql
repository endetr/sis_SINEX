-- FUNCTION: snx.ft_materialmoe_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_materialmoe_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_materialmoe_ime(
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
 FUNCION: 		snx.ft_materialmoe_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tmaterialmoe'
 AUTOR: 		 (admin)
 FECHA:	        29-08-2018 18:34:08
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				29-08-2018 18:34:08								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tmaterialmoe'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_materialmoe	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_materialmoe_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_MMOE_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		29-08-2018 18:34:08
	***********************************/

	if(p_transaccion='SNX_MMOE_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tmaterialmoe(
			id_unidad,
			valorunitariorcb,
			valorunitariorlp,
			estado_reg,
			valorunitariorsc,
			materialmoe,
			id_usuario_ai,
			id_usuario_reg,
			usuario_ai,
			fecha_reg,
			id_usuario_mod,
			fecha_mod
          	) values(
			v_parametros.id_unidad,
			v_parametros.valorunitariorcb,
			v_parametros.valorunitariorlp,
			'activo',
			v_parametros.valorunitariorsc,
			v_parametros.materialmoe,
			v_parametros._id_usuario_ai,
			p_id_usuario,
			v_parametros._nombre_usuario_ai,
			now(),
			null,
			null
							
			
			
			)RETURNING id_materialmoe into v_id_materialmoe;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Materiales almacenado(a) con exito (id_materialmoe'||v_id_materialmoe||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_materialmoe',v_id_materialmoe::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MMOE_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		29-08-2018 18:34:08
	***********************************/

	elsif(p_transaccion='SNX_MMOE_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tmaterialmoe set
			id_unidad = v_parametros.id_unidad,
			valorunitariorcb = v_parametros.valorunitariorcb,
			valorunitariorlp = v_parametros.valorunitariorlp,
			valorunitariorsc = v_parametros.valorunitariorsc,
			materialmoe = v_parametros.materialmoe,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_materialmoe=v_parametros.id_materialmoe;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Materiales modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_materialmoe',v_parametros.id_materialmoe::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MMOE_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		29-08-2018 18:34:08
	***********************************/

	elsif(p_transaccion='SNX_MMOE_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tmaterialmoe
            where id_materialmoe=v_parametros.id_materialmoe;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Materiales eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_materialmoe',v_parametros.id_materialmoe::varchar);
              
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

ALTER FUNCTION snx.ft_materialmoe_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;