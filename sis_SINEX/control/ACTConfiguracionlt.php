<?php
/**
*@package pXP
*@file gen-ACTConfiguracionlt.php
*@author  (admin)
*@date 19-07-2018 14:36:46
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTConfiguracionlt extends ACTbase{    
			
	function listarConfiguracionlt(){
		$this->objParam->defecto('ordenacion','id_configuracionlt');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODConfiguracionlt','listarConfiguracionlt');
		} else{
			$this->objFunc=$this->create('MODConfiguracionlt');
			
			$this->res=$this->objFunc->listarConfiguracionlt($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarConfiguracionlt(){
		$this->objFunc=$this->create('MODConfiguracionlt');	
		if($this->objParam->insertar('id_configuracionlt')){
			$this->res=$this->objFunc->insertarConfiguracionlt($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarConfiguracionlt($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarConfiguracionlt(){
			$this->objFunc=$this->create('MODConfiguracionlt');	
		$this->res=$this->objFunc->eliminarConfiguracionlt($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>