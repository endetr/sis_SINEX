<?php
/**
*@package pXP
*@file gen-ACTMontajepreciolt.php
*@author  (admin)
*@date 19-07-2018 13:29:16
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTMontajepreciolt extends ACTbase{    
			
	function listarMontajepreciolt(){
		$this->objParam->defecto('ordenacion','id_montajepreciolt');

		$this->objParam->defecto('dir_ordenacion','asc');
		
		if($this->objParam->getParametro('id_montajelt')!=''){
		$this->objParam->addFiltro("montp.id_montajelt = ".$this->objParam->getParametro('id_montajelt'));
	    }else {
	    	$this->objParam->addFiltro("montp.id_montajelt = 0");
	    }
		
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODMontajepreciolt','listarMontajepreciolt');
		} else{
			$this->objFunc=$this->create('MODMontajepreciolt');
			
			$this->res=$this->objFunc->listarMontajepreciolt($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarMontajepreciolt(){
		$this->objFunc=$this->create('MODMontajepreciolt');	
		if($this->objParam->insertar('id_montajepreciolt')){
			$this->res=$this->objFunc->insertarMontajepreciolt($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarMontajepreciolt($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarMontajepreciolt(){
			$this->objFunc=$this->create('MODMontajepreciolt');	
		$this->res=$this->objFunc->eliminarMontajepreciolt($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>