<?php
/**
*@package pXP
*@file gen-MODEquipoprecio.php
*@author  (admin)
*@date 22-03-2018 12:58:10
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODEquipoprecio extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarEquipoprecio(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_equipoprecio_sel';
		$this->transaccion='SNX_EPR_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_equipoprecio','int4');
		$this->captura('id_equipo','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('valorequipo','numeric');
		$this->captura('id_moneda','int4');
		$this->captura('proyecto','varchar');
		$this->captura('fechaprecio','date');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('id_usuario_reg','int4');
		$this->captura('id_usuario_ai','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('id_usuario_mod','int4');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('desc_moneda','varchar');
				
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarEquipoprecio(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_equipoprecio_ime';
		$this->transaccion='SNX_EPR_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_equipo','id_equipo','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('valorequipo','valorequipo','numeric');
		$this->setParametro('id_moneda','id_moneda','int4');
		$this->setParametro('proyecto','proyecto','varchar');
		$this->setParametro('fechaprecio','fechaprecio','timestamp');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarEquipoprecio(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_equipoprecio_ime';
		$this->transaccion='SNX_EPR_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_equipoprecio','id_equipoprecio','int4');
		$this->setParametro('id_equipo','id_equipo','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('valorequipo','valorequipo','numeric');
		$this->setParametro('id_moneda','id_moneda','int4');
		$this->setParametro('proyecto','proyecto','varchar');
		$this->setParametro('fechaprecio','fechaprecio','timestamp');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarEquipoprecio(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_equipoprecio_ime';
		$this->transaccion='SNX_EPR_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_equipoprecio','id_equipoprecio','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>