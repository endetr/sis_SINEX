<?php
/**
*@package pXP
*@file gen-MODUceepitem.php
*@author  (admin)
*@date 11-10-2018 19:56:25
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODUceepitem extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarUceepitem(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_uceepitem_sel';
		$this->transaccion='SNX_UCI_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_uceepitem','int4');
		$this->captura('id_unidadconstructivaeep','int4');
		$this->captura('valor','numeric');
		$this->captura('descripcion','varchar');
		$this->captura('estado_reg','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
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
			
	function insertarUceepitem(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_uceepitem_ime';
		$this->transaccion='SNX_UCI_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_unidadconstructivaeep','id_unidadconstructivaeep','int4');
		$this->setParametro('valor','valor','numeric');
		$this->setParametro('descripcion','descripcion','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarUceepitem(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_uceepitem_ime';
		$this->transaccion='SNX_UCI_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_uceepitem','id_uceepitem','int4');
		$this->setParametro('id_unidadconstructivaeep','id_unidadconstructivaeep','int4');
		$this->setParametro('valor','valor','numeric');
		$this->setParametro('descripcion','descripcion','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarUceepitem(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_uceepitem_ime';
		$this->transaccion='SNX_UCI_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_uceepitem','id_uceepitem','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>