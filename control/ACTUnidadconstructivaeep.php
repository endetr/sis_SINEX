<?php
/**
*@package pXP
*@file gen-ACTUnidadconstructivaeep.php
*@author  (admin)
*@date 11-10-2018 19:56:19
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTUnidadconstructivaeep extends ACTbase{    
			
	function listarUnidadconstructivaeep(){
		$this->objParam->defecto('ordenacion','id_unidadconstructivaeep');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODUnidadconstructivaeep','listarUnidadconstructivaeep');
		} else{
			$this->objFunc=$this->create('MODUnidadconstructivaeep');
			
			$this->res=$this->objFunc->listarUnidadconstructivaeep($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarUnidadconstructivaeep(){
		$this->objFunc=$this->create('MODUnidadconstructivaeep');	
		if($this->objParam->insertar('id_unidadconstructivaeep')){
			$this->res=$this->objFunc->insertarUnidadconstructivaeep($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarUnidadconstructivaeep($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarUnidadconstructivaeep(){
			$this->objFunc=$this->create('MODUnidadconstructivaeep');	
		$this->res=$this->objFunc->eliminarUnidadconstructivaeep($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>