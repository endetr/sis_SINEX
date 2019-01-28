<?php
/**
*@package pXP
*@file gen-ACTMcelecapantallamiento.php
*@author  (admin)
*@date 16-10-2018 20:00:23
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTMcelecapantallamiento extends ACTbase{    
			
	function listarMcelecapantallamiento(){
		$this->objParam->defecto('ordenacion','id_mcelecapantallamiento');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODMcelecapantallamiento','listarMcelecapantallamiento');
		} else{
			$this->objFunc=$this->create('MODMcelecapantallamiento');
			
			$this->res=$this->objFunc->listarMcelecapantallamiento($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarMcelecapantallamiento(){
		$this->objFunc=$this->create('MODMcelecapantallamiento');	
		if($this->objParam->insertar('id_mcelecapantallamiento')){
			$this->res=$this->objFunc->insertarMcelecapantallamiento($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarMcelecapantallamiento($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarMcelecapantallamiento(){
			$this->objFunc=$this->create('MODMcelecapantallamiento');	
		$this->res=$this->objFunc->eliminarMcelecapantallamiento($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>