<?php
/**
*@package pXP
*@file gen-MODTipocanalizacion.php
*@author  (admin)
*@date 25-07-2018 14:56:50
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODTipocanalizacion extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarTipocanalizacion(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_tipocanalizacion_sel';
		$this->transaccion='SNX_TCAN_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_tipocanalizacion','int4');
		$this->captura('tipocanalizacion','varchar');
		$this->captura('estado_reg','varchar');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('id_usuario_reg','int4');
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
			
	function insertarTipocanalizacion(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_tipocanalizacion_ime';
		$this->transaccion='SNX_TCAN_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('tipocanalizacion','tipocanalizacion','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarTipocanalizacion(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_tipocanalizacion_ime';
		$this->transaccion='SNX_TCAN_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_tipocanalizacion','id_tipocanalizacion','int4');
		$this->setParametro('tipocanalizacion','tipocanalizacion','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarTipocanalizacion(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_tipocanalizacion_ime';
		$this->transaccion='SNX_TCAN_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_tipocanalizacion','id_tipocanalizacion','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>