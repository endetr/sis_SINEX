CREATE OR REPLACE FUNCTION "snx"."ft_unidadconstructivaetaitem_ime" (	
				p_administrador integer, p_id_usuario integer, p_tabla character varying, p_transaccion character varying)
RETURNS character varying AS
$BODY$

/**************************************************************************
 SISTEMA:		SPVPT
 FUNCION: 		snx.ft_unidadconstructivaetaitem_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tunidadconstructivaetaitem'
 AUTOR: 		 (admin)
 FECHA:	        25-02-2019 15:32:16
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				25-02-2019 15:32:16								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tunidadconstructivaetaitem'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_unidadconstructivaetaitem	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_unidadconstructivaetaitem_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_UCBETAI_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		25-02-2019 15:32:16
	***********************************/

	if(p_transaccion='SNX_UCBETAI_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tunidadconstructivaetaitem(
			id_unidadconstructivaeta,
			id_unidad,
			valorunitario,
			estado_reg,
			cantidaditem,
			unidadconstructivaetaitem,
			id_usuario_reg,
			fecha_reg,
			usuario_ai,
			id_usuario_ai,
			id_usuario_mod,
			fecha_mod
          	) values(
			v_parametros.id_unidadconstructivaeta,
			v_parametros.id_unidad,
			v_parametros.valorunitario,
			'activo',
			v_parametros.cantidaditem,
			v_parametros.unidadconstructivaetaitem,
			p_id_usuario,
			now(),
			v_parametros._nombre_usuario_ai,
			v_parametros._id_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_unidadconstructivaetaitem into v_id_unidadconstructivaetaitem;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Ítems almacenado(a) con exito (id_unidadconstructivaetaitem'||v_id_unidadconstructivaetaitem||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivaetaitem',v_id_unidadconstructivaetaitem::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCBETAI_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		25-02-2019 15:32:16
	***********************************/

	elsif(p_transaccion='SNX_UCBETAI_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tunidadconstructivaetaitem set
			id_unidadconstructivaeta = v_parametros.id_unidadconstructivaeta,
			id_unidad = v_parametros.id_unidad,
			valorunitario = v_parametros.valorunitario,
			cantidaditem = v_parametros.cantidaditem,
			unidadconstructivaetaitem = v_parametros.unidadconstructivaetaitem,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_unidadconstructivaetaitem=v_parametros.id_unidadconstructivaetaitem;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Ítems modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivaetaitem',v_parametros.id_unidadconstructivaetaitem::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCBETAI_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		25-02-2019 15:32:16
	***********************************/

	elsif(p_transaccion='SNX_UCBETAI_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tunidadconstructivaetaitem
            where id_unidadconstructivaetaitem=v_parametros.id_unidadconstructivaetaitem;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Ítems eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivaetaitem',v_parametros.id_unidadconstructivaetaitem::varchar);
              
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
$BODY$
LANGUAGE 'plpgsql' VOLATILE
COST 100;
ALTER FUNCTION "snx"."ft_unidadconstructivaetaitem_ime"(integer, integer, character varying, character varying) OWNER TO postgres;
