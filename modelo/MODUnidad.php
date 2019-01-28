<?php
/**
*@package pXP
*@file gen-MODUnidad.php
*@author  (admin)
*@date 21-03-2018 19:24:25
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODUnidad extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarUnidad(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_unidad_sel';
		$this->transaccion='SNX_UNI_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_unidad','int4');
		$this->captura('unidad','varchar');
		$this->captura('estado_reg','varchar');
		$this->captura('unidadabrev','varchar');
		$this->captura('id_usuario_reg','int4');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
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
			
	function insertarUnidad(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_unidad_ime';
		$this->transaccion='SNX_UNI_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('unidad','unidad','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('unidadabrev','unidadabrev','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarUnidad(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_unidad_ime';
		$this->transaccion='SNX_UNI_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_unidad','id_unidad','int4');
		$this->setParametro('unidad','unidad','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('unidadabrev','unidadabrev','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarUnidad(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_unidad_ime';
		$this->transaccion='SNX_UNI_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_unidad','id_unidad','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>