<?php
/**
*@package pXP
*@file gen-ACTUnidadconstructivaedif.php
*@author  (admin)
*@date 27-07-2018 14:52:51
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTUnidadconstructivaedif extends ACTbase{    

	function copiarUCEDIF()
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
			$res=pg_query($link,"SELECT * FROM snx.ft_unidadconstructivaedif_copiar(" .$this->objParam->getParametro('id_unidadconstructivaedif') .");");
			
			return $res;
		}
	}
				
	function resetCantOBC(){
		$this->objFunc=$this->create('MODUnidadconstructivaedif');	
		$this->res=$this->objFunc->resetCantOBC($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());		
	}
			
	function listarUnidadconstructivaedif(){
		$this->objParam->defecto('ordenacion','id_unidadconstructivaedif');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODUnidadconstructivaedif','listarUnidadconstructivaedif');
		} else{
			$this->objFunc=$this->create('MODUnidadconstructivaedif');
			
			$this->res=$this->objFunc->listarUnidadconstructivaedif($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
	
	function listarOtrosgastos(){
		$this->objParam->defecto('ordenacion','id_unidadconstructivaedif');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('id_unidadconstructivaedif')!=''){
			$this->objParam->addFiltro('id_unidadconstructivaedif = ' . $this->objParam->getParametro('id_unidadconstructivaedif'));
		}
		else {
			$this->objParam->addFiltro("id_unidadconstructivaedif = 0");
	    }
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODUnidadconstructivaedif','listarOtrosgastos');
		} else{
			$this->objFunc=$this->create('MODUnidadconstructivaedif');
			
			$this->res=$this->objFunc->listarOtrosgastos($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarUnidadconstructivaedif(){
		$this->objFunc=$this->create('MODUnidadconstructivaedif');	
		if($this->objParam->insertar('id_unidadconstructivaedif')){
			$this->res=$this->objFunc->insertarUnidadconstructivaedif($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarUnidadconstructivaedif($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarUnidadconstructivaedif(){
		$this->objFunc=$this->create('MODUnidadconstructivaedif');	
		$this->res=$this->objFunc->eliminarUnidadconstructivaedif($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>