<?php
/**
*@package pXP
*@file gen-ACTUnidadconstructivaseraux.php
*@author  (admin)
*@date 11-10-2018 19:42:10
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTUnidadconstructivaseraux extends ACTbase{    
			
	function listarUnidadconstructivaseraux(){
		$this->objParam->defecto('ordenacion','id_unidadconstructivaseraux');

		$this->objParam->defecto('dir_ordenacion','asc');
		
		if($this->objParam->getParametro('unidadconstructivaencseraux')!=''){
		$this->objParam->addFiltro("ucsaux.unidadconstructivaencseraux = ".$this->objParam->getParametro('unidadconstructivaencseraux'));
	    }else {
	    	$this->objParam->addFiltro("ucsaux.unidadconstructivaencseraux = 0");
	    }
		
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODUnidadconstructivaseraux','listarUnidadconstructivaseraux');
		} else{
			$this->objFunc=$this->create('MODUnidadconstructivaseraux');
			
			$this->res=$this->objFunc->listarUnidadconstructivaseraux($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarUnidadconstructivaseraux(){
		$this->objFunc=$this->create('MODUnidadconstructivaseraux');	
		if($this->objParam->insertar('id_unidadconstructivaseraux')){
			$this->res=$this->objFunc->insertarUnidadconstructivaseraux($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarUnidadconstructivaseraux($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarUnidadconstructivaseraux(){
			$this->objFunc=$this->create('MODUnidadconstructivaseraux');	
		$this->res=$this->objFunc->eliminarUnidadconstructivaseraux($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>