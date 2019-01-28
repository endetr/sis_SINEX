<?php
/**
*@package pXP
*@file gen-MODMaquinariaprecio.php
*@author  (admin)
*@date 22-03-2018 19:06:49
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODMaquinariaprecio extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarMaquinariaprecio(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_maquinariaprecio_sel';
		$this->transaccion='SNX_MPR_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_maquinariaprecio','int4');
		$this->captura('fechaprecio','date');
		$this->captura('proyecto','varchar');
		$this->captura('id_moneda','int4');
		$this->captura('valormaquinaria','numeric');
		$this->captura('estado_reg','varchar');
		$this->captura('id_maquinaria','int4');
		$this->captura('id_usuario_ai','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
		$this->captura('id_usuario_reg','int4');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('desc_moneda','varchar');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarMaquinariaprecio(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_maquinariaprecio_ime';
		$this->transaccion='SNX_MPR_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('fechaprecio','fechaprecio','timestamp');
		$this->setParametro('proyecto','proyecto','varchar');
		$this->setParametro('id_moneda','id_moneda','int4');
		$this->setParametro('valormaquinaria','valormaquinaria','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('id_maquinaria','id_maquinaria','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarMaquinariaprecio(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_maquinariaprecio_ime';
		$this->transaccion='SNX_MPR_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_maquinariaprecio','id_maquinariaprecio','int4');
		$this->setParametro('fechaprecio','fechaprecio','timestamp');
		$this->setParametro('proyecto','proyecto','varchar');
		$this->setParametro('id_moneda','id_moneda','int4');
		$this->setParametro('valormaquinaria','valormaquinaria','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('id_maquinaria','id_maquinaria','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarMaquinariaprecio(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_maquinariaprecio_ime';
		$this->transaccion='SNX_MPR_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_maquinariaprecio','id_maquinariaprecio','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>