<?php
/**
*@package pXP
*@file gen-ACTUcedifobracivil.php
*@author  (admin)
*@date 27-07-2018 14:52:35
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTUcedifobracivil extends ACTbase{    
			
	function listarUcedifobracivil(){
		$this->objParam->defecto('ordenacion','id_ucedifobracivil');

		$this->objParam->defecto('dir_ordenacion','asc');
		
		if($this->objParam->getParametro('id_ucedifsubgrupo')!=''){
			$this->objParam->addFiltro("udoc.id_ucedifsubgrupo = ".$this->objParam->getParametro('id_ucedifsubgrupo'));
	    } else {
	    	$this->objParam->addFiltro("udoc.id_ucedifsubgrupo = 0");
	    }
		
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODUcedifobracivil','listarUcedifobracivil');
		} else{
			$this->objFunc=$this->create('MODUcedifobracivil');
			
			$this->res=$this->objFunc->listarUcedifobracivil($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarUcedifobracivil(){
		$this->objFunc=$this->create('MODUcedifobracivil');	
		if($this->objParam->insertar('id_ucedifobracivil')){
			$this->res=$this->objFunc->insertarUcedifobracivil($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarUcedifobracivil($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarUcedifobracivil(){
			$this->objFunc=$this->create('MODUcedifobracivil');	
		$this->res=$this->objFunc->eliminarUcedifobracivil($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>