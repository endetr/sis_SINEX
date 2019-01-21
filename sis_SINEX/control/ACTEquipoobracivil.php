<?php
/**
*@package pXP
*@file gen-ACTEquipoobracivil.php
*@author  (admin)
*@date 13-11-2018 13:39:04
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTEquipoobracivil extends ACTbase{    
			
	function listarEquipoobracivil(){
		$this->objParam->defecto('ordenacion','id_equipoobracivil');

		$this->objParam->defecto('dir_ordenacion','asc');
		
		if($this->objParam->getParametro('id_equipo')!=''){
			$this->objParam->addFiltro("eocme.id_equipo = ".$this->objParam->getParametro('id_equipo'));
	    } else {
	    	$this->objParam->addFiltro("eocme.id_equipo = 0");
	    }
		
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODEquipoobracivil','listarEquipoobracivil');
		} else{
			$this->objFunc=$this->create('MODEquipoobracivil');
			
			$this->res=$this->objFunc->listarEquipoobracivil($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarEquipoobracivil(){
		$this->objFunc=$this->create('MODEquipoobracivil');	
		if($this->objParam->insertar('id_equipoobracivil')){
			$this->res=$this->objFunc->insertarEquipoobracivil($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarEquipoobracivil($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarEquipoobracivil(){
			$this->objFunc=$this->create('MODEquipoobracivil');	
		$this->res=$this->objFunc->eliminarEquipoobracivil($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>