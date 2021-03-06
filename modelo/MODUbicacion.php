<?php
/**
*@package pXP
*@file gen-MODUbicacion.php
*@author  (admin)
*@date 21-03-2018 19:24:38
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODUbicacion extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarUbicacion(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_ubicacion_sel';
		$this->transaccion='SNX_UBI_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_ubicacion','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('ubicacion','varchar');
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
			
	function insertarUbicacion(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ubicacion_ime';
		$this->transaccion='SNX_UBI_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('ubicacion','ubicacion','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarUbicacion(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ubicacion_ime';
		$this->transaccion='SNX_UBI_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_ubicacion','id_ubicacion','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('ubicacion','ubicacion','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarUbicacion(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ubicacion_ime';
		$this->transaccion='SNX_UBI_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_ubicacion','id_ubicacion','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>