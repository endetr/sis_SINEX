<?php
/**
*@package pXP
*@file gen-ACTUnidadconstructivamcelec.php
*@author  (admin)
*@date 16-10-2018 20:00:28
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTUnidadconstructivamcelec extends ACTbase{    
	
	function copiarUCMCE()
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
			$res=pg_query($link,"SELECT * FROM snx.ft_unidadconstructivamcelec_copiar(" .$this->objParam->getParametro('id_unidadconstructivamcelec') .");");
			
			return $res;
		}
	}
			
	function listarUnidadconstructivamcelec(){
		$this->objParam->defecto('ordenacion','id_unidadconstructivamcelec');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODUnidadconstructivamcelec','listarUnidadconstructivamcelec');
		} else{
			$this->objFunc=$this->create('MODUnidadconstructivamcelec');
			
			$this->res=$this->objFunc->listarUnidadconstructivamcelec($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
	
	function listarOtrosgastos(){
		$this->objParam->defecto('ordenacion','id_unidadconstructivamcelec');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('id_unidadconstructivamcelec')!=''){
			$this->objParam->addFiltro('id_unidadconstructivamcelec = ' . $this->objParam->getParametro('id_unidadconstructivamcelec'));
		}
		else {
			$this->objParam->addFiltro("id_unidadconstructivamcelec = 0");
	    }
				
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODUnidadconstructivamcelec','listarOtrosgastos');
		} else{
			$this->objFunc=$this->create('MODUnidadconstructivamcelec');
			
			$this->res=$this->objFunc->listarOtrosgastos($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarUnidadconstructivamcelec(){
		$this->objFunc=$this->create('MODUnidadconstructivamcelec');	
		if($this->objParam->insertar('id_unidadconstructivamcelec')){
			$this->res=$this->objFunc->insertarUnidadconstructivamcelec($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarUnidadconstructivamcelec($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarUnidadconstructivamcelec(){
			$this->objFunc=$this->create('MODUnidadconstructivamcelec');	
		$this->res=$this->objFunc->eliminarUnidadconstructivamcelec($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>