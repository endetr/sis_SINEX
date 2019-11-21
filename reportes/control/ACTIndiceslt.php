<?php
/**
*@package pXP
*@file gen-ACTIndiceslt.php
*@author  (admin)
*@date 23-07-2018 15:53:45
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTIndiceslt extends ACTbase{    
			
	function listarIndiceslt(){
		$this->objParam->defecto('ordenacion','id_indicelt');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODIndiceslt','listarIndiceslt');
		} else{
			$this->objFunc=$this->create('MODIndiceslt');
			
			$this->res=$this->objFunc->listarIndiceslt($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarIndiceslt(){
		$this->objFunc=$this->create('MODIndiceslt');	
		if($this->objParam->insertar('id_indicelt')){
			$this->res=$this->objFunc->insertarIndiceslt($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarIndiceslt($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarIndiceslt(){
			$this->objFunc=$this->create('MODIndiceslt');	
		$this->res=$this->objFunc->eliminarIndiceslt($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>