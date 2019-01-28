<?php
/**
*@package pXP
*@file gen-MODTipocimentacion.php
*@author  (admin)
*@date 25-07-2018 14:56:46
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODTipocimentacion extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarTipocimentacion(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_tipocimentacion_sel';
		$this->transaccion='SNX_TCIM_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_tipocimentacion','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('tipocimentacion','varchar');
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
			
	function insertarTipocimentacion(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_tipocimentacion_ime';
		$this->transaccion='SNX_TCIM_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('tipocimentacion','tipocimentacion','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarTipocimentacion(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_tipocimentacion_ime';
		$this->transaccion='SNX_TCIM_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_tipocimentacion','id_tipocimentacion','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('tipocimentacion','tipocimentacion','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarTipocimentacion(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_tipocimentacion_ime';
		$this->transaccion='SNX_TCIM_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_tipocimentacion','id_tipocimentacion','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>