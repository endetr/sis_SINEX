<?php
/**
*@package pXP
*@file gen-ACTUcsbvalorarouc.php
*@author  (admin)
*@date 13-11-2018 18:53:49
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTUcsbvalorarouc extends ACTbase{    
			
	function listarUcsbvalorarouc(){
		$this->objParam->defecto('ordenacion','id_ucsbvalorarouc');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('id_ucsbvalorar')!=''){
			$this->objParam->addFiltro("sbuc.id_ucsbvalorar = ".$this->objParam->getParametro('id_ucsbvalorar'));
	    } else {
	    	$this->objParam->addFiltro("sbuc.id_ucsbvalorar = 0");
	    }
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODUcsbvalorarouc','listarUcsbvalorarouc');
		} else{
			$this->objFunc=$this->create('MODUcsbvalorarouc');
			
			$this->res=$this->objFunc->listarUcsbvalorarouc($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarUcsbvalorarouc(){
		$this->objFunc=$this->create('MODUcsbvalorarouc');	
		if($this->objParam->insertar('id_ucsbvalorarouc')){
			$this->res=$this->objFunc->insertarUcsbvalorarouc($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarUcsbvalorarouc($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarUcsbvalorarouc(){
			$this->objFunc=$this->create('MODUcsbvalorarouc');	
		$this->res=$this->objFunc->eliminarUcsbvalorarouc($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
	function listarOtrasunidades(){
		$this->objParam->defecto('ordenacion','id_otraunidad');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODUcsbvalorarouc','listarOtrasunidades');
		} else{
			$this->objFunc=$this->create('MODUcsbvalorarouc');
			
			$this->res=$this->objFunc->listarOtrasunidades($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}			
}

?>