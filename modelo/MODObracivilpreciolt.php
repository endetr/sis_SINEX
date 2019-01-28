<?php
/**
*@package pXP
*@file gen-MODObracivilpreciolt.php
*@author  (admin)
*@date 25-07-2018 15:23:24
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODObracivilpreciolt extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarObracivilpreciolt(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_obracivilpreciolt_sel';
		$this->transaccion='SNX_OCLTP_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_obracivilpreciolt','int4');
		$this->captura('id_obracivillt','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('valorobracivillt','numeric');
		$this->captura('proyecto','varchar');
		$this->captura('id_moneda','int4');
		$this->captura('fechaprecio','date');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('id_usuario_reg','int4');
		$this->captura('id_usuario_ai','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('id_usuario_mod','int4');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('desc_moneda','varchar');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarObracivilpreciolt(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_obracivilpreciolt_ime';
		$this->transaccion='SNX_OCLTP_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_obracivillt','id_obracivillt','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('valorobracivillt','valorobracivillt','numeric');
		$this->setParametro('proyecto','proyecto','varchar');
		$this->setParametro('id_moneda','id_moneda','int4');
		$this->setParametro('fechaprecio','fechaprecio','date');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarObracivilpreciolt(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_obracivilpreciolt_ime';
		$this->transaccion='SNX_OCLTP_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_obracivilpreciolt','id_obracivilpreciolt','int4');
		$this->setParametro('id_obracivillt','id_obracivillt','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('valorobracivillt','valorobracivillt','numeric');
		$this->setParametro('proyecto','proyecto','varchar');
		$this->setParametro('id_moneda','id_moneda','int4');
		$this->setParametro('fechaprecio','fechaprecio','date');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarObracivilpreciolt(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_obracivilpreciolt_ime';
		$this->transaccion='SNX_OCLTP_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_obracivilpreciolt','id_obracivilpreciolt','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>