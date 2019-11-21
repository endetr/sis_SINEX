<?php
/**
*@package pXP
*@file gen-MODBancoductos.php
*@author  (admin)
*@date 14-02-2019 17:57:56
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODBancoductos extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarBancoductos(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_bancoductos_sel';
		$this->transaccion='SNX_BDT_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_bancoductos','int4');
		$this->captura('bancoductos','varchar');
		$this->captura('estado_reg','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_reg','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
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
			
	function insertarBancoductos(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_bancoductos_ime';
		$this->transaccion='SNX_BDT_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('bancoductos','bancoductos','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarBancoductos(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_bancoductos_ime';
		$this->transaccion='SNX_BDT_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_bancoductos','id_bancoductos','int4');
		$this->setParametro('bancoductos','bancoductos','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarBancoductos(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_bancoductos_ime';
		$this->transaccion='SNX_BDT_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_bancoductos','id_bancoductos','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>