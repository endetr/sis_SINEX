<?php
/**
*@package pXP
*@file gen-MODMateriallt.php
*@author  (admin)
*@date 19-07-2018 14:36:34
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODMateriallt extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarMateriallt(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_materiallt_sel';
		$this->transaccion='SNX_MTLT_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_materiallt','int4');
		$this->captura('peso','numeric');
		$this->captura('id_unidad','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('materiallt','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_reg','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');		
		$this->captura('unidadabrev','varchar');
		$this->captura('valorunitario','numeric');	
		$this->captura('id_factorindexacion','int4');
		$this->captura('desc_factorindexacion','varchar');		
		$this->captura('id_ambitoprecio','int4');
		$this->captura('ambitoprecio','varchar');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}

function listarMaterialcantlt(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_materialcantlt_sel';
		$this->transaccion='SNX_MTLT_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_unidadconstructivalt','int4');
		$this->captura('id_grupo','int4');		
		$this->captura('grupo','varchar');
		$this->captura('id_item','int4');	
		$this->captura('item','varchar');
		$this->captura('id_unidad','int4');	
		$this->captura('unidadabrev','varchar');
		$this->captura('cantidaditem','numeric');	
		$this->captura('costounitarioext','numeric');	
		$this->captura('costounitarinac','numeric');	
		$this->captura('costototalext','numeric');	
		$this->captura('costototalnac','numeric');	
		$this->captura('costototalsumi','numeric');	
		$this->captura('pesounitarioext','numeric');	
		$this->captura('pesototalext','numeric');	
		$this->captura('pesounitarionac','numeric');	
		$this->captura('pesototalnac','numeric');	
		$this->captura('id_puestatierra','int4');		
		$this->captura('puestatierra','varchar');
		$this->captura('id_aislador','int4');		
		$this->captura('aislador','varchar');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarMateriallt(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_materiallt_ime';
		$this->transaccion='SNX_MTLT_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('peso','peso','numeric');
		$this->setParametro('id_unidad','id_unidad','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('materiallt','materiallt','varchar');
		$this->setParametro('id_factorindexacion','id_factorindexacion','int4');
		$this->setParametro('id_ambitoprecio','id_ambitoprecio','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarMateriallt(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_materiallt_ime';
		$this->transaccion='SNX_MTLT_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_materiallt','id_materiallt','int4');
		$this->setParametro('peso','peso','numeric');
		$this->setParametro('id_unidad','id_unidad','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('materiallt','materiallt','varchar');
		$this->setParametro('id_factorindexacion','id_factorindexacion','int4');
		$this->setParametro('id_ambitoprecio','id_ambitoprecio','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}

	function modificarMaterialcantlt(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_materialcantlt_ime';
		$this->transaccion='SNX_MTLT_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion		
		$this->setParametro('id_unidadconstructivalt','id_unidadconstructivalt','int4');
		$this->setParametro('id_item','id_item','int4');
		$this->setParametro('id_puestatierra','id_puestatierra','int4');
		$this->setParametro('id_aislador','id_aislador','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarMateriallt(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_materiallt_ime';
		$this->transaccion='SNX_MTLT_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_materiallt','id_materiallt','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>