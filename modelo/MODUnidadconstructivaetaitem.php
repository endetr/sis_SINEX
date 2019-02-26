<?php
/**
*@package pXP
*@file gen-MODUnidadconstructivaetaitem.php
*@author  (admin)
*@date 25-02-2019 15:32:16
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODUnidadconstructivaetaitem extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarUnidadconstructivaetaitem(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_unidadconstructivaetaitem_sel';
		$this->transaccion='SNX_UCBETAI_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_unidadconstructivaetaitem','int4');
		$this->captura('id_unidadconstructivaeta','int4');
		$this->captura('id_unidad','int4');
		$this->captura('valorunitario','numeric');
		$this->captura('estado_reg','varchar');
		$this->captura('cantidaditem','numeric');
		$this->captura('unidadconstructivaetaitem','varchar');
		$this->captura('id_usuario_reg','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('desc_unidadabrev','varchar');
		$this->captura('valortotaletaitem','numeric');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarUnidadconstructivaetaitem(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_unidadconstructivaetaitem_ime';
		$this->transaccion='SNX_UCBETAI_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_unidadconstructivaeta','id_unidadconstructivaeta','int4');
		$this->setParametro('id_unidad','id_unidad','int4');
		$this->setParametro('valorunitario','valorunitario','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('cantidaditem','cantidaditem','numeric');
		$this->setParametro('unidadconstructivaetaitem','unidadconstructivaetaitem','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarUnidadconstructivaetaitem(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_unidadconstructivaetaitem_ime';
		$this->transaccion='SNX_UCBETAI_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_unidadconstructivaetaitem','id_unidadconstructivaetaitem','int4');
		$this->setParametro('id_unidadconstructivaeta','id_unidadconstructivaeta','int4');
		$this->setParametro('id_unidad','id_unidad','int4');
		$this->setParametro('valorunitario','valorunitario','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('cantidaditem','cantidaditem','numeric');
		$this->setParametro('unidadconstructivaetaitem','unidadconstructivaetaitem','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarUnidadconstructivaetaitem(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_unidadconstructivaetaitem_ime';
		$this->transaccion='SNX_UCBETAI_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_unidadconstructivaetaitem','id_unidadconstructivaetaitem','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>