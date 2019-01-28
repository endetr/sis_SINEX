<?php
/**
*@package pXP
*@file gen-ACTPuc33123312.php
*@author  (admin)
*@date 31-07-2018 15:35:32
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTPuc33123312 extends ACTbase{    
			
	function listarPuc33123312(){
		$this->objParam->defecto('ordenacion','id_pcu33123312');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODPuc33123312','listarPuc33123312');
		} else{
			$this->objFunc=$this->create('MODPuc33123312');
			
			$this->res=$this->objFunc->listarPuc33123312($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarPuc33123312(){
		$this->objFunc=$this->create('MODPuc33123312');	
		if($this->objParam->insertar('id_pcu33123312')){
			$this->res=$this->objFunc->insertarPuc33123312($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarPuc33123312($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarPuc33123312(){
			$this->objFunc=$this->create('MODPuc33123312');	
		$this->res=$this->objFunc->eliminarPuc33123312($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>