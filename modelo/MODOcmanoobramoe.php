<?php
/**
*@package pXP
*@file gen-MODOcmanoobramoe.php
*@author  (admin)
*@date 30-08-2018 15:37:36
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODOcmanoobramoe extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarOcmanoobramoe(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_ocmanoobramoe_sel';
		$this->transaccion='SNX_OCMO_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_ocmanoobramoe','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('id_manoobramoe','int4');
		$this->captura('cantidadmanoobramoe','numeric');
		$this->captura('id_obracivilmoe','int4');
		$this->captura('id_usuario_reg','int4');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('desc_manoobramoe','varchar');		
		$this->captura('valorunitariorlpusd','numeric');
		$this->captura('valorunitariorcbusd','numeric');
		$this->captura('valorunitariorscusd','numeric');
		$this->captura('costototalrlp','numeric');
		$this->captura('costototalrcb','numeric');
		$this->captura('costototalrsc','numeric');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarOcmanoobramoe(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ocmanoobramoe_ime';
		$this->transaccion='SNX_OCMO_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('id_manoobramoe','id_manoobramoe','int4');
		$this->setParametro('cantidadmanoobramoe','cantidadmanoobramoe','numeric');
		$this->setParametro('id_obracivilmoe','id_obracivilmoe','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarOcmanoobramoe(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ocmanoobramoe_ime';
		$this->transaccion='SNX_OCMO_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_ocmanoobramoe','id_ocmanoobramoe','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('id_manoobramoe','id_manoobramoe','int4');
		$this->setParametro('cantidadmanoobramoe','cantidadmanoobramoe','numeric');
		$this->setParametro('id_obracivilmoe','id_obracivilmoe','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarOcmanoobramoe(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ocmanoobramoe_ime';
		$this->transaccion='SNX_OCMO_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_ocmanoobramoe','id_ocmanoobramoe','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>