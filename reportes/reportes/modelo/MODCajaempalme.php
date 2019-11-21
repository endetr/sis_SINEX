<?php
/**
*@package pXP
*@file gen-MODCajaempalme.php
*@author  (admin)
*@date 14-02-2019 17:57:59
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODCajaempalme extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarCajaempalme(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_cajaempalme_sel';
		$this->transaccion='SNX_CEP_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_cajaempalme','int4');
		$this->captura('cajaempalme','varchar');
		$this->captura('estado_reg','varchar');
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
			
	function insertarCajaempalme(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_cajaempalme_ime';
		$this->transaccion='SNX_CEP_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('cajaempalme','cajaempalme','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarCajaempalme(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_cajaempalme_ime';
		$this->transaccion='SNX_CEP_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_cajaempalme','id_cajaempalme','int4');
		$this->setParametro('cajaempalme','cajaempalme','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarCajaempalme(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_cajaempalme_ime';
		$this->transaccion='SNX_CEP_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_cajaempalme','id_cajaempalme','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>