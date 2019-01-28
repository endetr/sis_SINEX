<?php
/**
*@package pXP
*@file gen-MODMontajepreciolt.php
*@author  (admin)
*@date 19-07-2018 13:29:16
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODMontajepreciolt extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarMontajepreciolt(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_montajepreciolt_sel';
		$this->transaccion='SNX_MONTP_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_montajepreciolt','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('valormontajelt','numeric');
		$this->captura('fechaprecio','date');
		$this->captura('proyecto','varchar');
		$this->captura('id_moneda','int4');
		$this->captura('id_montajelt','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
		$this->captura('id_usuario_reg','int4');
		$this->captura('id_usuario_ai','int4');
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
			
	function insertarMontajepreciolt(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_montajepreciolt_ime';
		$this->transaccion='SNX_MONTP_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('valormontajelt','valormontajelt','numeric');
		$this->setParametro('fechaprecio','fechaprecio','date');
		$this->setParametro('proyecto','proyecto','varchar');
		$this->setParametro('id_moneda','id_moneda','int4');
		$this->setParametro('id_montajelt','id_montajelt','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarMontajepreciolt(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_montajepreciolt_ime';
		$this->transaccion='SNX_MONTP_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_montajepreciolt','id_montajepreciolt','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('valormontajelt','valormontajelt','numeric');
		$this->setParametro('fechaprecio','fechaprecio','date');
		$this->setParametro('proyecto','proyecto','varchar');
		$this->setParametro('id_moneda','id_moneda','int4');
		$this->setParametro('id_montajelt','id_montajelt','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarMontajepreciolt(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_montajepreciolt_ime';
		$this->transaccion='SNX_MONTP_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_montajepreciolt','id_montajepreciolt','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>