<?php
/**
*@package pXP
*@file gen-ACTNivelcontaminacionlt.php
*@author  (admin)
*@date 04-09-2018 18:41:39
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTNivelcontaminacionlt extends ACTbase{    
			
	function listarNivelcontaminacionlt(){
		$this->objParam->defecto('ordenacion','id_nivelcontaminacionlt');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODNivelcontaminacionlt','listarNivelcontaminacionlt');
		} else{
			$this->objFunc=$this->create('MODNivelcontaminacionlt');
			
			$this->res=$this->objFunc->listarNivelcontaminacionlt($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarNivelcontaminacionlt(){
		$this->objFunc=$this->create('MODNivelcontaminacionlt');	
		if($this->objParam->insertar('id_nivelcontaminacionlt')){
			$this->res=$this->objFunc->insertarNivelcontaminacionlt($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarNivelcontaminacionlt($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarNivelcontaminacionlt(){
			$this->objFunc=$this->create('MODNivelcontaminacionlt');	
		$this->res=$this->objFunc->eliminarNivelcontaminacionlt($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>