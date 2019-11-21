<?php
/**
*@package pXP
*@file gen-ACTEquipomaterial.php
*@author  (admin)
*@date 09-07-2018 16:12:16
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTEquipomaterial extends ACTbase{    
			
	function listarEquipomaterial(){
		$this->objParam->defecto('ordenacion','id_equipomaterial');

		$this->objParam->defecto('dir_ordenacion','asc');		
		
		if($this->objParam->getParametro('id_equipo')!=''){
			$this->objParam->addFiltro("eqma.id_equipo = ".$this->objParam->getParametro('id_equipo'));
	    } else {
	    	$this->objParam->addFiltro("eqma.id_equipo = 0");
	    }	
		
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODEquipomaterial','listarEquipomaterial');
		} else{
			$this->objFunc=$this->create('MODEquipomaterial');
			
			$this->res=$this->objFunc->listarEquipomaterial($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarEquipomaterial(){
		$this->objFunc=$this->create('MODEquipomaterial');	
		if($this->objParam->insertar('id_equipomaterial')){
			$this->res=$this->objFunc->insertarEquipomaterial($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarEquipomaterial($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarEquipomaterial(){
			$this->objFunc=$this->create('MODEquipomaterial');	
		$this->res=$this->objFunc->eliminarEquipomaterial($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>