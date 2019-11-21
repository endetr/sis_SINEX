<?php
/**
*@package pXP
*@file gen-MODPcu335313335313.php
*@author  (admin)
*@date 31-07-2018 15:35:48
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODPcu335313335313 extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarPcu335313335313(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_pcu335313335313_sel';
		$this->transaccion='SNX_PCU5313_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_pcu335313335313','int4');
		$this->captura('ano','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('valor','numeric');
		$this->captura('id_mes','int4');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('id_usuario_reg','int4');
		$this->captura('id_usuario_ai','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('id_usuario_mod','int4');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('desc_nombre','varchar');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarPcu335313335313(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_pcu335313335313_ime';
		$this->transaccion='SNX_PCU5313_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('ano','ano','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('valor','valor','numeric');
		$this->setParametro('id_mes','id_mes','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarPcu335313335313(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_pcu335313335313_ime';
		$this->transaccion='SNX_PCU5313_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_pcu335313335313','id_pcu335313335313','int4');
		$this->setParametro('ano','ano','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('valor','valor','numeric');
		$this->setParametro('id_mes','id_mes','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarPcu335313335313(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_pcu335313335313_ime';
		$this->transaccion='SNX_PCU5313_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_pcu335313335313','id_pcu335313335313','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>