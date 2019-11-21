<?php
/**
*@package pXP
*@file gen-ACTUeepotros.php
*@author  (admin)
*@date 12-10-2018 16:53:37
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTUeepotros extends ACTbase{    
			
	function listarUeepotros(){
		$this->objParam->defecto('ordenacion','id_uceepotros');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('id_unidadconstructivaeep')!=''){
		$this->objParam->addFiltro("tuco.id_unidadconstructivaeep = ".$this->objParam->getParametro('id_unidadconstructivaeep'));
	    }else {
	    	$this->objParam->addFiltro("tuco.id_unidadconstructivaeep = 0");
	    }
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODUeepotros','listarUeepotros');
		} else{
			$this->objFunc=$this->create('MODUeepotros');
			
			$this->res=$this->objFunc->listarUeepotros($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarUeepotros(){
		$this->objFunc=$this->create('MODUeepotros');	
		if($this->objParam->insertar('id_uceepotros')){
			$this->res=$this->objFunc->insertarUeepotros($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarUeepotros($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarUeepotros(){
			$this->objFunc=$this->create('MODUeepotros');	
		$this->res=$this->objFunc->eliminarUeepotros($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>