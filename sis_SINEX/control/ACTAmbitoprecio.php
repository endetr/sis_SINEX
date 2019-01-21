<?php
/**
*@package pXP
*@file gen-ACTAmbitoprecio.php
*@author  (admin)
*@date 23-07-2018 15:53:37
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTAmbitoprecio extends ACTbase{    
			
	function listarAmbitoprecio(){
		$this->objParam->defecto('ordenacion','id_ambitoprecio');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODAmbitoprecio','listarAmbitoprecio');
		} else{
			$this->objFunc=$this->create('MODAmbitoprecio');
			
			$this->res=$this->objFunc->listarAmbitoprecio($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarAmbitoprecio(){
		$this->objFunc=$this->create('MODAmbitoprecio');	
		if($this->objParam->insertar('id_ambitoprecio')){
			$this->res=$this->objFunc->insertarAmbitoprecio($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarAmbitoprecio($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarAmbitoprecio(){
			$this->objFunc=$this->create('MODAmbitoprecio');	
		$this->res=$this->objFunc->eliminarAmbitoprecio($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>