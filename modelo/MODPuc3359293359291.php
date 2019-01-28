<?php
/**
*@package pXP
*@file gen-MODPuc3359293359291.php
*@author  (admin)
*@date 31-07-2018 15:35:43
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODPuc3359293359291 extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarPuc3359293359291(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_puc3359293359291_sel';
		$this->transaccion='SNX_PCU9291_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_puc3359293359291','int4');
		$this->captura('id_mes','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('valor','numeric');
		$this->captura('ano','int4');
		$this->captura('id_usuario_ai','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
		$this->captura('id_usuario_reg','int4');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('desc_nombre','varchar');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarPuc3359293359291(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_puc3359293359291_ime';
		$this->transaccion='SNX_PCU9291_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_mes','id_mes','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('valor','valor','numeric');
		$this->setParametro('ano','ano','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarPuc3359293359291(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_puc3359293359291_ime';
		$this->transaccion='SNX_PCU9291_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_puc3359293359291','id_puc3359293359291','int4');
		$this->setParametro('id_mes','id_mes','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('valor','valor','numeric');
		$this->setParametro('ano','ano','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarPuc3359293359291(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_puc3359293359291_ime';
		$this->transaccion='SNX_PCU9291_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_puc3359293359291','id_puc3359293359291','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>