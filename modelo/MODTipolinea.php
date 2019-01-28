<?php
/**
*@package pXP
*@file gen-MODTipolinea.php
*@author  (admin)
*@date 19-07-2018 14:03:02
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODTipolinea extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarTipolinea(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_tipolinea_sel';
		$this->transaccion='SNX_TIPL_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_tipolinea','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('tipolinea','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('id_usuario_reg','int4');
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
			
	function insertarTipolinea(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_tipolinea_ime';
		$this->transaccion='SNX_TIPL_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('tipolinea','tipolinea','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarTipolinea(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_tipolinea_ime';
		$this->transaccion='SNX_TIPL_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_tipolinea','id_tipolinea','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('tipolinea','tipolinea','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarTipolinea(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_tipolinea_ime';
		$this->transaccion='SNX_TIPL_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_tipolinea','id_tipolinea','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>