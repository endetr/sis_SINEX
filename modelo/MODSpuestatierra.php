<?php
/**
*@package pXP
*@file gen-MODSpuestatierra.php
*@author  (admin)
*@date 25-07-2018 13:46:20
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODSpuestatierra extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarSpuestatierra(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_spuestatierra_sel';
		$this->transaccion='SNX_SPT_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_puestatierra','int4');
		$this->captura('puestatierra','varchar');
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
			
	function insertarSpuestatierra(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_spuestatierra_ime';
		$this->transaccion='SNX_SPT_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('puestatierra','puestatierra','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarSpuestatierra(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_spuestatierra_ime';
		$this->transaccion='SNX_SPT_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_puestatierra','id_puestatierra','int4');
		$this->setParametro('puestatierra','puestatierra','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarSpuestatierra(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_spuestatierra_ime';
		$this->transaccion='SNX_SPT_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_puestatierra','id_puestatierra','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>