<?php
/**
*@package pXP
*@file gen-ACTMaquinariaobracivil.php
*@author  (admin)
*@date 13-11-2018 13:55:26
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTMaquinariaobracivil extends ACTbase{    
			
	function listarMaquinariaobracivil(){
		$this->objParam->defecto('ordenacion','id_maquinariaobracivil');

		$this->objParam->defecto('dir_ordenacion','asc');
		
		if($this->objParam->getParametro('id_maquinaria')!=''){
			$this->objParam->addFiltro("mocme.id_maquinaria = ".$this->objParam->getParametro('id_maquinaria'));
	    } else {
	    	$this->objParam->addFiltro("mocme.id_maquinaria = 0");
	    }
		
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODMaquinariaobracivil','listarMaquinariaobracivil');
		} else{
			$this->objFunc=$this->create('MODMaquinariaobracivil');
			
			$this->res=$this->objFunc->listarMaquinariaobracivil($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarMaquinariaobracivil(){
		$this->objFunc=$this->create('MODMaquinariaobracivil');	
		if($this->objParam->insertar('id_maquinariaobracivil')){
			$this->res=$this->objFunc->insertarMaquinariaobracivil($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarMaquinariaobracivil($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarMaquinariaobracivil(){
			$this->objFunc=$this->create('MODMaquinariaobracivil');	
		$this->res=$this->objFunc->eliminarMaquinariaobracivil($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>