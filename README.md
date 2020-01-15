# sis_SINEX
Proyecto creado por Colombianos

## Control de Cambios
* Versión 1.5.0.5 - 2020-01-15
  * Se arregla la generación de los reportes de PDF y Excel para la línea de transmisión UUCC L 08.
  * Se agrega en la función de SQL el campo de numaccesos.
  * Se agrega en el reporte de PDF y Excel para las líneas de transmisión el campo accesos.
* Versión 1.5.0.4 - 2019-11-20
  * Se pasa el valor del peso de estructuras en UC de líneas a nacional
  * Se corrige el cálculo del equipo y material de la línea de transmisión código UUCC L 16
* Versión 1.5.0.3 - 2019-11-07
  * Se realizá cambio en el precio de la maquinaria Autotransformador monofasico 230 / 115 KV. 50 MVA.
  * Se arregla la generación de los reportes de PDF y Excel para cotizaciones UC de Subestaciones.
  * Se agrega la palabra indicativo a sistema puesta a tierra y cadenas de aisladores en UC de líneas.
  * Se pasa el valor del peso de estructuras en UC de líneas a extranjero
  * Se elimina de estudios especiales el elemento llamado Impuestos por pagos en el exterior.
* Versión 1.5.0.2 - 2019-10-25
  * Se agrega en el listado de maquinaria los reactores de potencia monofásica variable.
  * Se agrega en el listado de UC de subestaciones los reactores de potencia monofásica variable.
* Versión 1.5.0.1 - 2019-10-18
  * Se ajusta el cálculo de empalmes para cables de potencia en números enteros, y empalmes cada 500 metros para líneas de longitud mayor a 500 m.
* Versión 1.5.0.0 - 2019-10-15
  * Cambio en cantidades de obra civil para banco de capacitores y reactores.
  * Cambio en cantidad del equipo Barra tubular en UUCC SE B505.
  * Creacón de Suministro Suelto - Total de medidores de tarifación en tableros de medida comercial para Tableros de Control y Protección.
  * Eliminación de duplicados y correción de cantidades en servicios de Tableros de Control y Protección.
* Versión 1.4.0.2 - 2019-10-03
  * Se corrigen parámetros en la creación de los reportes para PDF y Excel.
* Versión 1.4.0.1 - 2019-09-24
  * Se modifican los reportes en PDF y Excel para los proyectos de subestaciones, para incluir todas las variales de las otras unidades constructivas.
* Versión 1.4.0.0 - 2019-09-18
  * Se agregan nuevos elementos a las tablas maestras de mallas de tierra y apantallamiento.
  * Se corrige el cálculo en aisladores en líneas de transmisión.
  * Se agrega nuevo campo de acceso a las líneas de transmisión.
  * Se modifica cálculo de Accesos en gastos de contratista de las líneas.
  * Se corrige cálculo en el módulo común eléctrico.
* Versión 1.3.0.1 - 2019-07-26
  * Se corrige la impresión de las distancias de transporte en los proyectos de líneas en el PDF y Excel.
* Versión 1.3.0.0 - 2019-07-24
  * Se ingresa las UC de subestaciones G17, G18, G19, G20.
  * Se ingresa las maquinarias para las UC anteriores Transformador de potencial GIS 115, 230 y 500 kV.
  * Se ingresa el equipo Barra Tubular.
  * Se modifican cantidades de maquinaria y equipo para las UUCC SE B604, B605, B606, B104, B105, B106, B504, B505, B506, B204, B205, B206, R07, TD4.
  * Se modifican cantidades de obra para las maquinarias Banco de Capacitores derivación 0 a 10 MVAr y 10 a 20 MVAr, Banco de Capacitores serie 230 KV.
* Versión 1.2.3.1 - 2019-05-31
  * Cambio en los pesos en algunos materiales en líneas.
  * Se agregan items faltantes en servicios auxiliares.
  * Se corrige tarifa de Gastos Financieros para Subestaciones.
  * Botón en UC de subestaciones para actualizar los cálculos de todas la UC.
