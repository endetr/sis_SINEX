<?php
/**
*@package pXP
*@file gen-MODUnidadconstructivalt.php
*@author  (admin)
*@date 03-08-2018 15:44:56
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODUnidadconstructivalt extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarUnidadconstructivalt(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_unidadconstructivalt_sel';
		$this->transaccion='SNX_UCLT_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_unidadconstructivalt','int4');
		$this->captura('estructurapasocantidad','numeric');
		$this->captura('id_clasificacionaltura','int4');
		$this->captura('porcmterrenosumer','numeric');
		$this->captura('id_tensionservicio','int4');
		$this->captura('descripcion','varchar');
		$this->captura('id_tipolinea','int4');
		$this->captura('porcterrenoplano','numeric');
		$this->captura('porcmterrenofirme','numeric');
		$this->captura('id_hilosguarda','int4');		
		$this->captura('porcmterrenoterrenoblando','numeric');
		$this->captura('id_tipoestructura','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('porcterrenoondulado','numeric');
		$this->captura('conductorfase','int4');
		$this->captura('distanciatransporte','numeric');
		$this->captura('distanciatransporteext','numeric');		
		$this->captura('porcmterrenointerme','numeric');
		$this->captura('porcvegetabosque','numeric');
		$this->captura('porcvegetaforestacion','numeric');
		$this->captura('estructurapasopeso','numeric');
		$this->captura('estructuraamarrepeso','numeric');
		$this->captura('estructuraamarrecantidad','numeric');
		$this->captura('porcterrenocerros','numeric');
		$this->captura('id_pararrayolinea','int4');
		$this->captura('id_configuracionlt','int4');
		$this->captura('porcvegetamatorral','numeric');
		$this->captura('codigo','varchar');
		$this->captura('porcvegetamaleza','numeric');
		$this->captura('id_tipoconductor','int4');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_reg','int4');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('desc_pararrayolinea','varchar');		
		$this->captura('desc_tipolinea','varchar');
		$this->captura('desc_tensionservicio','varchar');
		$this->captura('desc_tipoestructura','varchar');
		$this->captura('desc_tipoconductor','varchar');
		$this->captura('desc_configuracionlt','varchar');
		$this->captura('desc_valoraltura','numeric');	
		$this->captura('longitud','numeric');
		$this->captura('id_nivelcontaminacionlt','int4');		
		$this->captura('desc_nivelcontaminacionlt','varchar');
		$this->captura('id_areaprotegida','int4');	
		$this->captura('desc_areaprotegida','varchar');		
		$this->captura('numddp','numeric');
		$this->captura('nummontaje','numeric');
		$this->captura('numoc','numeric');
		$this->captura('numingenieria','numeric');		
		$this->captura('numadmeje','numeric');
		$this->captura('numsupero','numeric');
		$this->captura('numcfinan','numeric');
		$this->captura('numcaamb','numeric');
		$this->captura('numcapred','numeric');
		$this->captura('numcostototaluc','numeric');
		$this->captura('id_revista','int4');
		$this->captura('desc_revista','varchar');	
		$this->captura('desc_hilosguarda','varchar');
		$this->captura('descripcionfull','varchar');		
		$this->captura('id_bancoductos','int4');
		$this->captura('bancoductos','varchar');
		$this->captura('id_cajaempalme','int4');
		$this->captura('cajaempalme','varchar');			
				
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}

	function listarUnidadconstructivaltddl(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_unidadconstructivalt_sel';
		$this->transaccion='SNX_UCLT_SELDDL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_unidadconstructivalt','int4');
		$this->captura('estructurapasocantidad','numeric');
		$this->captura('id_clasificacionaltura','int4');
		$this->captura('porcmterrenosumer','numeric');
		$this->captura('id_tensionservicio','int4');
		$this->captura('descripcion','varchar');
		$this->captura('id_tipolinea','int4');
		$this->captura('porcterrenoplano','numeric');
		$this->captura('porcmterrenofirme','numeric');
		$this->captura('id_hilosguarda','int4');		
		$this->captura('porcmterrenoterrenoblando','numeric');
		$this->captura('id_tipoestructura','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('porcterrenoondulado','numeric');
		$this->captura('conductorfase','int4');
		$this->captura('distanciatransporte','numeric');
		$this->captura('distanciatransporteext','numeric');		
		$this->captura('porcmterrenointerme','numeric');
		$this->captura('porcvegetabosque','numeric');
		$this->captura('porcvegetaforestacion','numeric');
		$this->captura('estructurapasopeso','numeric');
		$this->captura('estructuraamarrepeso','numeric');
		$this->captura('estructuraamarrecantidad','numeric');
		$this->captura('porcterrenocerros','numeric');
		$this->captura('id_pararrayolinea','int4');
		$this->captura('id_configuracionlt','int4');
		$this->captura('porcvegetamatorral','numeric');
		$this->captura('codigo','varchar');
		$this->captura('porcvegetamaleza','numeric');
		$this->captura('id_tipoconductor','int4');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_reg','int4');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('desc_pararrayolinea','varchar');		
		$this->captura('desc_tipolinea','varchar');
		$this->captura('desc_tensionservicio','varchar');
		$this->captura('desc_tipoestructura','varchar');
		$this->captura('desc_tipoconductor','varchar');
		$this->captura('desc_configuracionlt','varchar');
		$this->captura('desc_valoraltura','numeric');	
		$this->captura('longitud','numeric');
		$this->captura('id_nivelcontaminacionlt','int4');		
		$this->captura('desc_nivelcontaminacionlt','varchar');
		$this->captura('id_areaprotegida','int4');	
		$this->captura('desc_areaprotegida','varchar');		
		$this->captura('numddp','numeric');
		$this->captura('nummontaje','numeric');
		$this->captura('numoc','numeric');
		$this->captura('numingenieria','numeric');		
		$this->captura('numadmeje','numeric');
		$this->captura('numsupero','numeric');
		$this->captura('numcfinan','numeric');
		$this->captura('numcaamb','numeric');
		$this->captura('numcapred','numeric');
		$this->captura('numcostototaluc','numeric');
		$this->captura('id_revista','int4');
		$this->captura('desc_revista','varchar');	
		$this->captura('desc_hilosguarda','varchar');
		$this->captura('descripcionfull','varchar');			
		$this->captura('id_bancoductos','int4');
		$this->captura('bancoductos','varchar');
		$this->captura('id_cajaempalme','int4');
		$this->captura('cajaempalme','varchar');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
	
	function listarGastoscontratistalt(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_gastoscontratistalt_sel';
		$this->transaccion='SNX_GCLT_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_unidadconstructivalt','int4');
		$this->captura('id_descripcion','int4');
		$this->captura('descripcion','varchar');		
		$this->captura('costobase','numeric');
		$this->captura('cantidaditem','numeric');
		$this->captura('costototal','numeric');		
		$this->captura('unidad','varchar');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
	
	function listarOtrosgastoslt(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_otrosgastoslt_sel';
		$this->transaccion='SNX_OGLT_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_unidadconstructivalt','int4');
		$this->captura('id_descripcion','int4');
		$this->captura('descripcion','varchar');
		$this->captura('costobase','numeric');
		$this->captura('cantidaditem','numeric');
		$this->captura('costototal','numeric');
		$this->captura('unidad','varchar');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
		
	function insertarUnidadconstructivalt(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_unidadconstructivalt_ime';
		$this->transaccion='SNX_UCLT_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('estructurapasocantidad','estructurapasocantidad','numeric');
		$this->setParametro('id_clasificacionaltura','id_clasificacionaltura','int4');
		$this->setParametro('porcmterrenosumer','porcmterrenosumer','numeric');
		$this->setParametro('id_tensionservicio','id_tensionservicio','int4');
		$this->setParametro('descripcion','descripcion','varchar');
		$this->setParametro('id_tipolinea','id_tipolinea','int4');
		$this->setParametro('porcterrenoplano','porcterrenoplano','numeric');
		$this->setParametro('porcmterrenofirme','porcmterrenofirme','numeric');
		$this->setParametro('id_hilosguarda','id_hilosguarda','int4');		
		$this->setParametro('porcmterrenoterrenoblando','porcmterrenoterrenoblando','numeric');
		$this->setParametro('id_tipoestructura','id_tipoestructura','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('porcterrenoondulado','porcterrenoondulado','numeric');
		$this->setParametro('conductorfase','conductorfase','int4');
		$this->setParametro('distanciatransporte','distanciatransporte','numeric');
		$this->setParametro('distanciatransporteext','distanciatransporteext','numeric');		
		$this->setParametro('porcmterrenointerme','porcmterrenointerme','numeric');
		$this->setParametro('porcvegetabosque','porcvegetabosque','numeric');
		$this->setParametro('porcvegetaforestacion','porcvegetaforestacion','numeric');
		$this->setParametro('estructurapasopeso','estructurapasopeso','numeric');
		$this->setParametro('estructuraamarrepeso','estructuraamarrepeso','numeric');
		$this->setParametro('estructuraamarrecantidad','estructuraamarrecantidad','numeric');
		$this->setParametro('porcterrenocerros','porcterrenocerros','numeric');
		$this->setParametro('id_pararrayolinea','id_pararrayolinea','int4');
		$this->setParametro('id_configuracionlt','id_configuracionlt','int4');
		$this->setParametro('porcvegetamatorral','porcvegetamatorral','numeric');
		$this->setParametro('codigo','codigo','varchar');
		$this->setParametro('porcvegetamaleza','porcvegetamaleza','numeric');
		$this->setParametro('id_tipoconductor','id_tipoconductor','int4');
		$this->setParametro('longitud','longitud','numeric');
		$this->setParametro('id_nivelcontaminacionlt','id_nivelcontaminacionlt','int4');
		$this->setParametro('id_areaprotegida','id_areaprotegida','int4');
		$this->setParametro('id_revista','id_revista','int4');
		$this->setParametro('id_bancoductos','id_bancoductos','int4');
		$this->setParametro('id_cajaempalme','id_cajaempalme','int4');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarUnidadconstructivalt(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_unidadconstructivalt_ime';
		$this->transaccion='SNX_UCLT_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_unidadconstructivalt','id_unidadconstructivalt','int4');
		$this->setParametro('estructurapasocantidad','estructurapasocantidad','numeric');
		$this->setParametro('id_clasificacionaltura','id_clasificacionaltura','int4');
		$this->setParametro('porcmterrenosumer','porcmterrenosumer','numeric');
		$this->setParametro('id_tensionservicio','id_tensionservicio','int4');
		$this->setParametro('descripcion','descripcion','varchar');
		$this->setParametro('id_tipolinea','id_tipolinea','int4');
		$this->setParametro('porcterrenoplano','porcterrenoplano','numeric');
		$this->setParametro('porcmterrenofirme','porcmterrenofirme','numeric');
		$this->setParametro('id_hilosguarda','id_hilosguarda','int4');		
		$this->setParametro('porcmterrenoterrenoblando','porcmterrenoterrenoblando','numeric');
		$this->setParametro('id_tipoestructura','id_tipoestructura','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('porcterrenoondulado','porcterrenoondulado','numeric');
		$this->setParametro('conductorfase','conductorfase','int4');
		$this->setParametro('distanciatransporte','distanciatransporte','numeric');
		$this->setParametro('distanciatransporteext','distanciatransporteext','numeric');
		$this->setParametro('porcmterrenointerme','porcmterrenointerme','numeric');
		$this->setParametro('porcvegetabosque','porcvegetabosque','numeric');
		$this->setParametro('porcvegetaforestacion','porcvegetaforestacion','numeric');
		$this->setParametro('estructurapasopeso','estructurapasopeso','numeric');
		$this->setParametro('estructuraamarrepeso','estructuraamarrepeso','numeric');
		$this->setParametro('estructuraamarrecantidad','estructuraamarrecantidad','numeric');
		$this->setParametro('porcterrenocerros','porcterrenocerros','numeric');
		$this->setParametro('id_pararrayolinea','id_pararrayolinea','int4');
		$this->setParametro('id_configuracionlt','id_configuracionlt','int4');
		$this->setParametro('porcvegetamatorral','porcvegetamatorral','numeric');
		$this->setParametro('codigo','codigo','varchar');
		$this->setParametro('porcvegetamaleza','porcvegetamaleza','numeric');
		$this->setParametro('id_tipoconductor','id_tipoconductor','int4');
		$this->setParametro('longitud','longitud','numeric');
		$this->setParametro('id_nivelcontaminacionlt','id_nivelcontaminacionlt','int4');
		$this->setParametro('id_areaprotegida','id_areaprotegida','int4');
		$this->setParametro('id_revista','id_revista','int4');
		$this->setParametro('id_bancoductos','id_bancoductos','int4');
		$this->setParametro('id_cajaempalme','id_cajaempalme','int4');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarUnidadconstructivalt(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_unidadconstructivalt_ime';
		$this->transaccion='SNX_UCLT_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_unidadconstructivalt','id_unidadconstructivalt','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>