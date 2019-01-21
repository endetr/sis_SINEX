<?php
/**
*@package pXP
*@file gen-MODEquipomaterial.php
*@author  (admin)
*@date 09-07-2018 16:12:16
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODEquipomaterial extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarEquipomaterial(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_equipomaterial_sel';
		$this->transaccion='SNX_EQMA_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_equipomaterial','int4');
		$this->captura('cantidadequimat','numeric');
		$this->captura('estado_reg','varchar');
		$this->captura('id_equipo','int4');
		$this->captura('id_material','int4');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_reg','int4');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('desc_material','varchar');
		$this->captura('valorunitario','numeric');
		$this->captura('valortotal','numeric');	
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarEquipomaterial(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_equipomaterial_ime';
		$this->transaccion='SNX_EQMA_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('cantidadequimat','cantidadequimat','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('id_equipo','id_equipo','int4');
		$this->setParametro('id_material','id_material','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarEquipomaterial(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_equipomaterial_ime';
		$this->transaccion='SNX_EQMA_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_equipomaterial','id_equipomaterial','int4');
		$this->setParametro('cantidadequimat','cantidadequimat','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('id_equipo','id_equipo','int4');
		$this->setParametro('id_material','id_material','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarEquipomaterial(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_equipomaterial_ime';
		$this->transaccion='SNX_EQMA_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_equipomaterial','id_equipomaterial','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>