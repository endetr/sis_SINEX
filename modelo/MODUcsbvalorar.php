<?php
/**
*@package pXP
*@file gen-MODUcsbvalorar.php
*@author  (admin)
*@date 09-11-2018 18:38:43
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODUcsbvalorar extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarUcsbvalorar(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_ucsbvalorar_sel';
		$this->transaccion='SNX_SBV_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_ucsbvalorar','int4');
		$this->captura('id_terrenosb','int4');
		$this->captura('numerobahias','int4');
		$this->captura('codigoproy','varchar');
		$this->captura('id_revista','int4');
		$this->captura('distanciatransnac','numeric');
		$this->captura('estado_reg','varchar');
		$this->captura('altura','numeric');
		$this->captura('distanciatransext','numeric');
		$this->captura('nombreproy','varchar');
		$this->captura('id_usuario_reg','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('id_usuario_mod','int4');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('desc_terrenosb','varchar');
		$this->captura('desc_revista','varchar');
		$this->captura('valortotal','numeric');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarUcsbvalorar(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ucsbvalorar_ime';
		$this->transaccion='SNX_SBV_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_terrenosb','id_terrenosb','int4');
		$this->setParametro('numerobahias','numerobahias','int4');
		$this->setParametro('codigoproy','codigoproy','varchar');
		$this->setParametro('id_revista','id_revista','int4');
		$this->setParametro('distanciatransnac','distanciatransnac','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('altura','altura','numeric');
		$this->setParametro('distanciatransext','distanciatransext','numeric');
		$this->setParametro('nombreproy','nombreproy','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarUcsbvalorar(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ucsbvalorar_ime';
		$this->transaccion='SNX_SBV_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_ucsbvalorar','id_ucsbvalorar','int4');
		$this->setParametro('id_terrenosb','id_terrenosb','int4');
		$this->setParametro('numerobahias','numerobahias','int4');
		$this->setParametro('codigoproy','codigoproy','varchar');
		$this->setParametro('id_revista','id_revista','int4');
		$this->setParametro('distanciatransnac','distanciatransnac','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('altura','altura','numeric');
		$this->setParametro('distanciatransext','distanciatransext','numeric');
		$this->setParametro('nombreproy','nombreproy','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarUcsbvalorar(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ucsbvalorar_ime';
		$this->transaccion='SNX_SBV_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_ucsbvalorar','id_ucsbvalorar','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
			
}
?>