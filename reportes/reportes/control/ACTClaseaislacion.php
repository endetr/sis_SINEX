<?php
/**
*@package pXP
*@file gen-ACTClaseaislacion.php
*@author  (admin)
*@date 22-03-2018 12:43:57
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTClaseaislacion extends ACTbase{    
			
	function listarClaseaislacion(){
		$this->objParam->defecto('ordenacion','id_claseaislacion');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODClaseaislacion','listarClaseaislacion');
		} else{
			$this->objFunc=$this->create('MODClaseaislacion');
			
			$this->res=$this->objFunc->listarClaseaislacion($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarClaseaislacion(){
		$this->objFunc=$this->create('MODClaseaislacion');	
		if($this->objParam->insertar('id_claseaislacion')){
			$this->res=$this->objFunc->insertarClaseaislacion($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarClaseaislacion($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarClaseaislacion(){
			$this->objFunc=$this->create('MODClaseaislacion');	
		$this->res=$this->objFunc->eliminarClaseaislacion($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>