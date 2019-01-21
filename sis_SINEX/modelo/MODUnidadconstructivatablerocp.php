<?php
/**
*@package pXP
*@file gen-MODUnidadconstructivatablerocp.php
*@author  (admin)
*@date 11-10-2018 19:42:39
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODUnidadconstructivatablerocp extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarUnidadconstructivatablerocp(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_unidadconstructivatablerocp_sel';
		$this->transaccion='SNX_UCTCP_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_unidadconstructivatablerocp','int4');
		$this->captura('id_unidadconstructivaenctablerocp','int4');
		$this->captura('precio','numeric');
		$this->captura('cantidadtablerocp','numeric');
		$this->captura('estado_reg','varchar');
		$this->captura('unidadconstructivatablerocp','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_reg','int4');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('valortotaltablerocp','numeric');
				
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarUnidadconstructivatablerocp(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_unidadconstructivatablerocp_ime';
		$this->transaccion='SNX_UCTCP_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_unidadconstructivaenctablerocp','id_unidadconstructivaenctablerocp','int4');
		$this->setParametro('precio','precio','numeric');
		$this->setParametro('cantidadtablerocp','cantidadtablerocp','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('unidadconstructivatablerocp','unidadconstructivatablerocp','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarUnidadconstructivatablerocp(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_unidadconstructivatablerocp_ime';
		$this->transaccion='SNX_UCTCP_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_unidadconstructivatablerocp','id_unidadconstructivatablerocp','int4');
		$this->setParametro('id_unidadconstructivaenctablerocp','id_unidadconstructivaenctablerocp','int4');
		$this->setParametro('precio','precio','numeric');
		$this->setParametro('cantidadtablerocp','cantidadtablerocp','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('unidadconstructivatablerocp','unidadconstructivatablerocp','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarUnidadconstructivatablerocp(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_unidadconstructivatablerocp_ime';
		$this->transaccion='SNX_UCTCP_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_unidadconstructivatablerocp','id_unidadconstructivatablerocp','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>