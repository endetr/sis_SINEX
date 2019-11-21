<?php
/**
*@package pXP
*@file gen-ACTUnidadconstructivacomun.php
*@author  (admin)
*@date 11-10-2018 19:42:28
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTUnidadconstructivacomun extends ACTbase{    
			
	function listarUnidadconstructivacomun(){
		$this->objParam->defecto('ordenacion','id_unidadconstructivacomun');

		$this->objParam->defecto('dir_ordenacion','asc');
		
		if($this->objParam->getParametro('id_unidadconstructivaenccomun')!=''){
		$this->objParam->addFiltro("uccom.id_unidadconstructivaenccomun = ".$this->objParam->getParametro('id_unidadconstructivaenccomun'));
	    }else {
	    	$this->objParam->addFiltro("uccom.id_unidadconstructivaenccomun = 0");
	    }
		
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODUnidadconstructivacomun','listarUnidadconstructivacomun');
		} else{
			$this->objFunc=$this->create('MODUnidadconstructivacomun');
			
			$this->res=$this->objFunc->listarUnidadconstructivacomun($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarUnidadconstructivacomun(){
		$this->objFunc=$this->create('MODUnidadconstructivacomun');	
		if($this->objParam->insertar('id_unidadconstructivacomun')){
			$this->res=$this->objFunc->insertarUnidadconstructivacomun($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarUnidadconstructivacomun($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarUnidadconstructivacomun(){
			$this->objFunc=$this->create('MODUnidadconstructivacomun');	
		$this->res=$this->objFunc->eliminarUnidadconstructivacomun($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>