<?php
/**
*@package pXP
*@file gen-MODHilosguarda.php
*@author  (admin)
*@date 23-10-2018 13:47:29
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODHilosguarda extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarHilosguarda(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_hilosguarda_sel';
		$this->transaccion='SNX_HDG_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_hilosguarda','int4');
		$this->captura('cantidadacero','int4');
		$this->captura('cantidadopgw','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('hilosguarda','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_reg','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
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
			
	function insertarHilosguarda(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_hilosguarda_ime';
		$this->transaccion='SNX_HDG_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('cantidadacero','cantidadacero','int4');
		$this->setParametro('cantidadopgw','cantidadopgw','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('hilosguarda','hilosguarda','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarHilosguarda(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_hilosguarda_ime';
		$this->transaccion='SNX_HDG_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_hilosguarda','id_hilosguarda','int4');
		$this->setParametro('cantidadacero','cantidadacero','int4');
		$this->setParametro('cantidadopgw','cantidadopgw','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('hilosguarda','hilosguarda','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarHilosguarda(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_hilosguarda_ime';
		$this->transaccion='SNX_HDG_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_hilosguarda','id_hilosguarda','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>