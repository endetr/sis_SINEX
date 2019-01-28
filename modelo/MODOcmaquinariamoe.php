<?php
/**
*@package pXP
*@file gen-MODOcmaquinariamoe.php
*@author  (admin)
*@date 30-08-2018 15:37:28
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODOcmaquinariamoe extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarOcmaquinariamoe(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_ocmaquinariamoe_sel';
		$this->transaccion='SNX_OCMAQ_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_ocmaquinariamoe','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('id_maquinariamoe','int4');
		$this->captura('cantidadmaquinariamoe','numeric');
		$this->captura('id_obracivilmoe','int4');
		$this->captura('id_usuario_reg','int4');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('desc_maquinariamoe','varchar');		
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
			
	function insertarOcmaquinariamoe(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ocmaquinariamoe_ime';
		$this->transaccion='SNX_OCMAQ_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('id_maquinariamoe','id_maquinariamoe','int4');
		$this->setParametro('cantidadmaquinariamoe','cantidadmaquinariamoe','numeric');
		$this->setParametro('id_obracivilmoe','id_obracivilmoe','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarOcmaquinariamoe(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ocmaquinariamoe_ime';
		$this->transaccion='SNX_OCMAQ_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_ocmaquinariamoe','id_ocmaquinariamoe','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('id_maquinariamoe','id_maquinariamoe','int4');
		$this->setParametro('cantidadmaquinariamoe','cantidadmaquinariamoe','numeric');
		$this->setParametro('id_obracivilmoe','id_obracivilmoe','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarOcmaquinariamoe(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ocmaquinariamoe_ime';
		$this->transaccion='SNX_OCMAQ_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_ocmaquinariamoe','id_ocmaquinariamoe','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>