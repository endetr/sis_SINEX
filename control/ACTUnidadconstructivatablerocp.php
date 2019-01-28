<?php
/**
*@package pXP
*@file gen-ACTUnidadconstructivatablerocp.php
*@author  (admin)
*@date 11-10-2018 19:42:39
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTUnidadconstructivatablerocp extends ACTbase{    
			
	function listarUnidadconstructivatablerocp(){
		$this->objParam->defecto('ordenacion','id_unidadconstructivatablerocp');

		$this->objParam->defecto('dir_ordenacion','asc');
		
		if($this->objParam->getParametro('id_unidadconstructivaenctablerocp')!=''){
		$this->objParam->addFiltro("uctcp.id_unidadconstructivaenctablerocp = ".$this->objParam->getParametro('id_unidadconstructivaenctablerocp'));
	    }else {
	    	$this->objParam->addFiltro("uctcp.id_unidadconstructivaenctablerocp = 0");
	    }
		
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODUnidadconstructivatablerocp','listarUnidadconstructivatablerocp');
		} else{
			$this->objFunc=$this->create('MODUnidadconstructivatablerocp');
			
			$this->res=$this->objFunc->listarUnidadconstructivatablerocp($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarUnidadconstructivatablerocp(){
		$this->objFunc=$this->create('MODUnidadconstructivatablerocp');	
		if($this->objParam->insertar('id_unidadconstructivatablerocp')){
			$this->res=$this->objFunc->insertarUnidadconstructivatablerocp($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarUnidadconstructivatablerocp($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarUnidadconstructivatablerocp(){
			$this->objFunc=$this->create('MODUnidadconstructivatablerocp');	
		$this->res=$this->objFunc->eliminarUnidadconstructivatablerocp($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>