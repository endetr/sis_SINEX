<?php
/**
*@package pXP
*@file gen-MODUnidadconstructivaeta.php
*@author  (admin)
*@date 25-02-2019 15:32:13
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODUnidadconstructivaeta extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
		
	function listarOtrosgastos(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_unidadconstructivaeta_sel';
		$this->transaccion='SNX_OTG_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_item','int4');
		$this->captura('id_otrauc','int4');
		$this->captura('otrosgastos','varchar');
		$this->captura('cantidadog','numeric');
		$this->captura('valorunitario','numeric');
		$this->captura('valorog','numeric');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
					
	function listarUnidadconstructivaeta(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_unidadconstructivaeta_sel';
		$this->transaccion='SNX_UCBETA_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_unidadconstructivaeta','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('unidadconstructivaeta','varchar');
		$this->captura('codigo','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
		$this->captura('id_usuario_reg','int4');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('valoritem','numeric');
		$this->captura('valorog','numeric');
		$this->captura('valortotal','numeric');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarUnidadconstructivaeta(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_unidadconstructivaeta_ime';
		$this->transaccion='SNX_UCBETA_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('unidadconstructivaeta','unidadconstructivaeta','varchar');
		$this->setParametro('codigo','codigo','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarUnidadconstructivaeta(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_unidadconstructivaeta_ime';
		$this->transaccion='SNX_UCBETA_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_unidadconstructivaeta','id_unidadconstructivaeta','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('unidadconstructivaeta','unidadconstructivaeta','varchar');
		$this->setParametro('codigo','codigo','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarUnidadconstructivaeta(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_unidadconstructivaeta_ime';
		$this->transaccion='SNX_UCBETA_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_unidadconstructivaeta','id_unidadconstructivaeta','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>