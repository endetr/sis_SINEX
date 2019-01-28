<?php
/**
*@package pXP
*@file gen-ACTObraciviles.php
*@author  (admin)
*@date 18-07-2018 15:01:57
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTObraciviles extends ACTbase{    
			
	function listarObraciviles(){
		$this->objParam->defecto('ordenacion','id_obrasciviles');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('id_unidadconstructivasb')!=''){
		$this->objParam->addFiltro("calc.id_unidadconstructivasb = ".$this->objParam->getParametro('id_unidadconstructivasb'));
	    }else{
			$this->objParam->addFiltro("calc.id_unidadconstructivasb = 1");
		}
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODObraciviles','listarObraciviles');
		} else{
			$this->objFunc=$this->create('MODObraciviles');
			
			$this->res=$this->objFunc->listarObraciviles($this->objParam);			
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
	
	function listarOtrosgastos(){
		$this->objParam->defecto('ordenacion','id_unidadconstructivasb');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('id_unidadconstructivasb')!=''){
		$this->objParam->addFiltro("calc.id_unidadconstructivasb =  ".$this->objParam->getParametro('id_unidadconstructivasb'));
	    }else{
			$this->objParam->addFiltro("calc.id_unidadconstructivasb = 1");
		}
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODObraciviles','listarOtrosgastos');
		} else{
			$this->objFunc=$this->create('MODObraciviles');
			$this->res=$this->objFunc->listarOtrosgastos($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}		
}

?>