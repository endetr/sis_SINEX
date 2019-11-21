<?php
/**
*@package pXP
*@file gen-ACTUcmoobracivil.php
*@author  (admin)
*@date 27-07-2018 16:54:44
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTUcmoobracivil extends ACTbase{    
			
	function listarUcmoobracivil(){
		$this->objParam->defecto('ordenacion','id_ucmoobracivil');

		$this->objParam->defecto('dir_ordenacion','asc');
		
		if($this->objParam->getParametro('id_ucmogrupo')!=''){
			$this->objParam->addFiltro("ucmoobci.id_ucmogrupo = ".$this->objParam->getParametro('id_ucmogrupo'));
	    } else {
	    	$this->objParam->addFiltro("ucmoobci.id_ucmogrupo = 0");
	    }
		
		
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODUcmoobracivil','listarUcmoobracivil');
		} else{
			$this->objFunc=$this->create('MODUcmoobracivil');
			
			$this->res=$this->objFunc->listarUcmoobracivil($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarUcmoobracivil(){
		$this->objFunc=$this->create('MODUcmoobracivil');	
		if($this->objParam->insertar('id_ucmoobracivil')){
			$this->res=$this->objFunc->insertarUcmoobracivil($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarUcmoobracivil($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarUcmoobracivil(){
			$this->objFunc=$this->create('MODUcmoobracivil');	
		$this->res=$this->objFunc->eliminarUcmoobracivil($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>