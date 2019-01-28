<?php
/**
*@package pXP
*@file gen-ACTObracivilpreciolt.php
*@author  (admin)
*@date 25-07-2018 15:23:24
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTObracivilpreciolt extends ACTbase{    
			
	function listarObracivilpreciolt(){
		$this->objParam->defecto('ordenacion','id_obracivilpreciolt');

		$this->objParam->defecto('dir_ordenacion','asc');
		
		if($this->objParam->getParametro('id_obracivillt')!=''){
		$this->objParam->addFiltro("ocltp.id_obracivillt = ".$this->objParam->getParametro('id_obracivillt'));
	    }else {
	    	$this->objParam->addFiltro("ocltp.id_obracivillt = 0");
	    }	
		
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODObracivilpreciolt','listarObracivilpreciolt');
		} else{
			$this->objFunc=$this->create('MODObracivilpreciolt');
			
			$this->res=$this->objFunc->listarObracivilpreciolt($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarObracivilpreciolt(){
		$this->objFunc=$this->create('MODObracivilpreciolt');	
		if($this->objParam->insertar('id_obracivilpreciolt')){
			$this->res=$this->objFunc->insertarObracivilpreciolt($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarObracivilpreciolt($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarObracivilpreciolt(){
			$this->objFunc=$this->create('MODObracivilpreciolt');	
		$this->res=$this->objFunc->eliminarObracivilpreciolt($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>