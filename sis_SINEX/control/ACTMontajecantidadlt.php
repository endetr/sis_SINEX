<?php
/**
*@package pXP
*@file gen-ACTMontajecantidadlt.php
*@author  (admin)
*@date 19-07-2018 14:51:24
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTMontajecantidadlt extends ACTbase{    
			
	function listarMontajecantidadlt(){
		$this->objParam->defecto('ordenacion','id_montajecantidadlt');

		$this->objParam->defecto('dir_ordenacion','asc');
		
		if($this->objParam->getParametro('id_montajelt')!=''){
		$this->objParam->addFiltro("montc.id_montajelt = ".$this->objParam->getParametro('id_montajelt'));
	    }else {
	    	$this->objParam->addFiltro("montc.id_montajelt = 0");
	    }	
		
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODMontajecantidadlt','listarMontajecantidadlt');
		} else{
			$this->objFunc=$this->create('MODMontajecantidadlt');
			
			$this->res=$this->objFunc->listarMontajecantidadlt($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarMontajecantidadlt(){
		$this->objFunc=$this->create('MODMontajecantidadlt');	
		if($this->objParam->insertar('id_montajecantidadlt')){
			$this->res=$this->objFunc->insertarMontajecantidadlt($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarMontajecantidadlt($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarMontajecantidadlt(){
			$this->objFunc=$this->create('MODMontajecantidadlt');	
		$this->res=$this->objFunc->eliminarMontajecantidadlt($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>