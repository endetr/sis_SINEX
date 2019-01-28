<?php
/**
*@package pXP
*@file gen-MODMaterialcantidadlt.php
*@author  (admin)
*@date 24-07-2018 15:27:55
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODMaterialcantidadlt extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarMaterialcantidadlt(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_materialcantidadlt_sel';
		$this->transaccion='SNX_MTCLT_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_materialcantidadlt','int4');
		$this->captura('cantidadmontajelt','numeric');
		$this->captura('id_materiallt','int4');
		$this->captura('id_funcionestructura','int4');
		$this->captura('id_hilosguarda','int4');			
		$this->captura('id_puestatierra','int4');
		$this->captura('id_tipoconductor','int4');
		$this->captura('id_configuracionlt','int4');
		$this->captura('id_aislador','int4');
		$this->captura('id_tensionservicio','int4');
		$this->captura('id_tipoestructura','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
		$this->captura('id_usuario_reg','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('id_usuario_mod','int4');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('desc_tipoconductor','varchar');
		$this->captura('desc_configuracionlt','varchar');
		$this->captura('desc_tipoestructura','varchar');
		$this->captura('desc_tensionservicio','varchar');
		$this->captura('desc_funcionestructura','varchar');
		$this->captura('desc_puestatierra','varchar');
		$this->captura('desc_tipoaislador','varchar');	
		$this->captura('desc_hilosguarda','varchar');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarMaterialcantidadlt(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_materialcantidadlt_ime';
		$this->transaccion='SNX_MTCLT_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('cantidadmontajelt','cantidadmontajelt','numeric');
		$this->setParametro('id_materiallt','id_materiallt','int4');
		$this->setParametro('id_funcionestructura','id_funcionestructura','int4');		
		$this->setParametro('id_hilosguarda','id_hilosguarda','int4');
		$this->setParametro('id_puestatierra','id_puestatierra','int4');
		$this->setParametro('id_tipoconductor','id_tipoconductor','int4');
		$this->setParametro('id_configuracionlt','id_configuracionlt','int4');
		$this->setParametro('id_aislador','id_aislador','int4');
		$this->setParametro('id_tensionservicio','id_tensionservicio','int4');
		$this->setParametro('id_tipoestructura','id_tipoestructura','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarMaterialcantidadlt(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_materialcantidadlt_ime';
		$this->transaccion='SNX_MTCLT_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_materialcantidadlt','id_materialcantidadlt','int4');
		$this->setParametro('cantidadmontajelt','cantidadmontajelt','numeric');
		$this->setParametro('id_materiallt','id_materiallt','int4');
		$this->setParametro('id_funcionestructura','id_funcionestructura','int4');		
		$this->setParametro('id_hilosguarda','id_hilosguarda','int4');
		$this->setParametro('id_puestatierra','id_puestatierra','int4');
		$this->setParametro('id_tipoconductor','id_tipoconductor','int4');
		$this->setParametro('id_configuracionlt','id_configuracionlt','int4');
		$this->setParametro('id_aislador','id_aislador','int4');
		$this->setParametro('id_tensionservicio','id_tensionservicio','int4');
		$this->setParametro('id_tipoestructura','id_tipoestructura','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarMaterialcantidadlt(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_materialcantidadlt_ime';
		$this->transaccion='SNX_MTCLT_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_materialcantidadlt','id_materialcantidadlt','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>