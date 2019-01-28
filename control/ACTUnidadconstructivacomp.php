<?php
/**
*@package pXP
*@file gen-ACTUnidadconstructivacomp.php
*@author  (admin)
*@date 11-10-2018 19:56:16
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTUnidadconstructivacomp extends ACTbase{    
			
	function listarUnidadconstructivacomp(){
		$this->objParam->defecto('ordenacion','id_unidadconstructivacomp');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODUnidadconstructivacomp','listarUnidadconstructivacomp');
		} else{
			$this->objFunc=$this->create('MODUnidadconstructivacomp');
			
			$this->res=$this->objFunc->listarUnidadconstructivacomp($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarUnidadconstructivacomp(){
		$this->objFunc=$this->create('MODUnidadconstructivacomp');	
		if($this->objParam->insertar('id_unidadconstructivacomp')){
			$this->res=$this->objFunc->insertarUnidadconstructivacomp($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarUnidadconstructivacomp($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarUnidadconstructivacomp(){
			$this->objFunc=$this->create('MODUnidadconstructivacomp');	
		$this->res=$this->objFunc->eliminarUnidadconstructivacomp($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>