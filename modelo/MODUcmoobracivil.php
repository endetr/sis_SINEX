<?php
/**
*@package pXP
*@file gen-MODUcmoobracivil.php
*@author  (admin)
*@date 27-07-2018 16:54:44
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODUcmoobracivil extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarUcmoobracivil(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_ucmoobracivil_sel';
		$this->transaccion='SNX_UCMOOBCI_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_ucmoobracivil','int4');
		$this->captura('id_obracivilmoe','int4');
		$this->captura('cantidadobra','numeric');
		$this->captura('estado_reg','varchar');
		$this->captura('id_ucmogrupo','int4');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_reg','int4');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('desc_obracivilmoe','varchar');
		$this->captura('unidad','varchar');
		$this->captura('valortotalrlp','numeric');
		$this->captura('valortotalrcb','numeric');	
		$this->captura('valortotalrsc','numeric');		
		$this->captura('preciounitariorlp','numeric');
		$this->captura('preciounitariorcb','numeric');
		$this->captura('preciounitariorsc','numeric');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarUcmoobracivil(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ucmoobracivil_ime';
		$this->transaccion='SNX_UCMOOBCI_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_obracivilmoe','id_obracivilmoe','int4');
		$this->setParametro('cantidadobra','cantidadobra','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('id_ucmogrupo','id_ucmogrupo','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarUcmoobracivil(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ucmoobracivil_ime';
		$this->transaccion='SNX_UCMOOBCI_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_ucmoobracivil','id_ucmoobracivil','int4');
		$this->setParametro('id_obracivilmoe','id_obracivilmoe','int4');
		$this->setParametro('cantidadobra','cantidadobra','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('id_ucmogrupo','id_ucmogrupo','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarUcmoobracivil(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ucmoobracivil_ime';
		$this->transaccion='SNX_UCMOOBCI_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_ucmoobracivil','id_ucmoobracivil','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>