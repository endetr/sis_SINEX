<?php
/**
*@package pXP
*@file gen-MODConfiguracionlt.php
*@author  (admin)
*@date 19-07-2018 14:36:46
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODConfiguracionlt extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarConfiguracionlt(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_configuracionlt_sel';
		$this->transaccion='SNX_CONFL_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_configuracionlt','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('configuracionlt','varchar');
		$this->captura('id_usuario_reg','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
		$this->captura('id_usuario_ai','int4');
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
			
	function insertarConfiguracionlt(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_configuracionlt_ime';
		$this->transaccion='SNX_CONFL_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('configuracionlt','configuracionlt','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarConfiguracionlt(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_configuracionlt_ime';
		$this->transaccion='SNX_CONFL_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_configuracionlt','id_configuracionlt','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('configuracionlt','configuracionlt','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarConfiguracionlt(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_configuracionlt_ime';
		$this->transaccion='SNX_CONFL_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_configuracionlt','id_configuracionlt','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>