<?php
/**
*@package pXP
*@file gen-MODUcsbvalorarcuc.php
*@author  (admin)
*@date 09-11-2018 18:38:46
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODUcsbvalorarcuc extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarUcsbvalorarcuc(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_ucsbvalorarcuc_sel';
		$this->transaccion='SNX_SBVC_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_ucsvalorarcuc','int4');
		$this->captura('cantidaditem','numeric');
		$this->captura('codigo','varchar');	
		$this->captura('potencia','numeric');
		$this->captura('valorucsbcont','numeric');
		$this->captura('valorucsbog','numeric');
		$this->captura('descripcion','varchar');
		$this->captura('valorucsbm','numeric');
		$this->captura('id_tensionservicio','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('valorucsbtotal','numeric');
		$this->captura('valorucsbmate','numeric');
		$this->captura('valorucsbe','numeric');
		$this->captura('valorucsbfinal','numeric');
		$this->captura('id_ucsbvalorar','int4');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_reg','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('desc_tensionservicio','varchar');
		$this->captura('id_unidadconstructivasb','int4');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarUcsbvalorarcuc(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ucsbvalorarcuc_ime';
		$this->transaccion='SNX_SBVC_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_ucsbvalorar','id_ucsbvalorar','int4');
		$this->setParametro('cantidaditem','cantidaditem','numeric');
		$this->setParametro('potencia','potencia','numeric');		
		$this->setParametro('id_unidadconstructivasb','id_unidadconstructivasb','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarUcsbvalorarcuc(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ucsbvalorarcuc_ime';
		$this->transaccion='SNX_SBVC_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_ucsbvalorar','id_ucsbvalorar','int4');
		$this->setParametro('id_ucsvalorarcuc','id_ucsvalorarcuc','int4');
		$this->setParametro('cantidaditem','cantidaditem','numeric');
		$this->setParametro('potencia','potencia','numeric');	
		$this->setParametro('id_unidadconstructivasb','id_unidadconstructivasb','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarUcsbvalorarcuc(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ucsbvalorarcuc_ime';
		$this->transaccion='SNX_SBVC_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_ucsvalorarcuc','id_ucsvalorarcuc','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>