<?php
/**
*@package pXP
*@file gen-MODAreaprotegida.php
*@author  (admin)
*@date 05-09-2018 13:04:44
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODAreaprotegida extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarAreaprotegida(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_areaprotegida_sel';
		$this->transaccion='SNX_ZONP_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_areaprotegida','int4');
		$this->captura('areaprotegida','varchar');
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
			
	function insertarAreaprotegida(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_areaprotegida_ime';
		$this->transaccion='SNX_ZONP_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('areaprotegida','areaprotegida','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarAreaprotegida(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_areaprotegida_ime';
		$this->transaccion='SNX_ZONP_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_areaprotegida','id_areaprotegida','int4');
		$this->setParametro('areaprotegida','areaprotegida','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarAreaprotegida(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_areaprotegida_ime';
		$this->transaccion='SNX_ZONP_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_areaprotegida','id_areaprotegida','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>