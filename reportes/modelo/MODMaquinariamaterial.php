<?php
/**
*@package pXP
*@file gen-MODMaquinariamaterial.php
*@author  (admin)
*@date 05-07-2018 18:55:02
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODMaquinariamaterial extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarMaquinariamaterial(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_maquinariamaterial_sel';
		$this->transaccion='SNX_MAQMA_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_maquinariamaterial','int4');
		$this->captura('id_material','int4');
		$this->captura('id_maquinaria','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('cantidadmate','numeric');
		$this->captura('valorunitario','numeric');
		$this->captura('valortotal','numeric');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
		$this->captura('id_usuario_reg','int4');
		$this->captura('id_usuario_ai','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('id_usuario_mod','int4');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('desc_material','varchar');
		$this->captura('desc_maquinaria','varchar');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarMaquinariamaterial(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_maquinariamaterial_ime';
		$this->transaccion='SNX_MAQMA_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_material','id_material','int4');
		$this->setParametro('id_maquinaria','id_maquinaria','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('cantidadmate','cantidadmate','numeric');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarMaquinariamaterial(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_maquinariamaterial_ime';
		$this->transaccion='SNX_MAQMA_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_maquinariamaterial','id_maquinariamaterial','int4');
		$this->setParametro('id_material','id_material','int4');
		$this->setParametro('id_maquinaria','id_maquinaria','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('cantidadmate','cantidadmate','numeric');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarMaquinariamaterial(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_maquinariamaterial_ime';
		$this->transaccion='SNX_MAQMA_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_maquinariamaterial','id_maquinariamaterial','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>