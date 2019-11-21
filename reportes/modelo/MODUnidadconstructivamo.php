<?php
/**
*@package pXP
*@file gen-MODUnidadconstructivamo.php
*@author  (admin)
*@date 27-07-2018 15:39:11
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODUnidadconstructivamo extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
	
	function resetCantOBC(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_unidadconstructivamo_ime';
		$this->transaccion='SNX_RESET_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_unidadconstructivamo','id_unidadconstructivamo','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
	
	function listarOtrosgastos(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_unidadconstructivamo_sel';
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
			
	function listarUnidadconstructivamo(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_unidadconstructivamo_sel';
		$this->transaccion='SNX_UNCONMO_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_unidadconstructivamo','int4');
		$this->captura('codigo','varchar');
		$this->captura('descripcion','varchar');
		$this->captura('estado_reg','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_reg','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
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
			
	function insertarUnidadconstructivamo(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_unidadconstructivamo_ime';
		$this->transaccion='SNX_UNCONMO_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('codigo','codigo','varchar');
		$this->setParametro('descripcion','descripcion','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarUnidadconstructivamo(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_unidadconstructivamo_ime';
		$this->transaccion='SNX_UNCONMO_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_unidadconstructivamo','id_unidadconstructivamo','int4');
		$this->setParametro('codigo','codigo','varchar');
		$this->setParametro('descripcion','descripcion','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarUnidadconstructivamo(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_unidadconstructivamo_ime';
		$this->transaccion='SNX_UNCONMO_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_unidadconstructivamo','id_unidadconstructivamo','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>