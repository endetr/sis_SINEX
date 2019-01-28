<?php
/**
*@package pXP
*@file gen-ACTMaquinariamaterial.php
*@author  (admin)
*@date 05-07-2018 18:55:02
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTMaquinariamaterial extends ACTbase{    
			
	function listarMaquinariamaterial(){
		$this->objParam->defecto('ordenacion','id_maquinariamaterial');

		$this->objParam->defecto('dir_ordenacion','asc');
		
		if($this->objParam->getParametro('id_maquinaria')!=''){
			$this->objParam->addFiltro("maqma.id_maquinaria = ".$this->objParam->getParametro('id_maquinaria'));
	    } else {
	    	$this->objParam->addFiltro("maqma.id_maquinaria = 0");
	    }	
		
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODMaquinariamaterial','listarMaquinariamaterial');
		} else{
			$this->objFunc=$this->create('MODMaquinariamaterial');
			
			$this->res=$this->objFunc->listarMaquinariamaterial($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarMaquinariamaterial(){
		$this->objFunc=$this->create('MODMaquinariamaterial');	
		if($this->objParam->insertar('id_maquinariamaterial')){
			$this->res=$this->objFunc->insertarMaquinariamaterial($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarMaquinariamaterial($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarMaquinariamaterial(){
			$this->objFunc=$this->create('MODMaquinariamaterial');	
		$this->res=$this->objFunc->eliminarMaquinariamaterial($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>