<?php
/**
*@package pXP
*@file gen-ACTOcmaquinariamoe.php
*@author  (admin)
*@date 30-08-2018 15:37:28
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTOcmaquinariamoe extends ACTbase{    
			
	function listarOcmaquinariamoe(){
		$this->objParam->defecto('ordenacion','id_ocmaquinariamoe');

		$this->objParam->defecto('dir_ordenacion','asc');
		
		if($this->objParam->getParametro('id_obracivilmoe')!=''){
			$this->objParam->addFiltro("ocmaq.id_obracivilmoe = ".$this->objParam->getParametro('id_obracivilmoe'));
	    } else {
	    	$this->objParam->addFiltro("ocmaq.id_obracivilmoe = 0");
	    }	
		
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODOcmaquinariamoe','listarOcmaquinariamoe');
		} else{
			$this->objFunc=$this->create('MODOcmaquinariamoe');
			
			$this->res=$this->objFunc->listarOcmaquinariamoe($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarOcmaquinariamoe(){
		$this->objFunc=$this->create('MODOcmaquinariamoe');	
		if($this->objParam->insertar('id_ocmaquinariamoe')){
			$this->res=$this->objFunc->insertarOcmaquinariamoe($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarOcmaquinariamoe($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarOcmaquinariamoe(){
			$this->objFunc=$this->create('MODOcmaquinariamoe');	
		$this->res=$this->objFunc->eliminarOcmaquinariamoe($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>