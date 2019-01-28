<?php
/**
*@package pXP
*@file gen-ACTFuncionestructura.php
*@author  (admin)
*@date 25-07-2018 13:45:15
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTFuncionestructura extends ACTbase{    
			
	function listarFuncionestructura(){
		$this->objParam->defecto('ordenacion','id_funcionestructura');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODFuncionestructura','listarFuncionestructura');
		} else{
			$this->objFunc=$this->create('MODFuncionestructura');
			
			$this->res=$this->objFunc->listarFuncionestructura($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarFuncionestructura(){
		$this->objFunc=$this->create('MODFuncionestructura');	
		if($this->objParam->insertar('id_funcionestructura')){
			$this->res=$this->objFunc->insertarFuncionestructura($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarFuncionestructura($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarFuncionestructura(){
			$this->objFunc=$this->create('MODFuncionestructura');	
		$this->res=$this->objFunc->eliminarFuncionestructura($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>