<?php
/**
*@package pXP
*@file gen-ACTListafactoresindexacion.php
*@author  (admin)
*@date 31-07-2018 21:00:40
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTListafactoresindexacion extends ACTbase{    
			
	function listarListafactoresindexacion(){
		$this->objParam->defecto('ordenacion','id_factorindexacion');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODListafactoresindexacion','listarListafactoresindexacion');
		} else{
			$this->objFunc=$this->create('MODListafactoresindexacion');
			
			$this->res=$this->objFunc->listarListafactoresindexacion($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarListafactoresindexacion(){
		$this->objFunc=$this->create('MODListafactoresindexacion');	
		if($this->objParam->insertar('id_factorindexacion')){
			$this->res=$this->objFunc->insertarListafactoresindexacion($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarListafactoresindexacion($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarListafactoresindexacion(){
			$this->objFunc=$this->create('MODListafactoresindexacion');	
		$this->res=$this->objFunc->eliminarListafactoresindexacion($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>