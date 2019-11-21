<?php
/**
*@package pXP
*@file gen-MODObracivillt.php
*@author  (admin)
*@date 25-07-2018 14:56:53
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODObracivillt extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarObracivillt(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_obracivillt_sel';
		$this->transaccion='SNX_OCLT_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_obracivillt','int4');
		$this->captura('peso','numeric');
		$this->captura('id_unidad','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('obracivillt','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
		$this->captura('id_usuario_reg','int4');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');		
		$this->captura('unidadabrev','varchar');
		$this->captura('valorunitario','numeric');		
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}

	function listarObracivilcantlt(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_obracivilcantlt_sel';
		$this->transaccion='SNX_OCLT_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_unidadconstructivalt','int4');		
		$this->captura('terrenolt','varchar');
		$this->captura('funcionestructura','varchar');
		$this->captura('tipocimentacion','varchar');		
		$this->captura('cantidaditem','numeric');
		$this->captura('cosotunitariooc','numeric');	
		$this->captura('costototaloc','numeric');
		$this->captura('pesounitariooc','numeric');	
		$this->captura('pesototaloc','numeric');		
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarObracivillt(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_obracivillt_ime';
		$this->transaccion='SNX_OCLT_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('peso','peso','numeric');
		$this->setParametro('id_unidad','id_unidad','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('obracivillt','obracivillt','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarObracivillt(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_obracivillt_ime';
		$this->transaccion='SNX_OCLT_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_obracivillt','id_obracivillt','int4');
		$this->setParametro('peso','peso','numeric');
		$this->setParametro('id_unidad','id_unidad','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('obracivillt','obracivillt','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarObracivillt(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_obracivillt_ime';
		$this->transaccion='SNX_OCLT_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_obracivillt','id_obracivillt','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>