<?php
/**
*@package pXP
*@file gen-MODUcmogrupo.php
*@author  (admin)
*@date 27-07-2018 16:51:55
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODUcmogrupo extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarUcmogrupo(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_ucmogrupo_sel';
		$this->transaccion='SNX_UCMOGR_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_ucmogrupo','int4');
		$this->captura('id_unidadconstructivamo','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('unmogrupo','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
		$this->captura('id_usuario_reg','int4');
		$this->captura('id_usuario_ai','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('id_usuario_mod','int4');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('valortotalrlp','numeric');
		$this->captura('valortotalrcb','numeric');	
		$this->captura('valortotalrsc','numeric');			
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarUcmogrupo(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ucmogrupo_ime';
		$this->transaccion='SNX_UCMOGR_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_unidadconstructivamo','id_unidadconstructivamo','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('unmogrupo','unmogrupo','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarUcmogrupo(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ucmogrupo_ime';
		$this->transaccion='SNX_UCMOGR_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_ucmogrupo','id_ucmogrupo','int4');
		$this->setParametro('id_unidadconstructivamo','id_unidadconstructivamo','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('unmogrupo','unmogrupo','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarUcmogrupo(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ucmogrupo_ime';
		$this->transaccion='SNX_UCMOGR_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_ucmogrupo','id_ucmogrupo','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>