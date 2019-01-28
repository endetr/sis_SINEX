<?php
/**
*@package pXP
*@file gen-MODUnidadconstructivatablerocpserv.php
*@author  (admin)
*@date 15-11-2018 14:02:13
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODUnidadconstructivatablerocpserv extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarUnidadconstructivatablerocpserv(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_unidadconstructivatablerocpserv_sel';
		$this->transaccion='SNX_UCTCSERV_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_unidadconstructivatablerocpserv','int4');
		$this->captura('id_unidadconstructivaenctablerocp','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('cantidadserv','numeric');
		$this->captura('precio','numeric');
		$this->captura('unidadconstructivatablerocpserv','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
		$this->captura('id_usuario_reg','int4');
		$this->captura('id_usuario_ai','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('id_usuario_mod','int4');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('valortotal','numeric');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarUnidadconstructivatablerocpserv(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_unidadconstructivatablerocpserv_ime';
		$this->transaccion='SNX_UCTCSERV_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_unidadconstructivaenctablerocp','id_unidadconstructivaenctablerocp','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('cantidadserv','cantidadserv','numeric');
		$this->setParametro('precio','precio','numeric');
		$this->setParametro('unidadconstructivatablerocpserv','unidadconstructivatablerocpserv','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarUnidadconstructivatablerocpserv(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_unidadconstructivatablerocpserv_ime';
		$this->transaccion='SNX_UCTCSERV_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_unidadconstructivatablerocpserv','id_unidadconstructivatablerocpserv','int4');
		$this->setParametro('id_unidadconstructivaenctablerocp','id_unidadconstructivaenctablerocp','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('cantidadserv','cantidadserv','numeric');
		$this->setParametro('precio','precio','numeric');
		$this->setParametro('unidadconstructivatablerocpserv','unidadconstructivatablerocpserv','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarUnidadconstructivatablerocpserv(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_unidadconstructivatablerocpserv_ime';
		$this->transaccion='SNX_UCTCSERV_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_unidadconstructivatablerocpserv','id_unidadconstructivatablerocpserv','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>