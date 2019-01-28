<?php
/**
*@package pXP
*@file gen-MODUeepotros.php
*@author  (admin)
*@date 12-10-2018 16:53:37
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODUeepotros extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarUeepotros(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_ueepotros_sel';
		$this->transaccion='SNX_TUCO_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_uceepotros','int4');
		$this->captura('id_unidadconstructivaeep','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('valor','numeric');
		$this->captura('descripcion','varchar');
		$this->captura('id_usuario_reg','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
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
			
	function insertarUeepotros(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ueepotros_ime';
		$this->transaccion='SNX_TUCO_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_unidadconstructivaeep','id_unidadconstructivaeep','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('valor','valor','numeric');
		$this->setParametro('descripcion','descripcion','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarUeepotros(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ueepotros_ime';
		$this->transaccion='SNX_TUCO_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_uceepotros','id_uceepotros','int4');
		$this->setParametro('id_unidadconstructivaeep','id_unidadconstructivaeep','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('valor','valor','numeric');
		$this->setParametro('descripcion','descripcion','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarUeepotros(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ueepotros_ime';
		$this->transaccion='SNX_TUCO_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_uceepotros','id_uceepotros','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>