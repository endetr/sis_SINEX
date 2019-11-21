-- FUNCTION: snx.ft_unidadconstructivamcelec_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_unidadconstructivamcelec_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_unidadconstructivamcelec_ime(
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
 FUNCION: 		snx.ft_unidadconstructivamcelec_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tunidadconstructivamcelec'
 AUTOR: 		 (admin)
 FECHA:	        16-10-2018 20:00:28
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				16-10-2018 20:00:28								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tunidadconstructivamcelec'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_unidadconstructivamcelec	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_unidadconstructivamcelec_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_MCUC_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		16-10-2018 20:00:28
	***********************************/

	if(p_transaccion='SNX_MCUC_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tunidadconstructivamcelec(
			codigo,
			areasub,
			estado_reg,
			numerobahias,
			longitudvia,
			id_claseaislacion,
			descripcion,
			id_tensionservicio,
			usuario_ai,
			fecha_reg,
			id_usuario_reg,
			id_usuario_ai,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.codigo,
			v_parametros.areasub,
			'activo',
			v_parametros.numerobahias,
			v_parametros.longitudvia,
			v_parametros.id_claseaislacion,
			v_parametros.descripcion,
			v_parametros.id_tensionservicio,
			v_parametros._nombre_usuario_ai,
			now(),
			p_id_usuario,
			v_parametros._id_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_unidadconstructivamcelec into v_id_unidadconstructivamcelec;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','MC Unida Constructiva almacenado(a) con exito (id_unidadconstructivamcelec'||v_id_unidadconstructivamcelec||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivamcelec',v_id_unidadconstructivamcelec::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MCUC_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		16-10-2018 20:00:28
	***********************************/

	elsif(p_transaccion='SNX_MCUC_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tunidadconstructivamcelec set
			codigo = v_parametros.codigo,
			areasub = v_parametros.areasub,
			numerobahias = v_parametros.numerobahias,
			longitudvia = v_parametros.longitudvia,
			id_claseaislacion = v_parametros.id_claseaislacion,
			descripcion = v_parametros.descripcion,
			id_tensionservicio = v_parametros.id_tensionservicio,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_unidadconstructivamcelec=v_parametros.id_unidadconstructivamcelec;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','MC Unida Constructiva modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivamcelec',v_parametros.id_unidadconstructivamcelec::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_MCUC_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		16-10-2018 20:00:28
	***********************************/

	elsif(p_transaccion='SNX_MCUC_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tucmceitem
            where id_unidadconstructivamcelec=v_parametros.id_unidadconstructivamcelec;
			
			delete from snx.tunidadconstructivamcelec
            where id_unidadconstructivamcelec=v_parametros.id_unidadconstructivamcelec;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','MC Unida Constructiva eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivamcelec',v_parametros.id_unidadconstructivamcelec::varchar);
              
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

ALTER FUNCTION snx.ft_unidadconstructivamcelec_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;