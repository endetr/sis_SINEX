<?php
/**
*@package pXP
*@file gen-MODRevista.php
*@author  (admin)
*@date 17-09-2018 13:04:24
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODRevista extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarRevista(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_revista_sel';
		$this->transaccion='SNX_REV_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_revista','int4');
		$this->captura('revista','varchar');
		$this->captura('estado_reg','varchar');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('id_usuario_reg','int4');
		$this->captura('id_usuario_ai','int4');
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
			
	function insertarRevista(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_revista_ime';
		$this->transaccion='SNX_REV_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('revista','revista','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarRevista(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_revista_ime';
		$this->transaccion='SNX_REV_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_revista','id_revista','int4');
		$this->setParametro('revista','revista','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarRevista(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_revista_ime';
		$this->transaccion='SNX_REV_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_revista','id_revista','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>