* Versión 1.2.3.0 - 2019-05-15
  * En las tarifas de subestaciones se dividen "Pruebas de Equipos y Fábrica" y "Pruebas y Puesta en Servicio" en dos; una para Bahías de subestaciones y otra para Máquinas.
  * Se aplican las nuevas tarifas al cálculo de Otros Gastos en las UC de Subestaciones.
  * Se actualizan los pesos de los materiales usados en UC de Líneas.
  * Se agrega la columna de cantidad en los items de las UC de estudios especiales.
* Versión 1.2.2.0 - 2019-04-25
  * Se elimina registro de obra civil repetido en el módulo común civil y efificaciones que intervenía en el cálculo final de las UC de líneas.
  * Se ajusta el cálculo de las cantidades de equipos y materiales en las UC de líneas de comunicaciones.
  * Se ajusta el exportar a PDF y Excel del cotizador de subestaciones.	
* Versión 1.2.1.0 - 2019-03-07
  * Actualización Formulación UC Edificaciones.
  * Actualización cantidades de transformadores de tensión en UC B107,B207,B507,B607 (1 Unidad).
  * Actualización de pesos en materiales de líneas de transmisión.
  * Actualización cantidades de cable de fuerza y control en Unidades constructivas de subestaciones.
  * Actualización Unidad constructiva de Comunicaciones, se ingresa ítem y precio de trampa de onda.
  * Actualización de suministro suelto en UC de tableros de C&P.
  * Actualización nombre tablero de acople de barras en UC de tableros de C&P.
  * Actualización Servicios en UC de tableros de C&P, se eliminan ítems repetidos y se deja valor unitario promedio.
  * Actualización UC de Servicios Auxiliares, se incluye ítem de cable de cobre de 70 mm2.
  * En la configuración de los precios de los equipos en el ítem proyecto se elimina la palabra SYNEX y se reemplaza por SPVPT.
  * Nueva obra civil relleno en roca con su APU.
  * Integración de la nueva obra civil con las unidades constructivas de líneas de transmisión.
  * Creación de la UUCC L 18.
* Versión 1.2.0.0 - 2019-02-26
  * Cambio en pesos de los materiales para líneas.
  * Se agrega unidades constructivas para estudios y trámites ambientales, las cuales pueden ser usadas en el cotizador de subestaciones.
* Versión 1.1.1.0 - 2019-02-25
  * Se aumenta precisión decimal en el peso y cantidades de los materiales de líneas.
  * Se cambia los iconos de los botones de reseteo de cantidades.
  * Se cambian los porcentajes de gastos financieros la subestaciones y líneas
* Versión 1.1.0.0 - 2019-02-15
  * Se crean las tablas de Banco de Ductos y Cajas de Empalme.
  * Se relacionan las tablas nuevas con las cantidades de obras civiles para líneas.
  * Se corrige el cálculo de limpienza y roce en la UUCC L 08.
  * Se corrige el cálculo de la obra civil para las UUCC L 01, 05, y 09.
  * Se corrige el cálculo de la topografúa y la ingeniería en las unidades constructivas de líneas.
* Versión 1.0.2.1 - 2019-02-14
  * Se agrega cuadro de dialogo de confirmación sobre los botones de reseteo de cantidades.
  * Se realizan ajustes sobre los archivos de la carpeta base del proyecto.
* Versión 1.0.2.1 - 2019-02-08
  * Se agrega script en data000001.sql para los proyectos de prueba no relacionados con sis_SINEX.  
* Versión 1.0.2.0 - 2019-01-28
  * Se realizo cambio sobre funciones relacionadas con el reseteo de las cantidades de equipos.
* Versión 1.0.1.0 - 2019-01-22
  * Se corrige el cálculo de las DDP en las unidades constructivas de líneas.
* Versión 1.0.0.0 - 2019-01-21
  * Versión subida correspondiente a la entrega final realizada por HMV Ingenieros.
