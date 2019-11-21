<?php
/**
*@package pXP
*@file gen-MODPcu335311335311.php
*@author  (admin)
*@date 31-07-2018 15:36:00
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODPcu335311335311 extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarPcu335311335311(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_pcu335311335311_sel';
		$this->transaccion='SNX_PCU5311_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_pcu335311335311','int4');
		$this->captura('ano','int4');
		$this->captura('id_mes','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('valor','numeric');
		$this->captura('id_usuario_ai','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
		$this->captura('id_usuario_reg','int4');
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
			
	function insertarPcu335311335311(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_pcu335311335311_ime';
		$this->transaccion='SNX_PCU5311_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('ano','ano','int4');
		$this->setParametro('id_mes','id_mes','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('valor','valor','numeric');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarPcu335311335311(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_pcu335311335311_ime';
		$this->transaccion='SNX_PCU5311_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_pcu335311335311','id_pcu335311335311','int4');
		$this->setParametro('ano','ano','int4');
		$this->setParametro('id_mes','id_mes','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('valor','valor','numeric');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarPcu335311335311(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_pcu335311335311_ime';
		$this->transaccion='SNX_PCU5311_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_pcu335311335311','id_pcu335311335311','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>