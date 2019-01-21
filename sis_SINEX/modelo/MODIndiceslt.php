<?php
/**
*@package pXP
*@file gen-MODIndiceslt.php
*@author  (admin)
*@date 23-07-2018 15:53:45
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODIndiceslt extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarIndiceslt(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_indiceslt_sel';
		$this->transaccion='SNX_INDLT_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_indicelt','int4');
		$this->captura('id_indicetipo','int4');
		$this->captura('id_ambitoprecio','int4');
		$this->captura('id_unidad','int4');
		$this->captura('valorindice','numeric');
		$this->captura('estado_reg','varchar');
		$this->captura('indicelt','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('id_usuario_reg','int4');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('ambitoprecio','varchar');
		$this->captura('indicetipo','varchar');
		$this->captura('unidadabrev','varchar');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarIndiceslt(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_indiceslt_ime';
		$this->transaccion='SNX_INDLT_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_indicetipo','id_indicetipo','int4');
		$this->setParametro('id_ambitoprecio','id_ambitoprecio','int4');
		$this->setParametro('id_unidad','id_unidad','int4');
		$this->setParametro('valorindice','valorindice','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('indicelt','indicelt','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarIndiceslt(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_indiceslt_ime';
		$this->transaccion='SNX_INDLT_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_indicelt','id_indicelt','int4');
		$this->setParametro('id_indicetipo','id_indicetipo','int4');
		$this->setParametro('id_ambitoprecio','id_ambitoprecio','int4');
		$this->setParametro('id_unidad','id_unidad','int4');
		$this->setParametro('valorindice','valorindice','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('indicelt','indicelt','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarIndiceslt(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_indiceslt_ime';
		$this->transaccion='SNX_INDLT_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_indicelt','id_indicelt','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>