<?php
/**
*@package pXP
*@file gen-MODMaterialpreciolt.php
*@author  (admin)
*@date 19-07-2018 14:36:40
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODMaterialpreciolt extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarMaterialpreciolt(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_materialpreciolt_sel';
		$this->transaccion='SNX_MTPLT_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_materialpreciolt','int4');
		$this->captura('id_materiallt','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('valormateriallt','numeric');
		$this->captura('proyecto','varchar');
		$this->captura('id_moneda','int4');
		$this->captura('fechaprecio','timestamp');
		$this->captura('id_usuario_reg','int4');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
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
			
	function insertarMaterialpreciolt(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_materialpreciolt_ime';
		$this->transaccion='SNX_MTPLT_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_materiallt','id_materiallt','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('valormateriallt','valormateriallt','numeric');
		$this->setParametro('proyecto','proyecto','varchar');
		$this->setParametro('id_moneda','id_moneda','int4');
		$this->setParametro('fechaprecio','fechaprecio','timestamp');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarMaterialpreciolt(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_materialpreciolt_ime';
		$this->transaccion='SNX_MTPLT_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_materialpreciolt','id_materialpreciolt','int4');
		$this->setParametro('id_materiallt','id_materiallt','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('valormateriallt','valormateriallt','numeric');
		$this->setParametro('proyecto','proyecto','varchar');
		$this->setParametro('id_moneda','id_moneda','int4');
		$this->setParametro('fechaprecio','fechaprecio','timestamp');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarMaterialpreciolt(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_materialpreciolt_ime';
		$this->transaccion='SNX_MTPLT_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_materialpreciolt','id_materialpreciolt','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>