<?php
/**
*@package pXP
*@file gen-MODUnidadconstructivacomun.php
*@author  (admin)
*@date 11-10-2018 19:42:28
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODUnidadconstructivacomun extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarUnidadconstructivacomun(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_unidadconstructivacomun_sel';
		$this->transaccion='SNX_UCCOM_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_unidadconstructivacomun','int4');
		$this->captura('id_unidadconstructivaenccomun','int4');
		$this->captura('id_unidad','int4');
		$this->captura('precio','numeric');
		$this->captura('cantidadcomun','numeric');
		$this->captura('estado_reg','varchar');
		$this->captura('unidadconstructivacomun','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_reg','int4');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('desc_unidadabrev','varchar');
		$this->captura('valortotalcomun','numeric');		
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarUnidadconstructivacomun(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_unidadconstructivacomun_ime';
		$this->transaccion='SNX_UCCOM_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_unidadconstructivaenccomun','id_unidadconstructivaenccomun','int4');
		$this->setParametro('id_unidad','id_unidad','int4');
		$this->setParametro('precio','precio','numeric');
		$this->setParametro('cantidadcomun','cantidadcomun','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('unidadconstructivacomun','unidadconstructivacomun','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarUnidadconstructivacomun(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_unidadconstructivacomun_ime';
		$this->transaccion='SNX_UCCOM_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_unidadconstructivacomun','id_unidadconstructivacomun','int4');
		$this->setParametro('id_unidadconstructivaenccomun','id_unidadconstructivaenccomun','int4');
		$this->setParametro('id_unidad','id_unidad','int4');
		$this->setParametro('precio','precio','numeric');
		$this->setParametro('cantidadcomun','cantidadcomun','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('unidadconstructivacomun','unidadconstructivacomun','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarUnidadconstructivacomun(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_unidadconstructivacomun_ime';
		$this->transaccion='SNX_UCCOM_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_unidadconstructivacomun','id_unidadconstructivacomun','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>