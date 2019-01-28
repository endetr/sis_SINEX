<?php
/**
*@package pXP
*@file gen-ACTUcsbvalorarcuc.php
*@author  (admin)
*@date 09-11-2018 18:38:46
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTUcsbvalorarcuc extends ACTbase{    
			
	function listarUcsbvalorarcuc(){
		$this->objParam->defecto('ordenacion','id_ucsvalorarcuc');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('id_ucsbvalorar')!=''){
			$this->objParam->addFiltro("sbvc.id_ucsbvalorar = ".$this->objParam->getParametro('id_ucsbvalorar'));
	    } else {
	    	$this->objParam->addFiltro("sbvc.id_ucsbvalorar = 0");
	    }
		
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODUcsbvalorarcuc','listarUcsbvalorarcuc');
		} else{
			$this->objFunc=$this->create('MODUcsbvalorarcuc');
			
			$this->res=$this->objFunc->listarUcsbvalorarcuc($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarUcsbvalorarcuc(){
		$this->objFunc=$this->create('MODUcsbvalorarcuc');	
		if($this->objParam->insertar('id_ucsvalorarcuc')){
			$this->res=$this->objFunc->insertarUcsbvalorarcuc($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarUcsbvalorarcuc($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarUcsbvalorarcuc(){
			$this->objFunc=$this->create('MODUcsbvalorarcuc');	
		$this->res=$this->objFunc->eliminarUcsbvalorarcuc($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>