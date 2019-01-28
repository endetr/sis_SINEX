<?php
/**
*@package pXP
*@file gen-ACTUcedifsubgrupo.php
*@author  (admin)
*@date 27-07-2018 14:52:38
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTUcedifsubgrupo extends ACTbase{    
			
	function listarUcedifsubgrupo(){
		$this->objParam->defecto('ordenacion','id_ucedifsubgrupo');

		$this->objParam->defecto('dir_ordenacion','asc');
		
		if($this->objParam->getParametro('id_ucedifgrupo')!=''){
			$this->objParam->addFiltro("udsg.id_ucedifgrupo = ".$this->objParam->getParametro('id_ucedifgrupo'));
	    } else {
	    	$this->objParam->addFiltro("udsg.id_ucedifgrupo = 0");
	    }
		
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODUcedifsubgrupo','listarUcedifsubgrupo');
		} else{
			$this->objFunc=$this->create('MODUcedifsubgrupo');
			
			$this->res=$this->objFunc->listarUcedifsubgrupo($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarUcedifsubgrupo(){
		$this->objFunc=$this->create('MODUcedifsubgrupo');	
		if($this->objParam->insertar('id_ucedifsubgrupo')){
			$this->res=$this->objFunc->insertarUcedifsubgrupo($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarUcedifsubgrupo($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarUcedifsubgrupo(){
			$this->objFunc=$this->create('MODUcedifsubgrupo');	
		$this->res=$this->objFunc->eliminarUcedifsubgrupo($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>