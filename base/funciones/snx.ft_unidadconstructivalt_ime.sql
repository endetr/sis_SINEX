-- FUNCTION: snx.ft_unidadconstructivalt_ime(integer, integer, character varying, character varying)

-- DROP FUNCTION snx.ft_unidadconstructivalt_ime(integer, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION snx.ft_unidadconstructivalt_ime(
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
 FUNCION: 		snx.ft_unidadconstructivalt_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tunidadconstructivalt'
 AUTOR: 		 (admin)
 FECHA:	        03-08-2018 15:44:56
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				03-08-2018 15:44:56								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'snx.tunidadconstructivalt'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_unidadconstructivalt	integer;
			    
BEGIN

    v_nombre_funcion = 'snx.ft_unidadconstructivalt_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SNX_UCLT_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		03-08-2018 15:44:56
	***********************************/

	if(p_transaccion='SNX_UCLT_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into snx.tunidadconstructivalt(
			estructurapasocantidad,
			id_clasificacionaltura,
			porcmterrenosumer,
			id_tensionservicio,
			descripcion,
			id_tipolinea,
			porcterrenoplano,
			porcmterrenofirme,			
			id_hilosguarda,
			porcmterrenoterrenoblando,
			id_tipoestructura,
			estado_reg,
			porcterrenoondulado,
			conductorfase,
			distanciatransporte,
			distanciatransporteext,
			porcmterrenointerme,
			porcvegetabosque,
			porcvegetaforestacion,
			estructurapasopeso,
			estructuraamarrepeso,
			estructuraamarrecantidad,
			porcterrenocerros,
			id_pararrayolinea,
			id_configuracionlt,
			porcvegetamatorral,
			codigo,
			porcvegetamaleza,
			id_tipoconductor,
			longitud,
			id_nivelcontaminacionlt,
			id_areaprotegida,
			id_revista,
			id_usuario_ai,
			id_usuario_reg,
			usuario_ai,
			fecha_reg,
			id_usuario_mod,
			fecha_mod
          	) values(
			v_parametros.estructurapasocantidad,
			v_parametros.id_clasificacionaltura,
			v_parametros.porcmterrenosumer,
			v_parametros.id_tensionservicio,
			v_parametros.descripcion,
			v_parametros.id_tipolinea,
			v_parametros.porcterrenoplano,
			v_parametros.porcmterrenofirme,			
			v_parametros.id_hilosguarda,
			v_parametros.porcmterrenoterrenoblando,
			v_parametros.id_tipoestructura,
			'activo',
			v_parametros.porcterrenoondulado,
			v_parametros.conductorfase,
			v_parametros.distanciatransporte,
			v_parametros.distanciatransporteext,
			v_parametros.porcmterrenointerme,
			v_parametros.porcvegetabosque,
			v_parametros.porcvegetaforestacion,
			v_parametros.estructurapasopeso,
			v_parametros.estructuraamarrepeso,
			v_parametros.estructuraamarrecantidad,
			v_parametros.porcterrenocerros,
			v_parametros.id_pararrayolinea,
			v_parametros.id_configuracionlt,
			v_parametros.porcvegetamatorral,
			v_parametros.codigo,
			v_parametros.porcvegetamaleza,
			v_parametros.id_tipoconductor,
			v_parametros.longitud,
			v_parametros.id_nivelcontaminacionlt,
			v_parametros.id_areaprotegida,
			v_parametros.id_revista,
			v_parametros._id_usuario_ai,
			p_id_usuario,
			v_parametros._nombre_usuario_ai,
			now(),
			null,
			null
							
			
			
			)RETURNING id_unidadconstructivalt into v_id_unidadconstructivalt;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Líneas de Transmisión almacenado(a) con exito (id_unidadconstructivalt'||v_id_unidadconstructivalt||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivalt',v_id_unidadconstructivalt::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCLT_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		03-08-2018 15:44:56
	***********************************/

	elsif(p_transaccion='SNX_UCLT_MOD')then

		begin
			--Sentencia de la modificacion
			update snx.tunidadconstructivalt set
			estructurapasocantidad = v_parametros.estructurapasocantidad,
			id_clasificacionaltura = v_parametros.id_clasificacionaltura,
			porcmterrenosumer = v_parametros.porcmterrenosumer,
			id_tensionservicio = v_parametros.id_tensionservicio,
			descripcion = v_parametros.descripcion,
			id_tipolinea = v_parametros.id_tipolinea,
			porcterrenoplano = v_parametros.porcterrenoplano,
			porcmterrenofirme = v_parametros.porcmterrenofirme,			
			id_hilosguarda = v_parametros.id_hilosguarda,
			porcmterrenoterrenoblando = v_parametros.porcmterrenoterrenoblando,
			id_tipoestructura = v_parametros.id_tipoestructura,
			porcterrenoondulado = v_parametros.porcterrenoondulado,
			conductorfase = v_parametros.conductorfase,
			distanciatransporte = v_parametros.distanciatransporte,
			distanciatransporteext = v_parametros.distanciatransporteext,
			porcmterrenointerme = v_parametros.porcmterrenointerme,
			porcvegetabosque = v_parametros.porcvegetabosque,
			porcvegetaforestacion = v_parametros.porcvegetaforestacion,
			estructurapasopeso = v_parametros.estructurapasopeso,
			estructuraamarrepeso = v_parametros.estructuraamarrepeso,
			estructuraamarrecantidad = v_parametros.estructuraamarrecantidad,
			porcterrenocerros = v_parametros.porcterrenocerros,
			id_pararrayolinea = v_parametros.id_pararrayolinea,
			id_configuracionlt = v_parametros.id_configuracionlt,
			porcvegetamatorral = v_parametros.porcvegetamatorral,
			codigo = v_parametros.codigo,
			porcvegetamaleza = v_parametros.porcvegetamaleza,
			id_tipoconductor = v_parametros.id_tipoconductor,
			longitud = v_parametros.longitud,
			id_nivelcontaminacionlt = v_parametros.id_nivelcontaminacionlt,
			id_areaprotegida = v_parametros.id_areaprotegida,
			id_revista = v_parametros.id_revista,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_unidadconstructivalt=v_parametros.id_unidadconstructivalt;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Líneas de Transmisión modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivalt',v_parametros.id_unidadconstructivalt::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SNX_UCLT_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		03-08-2018 15:44:56
	***********************************/

	elsif(p_transaccion='SNX_UCLT_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from snx.tunidadconstructivalt
            where id_unidadconstructivalt=v_parametros.id_unidadconstructivalt;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Líneas de Transmisión eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_unidadconstructivalt',v_parametros.id_unidadconstructivalt::varchar);
              
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

ALTER FUNCTION snx.ft_unidadconstructivalt_ime(integer, integer, character varying, character varying)
    OWNER TO postgres;