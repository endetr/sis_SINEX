<?php
/**
*@package pXP
*@file gen-ACTPcu335313335313.php
*@author  (admin)
*@date 31-07-2018 15:35:48
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTPcu335313335313 extends ACTbase{    
			
	function listarPcu335313335313(){
		$this->objParam->defecto('ordenacion','id_pcu335313335313');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODPcu335313335313','listarPcu335313335313');
		} else{
			$this->objFunc=$this->create('MODPcu335313335313');
			
			$this->res=$this->objFunc->listarPcu335313335313($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarPcu335313335313(){
		$this->objFunc=$this->create('MODPcu335313335313');	
		if($this->objParam->insertar('id_pcu335313335313')){
			$this->res=$this->objFunc->insertarPcu335313335313($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarPcu335313335313($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarPcu335313335313(){
			$this->objFunc=$this->create('MODPcu335313335313');	
		$this->res=$this->objFunc->eliminarPcu335313335313($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>