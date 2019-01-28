<?php
/**
*@package pXP
*@file gen-ACTPuc3359293359291.php
*@author  (admin)
*@date 31-07-2018 15:35:43
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTPuc3359293359291 extends ACTbase{    
			
	function listarPuc3359293359291(){
		$this->objParam->defecto('ordenacion','id_puc3359293359291');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODPuc3359293359291','listarPuc3359293359291');
		} else{
			$this->objFunc=$this->create('MODPuc3359293359291');
			
			$this->res=$this->objFunc->listarPuc3359293359291($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarPuc3359293359291(){
		$this->objFunc=$this->create('MODPuc3359293359291');	
		if($this->objParam->insertar('id_puc3359293359291')){
			$this->res=$this->objFunc->insertarPuc3359293359291($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarPuc3359293359291($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarPuc3359293359291(){
			$this->objFunc=$this->create('MODPuc3359293359291');	
		$this->res=$this->objFunc->eliminarPuc3359293359291($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>