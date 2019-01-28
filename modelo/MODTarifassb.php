<?php
/**
*@package pXP
*@file gen-MODTarifassb.php
*@author  (admin)
*@date 10-10-2018 13:26:46
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODTarifassb extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarTarifassb(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_tarifassb_sel';
		$this->transaccion='SNX_TAR_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_tarifasb','int4');
		$this->captura('id_unidad','int4');
		$this->captura('tarifasb','varchar');
		$this->captura('valortarifa','numeric');
		$this->captura('estado_reg','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_reg','int4');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('fecha_mod','timestamp');
		$this->captura('id_usuario_mod','int4');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('desc_unidad','varchar');	
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarTarifassb(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_tarifassb_ime';
		$this->transaccion='SNX_TAR_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_unidad','id_unidad','int4');
		$this->setParametro('tarifasb','tarifasb','varchar');
		$this->setParametro('valortarifa','valortarifa','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarTarifassb(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_tarifassb_ime';
		$this->transaccion='SNX_TAR_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_tarifasb','id_tarifasb','int4');
		$this->setParametro('id_unidad','id_unidad','int4');
		$this->setParametro('tarifasb','tarifasb','varchar');
		$this->setParametro('valortarifa','valortarifa','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarTarifassb(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_tarifassb_ime';
		$this->transaccion='SNX_TAR_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_tarifasb','id_tarifasb','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>