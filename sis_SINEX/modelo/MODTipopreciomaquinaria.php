<?php
/**
*@package pXP
*@file gen-MODTipopreciomaquinaria.php
*@author  (admin)
*@date 13-11-2018 18:43:45
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODTipopreciomaquinaria extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarTipopreciomaquinaria(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_tipopreciomaquinaria_sel';
		$this->transaccion='SNX_TPMAQ_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_tipopreciomaquinaria','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('tipopreciomaquinaria','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('id_usuario_reg','int4');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarTipopreciomaquinaria(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_tipopreciomaquinaria_ime';
		$this->transaccion='SNX_TPMAQ_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('tipopreciomaquinaria','tipopreciomaquinaria','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarTipopreciomaquinaria(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_tipopreciomaquinaria_ime';
		$this->transaccion='SNX_TPMAQ_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_tipopreciomaquinaria','id_tipopreciomaquinaria','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('tipopreciomaquinaria','tipopreciomaquinaria','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarTipopreciomaquinaria(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_tipopreciomaquinaria_ime';
		$this->transaccion='SNX_TPMAQ_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_tipopreciomaquinaria','id_tipopreciomaquinaria','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>