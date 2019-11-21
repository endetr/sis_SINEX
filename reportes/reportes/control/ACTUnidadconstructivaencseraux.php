<?php
/**
*@package pXP
*@file gen-ACTUnidadconstructivaencseraux.php
*@author  (admin)
*@date 14-11-2018 20:35:13
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTUnidadconstructivaencseraux extends ACTbase{    
			
	function copiarUCSAUX()
	{
		$cone=new conexion();
		if($this->tipo_conexion=='persistente'){
			//echo 'fff';exit;
			$link=$cone->conectarp();
		}
	    elseif($this->tipo_conexion=='seguridad'){
	    	//echo 'aaa';exit;
			$link=$cone->conectarSegu();
		}
		else{
			//echo 'sss';exit;
			$link=$cone->conectarnp($this->remote);
		}
		
		if($link==0){

			$this->res->imprimirRespuesta('No se puede conectar a la base de datos','Revise la cadena de conexion a la BD','modelo');
		}
		//Si tengo conexion a la Bd ejecuto la consulta
		else{			
			$res=pg_query($link,"SELECT * FROM snx.ft_Unidadconstructivaencseraux_copiar(" .$this->objParam->getParametro('unidadconstructivaencseraux') .");");
			
			return $res;
		}
	}
				
	function listarUnidadconstructivaencseraux(){
		$this->objParam->defecto('ordenacion','unidadconstructivaencseraux');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODUnidadconstructivaencseraux','listarUnidadconstructivaencseraux');
		} else{
			$this->objFunc=$this->create('MODUnidadconstructivaencseraux');
			
			$this->res=$this->objFunc->listarUnidadconstructivaencseraux($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
	
	
	function listarOtrosgastos(){
		$this->objParam->defecto('ordenacion','unidadconstructivaencseraux');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('unidadconstructivaencseraux')!=''){
			$this->objParam->addFiltro('unidadconstructivaencseraux = ' . $this->objParam->getParametro('unidadconstructivaencseraux'));
		}
		else {
			$this->objParam->addFiltro("unidadconstructivaencseraux = 0");
	    }
				
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODUnidadconstructivaencseraux','listarOtrosgastos');
		} else{
			$this->objFunc=$this->create('MODUnidadconstructivaencseraux');
			
			$this->res=$this->objFunc->listarOtrosgastos($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarUnidadconstructivaencseraux(){
		$this->objFunc=$this->create('MODUnidadconstructivaencseraux');	
		if($this->objParam->insertar('unidadconstructivaencseraux')){
			$this->res=$this->objFunc->insertarUnidadconstructivaencseraux($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarUnidadconstructivaencseraux($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarUnidadconstructivaencseraux(){
			$this->objFunc=$this->create('MODUnidadconstructivaencseraux');	
		$this->res=$this->objFunc->eliminarUnidadconstructivaencseraux($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>