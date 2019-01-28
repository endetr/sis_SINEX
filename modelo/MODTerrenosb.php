<?php
/**
*@package pXP
*@file gen-MODTerrenosb.php
*@author  (admin)
*@date 03-08-2018 19:41:46
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODTerrenosb extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarTerrenosb(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_terrenosb_sel';
		$this->transaccion='SNX_TSB_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_terrenosb','int4');
		$this->captura('terrenosb','varchar');
		$this->captura('factor','numeric');
		$this->captura('estado_reg','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('id_usuario_reg','int4');
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
			
	function insertarTerrenosb(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_terrenosb_ime';
		$this->transaccion='SNX_TSB_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('terrenosb','terrenosb','varchar');
		$this->setParametro('factor','factor','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarTerrenosb(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_terrenosb_ime';
		$this->transaccion='SNX_TSB_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_terrenosb','id_terrenosb','int4');
		$this->setParametro('terrenosb','terrenosb','varchar');
		$this->setParametro('factor','factor','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarTerrenosb(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_terrenosb_ime';
		$this->transaccion='SNX_TSB_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_terrenosb','id_terrenosb','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>