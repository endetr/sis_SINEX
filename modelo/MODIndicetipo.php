<?php
/**
*@package pXP
*@file gen-MODIndicetipo.php
*@author  (admin)
*@date 23-07-2018 15:53:42
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODIndicetipo extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarIndicetipo(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_indicetipo_sel';
		$this->transaccion='SNX_INDT_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_indicetipo','int4');
		$this->captura('indicetipo','varchar');
		$this->captura('estado_reg','varchar');
		$this->captura('id_usuario_reg','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
		$this->captura('id_usuario_ai','int4');
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
			
	function insertarIndicetipo(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_indicetipo_ime';
		$this->transaccion='SNX_INDT_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('indicetipo','indicetipo','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarIndicetipo(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_indicetipo_ime';
		$this->transaccion='SNX_INDT_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_indicetipo','id_indicetipo','int4');
		$this->setParametro('indicetipo','indicetipo','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarIndicetipo(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_indicetipo_ime';
		$this->transaccion='SNX_INDT_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_indicetipo','id_indicetipo','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>