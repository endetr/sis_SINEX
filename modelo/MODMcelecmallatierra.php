<?php
/**
*@package pXP
*@file gen-MODMcelecmallatierra.php
*@author  (admin)
*@date 16-10-2018 20:00:20
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODMcelecmallatierra extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarMcelecmallatierra(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_mcelecmallatierra_sel';
		$this->transaccion='SNX_MCMT_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_mcelecmallatierra','int4');
		$this->captura('id_claseaislamiento','int4');
		$this->captura('factortorre','numeric');
		$this->captura('cableporbahina','numeric');
		$this->captura('estado_reg','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
		$this->captura('id_usuario_reg','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('id_usuario_mod','int4');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('desc_claseaislacion','varchar');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarMcelecmallatierra(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_mcelecmallatierra_ime';
		$this->transaccion='SNX_MCMT_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_claseaislamiento','id_claseaislamiento','int4');
		$this->setParametro('factortorre','factortorre','numeric');
		$this->setParametro('cableporbahina','cableporbahina','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarMcelecmallatierra(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_mcelecmallatierra_ime';
		$this->transaccion='SNX_MCMT_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_mcelecmallatierra','id_mcelecmallatierra','int4');
		$this->setParametro('id_claseaislamiento','id_claseaislamiento','int4');
		$this->setParametro('factortorre','factortorre','numeric');
		$this->setParametro('cableporbahina','cableporbahina','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarMcelecmallatierra(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_mcelecmallatierra_ime';
		$this->transaccion='SNX_MCMT_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_mcelecmallatierra','id_mcelecmallatierra','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>