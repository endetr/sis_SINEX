<?php
/**
*@package pXP
*@file gen-MODFactorzona.php
*@author  (admin)
*@date 12-06-2018 14:56:11
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODFactorzona extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarFactorzona(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_factorzona_sel';
		$this->transaccion='SNX_FTZ_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_factorzona','int4');
		$this->captura('calificacion','varchar');
		$this->captura('estado_reg','varchar');
		$this->captura('distanciaini','int4');
		$this->captura('factor','numeric');
		$this->captura('distanciafin','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
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
			
	function insertarFactorzona(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_factorzona_ime';
		$this->transaccion='SNX_FTZ_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('calificacion','calificacion','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('distanciaini','distanciaini','int4');
		$this->setParametro('factor','factor','numeric');
		$this->setParametro('distanciafin','distanciafin','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarFactorzona(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_factorzona_ime';
		$this->transaccion='SNX_FTZ_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_factorzona','id_factorzona','int4');
		$this->setParametro('calificacion','calificacion','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('distanciaini','distanciaini','int4');
		$this->setParametro('factor','factor','numeric');
		$this->setParametro('distanciafin','distanciafin','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarFactorzona(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_factorzona_ime';
		$this->transaccion='SNX_FTZ_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_factorzona','id_factorzona','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>