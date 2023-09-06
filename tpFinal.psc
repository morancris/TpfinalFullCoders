Proceso tpFinal
	Definir nro_socio,nro_socio_ant Como Entero;
	Definir importe,totalSocio,totalGral Como Real;
	Definir modalidad Como Caracter;
	nro_socio<-0;
	nro_socio_ant<-0;
	totalSocio<-0;
	totalGral<-0;
	InicioGeneral(totalSocio,totalGral);
	IngresoSocio(nro_socio,nro_socio_ant);
	Mientras nro_socio<>0 Hacer
		Mientras nro_socio<>0 | nro_socio=nro_socio_ant Hacer
			nro_socio_ant<-nro_socio;
			Mientras (nro_socio=nro_socio_ant) Hacer
				IngresoImporte(importe);
				IngresoModalidad(modalidad);
				Procesar(modalidad,importe,totalSocio);
				IngresoSocio(nro_socio,nro_socio_ant);
			FinMientras
			FinParticular(nro_socio_ant,totalSocio,totalGral);
		FinMientras
		FinGeneral(totalGral);
	FinMientras
FinProceso

SubProceso InicioGeneral(totalSocio Por Referencia,totalGral Por Referencia)
	Escribir 'Programa para obtener saldos de socios de un banco';
	totalSocio<-0;
	totalGral<-0;
FinSubProceso

SubProceso IngresoSocio(nro_socio Por Referencia,nro_socio_ant Por Referencia)
	Escribir 'Ingrese numero de socio (numerico/no negativo)';
	Leer nro_socio;
	Mientras nro_socio<0 Hacer
		Escribir 'Error, el numero de socio debe ser positivo';
		Escribir 'Ingrese numero de socio (numerico/no negativo)';
		Leer nro_socio;
	FinMientras
FinSubProceso

SubProceso IngresoImporte(importe Por Referencia)
	Escribir 'Ingrese Importe: (no debe ser 0 ni tampoco negativo)';
	Leer importe;
	Mientras (importe<=0) Hacer
		Escribir 'Error al ingresar Importe';
		Escribir 'Ingrese Importe: (no debe ser 0 ni tampoco negativo)';
		Leer importe;
	FinMientras
FinSubProceso

SubProceso IngresoModalidad(modalidad Por Referencia)
	Escribir 'Ingrese modalidad D para DEBITOS C para CREDITOS';
	Leer modalidad;
	Mientras Mayusculas(modalidad)<>'D' & Mayusculas(modalidad)<>'C' Hacer
		Escribir 'Error, no existe esa modalidad';
		Escribir 'Ingrese modalidad (D o E)';
		Leer modalidad;
	FinMientras
FinSubProceso

SubProceso Procesar(modalidad Por Referencia,importe Por Referencia,totalSocio Por Referencia)
	Si Mayusculas(modalidad)=='D' Entonces
		totalSocio<-totalSocio-importe;
	Sino
		totalSocio<-totalSocio+importe;
	FinSi
FinSubProceso

SubProceso FinParticular(nro_socio_ant Por Referencia,totalSocio Por Referencia,totalGral Por Referencia)
	Escribir '****************************';
	Escribir 'Socio: ',nro_socio_ant;
	Escribir 'El saldo es: ',totalSocio;
	Escribir '****************************';
	Escribir '****CAMBIO SOCIO************';
	totalGral<-totalGral+totalSocio;
	totalSocio<-0;
FinSubProceso

SubProceso FinGeneral(totalGral Por Referencia)
	Escribir '*********TOTAL GENERAL*******************';
	Escribir 'Total general de saldos: ',totalGral;
	Escribir '*****************************************';
FinSubProceso

