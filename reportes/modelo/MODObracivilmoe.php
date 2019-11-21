<?php
/**
*@package pXP
*@file gen-MODObracivilmoe.php
*@author  (admin)
*@date 30-08-2018 18:19:48
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODObracivilmoe extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
	
	function listarObracivilTrans(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_obracivilmoe_sel';
		$this->transaccion='SNX_TRANS_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('strtransporte','varchar');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function listarObracivilmoe(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_obracivilmoe_sel';
		$this->transaccion='SNX_OBRCI_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_obracivilmoe','int4');
		$this->captura('porccargasocial','numeric');
		$this->captura('id_unidad','int4');
		$this->captura('valorunitario','numeric');
		$this->captura('porcimpuestos','numeric');
		$this->captura('porcimpmanoobra','numeric');
		$this->captura('estado_reg','varchar');
		$this->captura('porcgastosga','numeric');
		$this->captura('porcutilidad','numeric');
		$this->captura('obracivilmoe','varchar');
		$this->captura('strtransporte','varchar');		
		$this->captura('porcherramientas','numeric');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_reg','int4');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('desc_unidadabrev','varchar');		
		$this->captura('preciounitariorlp','numeric');
		$this->captura('preciounitariorcb','numeric');
		$this->captura('preciounitariorsc','numeric');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}

	function listarOtrosmoe(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_obtenerotrosmoe_sel';
		$this->transaccion='SNX_OBRCI_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion	
				
		//Definicion de la lista del resultado del query
		$this->captura('id_obracivilmoe','int4');
		$this->captura('id_otromoe','int4');
		$this->captura('otromoe','varchar');
		$this->captura('cantidadocmoe','numeric');
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
			
	function insertarObracivilmoe(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_obracivilmoe_ime';
		$this->transaccion='SNX_OBRCI_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('porccargasocial','porccargasocial','numeric');
		$this->setParametro('id_unidad','id_unidad','int4');	
		$this->setParametro('strtransporte','strtransporte','varchar');			
		$this->setParametro('porcimpuestos','porcimpuestos','numeric');
		$this->setParametro('porcimpmanoobra','porcimpmanoobra','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('porcgastosga','porcgastosga','numeric');
		$this->setParametro('porcutilidad','porcutilidad','numeric');
		$this->setParametro('obracivilmoe','obracivilmoe','varchar');
		$this->setParametro('porcherramientas','porcherramientas','numeric');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarObracivilmoe(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_obracivilmoe_ime';
		$this->transaccion='SNX_OBRCI_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_obracivilmoe','id_obracivilmoe','int4');
		$this->setParametro('porccargasocial','porccargasocial','numeric');
		$this->setParametro('strtransporte','strtransporte','varchar');			
		$this->setParametro('id_unidad','id_unidad','int4');		
		$this->setParametro('porcimpuestos','porcimpuestos','numeric');
		$this->setParametro('porcimpmanoobra','porcimpmanoobra','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('porcgastosga','porcgastosga','numeric');
		$this->setParametro('porcutilidad','porcutilidad','numeric');
		$this->setParametro('obracivilmoe','obracivilmoe','varchar');
		$this->setParametro('porcherramientas','porcherramientas','numeric');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
		
			
	function eliminarObracivilmoe(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_obracivilmoe_ime';
		$this->transaccion='SNX_OBRCI_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_obracivilmoe','id_obracivilmoe','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>