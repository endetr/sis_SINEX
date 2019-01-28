<?php
/**
*@package pXP
*@file gen-ACTUcltvaloraruc.php
*@author  (admin)
*@date 01-11-2018 15:13:41
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTUcltvaloraruc extends ACTbase{    
			
	function listarUcltvaloraruc(){
		$this->objParam->defecto('ordenacion','id_ucltvaloraruc');

		$this->objParam->defecto('dir_ordenacion','asc');
		
		if($this->objParam->getParametro('id_ucltvalorar')!=''){
			$this->objParam->addFiltro("vuclt.id_ucltvalorar = ".$this->objParam->getParametro('id_ucltvalorar'));
	    } else {
	    	$this->objParam->addFiltro("vuclt.id_ucltvalorar = 0");
	    }
		
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODUcltvaloraruc','listarUcltvaloraruc');
		} else{
			$this->objFunc=$this->create('MODUcltvaloraruc');
			
			$this->res=$this->objFunc->listarUcltvaloraruc($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarUcltvaloraruc(){
		$this->objFunc=$this->create('MODUcltvaloraruc');	
		if($this->objParam->insertar('id_ucltvaloraruc')){
			$this->res=$this->objFunc->insertarUcltvaloraruc($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarUcltvaloraruc($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarUcltvaloraruc(){
			$this->objFunc=$this->create('MODUcltvaloraruc');	
		$this->res=$this->objFunc->eliminarUcltvaloraruc($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>