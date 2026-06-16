# GFL-SalesInvoicePP — Report Extension sobre reporte 50000

## Resumen

**Enfoque:** Report Extension sobre el reporte 50000 de Aitana ("AIT Sales Invoice")
**ID extensión:** 50400
**Rango IDs:** 50400–50499
**Layout:** RDLC custom basado en el RDLC de Aitana con modificaciones mínimas

## Qué hace esta extensión

Añade al dataset del reporte 50000 de Aitana las siguientes columnas calculadas:

| Campo dataset | Tipo | Descripción |
|---|---|---|
| GFL_SubtotalAfterInvDisc | Decimal | Subtotal - Descuento en factura |
| GFL_PmtDiscAmount | Decimal | Importe descuento P.P. (SubtotalAfterInvDisc × %) |
| GFL_PmtDiscPct | Decimal | % descuento del término de pago |
| GFL_TotalExclVATRecalc | Decimal | Total € IVA excl. recalculado |
| GFL_TotalInclVATRecalc | Decimal | Total € IVA incl. recalculado |
| GFL_SubtotalAfterInvDiscCaption | Text | Etiqueta "Subtotal con descuento factura" |
| GFL_PmtDiscCaption | Text | Etiqueta "Descuento P.P." |
| GFL_PmtDiscWarningMsg | Text | Mensaje de advertencia (vacío si no hay P.P.) |
| GFL_HasPmtDisc | Boolean | Flag para visibilidad condicional en RDLC |

## Cambios en el RDLC

El fichero GFLSalesInvoicePP.rdlc es una copia del RDLC de Aitana con estos cambios:

1. **Dataset:** 9 campos nuevos (GFL_*) añadidos al final de la sección Fields
2. **Subtotales:** 2 filas nuevas insertadas entre "Descuento en factura" y "Total € IVA excl."
3. **Total € IVA excl.:** Valor condicionado — muestra GFL_TotalExclVATRecalc si hay P.P., si no el original
4. **Total € IVA incl.:** Valor condicionado — muestra GFL_TotalInclVATRecalc si hay P.P., si no el original
5. **Visibilidad:** Las 2 filas nuevas se ocultan cuando GFL_HasPmtDisc = false
6. **Mensaje pie:** Textbox nuevo con mensaje de advertencia, oculto cuando no hay P.P.

## Ficheros del proyecto

- `app.json` — Configuración de la extensión
- `src/GFLSalesInvoicePPExt.ReportExt.al` — Report Extension (lógica AL)
- `src/GFLSalesInvoicePP.rdlc` — Layout RDLC custom (importar como layout en BC)
- `INSTRUCCIONES.md` — Este fichero

## Pasos para desplegar en Sandbox

### 1. Compilar y publicar la extensión AL
- Abrir proyecto en VS Code
- Verificar que `app.json` tiene la versión de application correcta
- IMPORTANTE: El nombre del reporte en "extends" debe coincidir exactamente con el nombre del reporte de Aitana. Si no es "AIT Sales Invoice", ajustar en el .al
- Compilar (Ctrl+Shift+B) y publicar en Sandbox (F5)

### 2. Importar el layout RDLC custom
- En BC Sandbox, buscar "Selección diseño informe" o ir al reporte 50000
- En "Diseños de informe", importar el fichero GFLSalesInvoicePP.rdlc como layout custom
- Darle un nombre descriptivo: "GFL Factura PP"

### 3. Asignar el layout a clientes con P.P.
- En la ficha del cliente con término de pago que tenga % Descuento > 0
- Ir a Selección de informes → Ventas → Factura
- Asignar el layout custom "GFL Factura PP"

### 4. Probar
- Imprimir factura de cliente CON P.P. → debe mostrar las filas nuevas + mensaje
- Imprimir factura de cliente SIN P.P. → debe verse idéntica a la original
- Verificar totales con el ejemplo:
  - Subtotal: 2.014,20
  - Descuento en factura: -10,07
  - Subtotal con descuento factura: 2.004,13
  - Descuento P.P.: -30,06
  - Total € IVA excl.: 1.974,07
  - Importe IVA: 78,96
  - Total € IVA incl.: 2.053,03

## Punto importante para Claude en VS Code

El nombre exacto del reporte de Aitana (el que aparece en el objeto AL) debe verificarse. En el código actual se usa `extends "AIT Sales Invoice"`. Si el compilador da error, hay que buscar el nombre correcto del reporte 50000. Se puede encontrar en BC buscando el reporte 50000 en la página de "Selección diseño informe" o mirando los symbols descargados.
