<?php
/**
*@package pXP
*@file gen-MODClaseaislacion.php
*@author  (admin)
*@date 22-03-2018 12:43:57
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODClaseaislacion extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarClaseaislacion(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_claseaislacion_sel';
		$this->transaccion='SNX_CLA_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_claseaislacion','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('claseaislacion','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
		$this->captura('id_usuario_reg','int4');
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
			
	function insertarClaseaislacion(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_claseaislacion_ime';
		$this->transaccion='SNX_CLA_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('claseaislacion','claseaislacion','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarClaseaislacion(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_claseaislacion_ime';
		$this->transaccion='SNX_CLA_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_claseaislacion','id_claseaislacion','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('claseaislacion','claseaislacion','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarClaseaislacion(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_claseaislacion_ime';
		$this->transaccion='SNX_CLA_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_claseaislacion','id_claseaislacion','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>