<?php
/**
*@package pXP
*@file gen-MODTipoestructura.php
*@author  (admin)
*@date 07-05-2018 19:26:31
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODTipoestructura extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarTipoestructura(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_tipoestructura_sel';
		$this->transaccion='SNX_TPE_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_tipoestructura','int4');
		$this->captura('tipoestructura','varchar');
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
			
	function insertarTipoestructura(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_tipoestructura_ime';
		$this->transaccion='SNX_TPE_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('tipoestructura','tipoestructura','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarTipoestructura(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_tipoestructura_ime';
		$this->transaccion='SNX_TPE_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_tipoestructura','id_tipoestructura','int4');
		$this->setParametro('tipoestructura','tipoestructura','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarTipoestructura(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_tipoestructura_ime';
		$this->transaccion='SNX_TPE_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_tipoestructura','id_tipoestructura','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>