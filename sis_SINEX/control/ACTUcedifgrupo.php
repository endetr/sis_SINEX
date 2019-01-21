<?php
/**
*@package pXP
*@file gen-ACTUcedifgrupo.php
*@author  (admin)
*@date 27-07-2018 14:52:40
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTUcedifgrupo extends ACTbase{    
			
	function listarUcedifgrupo(){
		$this->objParam->defecto('ordenacion','id_ucedifgrupo');

		$this->objParam->defecto('dir_ordenacion','asc');
		
		if($this->objParam->getParametro('id_unidadconstructivaedif')!=''){
			$this->objParam->addFiltro("udg.id_unidadconstructivaedif = ".$this->objParam->getParametro('id_unidadconstructivaedif'));
	    } else {
	    	$this->objParam->addFiltro("udg.id_unidadconstructivaedif = 0");
	    }
		
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODUcedifgrupo','listarUcedifgrupo');
		} else{
			$this->objFunc=$this->create('MODUcedifgrupo');
			
			$this->res=$this->objFunc->listarUcedifgrupo($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarUcedifgrupo(){
		$this->objFunc=$this->create('MODUcedifgrupo');	
		if($this->objParam->insertar('id_ucedifgrupo')){
			$this->res=$this->objFunc->insertarUcedifgrupo($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarUcedifgrupo($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarUcedifgrupo(){
			$this->objFunc=$this->create('MODUcedifgrupo');	
		$this->res=$this->objFunc->eliminarUcedifgrupo($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>