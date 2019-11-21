<?php
/**
*@package pXP
*@file gen-ACTHerrajeaccesorio.php
*@author  (admin)
*@date 07-05-2018 19:37:50
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTHerrajeaccesorio extends ACTbase{    
			
	function listarHerrajeaccesorio(){
		$this->objParam->defecto('ordenacion','id_herrajeaccesorio');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODHerrajeaccesorio','listarHerrajeaccesorio');
		} else{
			$this->objFunc=$this->create('MODHerrajeaccesorio');
			
			$this->res=$this->objFunc->listarHerrajeaccesorio($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarHerrajeaccesorio(){
		$this->objFunc=$this->create('MODHerrajeaccesorio');	
		if($this->objParam->insertar('id_herrajeaccesorio')){
			$this->res=$this->objFunc->insertarHerrajeaccesorio($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarHerrajeaccesorio($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarHerrajeaccesorio(){
			$this->objFunc=$this->create('MODHerrajeaccesorio');	
		$this->res=$this->objFunc->eliminarHerrajeaccesorio($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>