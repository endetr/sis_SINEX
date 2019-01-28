<?php
/**
*@package pXP
*@file gen-MODTasacambio.php
*@author  (admin)
*@date 02-04-2018 13:35:50
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODTasacambio extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarTasacambio(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_tasacambio_sel';
		$this->transaccion='SNX_TAS_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_tasacambio','int4');
		$this->captura('id_mes','int4');
		$this->captura('ano','int4');
		$this->captura('id_monedadestino','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('valor','numeric');
		$this->captura('id_monedaorigen','int4');
		$this->captura('id_usuario_ai','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
		$this->captura('id_usuario_reg','int4');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('desc_nombre','varchar');		
		$this->captura('desc_moneda','varchar');
		$this->captura('desc_monedadest','varchar');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarTasacambio(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_tasacambio_ime';
		$this->transaccion='SNX_TAS_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_mes','id_mes','int4');
		$this->setParametro('ano','ano','int4');
		$this->setParametro('id_monedadestino','id_monedadestino','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('valor','valor','numeric');
		$this->setParametro('id_monedaorigen','id_monedaorigen','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarTasacambio(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_tasacambio_ime';
		$this->transaccion='SNX_TAS_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_tasacambio','id_tasacambio','int4');
		$this->setParametro('id_mes','id_mes','int4');
		$this->setParametro('ano','ano','int4');
		$this->setParametro('id_monedadestino','id_monedadestino','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('valor','valor','numeric');
		$this->setParametro('id_monedaorigen','id_monedaorigen','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarTasacambio(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_tasacambio_ime';
		$this->transaccion='SNX_TAS_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_tasacambio','id_tasacambio','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>