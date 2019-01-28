<?php
/**
*@package pXP
*@file gen-ACTPcu335311335311.php
*@author  (admin)
*@date 31-07-2018 15:36:00
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTPcu335311335311 extends ACTbase{    
			
	function listarPcu335311335311(){
		$this->objParam->defecto('ordenacion','id_pcu335311335311');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODPcu335311335311','listarPcu335311335311');
		} else{
			$this->objFunc=$this->create('MODPcu335311335311');
			
			$this->res=$this->objFunc->listarPcu335311335311($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarPcu335311335311(){
		$this->objFunc=$this->create('MODPcu335311335311');	
		if($this->objParam->insertar('id_pcu335311335311')){
			$this->res=$this->objFunc->insertarPcu335311335311($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarPcu335311335311($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarPcu335311335311(){
			$this->objFunc=$this->create('MODPcu335311335311');	
		$this->res=$this->objFunc->eliminarPcu335311335311($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>