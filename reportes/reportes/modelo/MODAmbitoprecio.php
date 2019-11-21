<?php
/**
*@package pXP
*@file gen-MODAmbitoprecio.php
*@author  (admin)
*@date 23-07-2018 15:53:37
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODAmbitoprecio extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarAmbitoprecio(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_ambitoprecio_sel';
		$this->transaccion='SNX_AMBP_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_ambitoprecio','int4');
		$this->captura('ambitoprecio','varchar');
		$this->captura('estado_reg','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_reg','int4');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
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
			
	function insertarAmbitoprecio(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ambitoprecio_ime';
		$this->transaccion='SNX_AMBP_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('ambitoprecio','ambitoprecio','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarAmbitoprecio(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ambitoprecio_ime';
		$this->transaccion='SNX_AMBP_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_ambitoprecio','id_ambitoprecio','int4');
		$this->setParametro('ambitoprecio','ambitoprecio','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarAmbitoprecio(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ambitoprecio_ime';
		$this->transaccion='SNX_AMBP_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_ambitoprecio','id_ambitoprecio','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>