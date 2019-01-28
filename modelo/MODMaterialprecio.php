<?php
/**
*@package pXP
*@file gen-MODMaterialprecio.php
*@author  (admin)
*@date 05-07-2018 13:09:03
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODMaterialprecio extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarMaterialprecio(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_materialprecio_sel';
		$this->transaccion='SNX_MATPRE_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_materialprecio','int4');
		$this->captura('fechaprecio','date');
		$this->captura('proyecto','varchar');
		$this->captura('id_moneda','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('valormaterial','numeric');
		$this->captura('id_material','int4');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_reg','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('desc_moneda','varchar');
		$this->captura('desc_material','varchar');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarMaterialprecio(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_materialprecio_ime';
		$this->transaccion='SNX_MATPRE_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('fechaprecio','fechaprecio','timestamp');
		$this->setParametro('proyecto','proyecto','varchar');
		$this->setParametro('id_moneda','id_moneda','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('valormaterial','valormaterial','numeric');
		$this->setParametro('id_material','id_material','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarMaterialprecio(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_materialprecio_ime';
		$this->transaccion='SNX_MATPRE_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_materialprecio','id_materialprecio','int4');
		$this->setParametro('fechaprecio','fechaprecio','timestamp');
		$this->setParametro('proyecto','proyecto','varchar');
		$this->setParametro('id_moneda','id_moneda','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('valormaterial','valormaterial','numeric');
		$this->setParametro('id_material','id_material','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarMaterialprecio(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_materialprecio_ime';
		$this->transaccion='SNX_MATPRE_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_materialprecio','id_materialprecio','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>