<?php
/**
*@package pXP
*@file gen-MODManoobramoe.php
*@author  (admin)
*@date 29-08-2018 18:34:29
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODManoobramoe extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarManoobramoe(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_manoobramoe_sel';
		$this->transaccion='SNX_MNMOE_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_manoobramoe','int4');
		$this->captura('manoobramoe','varchar');
		$this->captura('valorunitariorcb','numeric');
		$this->captura('id_unidad','int4');
		$this->captura('valorunitariorlp','numeric');
		$this->captura('valorunitariorsc','numeric');
		$this->captura('estado_reg','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_reg','int4');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('fecha_mod','timestamp');
		$this->captura('id_usuario_mod','int4');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('desc_unidadabrev','varchar');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarManoobramoe(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_manoobramoe_ime';
		$this->transaccion='SNX_MNMOE_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('manoobramoe','manoobramoe','varchar');
		$this->setParametro('valorunitariorcb','valorunitariorcb','numeric');
		$this->setParametro('id_unidad','id_unidad','int4');
		$this->setParametro('valorunitariorlp','valorunitariorlp','numeric');
		$this->setParametro('valorunitariorsc','valorunitariorsc','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarManoobramoe(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_manoobramoe_ime';
		$this->transaccion='SNX_MNMOE_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_manoobramoe','id_manoobramoe','int4');
		$this->setParametro('manoobramoe','manoobramoe','varchar');
		$this->setParametro('valorunitariorcb','valorunitariorcb','numeric');
		$this->setParametro('id_unidad','id_unidad','int4');
		$this->setParametro('valorunitariorlp','valorunitariorlp','numeric');
		$this->setParametro('valorunitariorsc','valorunitariorsc','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarManoobramoe(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_manoobramoe_ime';
		$this->transaccion='SNX_MNMOE_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_manoobramoe','id_manoobramoe','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>