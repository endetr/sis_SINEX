<?php
/**
*@package pXP
*@file gen-ACTMateriallt.php
*@author  (admin)
*@date 19-07-2018 14:36:34
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTMateriallt extends ACTbase{    
			
	function listarMateriallt(){
		$this->objParam->defecto('ordenacion','id_materiallt');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODMateriallt','listarMateriallt');
		} else{
			$this->objFunc=$this->create('MODMateriallt');
			
			$this->res=$this->objFunc->listarMateriallt($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
	
	function listarMaterialcantlt(){
		$this->objParam->defecto('ordenacion','id_materiallt');

		$this->objParam->defecto('dir_ordenacion','asc');
		
		if($this->objParam->getParametro('id_unidadconstructivalt')!=''){
			$this->objParam->addFiltro("uclt.id_unidadconstructivalt = ".$this->objParam->getParametro('id_unidadconstructivalt'));
	    }
		else {
			$this->objParam->addFiltro("uclt.id_unidadconstructivalt = 0");
	    }
		
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODMateriallt','listarMaterialcantlt');
		} else{
			$this->objFunc=$this->create('MODMateriallt');
			
			$this->res=$this->objFunc->listarMaterialcantlt($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarMateriallt(){
		$this->objFunc=$this->create('MODMateriallt');	
		if($this->objParam->insertar('id_materiallt')){
			$this->res=$this->objFunc->insertarMateriallt($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarMateriallt($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
	
	function modificarMaterialcantlt(){
		$this->objFunc=$this->create('MODMateriallt');	
		$this->res=$this->objFunc->modificarMaterialcantlt($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarMateriallt(){
			$this->objFunc=$this->create('MODMateriallt');	
		$this->res=$this->objFunc->eliminarMateriallt($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>