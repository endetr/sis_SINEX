<?php
/**
*@package pXP
*@file gen-ACTMaterialcantidadlt.php
*@author  (admin)
*@date 24-07-2018 15:27:55
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTMaterialcantidadlt extends ACTbase{    
			
	function listarMaterialcantidadlt(){
		$this->objParam->defecto('ordenacion','id_materialcantidadlt');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('id_materiallt')!=''){
		$this->objParam->addFiltro("mtclt.id_materiallt = ".$this->objParam->getParametro('id_materiallt'));
	    }else {
	    	$this->objParam->addFiltro("mtclt.id_materiallt = 0");
	    }			
		
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODMaterialcantidadlt','listarMaterialcantidadlt');
		} else{
			$this->objFunc=$this->create('MODMaterialcantidadlt');
			
			$this->res=$this->objFunc->listarMaterialcantidadlt($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarMaterialcantidadlt(){
		$this->objFunc=$this->create('MODMaterialcantidadlt');	
		if($this->objParam->insertar('id_materialcantidadlt')){
			$this->res=$this->objFunc->insertarMaterialcantidadlt($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarMaterialcantidadlt($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarMaterialcantidadlt(){
			$this->objFunc=$this->create('MODMaterialcantidadlt');	
		$this->res=$this->objFunc->eliminarMaterialcantidadlt($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>