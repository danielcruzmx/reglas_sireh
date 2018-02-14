[condition][]Pago=pago : PagoDTO()
[condition][]-eventual=idGrupoPago == 'V'
[condition][]-estructura=idGrupoPago == 'E'
[condition][]-honorario=idGrupoPago == 'H'
[condition][]-operativo=idJerarquia == '7'
[condition][]-tiene pension=pension == true
[keyword][]SUELDO=(pago.getTabSueldo()/2.0 * pago.getFactor() - pago.montoConceptoRetroactivo("P","07") - pago.montoConceptoRetroactivo("P","02"))
[keyword][]COMPENSACION=(pago.getTabCompensacion()/2.0 * pago.getFactor() - pago.montoConceptoRetroactivo("P","06"))
[condition][]-mando superior=idJerarquia == '1'
[condition][]-base=idNombramiento == 'B'
[condition][]-confianza=idNombramiento == 'C'
[consequence][]Asignar "{tipo}" codigo "{concepto}" con valor {valor}=pago.setAgregaConcepto(1, "{tipo}", "{concepto}", {valor} );
[consequence][]Asignar concepto "{tipo}" "{concepto}" con valor {valor}=pago.setAgregaConcepto(1, "{tipo}", "{concepto}", {valor} );
[condition][]-mando o enlace=idJerarquia == '4' || idJerarquia == '5'
[condition][]-tiene concepto "{tipo}" "{concepto}"=tieneConcepto("{tipo}","{concepto}")
[condition][]-tiene "{tipo}" codigo "{concepto}"=tieneConcepto("{tipo}","{concepto}")
[condition][]-tiene FONAC ORDINARIO=tieneConcepto("U","F")
[condition][]-tiene FONAC EXTRAORDINARIO=tieneConcepto("U","FE")
[condition][]-con erario=erario == 'S'
[keyword][]CUOTA_SIND=0.015
[keyword][]PORC_ERARIO=0.001
[keyword][]MONTO_PREST_FIJAS=(257.5 * pago.getFactor() - pago.montoConceptoRetroactivo("P","44") - pago.montoConceptoRetroactivo("P","46") - pago.montoConceptoRetroactivo("P","38"))
[keyword][]MONTO_AYUDA_DESPENSA=(342.5 * pago.getFactor() - pago.montoConceptoRetroactivo("P","38"))
[keyword][]MONTO_PREVISION_SOCIAL=(257.5 * pago.getFactor() - pago.montoConceptoRetroactivo("P","44"))
[keyword][]MONTO_AYUDA_SERVICIOS=(247.5 * pago.getFactor() - pago.montoConceptoRetroactivo("P","46"))
[keyword][]MONTO_AYUDA_TRANSPORTE=(250.0 * pago.getFactor() - pago.montoConceptoRetroactivo("P","95"))
[keyword][]COMP_X_DESA=(750.0 * pago.getFactor() - pago.montoConceptoRetroactivo("P","77"))
[keyword][]PRIMA_QUIN_A1=(50.0 * pago.getFactor() - pago.montoConceptoRetroactivo("P","A1"))
[keyword][]PRIMA_QUIN_A2=(62.5 * pago.getFactor() - pago.montoConceptoRetroactivo("P","A2"))
[keyword][]PRIMA_QUIN_A3=(87.5 * pago.getFactor() - pago.montoConceptoRetroactivo("P","A3"))
[keyword][]PRIMA_QUIN_A4=(100.0 * pago.getFactor() - pago.montoConceptoRetroactivo("P","A4"))
[keyword][]PRIMA_QUIN_A5=(112.5 * pago.getFactor() - pago.montoConceptoRetroactivo("P","A5"))
[keyword][]CUOTA_ISSSTE_0A=0.0275
[keyword][]CUOTA_ISSSTE_0B=0.00625
[keyword][]CUOTA_ISSSTE_0C=0.005
[keyword][]CUOTA_ISSSTE_0D=0.06125
[keyword][]CUOTA_ISSSTE_0E=0.00625
[keyword][]AYUDA_DESP=(342.5 * pago.getFactor() - pago.montoConceptoRetroactivo("P","38"))
[keyword][]MONTO_SEGURO_COLECTIVO_PAR=(7.28  * pago.getFactor() - pago.montoConceptoRetroactivo("D","77"))
[keyword][]MONTO_SEGURO_COLECTIVO_MES=(7.275 * pago.getFactor() - pago.montoConceptoRetroactivo("D","77"))
[keyword][]FONDO_RET_SIND=0.01
[keyword][]MONTO_CPTO "{tipo}" "{concepto}"=redondear(pago.montoConcepto("{tipo}","{concepto}"))
[keyword][]PORC_CPTO "{tipo}" "{concepto}"=pago.porcentajeConcepto("{tipo}","{concepto}")
[keyword][]RANGO {grav}  {inf}  {sup}  {cuota}  {exced}=pago.ispt({grav},{inf},{sup},{cuota},{exced})
[keyword][]MONTO_SEG_FOV=(8.50 * pago.getFactor()  - pago.montoConceptoRetroactivo("D","68"))
[keyword][]MONTO_FONAC=193.87
[keyword][]PERCEPCION="P"
[keyword][]DEDUCCION="D"
[keyword][]CONCEPTO="C"
[keyword][]SUELDO_BASE=pago.getSdoBase()
[consequence][]Integra sueldo base ISSSTE con {valor}=pago.setAcumuladoSdoBase({valor});
[consequence][]Suma a gravable {valor}=pago.setAcumuladoGravable({valor});
[consequence][]Calcula y asigna pensiones "{tipo}" "{concepto}"=pago.calculaPensiones("{tipo}","{concepto}");
[keyword][]TOPE_SDO_BASE=pago.sueldoBase(12090.00 * pago.getFactor())
[keyword][]GRAVABLE=pago.getAcumuladoGravable()
[keyword][]MONTO_SEG_SEP=((pago.getTabSueldo() + pago.getTabCompensacion()) * pago.porcentajeConcepto("D","82") / 100.00 /2.0 * pago.getFactor() - pago.montoConceptoRetroactivo("D","82"))
[keyword][]LIC_MEDICAS_MEDIO_SDO=pago.acumulaLicencias("DLM")
[keyword][]LIC_MEDICAS_SIN_SDO=pago.acumulaLicencias("DLS")
[consequence][]Resta a gravable {valor}=pago.setAcumuladoGravable({valor} * (-1));
[condition][]-es quincena par=numQuincena % 2 == 0
[keyword][]MONTO_SEGURO_COLECTIVO_NON=(7.27 * pago.getFactor() - pago.montoConceptoRetroactivo("D","77"))
[condition][]-es quincena non=numQuincena % 2 != 0
[keyword][]ADEUDO_CPTO "{tipo}" "{concepto}"=pago.adeudoConcepto("{tipo}","{concepto}")
[keyword][]ADEUDO_FONAC=pago.montoConcepto("D","AF")
[keyword][]ADEUDO_FONAC_EXTRAORDINARIO=pago.montoConcepto("D","AF")
[keyword][]SUELDO_HONORARIO=pago.getTabSueldoPre()/2.0 * pago.getFactor()
[keyword][]COMPENSACION_HONORARIO=(pago.getImpHonorario()/2.0 - pago.getTabSueldoPre()/2.0) * pago.getFactor()
[condition][]-no honorarios=idGrupoPago != 'H'
[condition][]-cotiza ISSSTE=tieneConcepto("D","CI")
[keyword][]PORC_SEGURO_HON=2.04
[condition][]-en el extranjero=idGrupoPago == 'J'
[condition][]-tieneFaltas=tieneFaltas({"UOE","UOS","UOV","UFA","UTV"})
[condition][]-tiene CODIGO FALTA "{concepto}"=tieneConcepto("U","{concepto}")
[keyword][]COSTO_FALTA=(pago.getTabSueldo() + pago.getTabCompensacion()) / 30.0 * 1.4
[consequence][]Asignar incidencias codigo "{concepto}" con valor {valor} hasta {monto}=pago.asignaIncidencia("D","{concepto}",{valor},{monto});
[consequence][]Resta incidencias a gravable=pago.setGravableFaltas();
[condition][]-es plaza {valor}=idPlaza == {valor}
[condition][]-es filiacion "{valor}"=rfcEmpleado == "{valor}"
[condition][]-es de la unidad  "{valor}"=idUnidadNomb == "{valor}"
[condition][]-no es de la unidad  "{valor}"=idUnidadNomb != "{valor}"
[keyword][]TOPE_INCIDENCIAS=(pago.getTabSueldo() + pago.getTabCompensacion()) * 30.0 / 100.00
[keyword][]GRAVABLE_SEG_SEP=(pago.getTabSueldo() + pago.getTabCompensacion()) / 2.0 * pago.getFactor()
[condition][]-sin quinquenio=notieneQuinquenio()
[condition][]-no tiene RENUNCIA ERARIO=!tieneConcepto("U","26")
[condition][]-no renuncia SEGURO INDIVIDUAL=!tieneConcepto("U","51")
[keyword][]DIA_SUELDO=pago.getTabSueldo() / 30.0 * 1.0
[keyword][]INCENTIVO=pago.getIncentivo()
[keyword][]GRAVABLE_OPERATIVO=((pago.getTabSueldo() + pago.getTabCompensacion() + pago.getIncentivo()) / 2.0  + 750.0 + 257.5 + 342.5 + 247.5 + 250.0) * pago.getFactor()
[condition][]-es retroactivo=retroactivo == true
[condition][]-movimiento valido=movimiento == 111 || movimiento == 112 || movimiento == 221 || movimiento == 225 || movimiento == 113 || movimiento == 503 || movimiento == 513 || movimiento == 502
[condition][]-no retroactivo=retroactivo == false
[consequence][]Procesa retroactivo=pago.procesaRetroactivo();
[keyword][]FACTOR=pago.getFactor()
[keyword][]CUOTA_ISSSTE_PATRON=0.0997
[consequence][]Sueldo base ISSSTE patron con {valor}=pago.setAcumuladoSdoBasePatron({valor});
[keyword][]TOPE_SDO_BASE_PATRON=pago.sueldoBasePatron(12090.00 * pago.getFactor())
[keyword][]GRAVABLE_DIFERENCIAS=(pago.montoConceptoRetroactivo("P","07")+pago.montoConceptoRetroactivo("P","06")+pago.montoConceptoRetroactivo("P","38")+pago.montoConceptoRetroactivo("P","44")+pago.montoConceptoRetroactivo("P","46")+pago.montoConceptoRetroactivo("P","77"))
[keyword][]PRIMA_VAC_EXCENTA=(75.49 * 7.5)
[keyword][]FACTOR_PRIMA_VAC=(30.4 / 181.0)
[keyword][]GRAVABLE_PRIMA=pago.getAcumuladoGravablePrima()
[consequence][]A gravable prima {valor}=pago.setAcumuladoGravablePrima({valor});
[consequence][]A prestaciones gravadas {valor}=pago.setAcumuladoGravableA({valor});
[keyword][]GRAVABLE_PRESTACIONES=(pago.getAcumuladoGravableA() + pago.getIncentivo() / 2.0)
[condition][]-nomina ordinaria=idTipoNomina == 'OR'
[condition][]-nomina incentivo=idTipoNomina == 'IN'
[condition][]-nomina extranjero=idTipoNomina == 'CJ'
[keyword][]SDO_BASE_PATRON=(pago.sueldoBasePatron(12090.00 * pago.getFactor() + 1))
[condition][]-no tiene concepto "{tipo}" "{concepto}"=!tieneConcepto("{tipo}","{concepto}")
