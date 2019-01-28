<?php
/**
*@package pXP
*@file gen-MODPararrayatolinea.php
*@author  (admin)
*@date 07-05-2018 19:37:48
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODPararrayatolinea extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarPararrayatolinea(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_pararrayatolinea_sel';
		$this->transaccion='SNX_PRL_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_pararrayolinea','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('pararrayolinea','varchar');
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
			
	function insertarPararrayatolinea(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_pararrayatolinea_ime';
		$this->transaccion='SNX_PRL_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('pararrayolinea','pararrayolinea','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarPararrayatolinea(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_pararrayatolinea_ime';
		$this->transaccion='SNX_PRL_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_pararrayolinea','id_pararrayolinea','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('pararrayolinea','pararrayolinea','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarPararrayatolinea(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_pararrayatolinea_ime';
		$this->transaccion='SNX_PRL_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_pararrayolinea','id_pararrayolinea','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>