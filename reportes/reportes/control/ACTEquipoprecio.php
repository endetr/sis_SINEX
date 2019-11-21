<?php
/**
*@package pXP
*@file gen-ACTEquipoprecio.php
*@author  (admin)
*@date 22-03-2018 12:58:10
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTEquipoprecio extends ACTbase{    
			
	function listarEquipoprecio(){
		$this->objParam->defecto('ordenacion','id_equipoprecio');

		$this->objParam->defecto('dir_ordenacion','asc');
		
		if($this->objParam->getParametro('id_equipo')!=''){
			$this->objParam->addFiltro("epr.id_equipo = ".$this->objParam->getParametro('id_equipo'));
	    } else {
	    	$this->objParam->addFiltro("epr.id_equipo = 0");
	    }	
		
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODEquipoprecio','listarEquipoprecio');
		} else{
			$this->objFunc=$this->create('MODEquipoprecio');
			
			$this->res=$this->objFunc->listarEquipoprecio($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarEquipoprecio(){
		$this->objFunc=$this->create('MODEquipoprecio');	
		if($this->objParam->insertar('id_equipoprecio')){
			$this->res=$this->objFunc->insertarEquipoprecio($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarEquipoprecio($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarEquipoprecio(){
			$this->objFunc=$this->create('MODEquipoprecio');	
		$this->res=$this->objFunc->eliminarEquipoprecio($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>