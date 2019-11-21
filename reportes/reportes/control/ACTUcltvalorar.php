<?php
/**
*@package pXP
*@file gen-ACTUcltvalorar.php
*@author  (admin)
*@date 01-11-2018 14:22:48
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTUcltvalorar extends ACTbase{
		  
			
	function listarUcltvalorar(){
		$this->objParam->defecto('ordenacion','id_ucltvalorar');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODUcltvalorar','listarUcltvalorar');
		} else{
			$this->objFunc=$this->create('MODUcltvalorar');
			
			$this->res=$this->objFunc->listarUcltvalorar($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarUcltvalorar(){
		$this->objFunc=$this->create('MODUcltvalorar');	
		if($this->objParam->insertar('id_ucltvalorar')){
			$this->res=$this->objFunc->insertarUcltvalorar($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarUcltvalorar($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarUcltvalorar(){
		$this->objFunc=$this->create('MODUcltvalorar');	
		$this->res=$this->objFunc->eliminarUcltvalorar($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
	
	function obtenerproyectoUCLT()
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
			$res=pg_query($link,"SELECT * FROM snx.ft_ucltvalorar_get(" .$this->objParam->getParametro('id_ucltvalorar') .");");
			
			return $res;
		}
	}
	
	function obtenerproyectoUCLTUC()
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
			$res=pg_query($link,"SELECT * FROM snx.ft_ucltvaloraruc_get(" .$this->objParam->getParametro('id_ucltvalorar') .");");
			
			return $res;
		}
	}

	function obtenerproyectoUCLTUCEM()
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
			$res=pg_query($link,"SELECT * FROM snx.ft_ucltvalorarucem_get(" .$this->objParam->getParametro('id_ucltvalorar') .");");
			
			return $res;
		}
	}
	
	function obtenerproyectoUCLTUCOC()
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
			$res=pg_query($link,"SELECT * FROM snx.ft_ucltvalorarucoc_get(" .$this->objParam->getParametro('id_ucltvalorar') .");");
			
			return $res;
		}
	}

	function obtenerproyectoUCLTUCMON()
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
			$res=pg_query($link,"SELECT * FROM snx.ft_ucltvalorarumon_get(" .$this->objParam->getParametro('id_ucltvalorar') .");");
			
			return $res;
		}
	}

	function obtenerproyectoUCLTUCGC()
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
			$res=pg_query($link,"SELECT * FROM snx.ft_ucltvalorarucgc_get(" .$this->objParam->getParametro('id_ucltvalorar') .");");
			
			return $res;
		}
	}

	function obtenerproyectoUCLTUCOGRG()
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
			$res=pg_query($link,"SELECT * FROM snx.ft_ucltvalorarucogrg_get(" .$this->objParam->getParametro('id_ucltvalorar') .");");
			
			return $res;
		}
	}

	function ReportePDF()
	{
		$blnControl = FALSE;		
		$dsEncabezado = $this->obtenerproyectoUCLT();		
		$dsResumUC = $this->obtenerproyectoUCLTUC();
		$dsUCEM = $this->obtenerproyectoUCLTUCEM();
		$dsUCOC = $this->obtenerproyectoUCLTUCOC();
		$dsUCMON = $this->obtenerproyectoUCLTUCMON();
		$dsUCGC = $this->obtenerproyectoUCLTUCGC();
		$dsUCOGRG = $this->obtenerproyectoUCLTUCOGRG();
			
		$arrResumUC = pg_fetch_all($dsResumUC);
		$arrUCEM = pg_fetch_all($dsUCEM);		
		$arrUCOC = pg_fetch_all($dsUCOC);
		$arrUCMON = pg_fetch_all($dsUCMON);
		$arrUCGC = pg_fetch_all($dsUCGC);
		$arrUCOGRG = pg_fetch_all($dsUCOGRG);
				
		$pdf = new TCPDF;                   
		$pdf->AddPage('L', 'A4');
		
		$w = array(50, 100, 40, 45);
				
		$pdf->SetFillColor(206, 206, 206);
		$pdf->SetFont('', 'B', 9);
		$pdf->Cell(0, 0, 'Reporte Proyecto de Líneas de Transmisión', 1, 0, 'C', 1);
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
		$pdf->Cell($w[0], 0, 'Valor Total Proyecto', 1, 0, 'L', 1);		
		$pdf->SetFillColor(255, 255, 255);
        $pdf->SetTextColor(0);
        $pdf->SetFont('');		
		$pdf->Cell($w[1], 0, 'USD ' .number_format(floatval(pg_fetch_result($dsEncabezado, 0, 3)), 2, ".", ","), 1, 0, 'L', 1);		
		$pdf->Ln();
		$pdf->Ln();
		
		//Resumen de UCLT
		$pdf->SetFillColor(206, 206, 206);
        $pdf->SetTextColor(0, 0, 0);        
        $pdf->SetLineWidth(0.3);
        $pdf->SetFont('', 'B');
		$pdf->Cell(0, 0, 'Datos de Entrada Unidades Constructivas', 1, 0, 'C', 1);
		$pdf->Ln();
		$pdf->Ln();
		foreach ($arrResumUC as &$row) {
			//Encabezado 1
			$pdf->SetFillColor(206, 206, 206);
        	$pdf->SetTextColor(0, 0, 0);        
        	$pdf->SetLineWidth(0.3);
        	$pdf->SetFont('', 'B');
			$pdf->Cell(30, 0, '', 1, 0, 'C', 1);
			$pdf->Cell(147, 0, '', 1, 0, 'C', 1);
			$pdf->Cell(40, 0, '', 1, 0, 'C', 1);
			$pdf->Cell(30, 0, 'Tensión', 1, 0, 'C', 1);		
			$pdf->Cell(30, 0, 'Longitud', 1, 0, 'C', 1);						
	        $pdf->Ln();			
			$pdf->Cell(30, 0, 'Código', 1, 0, 'C', 1);
			$pdf->Cell(147, 0, 'Descripción', 1, 0, 'C', 1);
			$pdf->Cell(40, 0, 'Tipo Línea', 1, 0, 'C', 1);
			$pdf->Cell(30, 0, 'Servicio', 1, 0, 'C', 1);		
			$pdf->Cell(30, 0, '(km)', 1, 0, 'C', 1);					
			$pdf->Ln();
			
			//Datos 1
			$pdf->SetFillColor(255, 255, 255);
	        $pdf->SetTextColor(0);
	        $pdf->SetFont('');		
     		$pdf->Cell(30, 0, $row['codigo'], 1, 0, 'C', 1);
			$pdf->Cell(147, 0, $row['descripcion'], 1, 0, 'L', 1);
			$pdf->Cell(40, 0, $row['tipolinea'], 1, 0, 'C', 1);
			$pdf->Cell(30, 0, $row['tensionservicio'], 1, 0, 'C', 1);		
			$pdf->Cell(30, 0, $row['longitud'], 1, 0, 'C', 1);
			$pdf->Ln();	
			
			//Encabezado 2
			$pdf->SetFillColor(206, 206, 206);
        	$pdf->SetTextColor(0, 0, 0);        
        	$pdf->SetLineWidth(0.3);
        	$pdf->SetFont('', 'B');
			$pdf->Cell(100, 0, '', 1, 0, 'C', 1);		
			$pdf->Cell(30, 0, 'Long. Transporte', 1, 0, 'C', 1);						
			$pdf->Cell(30, 0, 'Long. Transporte', 1, 0, 'C', 1);
			$pdf->Cell(30, 0, 'Conductores', 1, 0, 'C', 1);
			$pdf->Cell(30, 0, '', 1, 0, 'C', 1);
			$pdf->Cell(30, 0, 'Hilos de', 1, 0, 'C', 1);
			$pdf->Cell(25, 0, '', 1, 0, 'C', 1);
	        $pdf->Ln();
			$pdf->Cell(100, 0, 'Conductor', 1, 0, 'C', 1);		
			$pdf->Cell(30, 0, 'Extr (km)', 1, 0, 'C', 1);					
			$pdf->Cell(30, 0, 'Nac (km)', 1, 0, 'C', 1);
			$pdf->Cell(30, 0, 'por Fase', 1, 0, 'C', 1);
			$pdf->Cell(30, 0, 'Configuración', 1, 0, 'C', 1);
			$pdf->Cell(30, 0, 'Guarda', 1, 0, 'C', 1);
			$pdf->Cell(25, 0, 'Altura', 1, 0, 'C', 1);
			$pdf->Ln();		
			
			//Datos 2	
			$pdf->SetFillColor(255, 255, 255);
	        $pdf->SetTextColor(0);
	        $pdf->SetFont('');
			$pdf->Cell(100, 0, $row['desc_tipoconductor'], 1, 0, 'C', 1);
			$pdf->Cell(30, 0, $row['distanciatransporteext'], 1, 0, 'C', 1);
			$pdf->Cell(30, 0, $row['distanciatransporte'], 1, 0, 'C', 1);			
			$pdf->Cell(30, 0, $row['conductorfase'], 1, 0, 'C', 1);
			$pdf->Cell(30, 0, $row['desc_configuracionlt'], 1, 0, 'C', 1);			
			$pdf->Cell(30, 0, $row['desc_hilosguarda'], 1, 0, 'C', 1);
			$pdf->Cell(25, 0, $row['desc_valoraltura'], 1, 0, 'C', 1);
			$pdf->Ln();	
			
			//Encabezado 3
			$pdf->SetFillColor(206, 206, 206);
        	$pdf->SetTextColor(0, 0, 0);        
        	$pdf->SetLineWidth(0.3);
        	$pdf->SetFont('', 'B');
			$pdf->Cell(40, 0, '', 1, 0, 'C', 1);
			$pdf->Cell(30, 0, '', 1, 0, 'C', 1);		
			$pdf->Cell(30, 0, 'Estructura', 1, 0, 'C', 1);
			$pdf->Cell(30, 0, 'Estructura', 1, 0, 'C', 1);
			$pdf->Cell(30, 0, 'Estructura', 1, 0, 'C', 1);
			$pdf->Cell(30, 0, 'Estructura', 1, 0, 'C', 1);
			$pdf->Cell(25, 0, 'Terreno', 1, 0, 'C', 1);
			$pdf->Cell(25, 0, 'Terreno', 1, 0, 'C', 1);
			$pdf->Cell(25, 0, 'Terreno', 1, 0, 'C', 1);		
			$pdf->Ln();
			$pdf->Cell(40, 0, 'Revista', 1, 0, 'C', 1);
			$pdf->Cell(30, 0, 'Pararrayos', 1, 0, 'C', 1);		
			$pdf->Cell(30, 0, 'Paso Cant.', 1, 0, 'C', 1);
			$pdf->Cell(30, 0, 'Paso Peso', 1, 0, 'C', 1);
			$pdf->Cell(30, 0, 'Amarre Cant.', 1, 0, 'C', 1);
			$pdf->Cell(30, 0, 'Amarre Peso', 1, 0, 'C', 1);
			$pdf->Cell(25, 0, 'Firme (%)', 1, 0, 'C', 1);
			$pdf->Cell(25, 0, 'Intermedio (%)', 1, 0, 'C', 1);
			$pdf->Cell(25, 0, 'Blando (%)', 1, 0, 'C', 1);			
			$pdf->Ln();		
			
			//Datos 3	
			$pdf->SetFillColor(255, 255, 255);
	        $pdf->SetTextColor(0);
	        $pdf->SetFont('');
			$pdf->Cell(40, 0, $row['desc_revista'], 1, 0, 'C', 1);
			$pdf->Cell(30, 0, $row['desc_pararrayolinea'], 1, 0, 'C', 1);
			$pdf->Cell(30, 0, $row['estructurapasocantidad'], 1, 0, 'C', 1);
			$pdf->Cell(30, 0, $row['estructurapasopeso'], 1, 0, 'C', 1);
			$pdf->Cell(30, 0, $row['estructuraamarrecantidad'], 1, 0, 'C', 1);
			$pdf->Cell(30, 0, $row['estructuraamarrepeso'], 1, 0, 'C', 1);
			$pdf->Cell(25, 0, $row['porcmterrenofirme'], 1, 0, 'C', 1);
			$pdf->Cell(25, 0, $row['porcmterrenointerme'], 1, 0, 'C', 1);
			$pdf->Cell(25, 0, $row['porcmterrenoterrenoblando'], 1, 0, 'C', 1);			
			$pdf->Ln();	
			
			//Encabezado 4
			$pdf->SetFillColor(206, 206, 206);
        	$pdf->SetTextColor(0, 0, 0);        
        	$pdf->SetLineWidth(0.3);
        	$pdf->SetFont('', 'B');
			$pdf->Cell(25, 0, 'Terreno', 1, 0, 'C', 1);			
			$pdf->Cell(25, 0, '', 1, 0, 'C', 1);
			$pdf->Cell(25, 0, '', 1, 0, 'C', 1);
			$pdf->Cell(25, 0, '', 1, 0, 'C', 1);
			$pdf->Cell(25, 0, '', 1, 0, 'C', 1);	
			$pdf->Cell(30, 0, 'Terreno', 1, 0, 'C', 1);
			$pdf->Cell(30, 0, 'Terreno', 1, 0, 'C', 1);
			$pdf->Cell(30, 0, 'Terreno', 1, 0, 'C', 1);	
			$pdf->Cell(30, 0, 'Zona', 1, 0, 'C', 1);
			$pdf->Cell(30, 0, 'Tipo', 1, 0, 'C', 1);
			$pdf->Ln();
			$pdf->Cell(25, 0, 'Sumergido (%)', 1, 0, 'C', 1);
			$pdf->Cell(25, 0, 'Malez (%)', 1, 0, 'C', 1);
			$pdf->Cell(25, 0, 'Matorral (%)', 1, 0, 'C', 1);
			$pdf->Cell(25, 0, 'Forestación (%)', 1, 0, 'C', 1);
			$pdf->Cell(25, 0, 'Bosque (%)', 1, 0, 'C', 1);
			$pdf->Cell(30, 0, 'Plano (%)', 1, 0, 'C', 1);
			$pdf->Cell(30, 0, 'Ondulado (%)', 1, 0, 'C', 1);
			$pdf->Cell(30, 0, 'Cerros (%)', 1, 0, 'C', 1);
			$pdf->Cell(30, 0, 'Protegida', 1, 0, 'C', 1);
			$pdf->Cell(30, 0, 'Estructura', 1, 0, 'C', 1);
			$pdf->Ln();	
			
			//Datos 4
			$pdf->SetFillColor(255, 255, 255);
	        $pdf->SetTextColor(0);
	        $pdf->SetFont('');
			$pdf->Cell(25, 0, $row['porcmterrenosumer'], 1, 0, 'C', 1);
			$pdf->Cell(25, 0, $row['porcvegetamaleza'], 1, 0, 'C', 1);
			$pdf->Cell(25, 0, $row['porcvegetamatorral'], 1, 0, 'C', 1);
			$pdf->Cell(25, 0, $row['porcvegetaforestacion'], 1, 0, 'C', 1);
			$pdf->Cell(25, 0, $row['porcvegetabosque'], 1, 0, 'C', 1);
			$pdf->Cell(30, 0, $row['porcterrenoplano'], 1, 0, 'C', 1);
			$pdf->Cell(30, 0, $row['porcterrenoondulado'], 1, 0, 'C', 1);
			$pdf->Cell(30, 0, $row['porcterrenocerros'], 1, 0, 'C', 1);
			$pdf->Cell(30, 0, $row['desc_areaprotegida'], 1, 0, 'C', 1);
			$pdf->Cell(30, 0, $row['desc_tipoestructura'], 1, 0, 'C', 1);
			$pdf->Ln();	
			
			//Encabezado 5
			$pdf->SetFillColor(206, 206, 206);
        	$pdf->SetTextColor(0, 0, 0);        
        	$pdf->SetLineWidth(0.3);
        	$pdf->SetFont('', 'B');
			$pdf->Cell(30, 0, 'Nivel', 1, 0, 'C', 1);	
			$pdf->Ln();
			$pdf->Cell(30, 0, 'Contaminación', 1, 0, 'C', 1);
			$pdf->Ln();	
			
			//Datos 5
			$pdf->SetFillColor(255, 255, 255);
	        $pdf->SetTextColor(0);
	        $pdf->SetFont('');
			$pdf->Cell(30, 0, $row['desc_nivelcontaminacionlt'], 1, 0, 'C', 1);
			
			
			$pdf->Ln();	
			$pdf->Ln();	
		}
		
		//Resumen de UCLT
		$pdf->SetFillColor(206, 206, 206);
        $pdf->SetTextColor(0, 0, 0);        
        $pdf->SetLineWidth(0.3);
        $pdf->SetFont('', 'B');
		$pdf->Cell(0, 0, 'Resumen Unidades Constructivas', 1, 0, 'C', 1);
		$pdf->Ln();
		$pdf->Ln();
		foreach ($arrResumUC as &$row) {
			//Encabezado 1
			$pdf->SetFillColor(206, 206, 206);
        	$pdf->SetTextColor(0, 0, 0);        
        	$pdf->SetLineWidth(0.3);
        	$pdf->SetFont('', 'B');
			$pdf->Cell(30, 0, '', 1, 0, 'C', 1);
			$pdf->Cell(147, 0, '', 1, 0, 'C', 1);
			$pdf->Cell(40, 0, '', 1, 0, 'C', 1);
			$pdf->Cell(30, 0, 'Tensión', 1, 0, 'C', 1);		
									
	        $pdf->Ln();			
			$pdf->Cell(30, 0, 'Código', 1, 0, 'C', 1);
			$pdf->Cell(147, 0, 'Descripción', 1, 0, 'C', 1);
			$pdf->Cell(40, 0, 'Tipo Línea', 1, 0, 'C', 1);
			$pdf->Cell(30, 0, 'Servicio', 1, 0, 'C', 1);		
								
			$pdf->Ln();			
			
			//Datos 1
			$pdf->SetFillColor(255, 255, 255);
	        $pdf->SetTextColor(0);
	        $pdf->SetFont('');
		
     		$pdf->Cell(30, 0, $row['codigo'], 1, 0, 'C', 1);
			$pdf->Cell(147, 0, $row['descripcion'], 1, 0, 'L', 1);
			$pdf->Cell(40, 0, $row['tipolinea'], 1, 0, 'C', 1);
			$pdf->Cell(30, 0, $row['tensionservicio'], 1, 0, 'C', 1);		
			
			$pdf->Ln();	
			
			//Encabezado 2
			$pdf->SetFillColor(206, 206, 206);
	        $pdf->SetTextColor(0, 0, 0);        
	        $pdf->SetLineWidth(0.3);
	        $pdf->SetFont('', 'B');
			$pdf->Cell(34, 0, '', 1, 0, 'C', 1);
			$pdf->Cell(34, 0, '', 1, 0, 'C', 1);
			$pdf->Cell(34, 0, 'Obra', 1, 0, 'C', 1);
			$pdf->Cell(35, 0, '', 1, 0, 'C', 1);
			$pdf->Cell(35, 0, '', 1, 0, 'C', 1);
			$pdf->Cell(35, 0, 'Administración', 1, 0, 'C', 1);
			$pdf->Cell(35, 0, 'Supervicion', 1, 0, 'C', 1);
			$pdf->Cell(35, 0, 'Costos', 1, 0, 'C', 1);			
			$pdf->Ln();	
			$pdf->Cell(34, 0, 'DDP', 1, 0, 'C', 1);	
			$pdf->Cell(34, 0, 'Montaje', 1, 0, 'C', 1);
			$pdf->Cell(34, 0, 'Civil', 1, 0, 'C', 1);
			$pdf->Cell(35, 0, 'Ingeniería', 1, 0, 'C', 1);
			$pdf->Cell(35, 0, 'Inspección', 1, 0, 'C', 1);
			$pdf->Cell(35, 0, 'Ejecución', 1, 0, 'C', 1);
			$pdf->Cell(35, 0, 'de Obra', 1, 0, 'C', 1);
			$pdf->Cell(35, 0, 'Financieros', 1, 0, 'C', 1);			
			$pdf->Ln();			
			
			//Datos 2
			$pdf->SetFillColor(255, 255, 255);
	        $pdf->SetTextColor(0);
	        $pdf->SetFont('');
			$pdf->Cell(34, 0, number_format(floatval($row['numddp']), 2, ".", ","), 1, 0, 'R', 1);			
			$pdf->Cell(34, 0, number_format(floatval($row['nummontaje']), 2, ".", ","), 1, 0, 'R', 1);
			$pdf->Cell(34, 0, number_format(floatval($row['numoc']), 2, ".", ","), 1, 0, 'R', 1);
			$pdf->Cell(35, 0, number_format(floatval($row['numingenieria']), 2, ".", ","), 1, 0, 'R', 1);
			$pdf->Cell(35, 0, number_format(floatval($row['numinspeccion']), 2, ".", ","), 1, 0, 'R', 1);
			$pdf->Cell(35, 0, number_format(floatval($row['numadmeje']), 2, ".", ","), 1, 0, 'R', 1);
			$pdf->Cell(35, 0, number_format(floatval($row['numsupero']), 2, ".", ","), 1, 0, 'R', 1);
			$pdf->Cell(35, 0, number_format(floatval($row['numcfinan']), 2, ".", ","), 1, 0, 'R', 1);
			$pdf->Ln();
			
			//Encabezado 3
			$pdf->SetFillColor(206, 206, 206);
	        $pdf->SetTextColor(0, 0, 0);        
	        $pdf->SetLineWidth(0.3);
	        $pdf->SetFont('', 'B');
			$pdf->Cell(35, 0, 'Costos Aspectos', 1, 0, 'C', 1);
			$pdf->Cell(35, 0, 'Costos Aspectos', 1, 0, 'C', 1);
			$pdf->Cell(35, 0, 'Costo Total', 1, 0, 'C', 1);
			$pdf->Cell(35, 0, 'Costo Total', 1, 0, 'C', 1);
			$pdf->Ln();	
			$pdf->Cell(35, 0, 'Ambientales', 1, 0, 'C', 1);
			$pdf->Cell(35, 0, 'Prediales', 1, 0, 'C', 1);
			$pdf->Cell(35, 0, 'UC (USD/km)', 1, 0, 'C', 1);
			$pdf->Cell(35, 0, 'UC (USD)', 1, 0, 'C', 1);
			$pdf->Ln();			
			
			//Datos 3
			$pdf->SetFillColor(255, 255, 255);
	        $pdf->SetTextColor(0);
	        $pdf->SetFont('');
			$pdf->Cell(35, 0, number_format(floatval($row['numcaamb']), 2, ".", ","), 1, 0, 'R', 1);			
			$pdf->Cell(35, 0, number_format(floatval($row['numcapred']), 2, ".", ","), 1, 0, 'R', 1);
			$pdf->Cell(35, 0, number_format(floatval($row['numcostototaluc']), 2, ".", ","), 1, 0, 'R', 1);
			$pdf->Cell(35, 0, number_format(floatval($row['numcostototaluct']), 2, ".", ","), 1, 0, 'R', 1);
			$pdf->Ln();
			$pdf->Ln();
   		}
		
		$pdf->AddPage('L', 'A4');
		//Resumen de UCLT
		$pdf->SetFillColor(206, 206, 206);
        $pdf->SetTextColor(0, 0, 0);        
        $pdf->SetLineWidth(0.3);
        $pdf->SetFont('', 'B');
		$pdf->Cell(0, 0, 'Detalle Unidades Constructivas', 1, 0, 'C', 1);
		$pdf->Ln();
		$pdf->Ln();		
		foreach ($arrResumUC as &$row) {
			if ($blnControl == FALSE)
				$blnControl = TRUE;
			else
				$pdf->AddPage('L', 'A4');
			    		
			$pdf->SetFillColor(206, 206, 206);
        	$pdf->SetTextColor(0, 0, 0);        
        	$pdf->SetLineWidth(0.3);
        	$pdf->SetFont('', 'B');
			$pdf->Cell(30, 0, 'Código', 1, 0, 'C', 1);
			$pdf->Cell(147, 0, 'Descripción', 1, 0, 'C', 1);
			$pdf->Cell(60, 0, 'Tipo Línea', 1, 0, 'C', 1);
			$pdf->Cell(40, 0, 'Tensión Servicio', 1, 0, 'C', 1);
	        $pdf->Ln();		
			$pdf->SetFillColor(255, 255, 255);
	        $pdf->SetTextColor(0);
	        $pdf->SetFont('');
			$pdf->Cell(30, 0, $row['codigo'], 1, 0, 'C', 1);
			$pdf->Cell(147, 0, $row['descripcion'], 1, 0, 'L', 1);
			$pdf->Cell(60, 0, $row['tipolinea'], 1, 0, 'C', 1);
			$pdf->Cell(40, 0, $row['tensionservicio'], 1, 0, 'C', 1);		
			$pdf->Ln();				
			$pdf->SetFillColor(206, 206, 206);
        	$pdf->SetTextColor(0, 0, 0);        
        	$pdf->SetLineWidth(0.3);
        	$pdf->SetFont('', 'B');
			$pdf->Cell(30, 0, 'Longitud', 1, 0, 'C', 1);
			$pdf->Cell(50, 0, 'Costo Total UC (USD)', 1, 0, 'C', 1);	
			$pdf->Ln();		
			$pdf->SetFillColor(255, 255, 255);
	        $pdf->SetTextColor(0);
	        $pdf->SetFont('');
			$pdf->Cell(30, 0, $row['longitud'], 1, 0, 'C', 1);
			$pdf->Cell(50, 0, number_format(floatval($row['numcostototaluct']), 2, ".", ","), 1, 0, 'R', 1);
			$pdf->Ln();
			$pdf->Ln();	
			
			//Equipos y Materiales
			$pdf->SetFillColor(206, 206, 206);
	        $pdf->SetTextColor(0, 0, 0);        
	        $pdf->SetLineWidth(0.3);
	        $pdf->SetFont('', 'B');
			$pdf->Cell(0, 0, 'Equipos y Materiales', 1, 0, 'C', 1);
			$pdf->Ln();			
			$pdf->Cell(62, 0, '', 1, 0, 'C', 1);
			$pdf->Cell(20, 0, '', 1, 0, 'C', 1);
			$pdf->Cell(25, 0, '', 1, 0, 'C', 1);			
			$pdf->Cell(20, 0, 'C. Uni.', 1, 0, 'C', 1);
			$pdf->Cell(25, 0, 'C. Total', 1, 0, 'C', 1);	
			$pdf->Cell(20, 0, 'C. Uni.', 1, 0, 'C', 1);
			$pdf->Cell(25, 0, 'C. Total', 1, 0, 'C', 1);
			$pdf->Cell(20, 0, 'Peso. Uni.', 1, 0, 'C', 1);
			$pdf->Cell(20, 0, 'Peso. Total', 1, 0, 'C', 1);
			$pdf->Cell(20, 0, 'Peso. Uni.', 1, 0, 'C', 1);
			$pdf->Cell(20, 0, 'Peso. Total', 1, 0, 'C', 1);
			$pdf->Ln();			
			$pdf->Cell(62, 0, 'Descripción', 1, 0, 'C', 1);
			$pdf->Cell(20, 0, 'Und.', 1, 0, 'C', 1);
			$pdf->Cell(25, 0, 'Cant.', 1, 0, 'C', 1);			
			$pdf->Cell(20, 0, 'Ext', 1, 0, 'C', 1);
			$pdf->Cell(25, 0, 'Ext', 1, 0, 'C', 1);	
			$pdf->Cell(20, 0, 'Nac', 1, 0, 'C', 1);
			$pdf->Cell(25, 0, 'Nac', 1, 0, 'C', 1);
			$pdf->Cell(20, 0, 'Ext', 1, 0, 'C', 1);
			$pdf->Cell(20, 0, 'Ext', 1, 0, 'C', 1);
			$pdf->Cell(20, 0, 'Nac', 1, 0, 'C', 1);
			$pdf->Cell(20, 0, 'Nac', 1, 0, 'C', 1);			
			$pdf->Ln();
			$pdf->SetFillColor(255, 255, 255);
		    $pdf->SetTextColor(0);
		    $pdf->SetFont('');
			foreach ($arrUCEM as &$rowEM) {
				if ($rowEM['id_ucltvaloraruc'] == $row['id_ucltvaloraruc'])
				{
					$pdf->Cell(62, 0, $rowEM['item'], 1, 0, 'L', 1);
					$pdf->Cell(20, 0, $rowEM['unidadabrev'], 1, 0, 'C', 1);
					$pdf->Cell(25, 0, number_format(floatval($rowEM['cantidaditem']), 2, ".", ","), 1, 0, 'C', 1);
					$pdf->Cell(20, 0, number_format(floatval($rowEM['costounitarioext']), 2, ".", ","), 1, 0, 'R', 1);
					$pdf->Cell(25, 0, number_format(floatval($rowEM['costototalext']), 2, ".", ","), 1, 0, 'R', 1);
					$pdf->Cell(20, 0, number_format(floatval($rowEM['costounitarionac']), 2, ".", ","), 1, 0, 'R', 1);
					$pdf->Cell(25, 0, number_format(floatval($rowEM['costototalnac']), 2, ".", ","), 1, 0, 'R', 1);
					$pdf->Cell(20, 0, number_format(floatval($rowEM['pesounitarioext']), 2, ".", ","), 1, 0, 'R', 1);
					$pdf->Cell(20, 0, number_format(floatval($rowEM['pesototalext']), 2, ".", ","), 1, 0, 'R', 1);
					$pdf->Cell(20, 0, number_format(floatval($rowEM['pesounitarionac']), 2, ".", ","), 1, 0, 'R', 1);
					$pdf->Cell(20, 0, number_format(floatval($rowEM['pesototalnac']), 2, ".", ","), 1, 0, 'R', 1);
					$pdf->Ln();
				}
			}
			$pdf->Ln();
			
			//Obra Civil
			$pdf->SetFillColor(206, 206, 206);
	        $pdf->SetTextColor(0, 0, 0);        
	        $pdf->SetLineWidth(0.3);
	        $pdf->SetFont('', 'B');
			$pdf->Cell(0, 0, 'Obra Civil', 1, 0, 'C', 1);
			$pdf->Ln();
			$pdf->Cell(117, 0, 'Descripción', 1, 0, 'C', 1);
			$pdf->Cell(20, 0, 'Cant.', 1, 0, 'C', 1);
			$pdf->Cell(35, 0, 'C. Uni.', 1, 0, 'C', 1);			
			$pdf->Cell(35, 0, 'C. Total.', 1, 0, 'C', 1);
			$pdf->Cell(35, 0, 'Peso. Uni.', 1, 0, 'C', 1);	
			$pdf->Cell(35, 0, 'Peso. Total', 1, 0, 'C', 1);
			$pdf->Ln();
			$pdf->SetFillColor(255, 255, 255);
		    $pdf->SetTextColor(0);
		    $pdf->SetFont('');
			foreach ($arrUCOC as &$rowOC) {
				if ($rowOC['id_ucltvaloraruc'] == $row['id_ucltvaloraruc'])
				{
					$pdf->Cell(117, 0, $rowOC['terrenolt'] .' - ' .$rowOC['funcionestructura'] .' - ' .$rowOC['tipocimentacion'], 1, 0, 'L', 1);					
					$pdf->Cell(20, 0, number_format(floatval($rowOC['cantidaditem']), 2, ".", ","), 1, 0, 'C', 1);
					$pdf->Cell(35, 0, number_format(floatval($rowOC['costounitariooc']), 2, ".", ","), 1, 0, 'R', 1);
					$pdf->Cell(35, 0, number_format(floatval($rowOC['costototaloc']), 2, ".", ","), 1, 0, 'R', 1);
					$pdf->Cell(35, 0, number_format(floatval($rowOC['pesounitariooc']), 2, ".", ","), 1, 0, 'R', 1);
					$pdf->Cell(35, 0, number_format(floatval($rowOC['pesototaloc']), 2, ".", ","), 1, 0, 'R', 1);
					$pdf->Ln();
				}
			}
			$pdf->Ln();

			//Montaje
			$pdf->SetFillColor(206, 206, 206);
	        $pdf->SetTextColor(0, 0, 0);        
	        $pdf->SetLineWidth(0.3);
	        $pdf->SetFont('', 'B');
			$pdf->Cell(0, 0, 'Montaje', 1, 0, 'C', 1);
			$pdf->Ln();
			$pdf->Cell(117, 0, 'Descripción', 1, 0, 'C', 1);
			$pdf->Cell(25, 0, 'Und.', 1, 0, 'C', 1);
			$pdf->Cell(45, 0, 'Cant.', 1, 0, 'C', 1);			
			$pdf->Cell(45, 0, 'C. Uni.', 1, 0, 'C', 1);
			$pdf->Cell(45, 0, 'C. Total', 1, 0, 'C', 1);			
			$pdf->Ln();
			$pdf->SetFillColor(255, 255, 255);
		    $pdf->SetTextColor(0);
		    $pdf->SetFont('');
			foreach ($arrUCMON as &$rowMON) {
				if ($rowMON['id_ucltvaloraruc'] == $row['id_ucltvaloraruc'])
				{
					$pdf->Cell(117, 0, $rowMON['item'], 1, 0, 'L', 1);					
					$pdf->Cell(25, 0, $rowMON['unidadabrev'], 1, 0, 'C', 1);
					$pdf->Cell(45, 0, number_format(floatval($rowMON['cantidaditem']), 2, ".", ","), 1, 0, 'C', 1);
					$pdf->Cell(45, 0, number_format(floatval($rowMON['costounitario']), 2, ".", ","), 1, 0, 'R', 1);
					$pdf->Cell(45, 0, number_format(floatval($rowMON['costototal']), 2, ".", ","), 1, 0, 'R', 1);
					$pdf->Ln();
				}
			}
			$pdf->Ln();
			
			//Gastos del Contratista
			$pdf->SetFillColor(206, 206, 206);
	        $pdf->SetTextColor(0, 0, 0);        
	        $pdf->SetLineWidth(0.3);
	        $pdf->SetFont('', 'B');
			$pdf->Cell(0, 0, 'Gastos del Contratista', 1, 0, 'C', 1);
			$pdf->Ln();
			$pdf->Cell(117, 0, 'Descripción', 1, 0, 'C', 1);
			$pdf->Cell(25, 0, 'Und.', 1, 0, 'C', 1);
			$pdf->Cell(45, 0, 'Costo Base', 1, 0, 'C', 1);			
			$pdf->Cell(45, 0, 'Cant./Porc.', 1, 0, 'C', 1);
			$pdf->Cell(45, 0, 'C. Total', 1, 0, 'C', 1);			
			$pdf->Ln();
			$pdf->SetFillColor(255, 255, 255);
		    $pdf->SetTextColor(0);
		    $pdf->SetFont('');
			foreach ($arrUCGC as &$rowCG) {
				if ($rowCG['id_ucltvaloraruc'] == $row['id_ucltvaloraruc'])
				{
					$pdf->Cell(117, 0, $rowCG['descripcion'], 1, 0, 'L', 1);					
					$pdf->Cell(25, 0, $rowCG['unidad'], 1, 0, 'C', 1);
					$pdf->Cell(45, 0, number_format(floatval($rowCG['costobase']), 2, ".", ","), 1, 0, 'R', 1);
					$pdf->Cell(45, 0, number_format(floatval($rowCG['cantidaditem']), 2, ".", ","), 1, 0, 'C', 1);
					$pdf->Cell(45, 0, number_format(floatval($rowCG['costototal']), 2, ".", ","), 1, 0, 'R', 1);
					$pdf->Ln();
				}
			}
			$pdf->Ln();
			
			//Otros Gastos y Resumen General
			$pdf->SetFillColor(206, 206, 206);
	        $pdf->SetTextColor(0, 0, 0);        
	        $pdf->SetLineWidth(0.3);
	        $pdf->SetFont('', 'B');
			$pdf->Cell(0, 0, 'Otros Gastos y Resumen General', 1, 0, 'C', 1);
			$pdf->Ln();
			$pdf->Cell(117, 0, 'Descripción', 1, 0, 'C', 1);
			$pdf->Cell(25, 0, 'Und.', 1, 0, 'C', 1);
			$pdf->Cell(45, 0, 'Costo Base', 1, 0, 'C', 1);			
			$pdf->Cell(45, 0, 'Cant./Porc.', 1, 0, 'C', 1);
			$pdf->Cell(45, 0, 'C. Total', 1, 0, 'C', 1);			
			$pdf->Ln();
			$pdf->SetFillColor(255, 255, 255);
		    $pdf->SetTextColor(0);
		    $pdf->SetFont('');
			foreach ($arrUCOGRG as &$rowOGRG) {
				if ($rowOGRG['id_ucltvaloraruc'] == $row['id_ucltvaloraruc'])
				{
					$pdf->Cell(117, 0, $rowOGRG['descripcion'], 1, 0, 'L', 1);					
					$pdf->Cell(25, 0, $rowOGRG['unidad'], 1, 0, 'C', 1);
					$pdf->Cell(45, 0, number_format(floatval($rowOGRG['costobase']), 2, ".", ","), 1, 0, 'R', 1);
					$pdf->Cell(45, 0, number_format(floatval($rowOGRG['cantidaditem']), 2, ".", ","), 1, 0, 'C', 1);
					$pdf->Cell(45, 0, number_format(floatval($rowOGRG['costototal']), 2, ".", ","), 1, 0, 'R', 1);
					$pdf->Ln();
				}
			}
		}	
		
		
		$pdf->Output(__DIR__ . '/../reportes/ProyectoUUCLT-' .pg_fetch_result($dsEncabezado, 0, 1) .'.pdf','F');		
	}		

	function ReporteEXCEL()
	{
		
		$intRowExcel = 10;
		$intRowAnt = 0;
		
		$blnControl = FALSE;		
		$dsEncabezado = $this->obtenerproyectoUCLT();		
		$dsResumUC = $this->obtenerproyectoUCLTUC();
		$dsUCEM = $this->obtenerproyectoUCLTUCEM();
		$dsUCOC = $this->obtenerproyectoUCLTUCOC();
		$dsUCMON = $this->obtenerproyectoUCLTUCMON();
		$dsUCGC = $this->obtenerproyectoUCLTUCGC();
		$dsUCOGRG = $this->obtenerproyectoUCLTUCOGRG();
			
		$arrResumUC = pg_fetch_all($dsResumUC);
		$arrUCEM = pg_fetch_all($dsUCEM);		
		$arrUCOC = pg_fetch_all($dsUCOC);
		$arrUCMON = pg_fetch_all($dsUCMON);
		$arrUCGC = pg_fetch_all($dsUCGC);
		$arrUCOGRG = pg_fetch_all($dsUCOGRG);
				
		$Excel = new PHPExcel();
		$Excel->getProperties()->setTitle(pg_fetch_result($dsEncabezado, 0, 1))
        ->setDescription(pg_fetch_result($dsEncabezado, 0, 2));
		$Excel->getDefaultStyle()->getFont()->setName('Arial');
		$Excel->getDefaultStyle()->getFont()->setSize(10);		
		$Excel->setActiveSheetIndex(0);		
		$Excel->getActiveSheet()->getColumnDimension('A')->setWidth(13);
		$Excel->getActiveSheet()->getColumnDimension('B')->setWidth(13);
		$Excel->getActiveSheet()->getColumnDimension('C')->setWidth(13);
		$Excel->getActiveSheet()->getColumnDimension('F')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('G')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('H')->setWidth(15);	
		$Excel->getActiveSheet()->getColumnDimension('I')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('J')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('K')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('L')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('M')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('N')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('O')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('P')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('Q')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('R')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('S')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('T')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('U')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('V')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('W')->setWidth(15);	
		$Excel->getActiveSheet()->getColumnDimension('X')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('Y')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('Z')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('AA')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('AB')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('AC')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('AD')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('AE')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('AF')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('AG')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('AH')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('AI')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('AJ')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('AK')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('AL')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('AM')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('AN')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('AO')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('AP')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('AQ')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('AR')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('AS')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('AT')->setWidth(15);
		$Excel->getActiveSheet()->getColumnDimension('AU')->setWidth(15);
		
		//Encabezado
		$Excel->getActiveSheet()->mergeCells('A1:T1');
		$Excel->getActiveSheet()->setCellValue('A1','Reporte Proyecto de Líneas de Transmisión');	
		$Excel->getActiveSheet()->getStyle('A1')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
		$Excel->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		$Excel->getActiveSheet()->getStyle('A1')->getFont()->setBold( true );
		$Excel->getActiveSheet()->getStyle('A1:T1')->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN)->getColor()->setRGB('000000');
		
		$Excel->getActiveSheet()->mergeCells('A3:B3');
		$Excel->getActiveSheet()->mergeCells('A4:B4');
		$Excel->getActiveSheet()->mergeCells('A5:B5');	
		$Excel->getActiveSheet()->setCellValue('A3','Código Proyecto');
		$Excel->getActiveSheet()->setCellValue('A4','Proyecto');
		$Excel->getActiveSheet()->setCellValue('A5','Valor Total Proyecto');
		$Excel->getActiveSheet()->getStyle('A3')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
		$Excel->getActiveSheet()->getStyle('A4')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
		$Excel->getActiveSheet()->getStyle('A5')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
		$Excel->getActiveSheet()->getStyle('A3')->getFont()->setBold( true );
		$Excel->getActiveSheet()->getStyle('A4')->getFont()->setBold( true );
		$Excel->getActiveSheet()->getStyle('A5')->getFont()->setBold( true );
		$Excel->getActiveSheet()->mergeCells('C3:E3');
		$Excel->getActiveSheet()->mergeCells('C4:E4');
		$Excel->getActiveSheet()->mergeCells('C5:E5');
		$Excel->getActiveSheet()->setCellValue('C3',pg_fetch_result($dsEncabezado, 0, 1));
		$Excel->getActiveSheet()->setCellValue('C4',pg_fetch_result($dsEncabezado, 0, 2));
		$Excel->getActiveSheet()->setCellValue('C5',number_format(floatval(pg_fetch_result($dsEncabezado, 0, 3)), 2, ".", ","));
		$Excel->getActiveSheet()->getStyle('A3:E5')->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN)->getColor()->setRGB('000000');
		
		//Resumen Unidades Constructivas
		$Excel->getActiveSheet()->mergeCells('A7:AI7');
		$Excel->getActiveSheet()->setCellValue('A7','Datos de Entrada Unidades Constructivas');	
		$Excel->getActiveSheet()->getStyle('A7')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
		$Excel->getActiveSheet()->getStyle('A7')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
		$Excel->getActiveSheet()->getStyle('A7')->getFont()->setBold( true );
		$Excel->getActiveSheet()->mergeCells('AJ7:AT7');
		$Excel->getActiveSheet()->setCellValue('AJ7','Resumen Unidades Constructivas');	
		$Excel->getActiveSheet()->getStyle('AJ7')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
		$Excel->getActiveSheet()->getStyle('AJ7')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		$Excel->getActiveSheet()->getStyle('AJ7')->getFont()->setBold( true );
		$Excel->getActiveSheet()->getStyle('A7:AT7')->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN)->getColor()->setRGB('000000');
		
		//Encabezado
		$Excel->getActiveSheet()->setCellValue('A9','Código');			
		$Excel->getActiveSheet()->mergeCells('B9:E9');
		$Excel->getActiveSheet()->setCellValue('B9','Descripción');
		$Excel->getActiveSheet()->setCellValue('F9','Tipo Línea');			
		$Excel->getActiveSheet()->setCellValue('G9','Tensión Servicio');		
		$Excel->getActiveSheet()->setCellValue('H9','Conductor');
		$Excel->getActiveSheet()->setCellValue('I9','Long. Transporte Extr (km)');
		$Excel->getActiveSheet()->setCellValue('J9','Long. Transporte Nax (km)');
		$Excel->getActiveSheet()->setCellValue('K9','Conductores por Fase');
		$Excel->getActiveSheet()->setCellValue('L9','Configuración');
		$Excel->getActiveSheet()->setCellValue('M9','Hilos de Guarda');
		$Excel->getActiveSheet()->setCellValue('N9','Altura');
		$Excel->getActiveSheet()->setCellValue('O9','Revista');
		$Excel->getActiveSheet()->setCellValue('P9','Pararrayos');
		$Excel->getActiveSheet()->setCellValue('Q9','Estructura Paso Cant.');
		$Excel->getActiveSheet()->setCellValue('R9','Estructura Paso Peso');
		$Excel->getActiveSheet()->setCellValue('S9','Estructura Amarre Cant.');
		$Excel->getActiveSheet()->setCellValue('T9','Estructura Amarre Peso');
		$Excel->getActiveSheet()->setCellValue('U9','Terreno Firme (%)');
		$Excel->getActiveSheet()->setCellValue('V9','Terreno Intermedio (%)');
		$Excel->getActiveSheet()->setCellValue('W9','Terreno Blando (%)');
		$Excel->getActiveSheet()->setCellValue('X9','Terreno Sumergido(%)');
		$Excel->getActiveSheet()->setCellValue('Y9','Maleza (%)');
		$Excel->getActiveSheet()->setCellValue('Z9','Matorral (%)');
		$Excel->getActiveSheet()->setCellValue('AA9','Forestación (%)');
		$Excel->getActiveSheet()->setCellValue('AB9','Bosque (%)');
		$Excel->getActiveSheet()->setCellValue('AC9','Terreno Plano (%)');
		$Excel->getActiveSheet()->setCellValue('AD9','Terreno Ondulado (%)');
		$Excel->getActiveSheet()->setCellValue('AE9','Terreno Cerros  (%)');
		$Excel->getActiveSheet()->setCellValue('AF9','Zona Protegida');
		$Excel->getActiveSheet()->setCellValue('AG9','Longitud (km)');		
		$Excel->getActiveSheet()->setCellValue('AH9','Tipo Estructura');
		$Excel->getActiveSheet()->setCellValue('AI9','Nivel Contaminación');		
		$Excel->getActiveSheet()->setCellValue('AJ9','DDP');
		$Excel->getActiveSheet()->setCellValue('AK9','Montaje');
		$Excel->getActiveSheet()->setCellValue('AL9','Obra Civil');
		$Excel->getActiveSheet()->setCellValue('AM9','Ingeniería');		
		$Excel->getActiveSheet()->setCellValue('AN9','Administración Ejecución');
		$Excel->getActiveSheet()->setCellValue('AO9','Supervicion de Obra');
		$Excel->getActiveSheet()->setCellValue('AP9','Costos Financieros');
		$Excel->getActiveSheet()->setCellValue('AQ9','Costos Aspectos Ambientales');
		$Excel->getActiveSheet()->setCellValue('AR9','Costos Aspectos Prediales');
		$Excel->getActiveSheet()->setCellValue('AS9','Costo Total UC (USD/km)');
		$Excel->getActiveSheet()->setCellValue('AT9','Costo Total UC (USD)');				
		$Excel->getActiveSheet()->getStyle('A9:AT9')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
		$Excel->getActiveSheet()->getStyle('A9:AT9')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		$Excel->getActiveSheet()->getStyle('A9:AT9')->getFont()->setBold( true );
		$Excel->getActiveSheet()->getStyle('A9:AT9')->getAlignment()->setWrapText(true);
		foreach ($arrResumUC as &$row) {		
			//Datos 
			$Excel->getActiveSheet()->mergeCells('B' .$intRowExcel .':E'  .$intRowExcel);
			$Excel->getActiveSheet()->setCellValue('A' . $intRowExcel,$row['codigo']);
			$Excel->getActiveSheet()->setCellValue('B' . $intRowExcel,$row['descripcion']);
			$Excel->getActiveSheet()->setCellValue('F' . $intRowExcel,$row['tipolinea']);
			$Excel->getActiveSheet()->setCellValue('G' . $intRowExcel,$row['tensionservicio']);			
			$Excel->getActiveSheet()->setCellValue('H' . $intRowExcel,$row['desc_tipoconductor']);
			$Excel->getActiveSheet()->setCellValue('I' . $intRowExcel,$row['distanciatransporteext']);
			$Excel->getActiveSheet()->setCellValue('J' . $intRowExcel,$row['distanciatransporte']);			
			$Excel->getActiveSheet()->setCellValue('K' . $intRowExcel,$row['conductorfase']);
			$Excel->getActiveSheet()->setCellValue('L' . $intRowExcel,$row['desc_configuracionlt']);
			$Excel->getActiveSheet()->setCellValue('M' . $intRowExcel,$row['desc_hilosguarda']);
			$Excel->getActiveSheet()->setCellValue('N' . $intRowExcel,$row['desc_valoraltura']);
			$Excel->getActiveSheet()->setCellValue('O' . $intRowExcel,$row['desc_revista']);
			$Excel->getActiveSheet()->setCellValue('P' . $intRowExcel,$row['desc_pararrayolinea']);
			$Excel->getActiveSheet()->setCellValue('Q' . $intRowExcel,$row['estructurapasocantidad']);
			$Excel->getActiveSheet()->setCellValue('R' . $intRowExcel,$row['estructurapasopeso']);
			$Excel->getActiveSheet()->setCellValue('S' . $intRowExcel,$row['estructuraamarrecantidad']);
			$Excel->getActiveSheet()->setCellValue('T' . $intRowExcel,$row['estructuraamarrepeso']);
			$Excel->getActiveSheet()->setCellValue('U' . $intRowExcel,$row['porcmterrenofirme']);
			$Excel->getActiveSheet()->setCellValue('V' . $intRowExcel,$row['porcmterrenointerme']);
			$Excel->getActiveSheet()->setCellValue('W' . $intRowExcel,$row['porcmterrenoterrenoblando']);
			$Excel->getActiveSheet()->setCellValue('X' . $intRowExcel,$row['porcmterrenosumer']);
			$Excel->getActiveSheet()->setCellValue('Y' . $intRowExcel,$row['porcvegetamaleza']);
			$Excel->getActiveSheet()->setCellValue('Z' . $intRowExcel,$row['porcvegetamatorral']);
			$Excel->getActiveSheet()->setCellValue('AA' . $intRowExcel,$row['porcvegetaforestacion']);
			$Excel->getActiveSheet()->setCellValue('AB' . $intRowExcel,$row['porcvegetabosque']);
			$Excel->getActiveSheet()->setCellValue('AC' . $intRowExcel,$row['porcterrenoplano']);
			$Excel->getActiveSheet()->setCellValue('AD' . $intRowExcel,$row['porcterrenoondulado']);
			$Excel->getActiveSheet()->setCellValue('AE' . $intRowExcel,$row['porcterrenocerros']);
			$Excel->getActiveSheet()->setCellValue('AF' . $intRowExcel,$row['desc_areaprotegida']);		
			$Excel->getActiveSheet()->setCellValue('AG' . $intRowExcel,$row['longitud']);				
			$Excel->getActiveSheet()->setCellValue('AH' . $intRowExcel,$row['desc_tipoestructura']);
			$Excel->getActiveSheet()->setCellValue('AI' . $intRowExcel,$row['desc_nivelcontaminacionlt']);
			$Excel->getActiveSheet()->setCellValue('AJ' . $intRowExcel,$row['numddp']);
			$Excel->getActiveSheet()->setCellValue('AK' . $intRowExcel,$row['nummontaje']);
			$Excel->getActiveSheet()->setCellValue('AL' . $intRowExcel,$row['numoc']);
			$Excel->getActiveSheet()->setCellValue('AM' . $intRowExcel,$row['numingenieria']);			
			$Excel->getActiveSheet()->setCellValue('AN' . $intRowExcel,$row['numadmeje']);
			$Excel->getActiveSheet()->setCellValue('AO' . $intRowExcel,$row['numsupero']);
			$Excel->getActiveSheet()->setCellValue('AP' . $intRowExcel,$row['numcfinan']);
			$Excel->getActiveSheet()->setCellValue('AQ' . $intRowExcel,$row['numcaamb']);
			$Excel->getActiveSheet()->setCellValue('AR' . $intRowExcel,$row['numcapred']);
			$Excel->getActiveSheet()->setCellValue('AS' . $intRowExcel,$row['numcostototaluc']);
			$Excel->getActiveSheet()->setCellValue('AT' . $intRowExcel,$row['numcostototaluct']);
			
			$intRowExcel++;
		}
				
		$Excel->getActiveSheet()->getStyle('A9:AT' .($intRowExcel-1))->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN)->getColor()->setRGB('000000');
		
		//Resumen de UCLT		
		$intRowExcel++;
		$Excel->getActiveSheet()->mergeCells('A' .$intRowExcel . ':I' . $intRowExcel);
		$Excel->getActiveSheet()->setCellValue('A' .$intRowExcel,'Detalle Unidades Constructivas');
		$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
		$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getFont()->setBold( true );
		$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getAlignment()->setWrapText(true);
		$Excel->getActiveSheet()->getStyle('A' .$intRowExcel . ':I' . $intRowExcel)->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN)->getColor()->setRGB('000000');
		
		$intRowExcel = $intRowExcel + 2;	
		foreach ($arrResumUC as &$row) 
		{
			//Encabezado Línea			
			$Excel->getActiveSheet()->mergeCells('B' . $intRowExcel .':E' . $intRowExcel);
			$Excel->getActiveSheet()->setCellValue('A' .$intRowExcel,'Código');			
			$Excel->getActiveSheet()->setCellValue('B' .$intRowExcel,'Descripción');
			$Excel->getActiveSheet()->setCellValue('F' .$intRowExcel,'Tipo Línea');
			$Excel->getActiveSheet()->setCellValue('G' .$intRowExcel,'Tensión Servicio');
			$Excel->getActiveSheet()->setCellValue('H' .$intRowExcel,'Longitud');
			$Excel->getActiveSheet()->setCellValue('I' .$intRowExcel,'Costo Total UC (USD)');
			$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':I' . $intRowExcel)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
			$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':I' . $intRowExcel)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
			$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':I' . $intRowExcel)->getFont()->setBold( true );
			$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':I' . $intRowExcel)->getAlignment()->setWrapText(true);			
		
			//Datos Línea
			$intRowExcel++;			
			$Excel->getActiveSheet()->mergeCells('B' . $intRowExcel . ':E' . $intRowExcel);			
			$Excel->getActiveSheet()->setCellValue('A' . $intRowExcel,$row['codigo']);
			$Excel->getActiveSheet()->setCellValue('B' . $intRowExcel,$row['descripcion']);
			$Excel->getActiveSheet()->setCellValue('F' . $intRowExcel,$row['tipolinea']);
			$Excel->getActiveSheet()->setCellValue('G' . $intRowExcel,$row['tensionservicio']);
			$Excel->getActiveSheet()->setCellValue('H' . $intRowExcel,$row['longitud']);
			$Excel->getActiveSheet()->setCellValue('I' . $intRowExcel,$row['numcostototaluct']);			
			$Excel->getActiveSheet()->getStyle('A' .($intRowExcel-1) .':I' . $intRowExcel)->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN)->getColor()->setRGB('000000');
						
			//Equipos y Materiales
			$intRowExcel = $intRowExcel + 2;
			$intRowAnt = $intRowExcel;
			$Excel->getActiveSheet()->mergeCells('A' .$intRowExcel . ':M' . $intRowExcel);
			$Excel->getActiveSheet()->setCellValue('A' .$intRowExcel,'Equipos y Materiales');
			$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
			$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
			$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getFont()->setBold( true );
			$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getAlignment()->setWrapText(true);
		
			$intRowExcel++;
			$Excel->getActiveSheet()->mergeCells('A' . $intRowExcel . ':C' . $intRowExcel);
			$Excel->getActiveSheet()->setCellValue('A' .$intRowExcel,'Descripción');	
			$Excel->getActiveSheet()->setCellValue('D' .$intRowExcel,'Und.');
			$Excel->getActiveSheet()->setCellValue('E' .$intRowExcel,'Cant.');
			$Excel->getActiveSheet()->setCellValue('F' .$intRowExcel,'C. Uni. Ext');
			$Excel->getActiveSheet()->setCellValue('G' .$intRowExcel,'C. Total Ext.');
			$Excel->getActiveSheet()->setCellValue('H' .$intRowExcel,'C. Uni. Nac.');
			$Excel->getActiveSheet()->setCellValue('I' .$intRowExcel,'C. Total Nac.');
			$Excel->getActiveSheet()->setCellValue('J' .$intRowExcel,'Peso Uni. Ext.');
			$Excel->getActiveSheet()->setCellValue('K' .$intRowExcel,'Peso Total Ext.');
			$Excel->getActiveSheet()->setCellValue('L' .$intRowExcel,'Peso Uni. Nac.');
			$Excel->getActiveSheet()->setCellValue('M' .$intRowExcel,'Peso Total Nac.');
			$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':M' . $intRowExcel)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
			$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':M' . $intRowExcel)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
			$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':M' . $intRowExcel)->getFont()->setBold( true );
			$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':M' . $intRowExcel)->getAlignment()->setWrapText(true);
			
			$intRowExcel++;			
			foreach ($arrUCEM as &$rowEM) {
				if ($rowEM['id_ucltvaloraruc'] == $row['id_ucltvaloraruc'])
				{
					$Excel->getActiveSheet()->mergeCells('A' . $intRowExcel . ':C' . $intRowExcel);									
					$Excel->getActiveSheet()->setCellValue('A' . $intRowExcel,$rowEM['item']);
					$Excel->getActiveSheet()->setCellValue('D' . $intRowExcel,$rowEM['unidadabrev']);
					$Excel->getActiveSheet()->setCellValue('E' . $intRowExcel,$rowEM['cantidaditem']);
					$Excel->getActiveSheet()->setCellValue('F' . $intRowExcel,$rowEM['costounitarioext']);
					$Excel->getActiveSheet()->setCellValue('G' . $intRowExcel,$rowEM['costototalext']);
					$Excel->getActiveSheet()->setCellValue('H' . $intRowExcel,$rowEM['costounitarionac']);
					$Excel->getActiveSheet()->setCellValue('I' . $intRowExcel,$rowEM['costototalnac']);
					$Excel->getActiveSheet()->setCellValue('J' . $intRowExcel,$rowEM['pesounitarioext']);
					$Excel->getActiveSheet()->setCellValue('K' . $intRowExcel,$rowEM['pesototalext']);
					$Excel->getActiveSheet()->setCellValue('L' . $intRowExcel,$rowEM['pesounitarionac']);
					$Excel->getActiveSheet()->setCellValue('M' . $intRowExcel,$rowEM['pesototalnac']);
					
					$intRowExcel++;
				}
			}
			$Excel->getActiveSheet()->getStyle('A' .$intRowAnt .':M' .($intRowExcel-1))->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN)->getColor()->setRGB('000000');	

			//Obra Civil
			$intRowExcel++;	
			$intRowAnt = $intRowExcel;		
			$Excel->getActiveSheet()->mergeCells('A' .$intRowExcel . ':I' . $intRowExcel);
			$Excel->getActiveSheet()->setCellValue('A' .$intRowExcel,'Obra Civil');
			$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
			$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
			$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getFont()->setBold( true );
			$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getAlignment()->setWrapText(true);
			
			$intRowExcel++;
			$Excel->getActiveSheet()->mergeCells('A' . $intRowExcel . ':D' . $intRowExcel);
			$Excel->getActiveSheet()->setCellValue('A' . $intRowExcel,'Descripción');
			$Excel->getActiveSheet()->setCellValue('E' . $intRowExcel,'Cant.');
			$Excel->getActiveSheet()->setCellValue('F' . $intRowExcel,'C. Uni.');
			$Excel->getActiveSheet()->setCellValue('G' . $intRowExcel,'C. Total.');
			$Excel->getActiveSheet()->setCellValue('H' . $intRowExcel,'Peso. Uni.');
			$Excel->getActiveSheet()->setCellValue('I' . $intRowExcel,'Peso. Total');
			$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':I' . $intRowExcel)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
			$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':I' . $intRowExcel)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
			$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':I' . $intRowExcel)->getFont()->setBold( true );
			$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':I' . $intRowExcel)->getAlignment()->setWrapText(true);
			
			$intRowExcel++;
			foreach ($arrUCOC as &$rowOC) {
				if ($rowOC['id_ucltvaloraruc'] == $row['id_ucltvaloraruc'])
				{
					$Excel->getActiveSheet()->mergeCells('A' . $intRowExcel . ':D' . $intRowExcel);					
					$Excel->getActiveSheet()->setCellValue('A' . $intRowExcel,$rowOC['terrenolt'] . ' - ' .$rowOC['funcionestructura'] . ' - ' .$rowOC['tipocimentacion']);
					$Excel->getActiveSheet()->setCellValue('E' . $intRowExcel,$rowOC['cantidaditem']);
					$Excel->getActiveSheet()->setCellValue('F' . $intRowExcel,$rowOC['costounitariooc']);
					$Excel->getActiveSheet()->setCellValue('G' . $intRowExcel,$rowOC['costototaloc']);
					$Excel->getActiveSheet()->setCellValue('H' . $intRowExcel,$rowOC['pesounitariooc']);
					$Excel->getActiveSheet()->setCellValue('I' . $intRowExcel,$rowOC['pesototaloc']);
					$intRowExcel = $intRowExcel + 1;
				}
			}
			$Excel->getActiveSheet()->getStyle('A' .$intRowAnt .':I' .($intRowExcel-1))->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN)->getColor()->setRGB('000000');
			
			//Montaje
			$intRowExcel++;	
			$intRowAnt = $intRowExcel;		
			$Excel->getActiveSheet()->mergeCells('A' .$intRowExcel . ':G' . $intRowExcel);
			$Excel->getActiveSheet()->setCellValue('A' .$intRowExcel,'Montaje');
			$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
			$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
			$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getFont()->setBold( true );
			$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getAlignment()->setWrapText(true);
			
			$intRowExcel++;
			$Excel->getActiveSheet()->mergeCells('A' . $intRowExcel . ':C' . $intRowExcel);
			$Excel->getActiveSheet()->setCellValue('A' . $intRowExcel,'Descripción');
			$Excel->getActiveSheet()->setCellValue('D' . $intRowExcel,'Und.');
			$Excel->getActiveSheet()->setCellValue('E' . $intRowExcel,'Cant.');
			$Excel->getActiveSheet()->setCellValue('F' . $intRowExcel,'C. Uni.');
			$Excel->getActiveSheet()->setCellValue('G' . $intRowExcel,'C. Total');
			$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':G' . $intRowExcel)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
			$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':G' . $intRowExcel)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
			$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':G' . $intRowExcel)->getFont()->setBold( true );
			$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':G' . $intRowExcel)->getAlignment()->setWrapText(true);
			
			$intRowExcel++;
			foreach ($arrUCMON as &$rowMON) {
				if ($rowMON['id_ucltvaloraruc'] == $row['id_ucltvaloraruc'])
				{
					$Excel->getActiveSheet()->mergeCells('A' . $intRowExcel . ':C' . $intRowExcel);					
					$Excel->getActiveSheet()->setCellValue('A' . $intRowExcel,$rowMON['item']);
					$Excel->getActiveSheet()->setCellValue('D' . $intRowExcel,$rowMON['unidadabrev']);
					$Excel->getActiveSheet()->setCellValue('E' . $intRowExcel,$rowMON['cantidaditem']);
					$Excel->getActiveSheet()->setCellValue('F' . $intRowExcel,$rowMON['costounitario']);
					$Excel->getActiveSheet()->setCellValue('G' . $intRowExcel,$rowMON['costototal']);		
					$intRowExcel++;
				}
			}			
			$Excel->getActiveSheet()->getStyle('A' .$intRowAnt .':G' .($intRowExcel-1))->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN)->getColor()->setRGB('000000');
			
			//Gastos del Contratista
			$intRowExcel++;			
			$intRowAnt = $intRowExcel;
			$Excel->getActiveSheet()->mergeCells('A' .$intRowExcel . ':H' . $intRowExcel);
			$Excel->getActiveSheet()->setCellValue('A' .$intRowExcel,'Gastos del Contratista');
			$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
			$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
			$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getFont()->setBold( true );
			$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getAlignment()->setWrapText(true);
						
			$intRowExcel++;
			$Excel->getActiveSheet()->mergeCells('A' . $intRowExcel . ':D' . $intRowExcel);
			$Excel->getActiveSheet()->setCellValue('A' . $intRowExcel,'Descripción');
			$Excel->getActiveSheet()->setCellValue('E' . $intRowExcel,'Und.');
			$Excel->getActiveSheet()->setCellValue('F' . $intRowExcel,'Costo Base');
			$Excel->getActiveSheet()->setCellValue('G' . $intRowExcel,'Cant./Porc.');
			$Excel->getActiveSheet()->setCellValue('H' . $intRowExcel,'C. Total');
			$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':H' . $intRowExcel)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
			$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':H' . $intRowExcel)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
			$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':H' . $intRowExcel)->getFont()->setBold( true );
			$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':H' . $intRowExcel)->getAlignment()->setWrapText(true);
			
			$intRowExcel++;
			foreach ($arrUCGC as &$rowCG) {
				if ($rowCG['id_ucltvaloraruc'] == $row['id_ucltvaloraruc'])
				{
					$Excel->getActiveSheet()->mergeCells('A' . $intRowExcel . ':D' . $intRowExcel);
					$Excel->getActiveSheet()->setCellValue('A' . $intRowExcel,$rowCG['descripcion']);
					$Excel->getActiveSheet()->setCellValue('E' . $intRowExcel,$rowCG['unidad']);
					$Excel->getActiveSheet()->setCellValue('F' . $intRowExcel,$rowCG['costobase']);
					$Excel->getActiveSheet()->setCellValue('G' . $intRowExcel,$rowCG['cantidaditem']);
					$Excel->getActiveSheet()->setCellValue('H' . $intRowExcel,$rowCG['costototal']);					
					$intRowExcel++;				
				}
			}				
			$Excel->getActiveSheet()->getStyle('A' .$intRowAnt .':H' .($intRowExcel-1))->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN)->getColor()->setRGB('000000');
			
			//Otros Gastos y Resumen General
			$intRowExcel++;	
			$intRowAnt = $intRowExcel;		
			$Excel->getActiveSheet()->mergeCells('A' .$intRowExcel . ':H' . $intRowExcel);
			$Excel->getActiveSheet()->setCellValue('A' .$intRowExcel,'Otros Gastos y Resumen General');
			$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
			$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
			$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getFont()->setBold( true );
			$Excel->getActiveSheet()->getStyle('A' .$intRowExcel)->getAlignment()->setWrapText(true);
			
			$intRowExcel++;
			$Excel->getActiveSheet()->mergeCells('A' . $intRowExcel . ':D' . $intRowExcel);
			$Excel->getActiveSheet()->setCellValue('A' . $intRowExcel,'Descripción');
			$Excel->getActiveSheet()->setCellValue('E' . $intRowExcel,'Und.');
			$Excel->getActiveSheet()->setCellValue('F' . $intRowExcel,'Costo Base');
			$Excel->getActiveSheet()->setCellValue('G' . $intRowExcel,'Cant./Porc.');
			$Excel->getActiveSheet()->setCellValue('H' . $intRowExcel,'C. Total');
			$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':H' . $intRowExcel)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('CECECE');
			$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':H' . $intRowExcel)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
			$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':H' . $intRowExcel)->getFont()->setBold( true );
			$Excel->getActiveSheet()->getStyle('A' . $intRowExcel . ':H' . $intRowExcel)->getAlignment()->setWrapText(true);
			
			$intRowExcel++;
			foreach ($arrUCOGRG as &$rowOGRG) {
				if ($rowOGRG['id_ucltvaloraruc'] == $row['id_ucltvaloraruc'])
				{
					$Excel->getActiveSheet()->mergeCells('A' . $intRowExcel . ':D' . $intRowExcel);					
					$Excel->getActiveSheet()->setCellValue('A' . $intRowExcel,$rowOGRG['descripcion']);
					$Excel->getActiveSheet()->setCellValue('E' . $intRowExcel,$rowOGRG['unidad']);
					$Excel->getActiveSheet()->setCellValue('F' . $intRowExcel,$rowOGRG['costobase']);
					$Excel->getActiveSheet()->setCellValue('G' . $intRowExcel,$rowOGRG['cantidaditem']);
					$Excel->getActiveSheet()->setCellValue('H' . $intRowExcel,$rowOGRG['costototal']);
					$intRowExcel++;
				}
			}
			$Excel->getActiveSheet()->getStyle('A' .$intRowAnt .':H' .($intRowExcel-1))->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN)->getColor()->setRGB('000000');
			
			$intRowExcel = $intRowExcel + 2;		
			
		}

		$Excel->getActiveSheet()->setTitle(pg_fetch_result($dsEncabezado, 0, 1));
		$Excel->setActiveSheetIndex(0);
		
		$objWriter = PHPExcel_IOFactory::createWriter($Excel, 'Excel5');
		$objWriter->save(__DIR__ . '/../reportes/ProyectoUUCLT-' .pg_fetch_result($dsEncabezado, 0, 1) .'.xls');		
	}

	
}

?>