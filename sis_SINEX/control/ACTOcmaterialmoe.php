<?php
/**
*@package pXP
*@file gen-ACTOcmaterialmoe.php
*@author  (admin)
*@date 30-08-2018 15:37:04
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTOcmaterialmoe extends ACTbase{    
			
	function listarOcmaterialmoe(){
		$this->objParam->defecto('ordenacion','id_ocmaterialmoe');

		$this->objParam->defecto('dir_ordenacion','asc');		
		if($this->objParam->getParametro('id_obracivilmoe')!=''){
			$this->objParam->addFiltro("ocm.id_obracivilmoe = ".$this->objParam->getParametro('id_obracivilmoe'));
	    } else {
	    	$this->objParam->addFiltro("ocm.id_obracivilmoe = 0");
	    }			
		
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODOcmaterialmoe','listarOcmaterialmoe');
		} else{
			$this->objFunc=$this->create('MODOcmaterialmoe');
			
			$this->res=$this->objFunc->listarOcmaterialmoe($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarOcmaterialmoe(){
		$this->objFunc=$this->create('MODOcmaterialmoe');	
		if($this->objParam->insertar('id_ocmaterialmoe')){
			$this->res=$this->objFunc->insertarOcmaterialmoe($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarOcmaterialmoe($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarOcmaterialmoe(){
			$this->objFunc=$this->create('MODOcmaterialmoe');	
		$this->res=$this->objFunc->eliminarOcmaterialmoe($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>