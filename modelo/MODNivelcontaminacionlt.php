<?php
/**
*@package pXP
*@file gen-MODNivelcontaminacionlt.php
*@author  (admin)
*@date 04-09-2018 18:41:39
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODNivelcontaminacionlt extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarNivelcontaminacionlt(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_nivelcontaminacionlt_sel';
		$this->transaccion='SNX_NIC_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_nivelcontaminacionlt','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('factor','numeric');
		$this->captura('nivelcontaminacionlt','varchar');
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
			
	function insertarNivelcontaminacionlt(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_nivelcontaminacionlt_ime';
		$this->transaccion='SNX_NIC_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('factor','factor','numeric');
		$this->setParametro('nivelcontaminacionlt','nivelcontaminacionlt','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarNivelcontaminacionlt(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_nivelcontaminacionlt_ime';
		$this->transaccion='SNX_NIC_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_nivelcontaminacionlt','id_nivelcontaminacionlt','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('factor','factor','numeric');
		$this->setParametro('nivelcontaminacionlt','nivelcontaminacionlt','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarNivelcontaminacionlt(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_nivelcontaminacionlt_ime';
		$this->transaccion='SNX_NIC_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_nivelcontaminacionlt','id_nivelcontaminacionlt','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>