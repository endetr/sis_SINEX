<?php
/**
*@package pXP
*@file gen-ACTUnidadconstructivaetaitem.php
*@author  (admin)
*@date 25-02-2019 15:32:16
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTUnidadconstructivaetaitem extends ACTbase{    
			
	function listarUnidadconstructivaetaitem(){
		$this->objParam->defecto('ordenacion','id_unidadconstructivaetaitem');

		$this->objParam->defecto('dir_ordenacion','asc');
		
		if($this->objParam->getParametro('id_unidadconstructivaeta')!=''){
		$this->objParam->addFiltro("ucbetai.id_unidadconstructivaeta = ".$this->objParam->getParametro('id_unidadconstructivaeta'));
	    }else {
	    	$this->objParam->addFiltro("ucbetai.id_unidadconstructivaeta = 0");
	    }
	    
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODUnidadconstructivaetaitem','listarUnidadconstructivaetaitem');
		} else{
			$this->objFunc=$this->create('MODUnidadconstructivaetaitem');
			
			$this->res=$this->objFunc->listarUnidadconstructivaetaitem($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarUnidadconstructivaetaitem(){
		$this->objFunc=$this->create('MODUnidadconstructivaetaitem');	
		if($this->objParam->insertar('id_unidadconstructivaetaitem')){
			$this->res=$this->objFunc->insertarUnidadconstructivaetaitem($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarUnidadconstructivaetaitem($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarUnidadconstructivaetaitem(){
			$this->objFunc=$this->create('MODUnidadconstructivaetaitem');	
		$this->res=$this->objFunc->eliminarUnidadconstructivaetaitem($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>