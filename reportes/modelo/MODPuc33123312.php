<?php
/**
*@package pXP
*@file gen-MODPuc33123312.php
*@author  (admin)
*@date 31-07-2018 15:35:32
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODPuc33123312 extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarPuc33123312(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_puc33123312_sel';
		$this->transaccion='SNX_PCU3312_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_pcu33123312','int4');
		$this->captura('ano','int4');
		$this->captura('valor','numeric');
		$this->captura('estado_reg','varchar');
		$this->captura('id_mes','int4');
		$this->captura('id_usuario_reg','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
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
			
	function insertarPuc33123312(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_puc33123312_ime';
		$this->transaccion='SNX_PCU3312_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('ano','ano','int4');
		$this->setParametro('valor','valor','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('id_mes','id_mes','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarPuc33123312(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_puc33123312_ime';
		$this->transaccion='SNX_PCU3312_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_pcu33123312','id_pcu33123312','int4');
		$this->setParametro('ano','ano','int4');
		$this->setParametro('valor','valor','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('id_mes','id_mes','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarPuc33123312(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_puc33123312_ime';
		$this->transaccion='SNX_PCU3312_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_pcu33123312','id_pcu33123312','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>