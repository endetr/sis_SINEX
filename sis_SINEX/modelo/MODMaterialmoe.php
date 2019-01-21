<?php
/**
*@package pXP
*@file gen-MODMaterialmoe.php
*@author  (admin)
*@date 29-08-2018 18:34:08
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODMaterialmoe extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarMaterialmoe(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_materialmoe_sel';
		$this->transaccion='SNX_MMOE_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_materialmoe','int4');
		$this->captura('id_unidad','int4');
		$this->captura('valorunitariorcb','numeric');
		$this->captura('valorunitariorlp','numeric');
		$this->captura('estado_reg','varchar');
		$this->captura('valorunitariorsc','numeric');
		$this->captura('materialmoe','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_reg','int4');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('desc_unidadabrev','varchar');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarMaterialmoe(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_materialmoe_ime';
		$this->transaccion='SNX_MMOE_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_unidad','id_unidad','int4');
		$this->setParametro('valorunitariorcb','valorunitariorcb','numeric');
		$this->setParametro('valorunitariorlp','valorunitariorlp','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('valorunitariorsc','valorunitariorsc','numeric');
		$this->setParametro('materialmoe','materialmoe','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarMaterialmoe(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_materialmoe_ime';
		$this->transaccion='SNX_MMOE_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_materialmoe','id_materialmoe','int4');
		$this->setParametro('id_unidad','id_unidad','int4');
		$this->setParametro('valorunitariorcb','valorunitariorcb','numeric');
		$this->setParametro('valorunitariorlp','valorunitariorlp','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('valorunitariorsc','valorunitariorsc','numeric');
		$this->setParametro('materialmoe','materialmoe','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarMaterialmoe(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_materialmoe_ime';
		$this->transaccion='SNX_MMOE_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_materialmoe','id_materialmoe','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>