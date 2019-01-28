<?php
/**
*@package pXP
*@file gen-MODOcmaterialmoe.php
*@author  (admin)
*@date 30-08-2018 15:37:04
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODOcmaterialmoe extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarOcmaterialmoe(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_ocmaterialmoe_sel';
		$this->transaccion='SNX_OCM_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_ocmaterialmoe','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('cantidadmaterialmoe','numeric');
		$this->captura('id_materialmoe','int4');
		$this->captura('id_obracivilmoe','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
		$this->captura('id_usuario_reg','int4');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('desc_materialmoe','varchar');			
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
			
	function insertarOcmaterialmoe(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ocmaterialmoe_ime';
		$this->transaccion='SNX_OCM_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('cantidadmaterialmoe','cantidadmaterialmoe','numeric');
		$this->setParametro('id_materialmoe','id_materialmoe','int4');
		$this->setParametro('id_obracivilmoe','id_obracivilmoe','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarOcmaterialmoe(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ocmaterialmoe_ime';
		$this->transaccion='SNX_OCM_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_ocmaterialmoe','id_ocmaterialmoe','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('cantidadmaterialmoe','cantidadmaterialmoe','numeric');
		$this->setParametro('id_materialmoe','id_materialmoe','int4');
		$this->setParametro('id_obracivilmoe','id_obracivilmoe','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarOcmaterialmoe(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ocmaterialmoe_ime';
		$this->transaccion='SNX_OCM_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_ocmaterialmoe','id_ocmaterialmoe','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>