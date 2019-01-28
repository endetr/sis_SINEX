<?php
/**
*@package pXP
*@file gen-MODHerrajeaccesorio.php
*@author  (admin)
*@date 07-05-2018 19:37:50
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODHerrajeaccesorio extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarHerrajeaccesorio(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_herrajeaccesorio_sel';
		$this->transaccion='SNX_HAC_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_herrajeaccesorio','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('herrajeaccesorio','varchar');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
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
			
	function insertarHerrajeaccesorio(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_herrajeaccesorio_ime';
		$this->transaccion='SNX_HAC_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('herrajeaccesorio','herrajeaccesorio','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarHerrajeaccesorio(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_herrajeaccesorio_ime';
		$this->transaccion='SNX_HAC_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_herrajeaccesorio','id_herrajeaccesorio','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('herrajeaccesorio','herrajeaccesorio','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarHerrajeaccesorio(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_herrajeaccesorio_ime';
		$this->transaccion='SNX_HAC_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_herrajeaccesorio','id_herrajeaccesorio','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>