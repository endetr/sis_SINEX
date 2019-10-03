<?php
/**
*@package pXP
*@file gen-ACTUcsbvalorar.php
*@author  (admin)
*@date 09-11-2018 18:38:43
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTUcsbvalorar extends ACTbase{    
			
	function listarUcsbvalorar(){
		$this->objParam->defecto('ordenacion','id_ucsbvalorar');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODUcsbvalorar','listarUcsbvalorar');
		} else{
			$this->objFunc=$this->create('MODUcsbvalorar');
			
			$this->res=$this->objFunc->listarUcsbvalorar($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarUcsbvalorar(){
		$this->objFunc=$this->create('MODUcsbvalorar');	
		if($this->objParam->insertar('id_ucsbvalorar')){
			$this->res=$this->objFunc->insertarUcsbvalorar($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarUcsbvalorar($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarUcsbvalorar(){
			$this->objFunc=$this->create('MODUcsbvalorar');	
		$this->res=$this->objFunc->eliminarUcsbvalorar($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
	
	function obtenerproyectoUCSB()
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
			$res=pg_query($link,"SELECT * FROM snx.ft_tucsbvalorar_get(" .$this->objParam->getParametro('id_ucsbvalorar') .");");
			
			return $res;
		}
	}
	
	function obtenerproyectoUCSBcuc()
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
			$res=pg_query($link,"SELECT * FROM snx.ft_tucsbvalorarcuc_get(" .$this->objParam->getParametro('id_ucsbvalorar') .");");
			
			return $res;
		}
	}

	function obtenerproyectoUCSBouc()
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
			$res=pg_query($link,"SELECT * FROM snx.ft_tucsbvalorarouc_get(" .$this->objParam->getParametro('id_ucsbvalorar') .");");
			
			return $res;
		}
	}
		
	function obtenerproyectoUCSBcuce()
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
			$res=pg_query($link,"SELECT * FROM snx.ft_tucsbvalorarcuce_get(" .$this->objParam->getParametro('id_ucsbvalorar') .");");
			
			return $res;
		}
	}
	
	function obtenerproyectoUCSBcucm()
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
			$res=pg_query($link,"SELECT * FROM snx.ft_tucsbvalorarcucm_get(" .$this->objParam->getParametro('id_ucsbvalorar') .");");
			
			return $res;
		}
	}
	
	function obtenerproyectoUCSBcucmate()
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
			$res=pg_query($link,"SELECT * FROM snx.ft_tucsbvalorarcucmate_get(" .$this->objParam->getParametro('id_ucsbvalorar') .");");
			
			return $res;
		}
	}
	
	function obtenerproyectoUCSBcuccont()
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
			$res=pg_query($link,"SELECT * FROM snx.ft_tucsbvalorarcuccont_get(" .$this->objParam->getParametro('id_ucsbvalorar') .");");
			
			return $res;
		}
	}

	function obtenerproyectoUCSBcucog()
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
			$res=pg_query($link,"SELECT * FROM snx.ft_tucsbvalorarcucog_get(" .$this->objParam->getParametro('id_ucsbvalorar') .");");
			
			return $res;
		}
	}
	
	function obtenerproyectoUCSBoucdet()
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
			$res=pg_query($link,"SELECT * FROM snx.ft_tucsbvaloraroucdet_get(" .$this->objParam->getParametro('id_ucsbvalorar') .");");
			
			return $res;
		}
	}

	function obtenerproyectoUCSBoucog()
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
			$res=pg_query($link,"SELECT * FROM snx.ft_tucsbvaloraroucog_get(" .$this->objParam->getParametro('id_ucsbvalorar') .");");
			
			return $res;
		}
	}

	function ReporteEXCEL()
	{
		
		$intRowExcel = 15;
		$intRowAnt = 0;
		
		$blnControl = FALSE;		
		$dsEncabezado = $this->obtenerproyectoUCSB();		
		$dsUCSB = $this->obtenerproyectoUCSBcuc();		
		$dsUCEM = $this->obtenerproyectoUCSBcuce();
		$dsUCM = $this->obtenerproyectoUCSBcucm();
		$dsUCMate = $this->obtenerproyectoUCSBcucmate();
		$dsUCGC = $this->obtenerproyectoUCSBcuccont();
		$dsUCOG = $this->obtenerproyectoUCSBcucog();
		
		$dsUCOT = $this->obtenerproyectoUCSBouc();
		$dsUCOTdet = $this->obtenerproyectoUCSBoucdet();
		$dsUCOTog = $this->obtenerproyectoUCSBoucog();
			
		$arrUCSB = pg_fetch_all($dsUCSB);		
		$arrUCEM = pg_fetch_all($dsUCEM);		
		$arrUCM = pg_fetch_all($dsUCM);
		$arrUCMate = pg_fetch_all($dsUCMate);
		$arrUCGC = pg_fetch_all($dsUCGC);
		$arrUCOG = pg_fetch_all($dsUCOG);
		
		$arrUCOT = pg_fetch_all($dsUCOT);
		$arrUCOTdet = pg_fetch_all($dsUCOTdet);
		$arrUCOTog = pg_fetch_all($dsUCOTog);
				
		$Excel = new PHPExcel();
		$Excel->getActiveSheet()->setTitle(pg_fetch_result($dsEncabezado, 0, 1));
		$Excel->setActiveSheetIndex(0);
		
		$Excel = new PHPExcel();
		$Excel->getProperties()->setTitle(pg_fetch_result($dsEncabezado, 0, 1))
        ->setDescription(pg_fetch_result($dsEncabezado, 0, 2));
		$Excel->getDefaultStyle()->getFont()->setName('Arial');
		$Excel->getDefaultStyle()->getFont()->setSize(10);		
		$Excel->setActiveSheetIndex(0);		
		$Excel->getActiveSheet()->getColumnDimension('A')->setWidth(14);
		$Excel->getActiveSheet()->getColumnDimension('B')->setWidth(20);
		$Excel->getActiveSheet()->getColumnDimension('C')->setWidth(14);
		$Excel->getActiveSheet()->getColumnDimension('F')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('G')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('H')->setWidth(15);	
		$Excel->getActiveSheet()->getColumnDimension('I')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('J')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('K')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('L')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('M')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('N')->setWidth(15);		
		
		//Encabezado
		$Excel->getActiveSheet()->mergeCells('A1:N1');
		$Excel->getActiveSheet()->setCellValue('A1','Reporte Proyecto de Subestaciones');	
		$Excel->getActiveSheet()->getStyle('A1')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
		$Excel->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		$Excel->getActiveSheet()->getStyle('A1')->getFont()->setBold( true );
		$Excel->getActiveSheet()->getStyle('A1:N1')->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN)->getColor()->setRGB('000000');
		
		$Excel->getActiveSheet()->mergeCells('A3:C3');
		$Excel->getActiveSheet()->mergeCells('A4:C4');
		$Excel->getActiveSheet()->mergeCells('A5:C5');
		$Excel->getActiveSheet()->mergeCells('A6:C6');
		$Excel->getActiveSheet()->mergeCells('A7:C7');
		$Excel->getActiveSheet()->mergeCells('A8:C8');
		$Excel->getActiveSheet()->mergeCells('A9:C9');
		$Excel->getActiveSheet()->mergeCells('A10:C10');
		$Excel->getActiveSheet()->mergeCells('A11:C11');	
		$Excel->getActiveSheet()->setCellValue('A3','Código Proyecto');
		$Excel->getActiveSheet()->setCellValue('A4','Proyecto');
		$Excel->getActiveSheet()->setCellValue('A5','Zona');
		$Excel->getActiveSheet()->setCellValue('A6','Tipo Suelo');
		$Excel->getActiveSheet()->setCellValue('A7','Altura');
		$Excel->getActiveSheet()->setCellValue('A8','Distancia de transporte suministros importados [km]');
		$Excel->getActiveSheet()->setCellValue('A9','Distancia de transporte suministros nacionales [km]');
		$Excel->getActiveSheet()->setCellValue('A10','Número de Bahías');		
		$Excel->getActiveSheet()->setCellValue('A11','Valor Total Proyecto');
		
		$Excel->getActiveSheet()->getStyle('A3')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
		$Excel->getActiveSheet()->getStyle('A4')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
		$Excel->getActiveSheet()->getStyle('A5')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
		$Excel->getActiveSheet()->getStyle('A6')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
		$Excel->getActiveSheet()->getStyle('A7')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
		$Excel->getActiveSheet()->getStyle('A8')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
		$Excel->getActiveSheet()->getStyle('A9')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
		$Excel->getActiveSheet()->getStyle('A10')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
		$Excel->getActiveSheet()->getStyle('A11')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
		$Excel->getActiveSheet()->getStyle('A3')->getFont()->setBold( true );
		$Excel->getActiveSheet()->getStyle('A4')->getFont()->setBold( true );
		$Excel->getActiveSheet()->getStyle('A5')->getFont()->setBold( true );
		$Excel->getActiveSheet()->getStyle('A6')->getFont()->setBold( true );
		$Excel->getActiveSheet()->getStyle('A7')->getFont()->setBold( true );
		$Excel->getActiveSheet()->getStyle('A8')->getFont()->setBold( true );
		$Excel->getActiveSheet()->getStyle('A9')->getFont()->setBold( true );
		$Excel->getActiveSheet()->getStyle('A10')->getFont()->setBold( true );
		$Excel->getActiveSheet()->getStyle('A11')->getFont()->setBold( true );
		$Excel->getActiveSheet()->mergeCells('D3:F3');
		$Excel->getActiveSheet()->mergeCells('D4:F4');
		$Excel->getActiveSheet()->mergeCells('D5:F5');
		$Excel->getActiveSheet()->mergeCells('D6:F6');
		$Excel->getActiveSheet()->mergeCells('D7:F7');
		$Excel->getActiveSheet()->mergeCells('D8:F8');
		$Excel->getActiveSheet()->mergeCells('D9:F9');
		$Excel->getActiveSheet()->mergeCells('D10:F10');
		$Excel->getActiveSheet()->mergeCells('D11:F11');
		$Excel->getActiveSheet()->setCellValue('D3',pg_fetch_result($dsEncabezado, 0, 1));
		$Excel->getActiveSheet()->setCellValue('D4',pg_fetch_result($dsEncabezado, 0, 2));
		$Excel->getActiveSheet()->setCellValue('D5',pg_fetch_result($dsEncabezado, 0, 8));
		$Excel->getActiveSheet()->setCellValue('D6',pg_fetch_result($dsEncabezado, 0, 7));
		$Excel->getActiveSheet()->setCellValue('D7',number_format(floatval(pg_fetch_result($dsEncabezado, 0, 3)), 2, ".", ","));
		$Excel->getActiveSheet()->setCellValue('D8',number_format(floatval(pg_fetch_result($dsEncabezado, 0, 4)), 2, ".", ","));
		$Excel->getActiveSheet()->setCellValue('D9',number_format(floatval(pg_fetch_result($dsEncabezado, 0, 5)), 2, ".", ","));
		$Excel->getActiveSheet()->setCellValue('D10',number_format(floatval(pg_fetch_result($dsEncabezado, 0, 6)), 2, ".", ","));
		$Excel->getActiveSheet()->setCellValue('D11',number_format(floatval(pg_fetch_result($dsEncabezado, 0, 9)), 2, ".", ","));
		$Excel->getActiveSheet()->getStyle('A3:F11')->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN)->getColor()->setRGB('000000');
		
		//Resumen Unidades Constructivas Subestaciones
		$Excel->getActiveSheet()->mergeCells('A13:N13');
		$Excel->getActiveSheet()->setCellValue('A13','Resumen Unidades Constructivas Subestaciones');	
		$Excel->getActiveSheet()->getStyle('A13')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
		$Excel->getActiveSheet()->getStyle('A13')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		$Excel->getActiveSheet()->getStyle('A13')->getFont()->setBold( true );
		$Excel->getActiveSheet()->getStyle('A13:N13')->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN)->getColor()->setRGB('000000');
		
		if (pg_numrows($dsUCSB) > 0)
		{
			foreach ($arrUCSB as &$row) {
				//Encabezado
				$Excel->getActiveSheet()->setCellValue('A' .$intRowExcel,'Código');			
				$Excel->getActiveSheet()->mergeCells('B' .$intRowExcel .':E' .$intRowExcel);
				$Excel->getActiveSheet()->setCellValue('B' .$intRowExcel,'Descripción');
				$Excel->getActiveSheet()->setCellValue('F' .$intRowExcel,'Tensión Servicio');			
				$Excel->getActiveSheet()->setCellValue('G' .$intRowExcel,'Cantidad');
				$Excel->getActiveSheet()->setCellValue('H' .$intRowExcel,'Potencia');
				$Excel->getActiveSheet()->setCellValue('I' .$intRowExcel,'Equipos');
				$Excel->getActiveSheet()->setCellValue('J' .$intRowExcel,'Maquinaria');
				$Excel->getActiveSheet()->setCellValue('K' .$intRowExcel,'Materiales');
				$Excel->getActiveSheet()->setCellValue('L' .$intRowExcel,'Directo Contratista');
				$Excel->getActiveSheet()->setCellValue('M' .$intRowExcel,'Otros Gastos');
				$Excel->getActiveSheet()->setCellValue('N' .$intRowExcel,'Total');			
				$Excel->getActiveSheet()->getStyle('A' .$intRowExcel .':N' .$intRowExcel)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
				$Excel->getActiveSheet()->getStyle('A' .$intRowExcel .':N' .$intRowExcel)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
				$Excel->getActiveSheet()->getStyle('A' .$intRowExcel .':N' .$intRowExcel)->getFont()->setBold( true );
				$Excel->getActiveSheet()->getStyle('A' .$intRowExcel .':N' .$intRowExcel)->getAlignment()->setWrapText(true);	
				//Datos Encabezado UC 
				$intRowExcel++;	
				$Excel->getActiveSheet()->mergeCells('B' .$intRowExcel .':E'  .$intRowExcel);
				$Excel->getActiveSheet()->setCellValue('A' . $intRowExcel,$row['codigo']);
				$Excel->getActiveSheet()->setCellValue('B' . $intRowExcel,$row['descripcion']);
				$Excel->getActiveSheet()->setCellValue('F' . $intRowExcel,$row['tensionservicio']);
				$Excel->getActiveSheet()->setCellValue('G' . $intRowExcel,$row['cantidaditem']);
				$Excel->getActiveSheet()->setCellValue('H' . $intRowExcel,$row['potencia']);			
				$Excel->getActiveSheet()->setCellValue('I' . $intRowExcel,$row['valorucsbe']);
				$Excel->getActiveSheet()->setCellValue('J' . $intRowExcel,$row['valorucsbm']);
				$Excel->getActiveSheet()->setCellValue('K' . $intRowExcel,$row['valorucsbmate']);
				$Excel->getActiveSheet()->setCellValue('L' . $intRowExcel,$row['valorucsbcont']);
				$Excel->getActiveSheet()->setCellValue('M' . $intRowExcel,$row['valorucsbog']);
				$Excel->getActiveSheet()->setCellValue('N' . $intRowExcel,$row['valorucsbtotal']);	
				$Excel->getActiveSheet()->getStyle('A' .($intRowExcel-1) .':N' .$intRowExcel)->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN)->getColor()->setRGB('000000');
				
				//Maquinaria
				if (pg_numrows($dsUCM) > 0)
				{
					$intRowExcel = $intRowExcel + 2;				
					$Excel->getActiveSheet()->mergeCells('A' .$intRowExcel . ':G' . $intRowExcel);
					$Excel->getActiveSheet()->setCellValue('A' .$intRowExcel,'Maquinaria');
					$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
					$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
					$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getFont()->setBold( true );
					$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getAlignment()->setWrapText(true);					
					$Excel->getActiveSheet()->getStyle('A' .$intRowExcel .':G' .$intRowExcel)->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN)->getColor()->setRGB('000000');
					
					$intRowExcel++;	
					$intRowAnt = $intRowExcel;		
					$Excel->getActiveSheet()->mergeCells('A' . $intRowExcel . ':D' . $intRowExcel);
					$Excel->getActiveSheet()->setCellValue('A' .$intRowExcel,'Maquinaria');	
					$Excel->getActiveSheet()->setCellValue('E' .$intRowExcel,'Cantidad');
					$Excel->getActiveSheet()->setCellValue('F' .$intRowExcel,'Valor Unitario');
					$Excel->getActiveSheet()->setCellValue('G' .$intRowExcel,'Valor Total');
					$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':G' . $intRowExcel)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
					$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':G' . $intRowExcel)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
					$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':G' . $intRowExcel)->getFont()->setBold( true );
					$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':G' . $intRowExcel)->getAlignment()->setWrapText(true);
					
					$intRowExcel++;
					foreach ($arrUCM as &$rowItem) {
						if ($rowItem['id_ucsbvalorarcuc'] == $row['id_ucsvalorarcuc'])
						{
							$Excel->getActiveSheet()->mergeCells('A' . $intRowExcel . ':D' . $intRowExcel);									
							$Excel->getActiveSheet()->setCellValue('A' . $intRowExcel,$rowItem['maquinaria']);
							$Excel->getActiveSheet()->setCellValue('E' . $intRowExcel,$rowItem['cantidadmaq']);
							$Excel->getActiveSheet()->setCellValue('F' . $intRowExcel,$rowItem['valorunitario']);
							$Excel->getActiveSheet()->setCellValue('G' . $intRowExcel,$rowItem['valortotal']);
							$intRowExcel++;
						}
					}
					$Excel->getActiveSheet()->getStyle('A' .$intRowAnt .':G' .($intRowExcel-1))->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN)->getColor()->setRGB('000000');	
				}
	
				//Equipos
				if (pg_numrows($dsUCEM) > 0)
				{
					$intRowExcel = $intRowExcel + 2;			
					$Excel->getActiveSheet()->mergeCells('A' .$intRowExcel . ':H' . $intRowExcel);
					$Excel->getActiveSheet()->setCellValue('A' .$intRowExcel,'Equipos');
					$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
					$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
					$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getFont()->setBold( true );
					$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getAlignment()->setWrapText(true);		
					$Excel->getActiveSheet()->getStyle('A' .$intRowExcel .':H' .$intRowExcel)->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN)->getColor()->setRGB('000000');
					
					$intRowExcel++;		
					$intRowAnt = $intRowExcel;	
					$Excel->getActiveSheet()->mergeCells('A' . $intRowExcel . ':D' . $intRowExcel);
					$Excel->getActiveSheet()->setCellValue('A' .$intRowExcel,'Equipo');	
					$Excel->getActiveSheet()->setCellValue('E' .$intRowExcel,'Unidad');
					$Excel->getActiveSheet()->setCellValue('F' .$intRowExcel,'Cantidad');
					$Excel->getActiveSheet()->setCellValue('G' .$intRowExcel,'Valor Unitario');
					$Excel->getActiveSheet()->setCellValue('H' .$intRowExcel,'Valor Total');
					$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':H' . $intRowExcel)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
					$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':H' . $intRowExcel)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
					$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':H' . $intRowExcel)->getFont()->setBold( true );
					$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':H' . $intRowExcel)->getAlignment()->setWrapText(true);
						
					$intRowExcel++;
					foreach ($arrUCEM as &$rowItem) {
						if ($rowItem['id_ucsbvalorarcuc'] == $row['id_ucsvalorarcuc'])
						{
							$Excel->getActiveSheet()->mergeCells('A' . $intRowExcel . ':D' . $intRowExcel);									
							$Excel->getActiveSheet()->setCellValue('A' . $intRowExcel,$rowItem['equipo']);
							$Excel->getActiveSheet()->setCellValue('E' . $intRowExcel,$rowItem['unidadabrer']);
							$Excel->getActiveSheet()->setCellValue('F' . $intRowExcel,$rowItem['cantidadequ']);
							$Excel->getActiveSheet()->setCellValue('G' . $intRowExcel,$rowItem['valorunitario']);
							$Excel->getActiveSheet()->setCellValue('H' . $intRowExcel,$rowItem['valortotal']);
							$intRowExcel++;
						}				
					}
					$Excel->getActiveSheet()->getStyle('A' .$intRowAnt .':H' .($intRowExcel-1))->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN)->getColor()->setRGB('000000');
				}

				//Materiales
				if (pg_numrows($dsUCMate) > 0)
				{
					$intRowExcel++;
					$Excel->getActiveSheet()->mergeCells('A' .$intRowExcel . ':J' . $intRowExcel);
					$Excel->getActiveSheet()->setCellValue('A' .$intRowExcel,'Materiales');
					$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
					$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
					$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getFont()->setBold( true );
					$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getAlignment()->setWrapText(true);		
					$Excel->getActiveSheet()->getStyle('A' .$intRowExcel .':J' .$intRowExcel)->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN)->getColor()->setRGB('000000');
					
					$intRowExcel++;		
					$intRowAnt = $intRowExcel;	
					$Excel->getActiveSheet()->mergeCells('A' . $intRowExcel . ':D' . $intRowExcel);
					$Excel->getActiveSheet()->setCellValue('A' .$intRowExcel,'Material');	
					$Excel->getActiveSheet()->setCellValue('E' .$intRowExcel,'Unidad');
					$Excel->getActiveSheet()->setCellValue('F' .$intRowExcel,'Cantidad');
					$Excel->getActiveSheet()->setCellValue('G' .$intRowExcel,'Valor Uni. Ext.');
					$Excel->getActiveSheet()->setCellValue('H' .$intRowExcel,'Valor Total Ext');
					$Excel->getActiveSheet()->setCellValue('I' .$intRowExcel,'Valor Uni. Nac.');
					$Excel->getActiveSheet()->setCellValue('J' .$intRowExcel,'Valor Total Nac.');
					$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':J' . $intRowExcel)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
					$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':J' . $intRowExcel)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
					$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':J' . $intRowExcel)->getFont()->setBold( true );
					$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':J' . $intRowExcel)->getAlignment()->setWrapText(true);	
					
					$intRowExcel++;
					foreach ($arrUCMate as &$rowItem) {
						if ($rowItem['id_ucsbvalorarcuc'] == $row['id_ucsvalorarcuc'])
						{
							$Excel->getActiveSheet()->mergeCells('A' . $intRowExcel . ':D' . $intRowExcel);									
							$Excel->getActiveSheet()->setCellValue('A' . $intRowExcel,$rowItem['material']);
							$Excel->getActiveSheet()->setCellValue('E' . $intRowExcel,$rowItem['unidadbrev']);
							$Excel->getActiveSheet()->setCellValue('F' . $intRowExcel,$rowItem['cantidadmate']);
							$Excel->getActiveSheet()->setCellValue('G' . $intRowExcel,$rowItem['valorunitarioext']);
							$Excel->getActiveSheet()->setCellValue('H' . $intRowExcel,$rowItem['valortotalext']);
							$Excel->getActiveSheet()->setCellValue('I' . $intRowExcel,$rowItem['valorunitarionac']);
							$Excel->getActiveSheet()->setCellValue('J' . $intRowExcel,$rowItem['valortotalnac']);
							$intRowExcel++;
						}				
					}
					$Excel->getActiveSheet()->getStyle('A' .$intRowAnt .':J' .($intRowExcel-1))->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN)->getColor()->setRGB('000000');
				}
	
				//Directo Contratista
				if (pg_numrows($dsUCGC) > 0)
				{
					$intRowExcel++;
					$Excel->getActiveSheet()->mergeCells('A' .$intRowExcel . ':H' . $intRowExcel);
					$Excel->getActiveSheet()->setCellValue('A' .$intRowExcel,'Directo Contratista');
					$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
					$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
					$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getFont()->setBold( true );
					$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getAlignment()->setWrapText(true);		
					$Excel->getActiveSheet()->getStyle('A' .$intRowExcel .':H' .$intRowExcel)->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN)->getColor()->setRGB('000000');
					
					$intRowExcel++;		
					$intRowAnt = $intRowExcel;
					$Excel->getActiveSheet()->mergeCells('A' . $intRowExcel . ':D' . $intRowExcel);
					$Excel->getActiveSheet()->setCellValue('A' .$intRowExcel,'Obra Civil');	
					$Excel->getActiveSheet()->setCellValue('E' .$intRowExcel,'Unidad');
					$Excel->getActiveSheet()->setCellValue('F' .$intRowExcel,'Cantidad');
					$Excel->getActiveSheet()->setCellValue('G' .$intRowExcel,'Valor Unitario');
					$Excel->getActiveSheet()->setCellValue('H' .$intRowExcel,'Valor Total');
					$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':H' . $intRowExcel)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
					$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':H' . $intRowExcel)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
					$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':H' . $intRowExcel)->getFont()->setBold( true );
					$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':H' . $intRowExcel)->getAlignment()->setWrapText(true);
						
					$intRowExcel++;
					foreach ($arrUCGC as &$rowItem) {
						if ($rowItem['id_ucsbvalorarcuc'] == $row['id_ucsvalorarcuc'])
						{
							$Excel->getActiveSheet()->mergeCells('A' . $intRowExcel . ':D' . $intRowExcel);									
							$Excel->getActiveSheet()->setCellValue('A' . $intRowExcel,$rowItem['obracivil']);
							$Excel->getActiveSheet()->setCellValue('E' . $intRowExcel,$rowItem['unidadbrev']);
							$Excel->getActiveSheet()->setCellValue('F' . $intRowExcel,$rowItem['cantidadpeso']);
							$Excel->getActiveSheet()->setCellValue('G' . $intRowExcel,$rowItem['valorunitario']);
							$Excel->getActiveSheet()->setCellValue('H' . $intRowExcel,$rowItem['valorobracivil']);
							$intRowExcel++;
						}				
					}
					$Excel->getActiveSheet()->getStyle('A' .$intRowAnt .':H' .($intRowExcel-1))->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN)->getColor()->setRGB('000000');
				}	
				
				//Otros Gastos
				if (pg_numrows($dsUCOG) > 0)
				{
					$intRowExcel++;
					$Excel->getActiveSheet()->mergeCells('A' .$intRowExcel . ':G' . $intRowExcel);
					$Excel->getActiveSheet()->setCellValue('A' .$intRowExcel,'Otros Gastos');
					$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
					$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
					$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getFont()->setBold( true );
					$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getAlignment()->setWrapText(true);		
					$Excel->getActiveSheet()->getStyle('A' .$intRowExcel .':G' .$intRowExcel)->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN)->getColor()->setRGB('000000');
					
					$intRowExcel++;		
					$intRowAnt = $intRowExcel;
					$Excel->getActiveSheet()->mergeCells('A' . $intRowExcel . ':D' . $intRowExcel);
					$Excel->getActiveSheet()->setCellValue('A' .$intRowExcel,'Descripción');	
					$Excel->getActiveSheet()->setCellValue('E' .$intRowExcel,'Cantidad');
					$Excel->getActiveSheet()->setCellValue('F' .$intRowExcel,'Valor Unitario');
					$Excel->getActiveSheet()->setCellValue('G' .$intRowExcel,'Valor Total');			
					$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':G' . $intRowExcel)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
					$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':G' . $intRowExcel)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
					$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':G' . $intRowExcel)->getFont()->setBold( true );
					$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':G' . $intRowExcel)->getAlignment()->setWrapText(true);
						
					$intRowExcel++;
					foreach ($arrUCOG as &$rowItem) {
						if ($rowItem['id_ucsbvalorarcuc'] == $row['id_ucsvalorarcuc'])
						{
							$Excel->getActiveSheet()->mergeCells('A' . $intRowExcel . ':D' . $intRowExcel);									
							$Excel->getActiveSheet()->setCellValue('A' . $intRowExcel,$rowItem['otrosgastos']);
							$Excel->getActiveSheet()->setCellValue('E' . $intRowExcel,$rowItem['cantidadog']);
							$Excel->getActiveSheet()->setCellValue('F' . $intRowExcel,$rowItem['valorunitario']);
							$Excel->getActiveSheet()->setCellValue('G' . $intRowExcel,$rowItem['valorog']);					
							$intRowExcel++;
						}				
					}
					$Excel->getActiveSheet()->getStyle('A' .$intRowAnt .':G' .($intRowExcel-1))->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN)->getColor()->setRGB('000000');
				}
				
				$intRowExcel = $intRowExcel + 2;
			}		
			
		}
		
		
		//Resumen Otras Unidades Constructivas
		$intRowExcel++;		
		$Excel->getActiveSheet()->mergeCells('A' .$intRowExcel .':N' .$intRowExcel);
		$Excel->getActiveSheet()->setCellValue('A' .$intRowExcel,'Resumen Otras Unidades Constructivas');	
		$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
		$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getFont()->setBold( true );
		$Excel->getActiveSheet()->getStyle('A' .$intRowExcel .':N' .$intRowExcel)->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN)->getColor()->setRGB('000000');
		
		//Encabezado
		$intRowExcel++;
		$intRowAnt = $intRowExcel;		
		$intRowExcel++;
		
		if (pg_numrows($dsUCOT) > 0)
		{
			foreach ($arrUCOT as &$row) {
				//Encabezado
				$Excel->getActiveSheet()->setCellValue('A' .$intRowExcel,'Código');			
				$Excel->getActiveSheet()->mergeCells('B' .$intRowExcel .':E' .$intRowExcel);
				$Excel->getActiveSheet()->setCellValue('B' .$intRowExcel,'Descripción');
				$Excel->getActiveSheet()->setCellValue('F' .$intRowExcel,'Cantidad');			
				$Excel->getActiveSheet()->setCellValue('G' .$intRowExcel,'Tensión Servicio');
				$Excel->getActiveSheet()->setCellValue('H' .$intRowExcel,'Clase Aislamiento');
				$Excel->getActiveSheet()->setCellValue('I' .$intRowExcel,'Area Subestación (m2)');
				$Excel->getActiveSheet()->setCellValue('J' .$intRowExcel,'Longitud Vías (m)');
				$Excel->getActiveSheet()->setCellValue('K' .$intRowExcel,'Norma');
				$Excel->getActiveSheet()->setCellValue('L' .$intRowExcel,'Porc. Repuestos');							
				$Excel->getActiveSheet()->setCellValue('M' .$intRowExcel,'Total');
				$Excel->getActiveSheet()->getStyle('A' .$intRowExcel .':M' .$intRowExcel)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
				$Excel->getActiveSheet()->getStyle('A' .$intRowExcel .':M' .$intRowExcel)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
				$Excel->getActiveSheet()->getStyle('A' .$intRowExcel .':M' .$intRowExcel)->getFont()->setBold( true );
				$Excel->getActiveSheet()->getStyle('A' .$intRowExcel .':M' .$intRowExcel)->getAlignment()->setWrapText(true);
				
				//Datos 
				$intRowExcel++;
				$Excel->getActiveSheet()->mergeCells('B' .$intRowExcel .':E'  .$intRowExcel);
				$Excel->getActiveSheet()->setCellValue('A' . $intRowExcel,$row['codigo']);
				$Excel->getActiveSheet()->setCellValue('B' . $intRowExcel,$row['descripcion']);
				$Excel->getActiveSheet()->setCellValue('F' . $intRowExcel,$row['cantidaditem']);			
				$Excel->getActiveSheet()->setCellValue('G' . $intRowExcel,$row['tensionservicio']);
				$Excel->getActiveSheet()->setCellValue('H' . $intRowExcel,$row['claseaislamiento']);
				$Excel->getActiveSheet()->setCellValue('I' . $intRowExcel,$row['areasubestacion']);
				$Excel->getActiveSheet()->setCellValue('J' . $intRowExcel,$row['longitudvias']);
				$Excel->getActiveSheet()->setCellValue('K' . $intRowExcel,$row['norma']);
				$Excel->getActiveSheet()->setCellValue('L' . $intRowExcel,$row['porcrepuestos']);						
				$Excel->getActiveSheet()->setCellValue('M' . $intRowExcel,$row['valortotal']);
				$Excel->getActiveSheet()->getStyle('A' .($intRowExcel-1) .':M' .$intRowExcel)->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN)->getColor()->setRGB('000000');
				
				//Detalle de Items			
				if (pg_numrows($dsUCOTdet) > 0)
				{
					$intRowExcel = $intRowExcel + 2;				
					$Excel->getActiveSheet()->mergeCells('A' .$intRowExcel . ':H' . $intRowExcel);
					$Excel->getActiveSheet()->setCellValue('A' .$intRowExcel,'Ítems');
					$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
					$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
					$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getFont()->setBold( true );
					$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getAlignment()->setWrapText(true);					
					$Excel->getActiveSheet()->getStyle('A' .$intRowExcel .':H' .$intRowExcel)->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN)->getColor()->setRGB('000000');
					
					$intRowExcel++;	
					$intRowAnt = $intRowExcel;		
					$Excel->getActiveSheet()->mergeCells('A' . $intRowExcel . ':D' . $intRowExcel);
					$Excel->getActiveSheet()->setCellValue('A' .$intRowExcel,'Descripción');	
					$Excel->getActiveSheet()->setCellValue('E' .$intRowExcel,'Unidad');
					$Excel->getActiveSheet()->setCellValue('F' .$intRowExcel,'Cantidad');
					$Excel->getActiveSheet()->setCellValue('G' .$intRowExcel,'Valor Unitario');
					$Excel->getActiveSheet()->setCellValue('H' .$intRowExcel,'Valor Total');
					$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':H' . $intRowExcel)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
					$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':H' . $intRowExcel)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
					$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':H' . $intRowExcel)->getFont()->setBold( true );
					$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':H' . $intRowExcel)->getAlignment()->setWrapText(true);
					
					$intRowExcel++;
					foreach ($arrUCOTdet as &$rowItem) {
						if ($rowItem['id_ucsbvalorarouc'] == $row['id_ucsbvalorarouc'])
						{
							$Excel->getActiveSheet()->mergeCells('A' . $intRowExcel . ':D' . $intRowExcel);									
							$Excel->getActiveSheet()->setCellValue('A' . $intRowExcel,$rowItem['descripcion']);
							$Excel->getActiveSheet()->setCellValue('E' . $intRowExcel,$rowItem['unidadabrev']);
							if ($rowItem['nivel'] == 3)
							{
								$Excel->getActiveSheet()->setCellValue('F' . $intRowExcel,$rowItem['cantidaditem']);
								$Excel->getActiveSheet()->setCellValue('G' . $intRowExcel,$rowItem['valorunitario']);
							}
							$Excel->getActiveSheet()->setCellValue('H' . $intRowExcel,$rowItem['valortotal']);
							
							if ($rowItem['nivel'] == 1)
							{
								$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':H' . $intRowExcel)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('DDDDDD');
								$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':H' . $intRowExcel)->getFont()->setBold( true );
							}
							else if ($rowItem['nivel'] == 2)
							{
								$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':H' . $intRowExcel)->getFont()->setBold( true );
							}
							
							$intRowExcel++;
						}
					}
					$Excel->getActiveSheet()->getStyle('A' .$intRowAnt .':H' .($intRowExcel-1))->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN)->getColor()->setRGB('000000');	
				}

				//Detalle de Otros Gastos			
				if (pg_numrows($dsUCOTog) > 0)
				{
					$intRowExcel++;				
					$Excel->getActiveSheet()->mergeCells('A' .$intRowExcel . ':G' . $intRowExcel);
					$Excel->getActiveSheet()->setCellValue('A' .$intRowExcel,'Otros Gastos');
					$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
					$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
					$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getFont()->setBold( true );
					$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getAlignment()->setWrapText(true);					
					$Excel->getActiveSheet()->getStyle('A' .$intRowExcel .':G' .$intRowExcel)->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN)->getColor()->setRGB('000000');
					
					$intRowExcel++;	
					$intRowAnt = $intRowExcel;		
					$Excel->getActiveSheet()->mergeCells('A' . $intRowExcel . ':D' . $intRowExcel);
					$Excel->getActiveSheet()->setCellValue('A' .$intRowExcel,'Descripción');	
					$Excel->getActiveSheet()->setCellValue('E' .$intRowExcel,'Cantidad');				
					$Excel->getActiveSheet()->setCellValue('F' .$intRowExcel,'Valor Unitario');
					$Excel->getActiveSheet()->setCellValue('G' .$intRowExcel,'Valor Total');
					$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':G' . $intRowExcel)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
					$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':G' . $intRowExcel)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
					$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':G' . $intRowExcel)->getFont()->setBold( true );
					$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':G' . $intRowExcel)->getAlignment()->setWrapText(true);
					
					$intRowExcel++;
					foreach ($arrUCOTog as &$rowItem) {
						if ($rowItem['id_ucsbvalorarouc'] == $row['id_ucsbvalorarouc'])
						{
							$Excel->getActiveSheet()->mergeCells('A' . $intRowExcel . ':D' . $intRowExcel);									
							$Excel->getActiveSheet()->setCellValue('A' . $intRowExcel,$rowItem['otrosgastos']);
							$Excel->getActiveSheet()->setCellValue('E' . $intRowExcel,$rowItem['cantidadog']);
							$Excel->getActiveSheet()->setCellValue('F' . $intRowExcel,$rowItem['valorunitario']);
							$Excel->getActiveSheet()->setCellValue('G' . $intRowExcel,$rowItem['valorog']);
							$intRowExcel++;
						}
					}
					$Excel->getActiveSheet()->getStyle('A' .$intRowAnt .':G' .($intRowExcel-1))->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN)->getColor()->setRGB('000000');
				}
				
				$intRowExcel = $intRowExcel + 2;
			}
		}		
		
		
		$objWriter = PHPExcel_IOFactory::createWriter($Excel, 'Excel5');
		$objWriter->save(__DIR__ . '/../reportes/ProyectoUUESE-' .pg_fetch_result($dsEncabezado, 0, 1) .'.xls');		
	}

	function ReportePDF()
	{
		$blnControl = FALSE;		
		$dsEncabezado = $this->obtenerproyectoUCSB();		
		$dsUCSB = $this->obtenerproyectoUCSBcuc();		
		$dsUCEM = $this->obtenerproyectoUCSBcuce();
		$dsUCM = $this->obtenerproyectoUCSBcucm();
		$dsUCMate = $this->obtenerproyectoUCSBcucmate();
		$dsUCGC = $this->obtenerproyectoUCSBcuccont();
		$dsUCOG = $this->obtenerproyectoUCSBcucog();
		
		$dsUCOT = $this->obtenerproyectoUCSBouc();
		$dsUCOTdet = $this->obtenerproyectoUCSBoucdet();
		$dsUCOTog = $this->obtenerproyectoUCSBoucog();
			
		$arrUCSB = pg_fetch_all($dsUCSB);		
		$arrUCEM = pg_fetch_all($dsUCEM);		
		$arrUCM = pg_fetch_all($dsUCM);
		$arrUCMate = pg_fetch_all($dsUCMate);
		$arrUCGC = pg_fetch_all($dsUCGC);
		$arrUCOG = pg_fetch_all($dsUCOG);
		
		$arrUCOT = pg_fetch_all($dsUCOT);
		$arrUCOTdet = pg_fetch_all($dsUCOTdet);
		$arrUCOTog = pg_fetch_all($dsUCOTog);
		
		$pdf = new TCPDF;
		$pdf->AddPage('L', 'A4');
		
		$w = array(50, 100, 40, 45);
				
		$pdf->SetFillColor(206, 206, 206);
		$pdf->SetFont('', 'B', 9);
		$pdf->Cell(0, 0, 'Reporte Proyecto de Subestaciones', 1, 0, 'C', 1);
		$pdf->Ln();
		$pdf->Ln();
		
		//Encabezado reporte
		$pdf->SetFillColor(206, 206, 206);
        $pdf->SetTextColor(0, 0, 0);        
        $pdf->SetLineWidth(0.3);
        $pdf->SetFont('', 'B');
		$pdf->Cell($w[0], 0, 'Código Proyecto', 1, 0, 'L', 1);		
		$pdf->SetFillColor(255, 255, 255);
        $pdf->SetTextColor(0);
        $pdf->SetFont('');
		$pdf->Cell($w[1], 0, pg_fetch_result($dsEncabezado, 0, 1), 1, 0, 'L', 1);
		$pdf->Ln();
		
		$pdf->SetFillColor(206, 206, 206);
        $pdf->SetTextColor(0, 0, 0);        
        $pdf->SetLineWidth(0.3);
        $pdf->SetFont('', 'B');
		$pdf->Cell($w[0], 0, 'Proyecto', 1, 0, 'L', 1);		
		$pdf->SetFillColor(255, 255, 255);
        $pdf->SetTextColor(0);
        $pdf->SetFont('');
		$pdf->Cell($w[1], 0, pg_fetch_result($dsEncabezado, 0, 2), 1, 0, 'L', 1);
		$pdf->Ln();
		
		$pdf->SetFillColor(206, 206, 206);
        $pdf->SetTextColor(0, 0, 0);        
        $pdf->SetLineWidth(0.3);
        $pdf->SetFont('', 'B');
		$pdf->Cell($w[0], 0, 'Zona', 1, 0, 'L', 1);		
		$pdf->SetFillColor(255, 255, 255);
        $pdf->SetTextColor(0);
        $pdf->SetFont('');
		$pdf->Cell($w[1], 0, pg_fetch_result($dsEncabezado, 0, 8), 1, 0, 'L', 1);
		$pdf->Ln();
		
		$pdf->SetFillColor(206, 206, 206);
        $pdf->SetTextColor(0, 0, 0);        
        $pdf->SetLineWidth(0.3);
        $pdf->SetFont('', 'B');
		$pdf->Cell($w[0], 0, 'Tipo Suelo', 1, 0, 'L', 1);		
		$pdf->SetFillColor(255, 255, 255);
        $pdf->SetTextColor(0);
        $pdf->SetFont('');
		$pdf->Cell($w[1], 0, pg_fetch_result($dsEncabezado, 0, 7), 1, 0, 'L', 1);
		$pdf->Ln();
		
		$pdf->SetFillColor(206, 206, 206);
        $pdf->SetTextColor(0, 0, 0);        
        $pdf->SetLineWidth(0.3);
        $pdf->SetFont('', 'B');
		$pdf->Cell($w[0], 0, 'Altura', 1, 0, 'L', 1);		
		$pdf->SetFillColor(255, 255, 255);
        $pdf->SetTextColor(0);
        $pdf->SetFont('');
		$pdf->Cell($w[1], 0, pg_fetch_result($dsEncabezado, 0, 3), 1, 0, 'L', 1);
		$pdf->Ln();
		
		$pdf->SetFillColor(206, 206, 206);
        $pdf->SetTextColor(0, 0, 0);        
        $pdf->SetLineWidth(0.3);
        $pdf->SetFont('', 'B');
		$pdf->Cell($w[0], 0, 'Distancia de transporte suministros importados [km]', 1, 0, 'L', 1);		
		$pdf->SetFillColor(255, 255, 255);
        $pdf->SetTextColor(0);
        $pdf->SetFont('');
		$pdf->Cell($w[1], 0, pg_fetch_result($dsEncabezado, 0, 4), 1, 0, 'L', 1);
		$pdf->Ln();
		
		$pdf->SetFillColor(206, 206, 206);
        $pdf->SetTextColor(0, 0, 0);        
        $pdf->SetLineWidth(0.3);
        $pdf->SetFont('', 'B');
		$pdf->Cell($w[0], 0, 'Distancia de transporte suministros nacionales [km]', 1, 0, 'L', 1);		
		$pdf->SetFillColor(255, 255, 255);
        $pdf->SetTextColor(0);
        $pdf->SetFont('');
		$pdf->Cell($w[1], 0, pg_fetch_result($dsEncabezado, 0, 5), 1, 0, 'L', 1);
		$pdf->Ln();
				
		$pdf->SetFillColor(206, 206, 206);
        $pdf->SetTextColor(0, 0, 0);        
        $pdf->SetLineWidth(0.3);
        $pdf->SetFont('', 'B');
		$pdf->Cell($w[0], 0, 'Número de Bahías', 1, 0, 'L', 1);		
		$pdf->SetFillColor(255, 255, 255);
        $pdf->SetTextColor(0);
        $pdf->SetFont('');
		$pdf->Cell($w[1], 0, pg_fetch_result($dsEncabezado, 0, 6), 1, 0, 'L', 1);
		$pdf->Ln();
		
		$pdf->SetFillColor(206, 206, 206);
        $pdf->SetTextColor(0, 0, 0);        
        $pdf->SetLineWidth(0.3);
        $pdf->SetFont('', 'B');
		$pdf->Cell($w[0], 0, 'Valor Total Proyecto', 1, 0, 'L', 1);		
		$pdf->SetFillColor(255, 255, 255);
        $pdf->SetTextColor(0);
        $pdf->SetFont('');		
		$pdf->Cell($w[1], 0, 'USD ' .number_format(floatval(pg_fetch_result($dsEncabezado, 0, 9)), 2, ".", ","), 1, 0, 'L', 1);		
		$pdf->Ln();
		$pdf->Ln();		
		
		if (pg_numrows($dsUCSB) > 0)
		{
			foreach ($arrUCSB as &$row) {			
				//Resumen Unidades Constructivas Subestaciones
				$pdf->SetFillColor(206, 206, 206);
				$pdf->SetTextColor(0, 0, 0);        
				$pdf->SetLineWidth(0.3);
				$pdf->SetFont('', 'B');
				$pdf->Cell(0, 0, 'Resumen Unidades Constructivas Subestaciones', 1, 0, 'C', 1);
				$pdf->Ln();
				
				//Encabezado 1
				$pdf->SetFillColor(206, 206, 206);
				$pdf->SetTextColor(0, 0, 0);        
				$pdf->SetLineWidth(0.3);
				$pdf->SetFont('', 'B');
				$pdf->Cell(30, 0, 'Código', 1, 0, 'C', 1);
				$pdf->Cell(100, 0, 'Descripción', 1, 0, 'C', 1);
				$pdf->Cell(40, 0, 'Tensión Servicio', 1, 0, 'C', 1);
				$pdf->Cell(30, 0, 'Cantidad', 1, 0, 'C', 1);		
				$pdf->Cell(30, 0, 'Potencia', 1, 0, 'C', 1);
				$pdf->Cell(30, 0, 'Equipos', 1, 0, 'C', 1);
				$pdf->Cell(27, 0, 'Maquinaria', 1, 0, 'C', 1);
				$pdf->Ln();
				//Datos 1
				$pdf->SetFillColor(255, 255, 255);
				$pdf->SetTextColor(0);
				$pdf->SetFont('');
				$pdf->Cell(30, 0, $row['codigo'], 1, 0, 'C', 1);
				$pdf->Cell(100, 0, $row['descripcion'], 1, 0, 'L', 1);
				$pdf->Cell(40, 0, $row['tensionservicio'], 1, 0, 'C', 1);
				$pdf->Cell(30, 0, $row['cantidaditem'], 1, 0, 'C', 1);		
				$pdf->Cell(30, 0, $row['potencia'], 1, 0, 'C', 1);
				$pdf->Cell(30, 0, $row['valorucsbe'], 1, 0, 'C', 1);
				$pdf->Cell(27, 0, $row['valorucsbm'], 1, 0, 'L', 1);
				$pdf->Ln();
				//Encabezado 2 pegado
				$pdf->SetFillColor(206, 206, 206);
				$pdf->SetTextColor(0, 0, 0);        
				$pdf->SetLineWidth(0.3);
				$pdf->SetFont('', 'B');
				$pdf->Cell(30, 0, 'Materiales', 1, 0, 'C', 1);
				$pdf->Cell(40, 0, 'Directo Contratista', 1, 0, 'C', 1);
				$pdf->Cell(30, 0, 'Otros Gastos', 1, 0, 'C', 1);
				$pdf->Cell(30, 0, 'Total', 1, 0, 'C', 1);
				$pdf->Ln();			
				//Datos 1
				$pdf->SetFillColor(255, 255, 255);
				$pdf->SetTextColor(0);
				$pdf->SetFont('');     		
				$pdf->Cell(30, 0, $row['valorucsbmate'], 1, 0, 'C', 1);
				$pdf->Cell(40, 0, $row['valorucsbcont'], 1, 0, 'C', 1);		
				$pdf->Cell(30, 0, $row['valorucsbog'], 1, 0, 'C', 1);
				$pdf->Cell(30, 0, $row['valorucsbtotal'], 1, 0, 'C', 1);			
				$pdf->Ln();
				
				//Maquinaria
				if (pg_numrows($dsUCM) > 0)
				{
					
					$pdf->SetFillColor(206, 206, 206);
					$pdf->SetTextColor(0, 0, 0);        
					$pdf->SetLineWidth(0.3);
					$pdf->SetFont('', 'B');
					$pdf->Cell(204, 0, 'Maquinaria', 1, 0, 'C', 1);
					$pdf->Ln();			
					$pdf->SetFillColor(206, 206, 206);
					$pdf->SetTextColor(0, 0, 0);        
					$pdf->SetLineWidth(0.3);
					$pdf->Cell(34, 0, 'Maquinaria', 1, 0, 'C', 1);	
					$pdf->Cell(34, 0, 'Cantidad', 1, 0, 'C', 1);
					$pdf->Cell(34, 0, 'Valor Unitario', 1, 0, 'C', 1);
					$pdf->Cell(34, 0, 'Valor Total', 1, 0, 'C', 1);
					$pdf->Ln();	
					
					foreach ($arrUCM as &$rowItem) {
							if ($rowItem['id_ucsbvalorarcuc'] == $row['id_ucsvalorarcuc'])
							{
					$pdf->SetFillColor(255, 255, 255);
					$pdf->SetTextColor(0);
					$pdf->SetFont('');
					
					$pdf->Cell(34, 0, $rowItem['maquinaria'], 1, 0, 'C', 1);
					$pdf->Cell(34, 0, $rowItem['cantidadmaq'], 1, 0, 'C', 1);
					$pdf->Cell(34, 0, $rowItem['valorunitario'], 1, 0, 'C', 1);
					$pdf->Cell(34, 0, $rowItem['valortotal'], 1, 0, 'C', 1);
					$pdf->Ln();
						}
					}
				}
				$pdf->Ln();

				//Equipos
				if (pg_numrows($dsUCEM) > 0)
				{
					$pdf->SetFillColor(206, 206, 206);
					$pdf->SetTextColor(0, 0, 0);        
					$pdf->SetLineWidth(0.3);
					$pdf->SetFont('', 'B');
					$pdf->Cell(240, 0, 'Equipos', 1, 0, 'C', 1);
					$pdf->Ln();	
					$pdf->Cell(100, 0, 'Equipo', 1, 0, 'C', 1);
					$pdf->Cell(20, 0, 'Unidad', 1, 0, 'C', 1);
					$pdf->Cell(40, 0, 'Cantidad', 1, 0, 'C', 1);
					$pdf->Cell(40, 0, 'Valor Unitario', 1, 0, 'C', 1);
					$pdf->Cell(40, 0, 'Valor Total', 1, 0, 'C', 1);
					$pdf->Ln();			
					
					foreach ($arrUCEM as &$rowItem) {
						if ($rowItem['id_ucsbvalorarcuc'] == $row['id_ucsvalorarcuc'])
						{
							
						$pdf->SetFillColor(255, 255, 255);
						$pdf->SetTextColor(0);
						$pdf->SetFont('');
						
						$pdf->Cell(100, 0, $rowItem['equipo'], 1, 0, 'C', 1);
						$pdf->Cell(20, 0, $rowItem['unidadabrer'], 1, 0, 'C', 1);
						$pdf->Cell(40, 0, $rowItem['cantidadequ'], 1, 0, 'C', 1);
						$pdf->Cell(40, 0, $rowItem['valorunitario'], 1, 0, 'C', 1);
						$pdf->Cell(40, 0, $rowItem['valortotal'], 1, 0, 'C', 1);
						
						$pdf->Ln();
						}
					}
					}
				$pdf->Ln();
			
				//Materiales
				if (pg_numrows($dsUCMate) > 0)
				{
					$pdf->SetFillColor(206, 206, 206);
					$pdf->SetTextColor(0, 0, 0);        
					$pdf->SetLineWidth(0.3);
					$pdf->SetFont('', 'B');
					$pdf->Cell(260, 0, 'Materiales', 1, 0, 'C', 1);
					$pdf->Ln();
					$pdf->Cell(90, 0, 'Material', 1, 0, 'C', 1);
					$pdf->Cell(20, 0, 'Unidad', 1, 0, 'C', 1);
					$pdf->Cell(30, 0, 'Cantidad', 1, 0, 'C', 1);
					$pdf->Cell(30, 0, 'Valor Uni. Ext.', 1, 0, 'C', 1);
					$pdf->Cell(30, 0, 'Valor Total Ext', 1, 0, 'C', 1);
					$pdf->Cell(30, 0, 'Valor Uni. Nac.', 1, 0, 'C', 1);
					$pdf->Cell(30, 0, 'Valor Total Nac.', 1, 0, 'C', 1);	
					$pdf->Ln();
				
					foreach ($arrUCMate as &$rowItem) {
						if ($rowItem['id_ucsbvalorarcuc'] == $row['id_ucsvalorarcuc'])
						{
							$pdf->SetFillColor(255, 255, 255);
							$pdf->SetTextColor(0);
							$pdf->SetFont('');
						
							$pdf->Cell(90, 0, $rowItem['material'], 1, 0, 'C', 1);
							$pdf->Cell(20, 0, $rowItem['unidadbrev'], 1, 0, 'L', 1);
							$pdf->Cell(30, 0, $rowItem['cantidadmate'], 1, 0, 'C', 1);		
							$pdf->Cell(30, 0, $rowItem['valorunitarioext'], 1, 0, 'C', 1);		
							$pdf->Cell(30, 0, $rowItem['valortotalext'], 1, 0, 'C', 1);		
							$pdf->Cell(30, 0, $rowItem['valorunitarionac'], 1, 0, 'C', 1);	
							$pdf->Cell(30, 0, $rowItem['valortotalnac'], 1, 0, 'C', 1);
							$pdf->Ln();
						}				
					}
				}
				$pdf->Ln();
				
			//Directo Contratista
			if (pg_numrows($dsUCGC) > 0)
			{
				$pdf->SetFillColor(206, 206, 206);
				$pdf->SetTextColor(0, 0, 0);        
				$pdf->SetLineWidth(0.3);
				$pdf->SetFont('', 'B');
				$pdf->Cell(250, 0, 'Directo Contratista', 1, 0, 'C', 1);
				$pdf->Ln();
				$pdf->Cell(100, 0, 'Obra Civil', 1, 0, 'C', 1);
				$pdf->Cell(30, 0, 'Unidad', 1, 0, 'L', 1);
				$pdf->Cell(40, 0, 'Cantidad', 1, 0, 'C', 1);
				$pdf->Cell(40, 0, 'Valor Unitario', 1, 0, 'C', 1);		
				$pdf->Cell(40, 0, 'Valor Total', 1, 0, 'C', 1);
				$pdf->Ln();
				
				foreach ($arrUCGC as &$rowItem) {
						if ($rowItem['id_ucsbvalorarcuc'] == $row['id_ucsvalorarcuc'])
						{
							$pdf->SetFillColor(255, 255, 255);
							$pdf->SetTextColor(0);
							$pdf->SetFont('');
						
							$pdf->Cell(100, 0, $rowItem['obracivil'], 1, 0, 'C', 1);
							$pdf->Cell(30, 0, $rowItem['unidadbrev'], 1, 0, 'C', 1);
							$pdf->Cell(40, 0, $rowItem['cantidadpeso'], 1, 0, 'C', 1);
							$pdf->Cell(40, 0, $rowItem['valorunitario'], 1, 0, 'C', 1);
							$pdf->Cell(40, 0, $rowItem['valorobracivil'], 1, 0, 'C', 1);
							$pdf->Ln();
						}
					}
			}
			$pdf->Ln();
			
			//Otros Gastos
			if (pg_numrows($dsUCOG) > 0)
			{
				$pdf->SetFillColor(206, 206, 206);
				$pdf->SetTextColor(0, 0, 0);        
				$pdf->SetLineWidth(0.3);
				$pdf->SetFont('', 'B');
				$pdf->Cell(220, 0, 'Otros Gastos', 1, 0, 'C', 1);
				$pdf->Ln();
				$pdf->Cell(100, 0, 'Descripción', 1, 0, 'C', 1);
				$pdf->Cell(40, 0, 'Cantidad', 1, 0, 'L', 1);
				$pdf->Cell(40, 0, 'Valor Unitario', 1, 0, 'C', 1);	
				$pdf->Cell(40, 0, 'Valor Total', 1, 0, 'C', 1);
				$pdf->Ln();
				
				foreach ($arrUCOG as &$rowItem) {
						if ($rowItem['id_ucsbvalorarcuc'] == $row['id_ucsvalorarcuc'])
						{
							$pdf->SetFillColor(255, 255, 255);
							$pdf->SetTextColor(0);
							$pdf->SetFont('');
						
							$pdf->Cell(100, 0, $rowItem['otrosgastos'], 1, 0, 'C', 1);
							$pdf->Cell(40, 0, $rowItem['cantidadog'], 1, 0, 'C', 1);
							$pdf->Cell(40, 0, $rowItem['valorunitario'], 1, 0, 'C', 1);
							$pdf->Cell(40, 0, $rowItem['valorog'], 1, 0, 'C', 1);
							$pdf->Ln();
						}
					}
			}
			$pdf->Ln();
			$pdf->AddPage('L', 'A4');
		}
		}		
		
		//Resumen Otras Unidades Constructivas
		$pdf->SetFillColor(206, 206, 206);
	    $pdf->SetTextColor(0, 0, 0);        
	    $pdf->SetLineWidth(0.3);
	    $pdf->SetFont('', 'B');
		$pdf->Cell(260, 0, 'Resumen Otras Unidades Constructivas', 1, 0, 'C', 1);
		$pdf->Ln();				
		$pdf->Ln();
		
		if (pg_numrows($dsUCOT) > 0)
		{
			foreach ($arrUCOT as &$row) {
				//Encabezado
				$pdf->SetFillColor(206, 206, 206);
				$pdf->SetTextColor(0, 0, 0);        
				$pdf->SetLineWidth(0.3);
				$pdf->SetFont('', 'B');
				$pdf->Cell(40, 0, 'Código', 1, 0, 'L', 1);
				$pdf->Cell(80, 0, 'Descripción', 1, 0, 'L', 1);
				$pdf->Cell(40, 0, 'Cantidad', 1, 0, 'C', 1);			
				$pdf->Cell(40, 0, 'Tensión Servicio', 1, 0, 'C', 1);
				$pdf->Cell(40, 0, 'Clase Aislamiento', 1, 0, 'C', 1);
				$pdf->Ln();				
					
				//Datos
				$pdf->SetFillColor(255, 255, 255);
				$pdf->SetTextColor(0);
				$pdf->SetFont('');				
				$pdf->Cell(40, 0, $row['codigo'], 1, 0, 'C', 1);
				$pdf->Cell(80, 0, $row['descripcion'], 1, 0, 'C', 1);
				$pdf->Cell(40, 0, $row['cantidaditem'], 1, 0, 'C', 1);
				$pdf->Cell(40, 0, $row['tensionservicio'], 1, 0, 'C', 1);
				$pdf->Cell(40, 0, $row['claseaislamiento'], 1, 0, 'C', 1);
				$pdf->Ln();
				
				//Encabezado				
				$pdf->SetFillColor(206, 206, 206);
				$pdf->SetTextColor(0, 0, 0);        
				$pdf->SetLineWidth(0.3);
				$pdf->SetFont('', 'B');				
				$pdf->Cell(40, 0, 'Area Sub. (m2)', 1, 0, 'C', 1);
				$pdf->Cell(40, 0, 'Long. Vías (m)', 1, 0, 'C', 1);
				$pdf->Cell(40, 0, 'Norma', 1, 0, 'C', 1);
				$pdf->Cell(40, 0, 'Porc. Repuestos', 1, 0, 'C', 1);				
				$pdf->Cell(40, 0, 'Total', 1, 0, 'C', 1);
				$pdf->Ln();
					
				//Datos
				$pdf->SetFillColor(255, 255, 255);
				$pdf->SetTextColor(0);
				$pdf->SetFont('');				
				$pdf->Cell(40, 0, $row['areasubestacion'], 1, 0, 'C', 1);
				$pdf->Cell(40, 0, $row['longitudvias'], 1, 0, 'C', 1);
				$pdf->Cell(40, 0, $row['norma'], 1, 0, 'C', 1);
				$pdf->Cell(40, 0, $row['porcrepuestos'], 1, 0, 'C', 1);
				$pdf->Cell(40, 0, $row['valortotal'], 1, 0, 'C', 1);
				$pdf->Ln();
				$pdf->Ln();
				
				//Detalle de Items			
				if (pg_numrows($dsUCOTdet) > 0)
				{
					
					//Encabezado
					$pdf->SetFillColor(206, 206, 206);
					$pdf->SetTextColor(0, 0, 0);        
					$pdf->SetLineWidth(0.3);
					$pdf->SetFont('', 'B');
					$pdf->Cell(260, 0, 'Ítems', 1, 0, 'C', 1);
					$pdf->Ln();	
					$pdf->Cell(100, 0, 'Descripción', 1, 0, 'C', 1);
					$pdf->Cell(40, 0, 'Unidad', 1, 0, 'C', 1);
					$pdf->Cell(40, 0, 'Cantidad', 1, 0, 'C', 1);
					$pdf->Cell(40, 0, 'Valor Unitario', 1, 0, 'C', 1);
					$pdf->Cell(40, 0, 'Valor Total', 1, 0, 'C', 1);
					$pdf->Ln();
					
					foreach ($arrUCOTdet as &$rowItem) {
						if ($rowItem['id_ucsbvalorarouc'] == $row['id_ucsbvalorarouc'])
						{
							if ($rowItem['nivel'] == 1)
							{
								$pdf->SetFillColor(221, 221, 221);
								$pdf->SetFont('','B');
							}
							else if ($rowItem['nivel'] == 2)
							{
								$pdf->SetFillColor(255, 255, 255);
								$pdf->SetFont('','B');		
								
							}
							else {
								$pdf->SetFillColor(255, 255, 255);
								$pdf->SetFont('');		
							}					
							$pdf->SetTextColor(0);			        
							$pdf->Cell(100, 0, $rowItem['descripcion'], 1, 0, 'L', 1);
							$pdf->Cell(40, 0, $rowItem['unidadabrev'], 1, 0, 'C', 1);
							if ($rowItem['nivel'] == 3)
							{
								$pdf->Cell(40, 0, $rowItem['cantidaditem'], 1, 0, 'C', 1);	
								$pdf->Cell(40, 0, $rowItem['valorunitario'], 1, 0, 'R', 1);
							}
							else {
								$pdf->Cell(40, 0, '', 1, 0, 'C', 1);	
								$pdf->Cell(40, 0, '', 1, 0, 'R', 1);
							}
							$pdf->Cell(40, 0, $rowItem['valortotal'], 1, 0, 'R', 1);
							$pdf->Ln();
						}					
					}
					$pdf->Ln();
				}
				$pdf->Ln();

				//Detalle de Otros Gastos			
				if (pg_numrows($dsUCOTog) > 0)
				{
					//Encabezado
					$pdf->SetFillColor(206, 206, 206);
					$pdf->SetTextColor(0, 0, 0);        
					$pdf->SetLineWidth(0.3);
					$pdf->SetFont('', 'B');
					$pdf->Cell(220, 0, 'Otros Gastos', 1, 0, 'C', 1);
					$pdf->Ln();	
					$pdf->Cell(100, 0, 'Descripción', 1, 0, 'C', 1);				
					$pdf->Cell(40, 0, 'Cantidad', 1, 0, 'C', 1);
					$pdf->Cell(40, 0, 'Valor Unitario', 1, 0, 'C', 1);
					$pdf->Cell(40, 0, 'Valor Total', 1, 0, 'C', 1);
					$pdf->Ln();
					
					foreach ($arrUCOTog as &$rowItem) {
						if ($rowItem['id_ucsbvalorarouc'] == $row['id_ucsbvalorarouc'])
						{
							$pdf->SetFillColor(255, 255, 255);
							$pdf->SetTextColor(0, 0, 0);
							$pdf->SetFont('');
							$pdf->Cell(100, 0, $rowItem['otrosgastos'], 1, 0, 'L', 1);
							$pdf->Cell(40, 0, $rowItem['cantidadog'], 1, 0, 'C', 1);
							$pdf->Cell(40, 0, $rowItem['valorunitario'], 1, 0, 'R', 1);
							$pdf->Cell(40, 0, $rowItem['valorog'], 1, 0, 'R', 1);
							$pdf->Ln();
						}					
					}
				}
				$pdf->Ln();
			}
		}
		
		
		//Directo Contratista		
		$pdf->Output(__DIR__ . '/../reportes/ProyectoUUESE-' .pg_fetch_result($dsEncabezado, 0, 1) .'.pdf','F');		
	}
}

?>