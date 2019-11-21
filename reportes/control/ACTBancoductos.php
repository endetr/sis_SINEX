<?php
/**
*@package pXP
*@file gen-ACTBancoductos.php
*@author  (admin)
*@date 14-02-2019 17:57:56
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTBancoductos extends ACTbase{    
			
	function listarBancoductos(){
		$this->objParam->defecto('ordenacion','id_bancoductos');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODBancoductos','listarBancoductos');
		} else{
			$this->objFunc=$this->create('MODBancoductos');
			
			$this->res=$this->objFunc->listarBancoductos($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarBancoductos(){
		$this->objFunc=$this->create('MODBancoductos');	
		if($this->objParam->insertar('id_bancoductos')){
			$this->res=$this->objFunc->insertarBancoductos($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarBancoductos($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarBancoductos(){
			$this->objFunc=$this->create('MODBancoductos');	
		$this->res=$this->objFunc->eliminarBancoductos($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>