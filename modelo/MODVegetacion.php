<?php
/**
*@package pXP
*@file gen-MODVegetacion.php
*@author  (admin)
*@date 24-07-2018 14:00:24
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODVegetacion extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarVegetacion(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_vegetacion_sel';
		$this->transaccion='SNX_VGT_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_vegetacion','int4');
		$this->captura('tipovegetacion','varchar');
		$this->captura('costoroce','numeric');
		$this->captura('estado_reg','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_reg','int4');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('fecha_mod','timestamp');
		$this->captura('id_usuario_mod','int4');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarVegetacion(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_vegetacion_ime';
		$this->transaccion='SNX_VGT_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('tipovegetacion','tipovegetacion','varchar');
		$this->setParametro('costoroce','costoroce','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarVegetacion(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_vegetacion_ime';
		$this->transaccion='SNX_VGT_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_vegetacion','id_vegetacion','int4');
		$this->setParametro('tipovegetacion','tipovegetacion','varchar');
		$this->setParametro('costoroce','costoroce','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarVegetacion(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_vegetacion_ime';
		$this->transaccion='SNX_VGT_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_vegetacion','id_vegetacion','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>