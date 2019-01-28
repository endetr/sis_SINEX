<?php
/**
*@package pXP
*@file gen-MODUnidadconstructivasb.php
*@author  (admin)
*@date 11-07-2018 16:47:14
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODUnidadconstructivasb extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarUnidadconstructivasb(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='snx.ft_unidadconstructivasb_sel';
		$this->transaccion='SNX_UCS_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_unidadconstructivasb','int4');
		$this->captura('descripcion','varchar');
		$this->captura('id_tensionservicio','int4');
		$this->captura('superficie','numeric');
		$this->captura('codigo','varchar');
		$this->captura('desc_coddescrip','varchar');		
		$this->captura('alturainstalacion','numeric');
		$this->captura('id_ubicacion','int4');
		$this->captura('estado_reg','varchar');	
		$this->captura('id_claseaislacion','int4');
		$this->captura('distanciatransporte','numeric');
		$this->captura('distanciatransportemate','numeric');
		$this->captura('numerobahias','int4');
		$this->captura('varloringenieria','numeric');
		$this->captura('id_usuario_ai','int4');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('id_usuario_reg','int4');
		$this->captura('fecha_mod','timestamp');		
		$this->captura('id_usuario_mod','int4');		
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('desc_tensionservicio','varchar');
		$this->captura('desc_ubicacion','varchar');
		$this->captura('desc_claseaislacion','varchar');
		$this->captura('valorucsbe','numeric');
		$this->captura('valorucsbm','numeric');
		$this->captura('valorucsbmate','numeric');		
		$this->captura('valorucsdcont','numeric');
		$this->captura('valorucsog','numeric');
		$this->captura('valorucstotal','numeric');
		
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}	
			
	function insertarUnidadconstructivasb(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_unidadconstructivasb_ime';
		$this->transaccion='SNX_UCS_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('descripcion','descripcion','varchar');
		$this->setParametro('id_tensionservicio','id_tensionservicio','int4');
		$this->setParametro('superficie','superficie','numeric');
		$this->setParametro('tarifagalvanizado','tarifagalvanizado','numeric');
		$this->setParametro('codigo','codigo','varchar');
		$this->setParametro('tarifamanoobra','tarifamanoobra','numeric');
		$this->setParametro('alturainstalacion','alturainstalacion','numeric');
		$this->setParametro('id_ubicacion','id_ubicacion','int4');
		$this->setParametro('id_terreno','id_terreno','int4');
		$this->setParametro('tarifahormigon','tarifahormigon','numeric');
		$this->setParametro('tarifaexcavacion','tarifaexcavacion','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('tarifarelleno','tarifarelleno','numeric');		
		$this->setParametro('id_claseaislacion','id_claseaislacion','int4');
		$this->setParametro('distanciatransporte','distanciatransporte','numeric');
		$this->setParametro('distanciatransportemate','distanciatransportemate','numeric');
		$this->setParametro('numerobahias','numerobahias','int4');
		$this->setParametro('varloringenieria','varloringenieria','numeric');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarUnidadconstructivasb(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_unidadconstructivasb_ime';
		$this->transaccion='SNX_UCS_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_unidadconstructivasb','id_unidadconstructivasb','int4');
		$this->setParametro('descripcion','descripcion','varchar');
		$this->setParametro('id_tensionservicio','id_tensionservicio','int4');
		$this->setParametro('superficie','superficie','numeric');
		$this->setParametro('tarifagalvanizado','tarifagalvanizado','numeric');
		$this->setParametro('codigo','codigo','varchar');
		$this->setParametro('tarifamanoobra','tarifamanoobra','numeric');
		$this->setParametro('alturainstalacion','alturainstalacion','numeric');
		$this->setParametro('id_ubicacion','id_ubicacion','int4');
		$this->setParametro('id_terreno','id_terreno','int4');
		$this->setParametro('tarifahormigon','tarifahormigon','numeric');
		$this->setParametro('tarifaexcavacion','tarifaexcavacion','numeric');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('tarifarelleno','tarifarelleno','numeric');		
		$this->setParametro('id_claseaislacion','id_claseaislacion','int4');
		$this->setParametro('distanciatransporte','distanciatransporte','numeric');
		$this->setParametro('distanciatransportemate','distanciatransportemate','numeric');		
		$this->setParametro('numerobahias','numerobahias','int4');
		$this->setParametro('varloringenieria','varloringenieria','numeric');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarUnidadconstructivasb(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='snx.ft_unidadconstructivasb_ime';
		$this->transaccion='SNX_UCS_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_unidadconstructivasb','id_unidadconstructivasb','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}	
			
}
?>