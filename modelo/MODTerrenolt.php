<?php
/**
*@package pXP
*@file gen-MODTerrenolt.php
*@author  (admin)
*@date 03-08-2018 19:41:41
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODTerrenolt extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarTerrenolt(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_terrenolt_sel';
		$this->transaccion='SNX_TLT_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_terrenolt','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('terrenolt','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
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
			
	function insertarTerrenolt(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_terrenolt_ime';
		$this->transaccion='SNX_TLT_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('terrenolt','terrenolt','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarTerrenolt(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_terrenolt_ime';
		$this->transaccion='SNX_TLT_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_terrenolt','id_terrenolt','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('terrenolt','terrenolt','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarTerrenolt(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_terrenolt_ime';
		$this->transaccion='SNX_TLT_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_terrenolt','id_terrenolt','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>