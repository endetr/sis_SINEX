<?php
/**
*@package pXP
*@file gen-ACTPararrayatolinea.php
*@author  (admin)
*@date 07-05-2018 19:37:48
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTPararrayatolinea extends ACTbase{    
			
	function listarPararrayatolinea(){
		$this->objParam->defecto('ordenacion','id_pararrayolinea');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODPararrayatolinea','listarPararrayatolinea');
		} else{
			$this->objFunc=$this->create('MODPararrayatolinea');
			
			$this->res=$this->objFunc->listarPararrayatolinea($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarPararrayatolinea(){
		$this->objFunc=$this->create('MODPararrayatolinea');	
		if($this->objParam->insertar('id_pararrayolinea')){
			$this->res=$this->objFunc->insertarPararrayatolinea($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarPararrayatolinea($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarPararrayatolinea(){
			$this->objFunc=$this->create('MODPararrayatolinea');	
		$this->res=$this->objFunc->eliminarPararrayatolinea($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>