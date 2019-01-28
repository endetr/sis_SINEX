<?php
/**
*@package pXP
*@file gen-ACTObracivilcantidadlt.php
*@author  (admin)
*@date 25-07-2018 18:42:06
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTObracivilcantidadlt extends ACTbase{    
			
	function listarObracivilcantidadlt(){
		$this->objParam->defecto('ordenacion','id_obracivilcantidadlt');

		$this->objParam->defecto('dir_ordenacion','asc');
		
		if($this->objParam->getParametro('id_obracivillt')!=''){
		$this->objParam->addFiltro("occlt.id_obracivillt = ".$this->objParam->getParametro('id_obracivillt'));
	    }else {
	    	$this->objParam->addFiltro("occlt.id_obracivillt = 0");
	    }	
		
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODObracivilcantidadlt','listarObracivilcantidadlt');
		} else{
			$this->objFunc=$this->create('MODObracivilcantidadlt');
			
			$this->res=$this->objFunc->listarObracivilcantidadlt($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarObracivilcantidadlt(){
		$this->objFunc=$this->create('MODObracivilcantidadlt');	
		if($this->objParam->insertar('id_obracivilcantidadlt')){
			$this->res=$this->objFunc->insertarObracivilcantidadlt($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarObracivilcantidadlt($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarObracivilcantidadlt(){
			$this->objFunc=$this->create('MODObracivilcantidadlt');	
		$this->res=$this->objFunc->eliminarObracivilcantidadlt($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>