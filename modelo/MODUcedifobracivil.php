<?php
/**
*@package pXP
*@file gen-MODUcedifobracivil.php
*@author  (admin)
*@date 27-07-2018 14:52:35
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODUcedifobracivil extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarUcedifobracivil(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_ucedifobracivil_sel';
		$this->transaccion='SNX_UDOC_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_ucedifobracivil','int4');
		$this->captura('id_ucedifsubgrupo','int4');
		$this->captura('cantidadobracivil','numeric');
		$this->captura('id_obracivilmoe','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_reg','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_mod','timestamp');
		$this->captura('id_usuario_mod','int4');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');		
		$this->captura('desc_obracivilmoe','varchar');
		$this->captura('unidad','varchar');		
		$this->captura('valortotalrlp','numeric');
		$this->captura('valortotalrcb','numeric');	
		$this->captura('valortotalrsc','numeric');		
		$this->captura('preciounitariorlp','numeric');
		$this->captura('preciounitariorcb','numeric');
		$this->captura('preciounitariorsc','numeric');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarUcedifobracivil(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ucedifobracivil_ime';
		$this->transaccion='SNX_UDOC_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_ucedifsubgrupo','id_ucedifsubgrupo','int4');
		$this->setParametro('cantidadobracivil','cantidadobracivil','numeric');
		$this->setParametro('id_obracivilmoe','id_obracivilmoe','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarUcedifobracivil(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ucedifobracivil_ime';
		$this->transaccion='SNX_UDOC_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_ucedifobracivil','id_ucedifobracivil','int4');
		$this->setParametro('id_ucedifsubgrupo','id_ucedifsubgrupo','int4');
		$this->setParametro('cantidadobracivil','cantidadobracivil','numeric');
		$this->setParametro('id_obracivilmoe','id_obracivilmoe','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarUcedifobracivil(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_ucedifobracivil_ime';
		$this->transaccion='SNX_UDOC_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_ucedifobracivil','id_ucedifobracivil','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>