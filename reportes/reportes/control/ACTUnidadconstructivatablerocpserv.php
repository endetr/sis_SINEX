<?php
/**
*@package pXP
*@file gen-ACTUnidadconstructivatablerocpserv.php
*@author  (admin)
*@date 15-11-2018 14:02:13
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTUnidadconstructivatablerocpserv extends ACTbase{    
			
	function listarUnidadconstructivatablerocpserv(){
		$this->objParam->defecto('ordenacion','id_unidadconstructivatablerocpserv');

		$this->objParam->defecto('dir_ordenacion','asc');
		
		if($this->objParam->getParametro('id_unidadconstructivaenctablerocp')!=''){
		$this->objParam->addFiltro("uctcserv.id_unidadconstructivaenctablerocp = ".$this->objParam->getParametro('id_unidadconstructivaenctablerocp'));
	    }else {
	    	$this->objParam->addFiltro("uctcserv.id_unidadconstructivaenctablerocp = 0");
	    }
		
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODUnidadconstructivatablerocpserv','listarUnidadconstructivatablerocpserv');
		} else{
			$this->objFunc=$this->create('MODUnidadconstructivatablerocpserv');
			
			$this->res=$this->objFunc->listarUnidadconstructivatablerocpserv($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarUnidadconstructivatablerocpserv(){
		$this->objFunc=$this->create('MODUnidadconstructivatablerocpserv');	
		if($this->objParam->insertar('id_unidadconstructivatablerocpserv')){
			$this->res=$this->objFunc->insertarUnidadconstructivatablerocpserv($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarUnidadconstructivatablerocpserv($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarUnidadconstructivatablerocpserv(){
			$this->objFunc=$this->create('MODUnidadconstructivatablerocpserv');	
		$this->res=$this->objFunc->eliminarUnidadconstructivatablerocpserv($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>