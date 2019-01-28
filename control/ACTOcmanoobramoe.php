<?php
/**
*@package pXP
*@file gen-ACTOcmanoobramoe.php
*@author  (admin)
*@date 30-08-2018 15:37:36
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTOcmanoobramoe extends ACTbase{    
			
	function listarOcmanoobramoe(){
		$this->objParam->defecto('ordenacion','id_ocmanoobramoe');

		$this->objParam->defecto('dir_ordenacion','asc');
		
		if($this->objParam->getParametro('id_obracivilmoe')!=''){
			$this->objParam->addFiltro("ocmo.id_obracivilmoe = ".$this->objParam->getParametro('id_obracivilmoe'));
	    } else {
	    	$this->objParam->addFiltro("ocmo.id_obracivilmoe = 0");
	    }	
		
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODOcmanoobramoe','listarOcmanoobramoe');
		} else{
			$this->objFunc=$this->create('MODOcmanoobramoe');
			
			$this->res=$this->objFunc->listarOcmanoobramoe($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarOcmanoobramoe(){
		$this->objFunc=$this->create('MODOcmanoobramoe');	
		if($this->objParam->insertar('id_ocmanoobramoe')){
			$this->res=$this->objFunc->insertarOcmanoobramoe($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarOcmanoobramoe($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarOcmanoobramoe(){
			$this->objFunc=$this->create('MODOcmanoobramoe');	
		$this->res=$this->objFunc->eliminarOcmanoobramoe($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>