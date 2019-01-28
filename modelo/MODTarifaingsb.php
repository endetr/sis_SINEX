<?php
/**
*@package pXP
*@file gen-MODTarifaingsb.php
*@author  (admin)
*@date 14-11-2018 16:12:18
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODTarifaingsb extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarTarifaingsb(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_tarifaingsb_sel';
		$this->transaccion='SNX_TING_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_tarifaingsb','int4');
		$this->captura('numerobahias','int4');
		$this->captura('porceidfaenas','numeric');
		$this->captura('porceingenieria','numeric');
		$this->captura('estado_reg','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_reg','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
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
			
	function insertarTarifaingsb(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_tarifaingsb_ime';
		$this->transaccion='SNX_TING_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('numerobahias','numerobahias','int4');
		$this->setParametro('porceidfaenas','porceidfaenas','numeric');
		$this->setParametro('porceingenieria','porceingenieria','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarTarifaingsb(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_tarifaingsb_ime';
		$this->transaccion='SNX_TING_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_tarifaingsb','id_tarifaingsb','int4');
		$this->setParametro('numerobahias','numerobahias','int4');
		$this->setParametro('porceidfaenas','porceidfaenas','numeric');
		$this->setParametro('porceingenieria','porceingenieria','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarTarifaingsb(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_tarifaingsb_ime';
		$this->transaccion='SNX_TING_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_tarifaingsb','id_tarifaingsb','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>