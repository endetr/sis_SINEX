<?php
/**
*@package pXP
*@file gen-ACTAreaprotegida.php
*@author  (admin)
*@date 05-09-2018 13:04:44
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTAreaprotegida extends ACTbase{    
			
	function listarAreaprotegida(){
		$this->objParam->defecto('ordenacion','id_areaprotegida');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODAreaprotegida','listarAreaprotegida');
		} else{
			$this->objFunc=$this->create('MODAreaprotegida');
			
			$this->res=$this->objFunc->listarAreaprotegida($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarAreaprotegida(){
		$this->objFunc=$this->create('MODAreaprotegida');	
		if($this->objParam->insertar('id_areaprotegida')){
			$this->res=$this->objFunc->insertarAreaprotegida($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarAreaprotegida($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarAreaprotegida(){
			$this->objFunc=$this->create('MODAreaprotegida');	
		$this->res=$this->objFunc->eliminarAreaprotegida($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>