<?php
/**
*@package pXP
*@file gen-MODTensionservicio.php
*@author  (admin)
*@date 21-03-2018 19:24:34
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODTensionservicio extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarTensionservicio(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_tensionservicio_sel';
		$this->transaccion='SNX_NIV_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_tensionservicio','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('tensionservicio','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_reg','int4');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
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
			
	function insertarTensionservicio(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_tensionservicio_ime';
		$this->transaccion='SNX_NIV_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('tensionservicio','tensionservicio','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarTensionservicio(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_tensionservicio_ime';
		$this->transaccion='SNX_NIV_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_tensionservicio','id_tensionservicio','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('tensionservicio','tensionservicio','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarTensionservicio(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_tensionservicio_ime';
		$this->transaccion='SNX_NIV_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_tensionservicio','id_tensionservicio','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>