# Informe Técnico — GFL Sales Invoice PP (Report 50400)

**Empresa:** Empresa X  
**Versión actual:** 1.0.1.0  
**Fecha:** Junio 2026  
**Autor:** Departamento de Sistemas

---

## 1. Descripción General

`GFL Sales Invoice PP` es un report standalone de Business Central (ID 50400) que genera facturas de venta personalizadas para Empresa X. Está basado en el diseño del report 50000 de Aitana Management S.L. con las siguientes adiciones:

- Desglose de **descuento por pronto pago (P.P.)** en la sección de subtotales
- **Descripción del término de pago** en la cabecera del documento
- **Mensaje de advertencia condicional** sobre el P.P. en la sección de Observaciones
- Acceso a los **logos de certificación** (BRC, EU Orgánico, CESCE) almacenados en la ficha de empresa

---

## 2. Especificaciones Técnicas

| Parámetro | Valor |
|---|---|
| Tipo de objeto | Report (standalone) |
| ID | 50400 |
| Nombre | `GFL Sales Invoice PP` |
| Caption | `GFL Ventas - Factura PP` |
| Versión | 1.0.1.0 |
| Plataforma BC | 28.0.0.0 |
| Runtime AL | 17.0 |
| Target | Cloud |
| Layout | RDLC embebido (`src/GFLSalesInvoicePP.rdlc`) |

### 2.1 Dependencias

| Extensión | Publisher | Versión mínima | Propósito |
|---|---|---|---|
| `BC_GEN-001 General` | Aitana Management S.L. | 1.0.0.0 | Campos Picture2–5 en Company Information (logos certificación) |
| `BC_IMP-001 Impresos` | Aitana Management S.L. | 1.0.0.0 | Compatibilidad con el ecosistema de impresión de Aitana |

> **Nota:** Ambas extensiones deben estar instaladas en el entorno BC donde se despliegue el report. `BC_GEN-001 General` es una dependencia transitiva de `BC_IMP-001 Impresos` y normalmente ya estará presente.

---

## 3. Estructura del Proyecto

```
GFL-SalesInvoicePP/
├── app.json                          # Configuración de la extensión AL
├── src/
│   ├── GFLSalesInvoicePP.Report.al  # Lógica del report (AL)
│   └── GFLSalesInvoicePP.rdlc       # Layout RDLC embebido
├── docs/
│   ├── informe-tecnico.md           # Este documento
│   └── manual-usuario.md            # Manual de usuario
└── .gitignore
```

---

## 4. Estructura del Dataset AL

El dataitem principal es `Header` sobre la tabla `Sales Invoice Header`. Todos los dataitems hijos heredan contexto de `Header`.

### 4.1 Dataitems

| Dataitem | Tabla | Descripción |
|---|---|---|
| `Header` | `Sales Invoice Header` | Cabecera de factura — dataitem raíz |
| `Line` | `Sales Invoice Line` | Líneas de factura |
| `ShipmentLine` | `Sales Shipment Line` | Líneas de albarán — siempre oculto en RDLC |
| `AssemblyLine` | `Integer` (stub vacío) | Stub para compatibilidad con el dataset |
| `WorkDescriptionLines` | `Integer` (stub vacío) | Stub para compatibilidad |
| `VATAmountLine` | `VAT Amount Line` (temporary) | Detalle de IVA — calculado en `OnAfterGetRecord` |
| `VATClauseLine` | `VAT Clause` (temporary) | Cláusulas IVA — calculado en `OnPreDataItem` de VATAmountLine |
| `ReportTotalsLine` | `Integer` (stub vacío) | Stub para compatibilidad |
| `LineFee`, `PaymentReportingArgument`, `LetterText`, `LeftHeader`, `RightHeader` | `Integer` (stub vacío) | Stubs de compatibilidad con dataset estándar de BC |
| `Totals` | `Integer` (`Number=0`) | Totales calculados — se ejecuta una vez por factura |

### 4.2 Columnas Clave del Dataitem Header

#### Dirección Empresa (`CompanyAddr[1..8]`)
Se construye en `OnPreDataItem` del dataitem `Header`:

| Slot | Contenido | Formato en RDLC |
|---|---|---|
| `CompanyAddr[1]` | `CompanyInfo.Name` | **Negrita** |
| `CompanyAddr[2]` | `CompanyInfo.Address` (+ Address2 si existe) | Normal 8pt |
| `CompanyAddr[3]` | `CompanyInfo."Post Code" + City` | Normal 8pt |
| `CompanyAddr[4]` | Nombre del país (via `GetCountryName`) | Normal 8pt |
| `CompanyAddr[5]` | `CompanyInfo."Phone No."` | Normal 8pt |
| `CompanyAddr[6]` | `'CIF/NIF: ' + Country + VAT Registration No.` | **Negrita 8pt** |
| `CompanyAddr[7]` | `'EORI: ' + EORI Number` (o Country+VAT si EORI vacío) | **Negrita 8pt** |
| `CompanyAddr[8]` | Vacío | — |

#### Dirección Cliente (`CustAddr[1..8]`)
Se construye en `OnAfterGetRecord` del dataitem `Header`:

| Slot | Contenido |
|---|---|
| `CustAddr[1]` | `"Bill-to Name"` |
| `CustAddr[2]` | `"Bill-to Address"` |
| `CustAddr[3]` | County + Post Code + City (County omitido si vacío) |
| `CustAddr[4]` | Nombre del país (via `GetCountryName`) |
| `CustAddr[5]` | `'CIF/NIF: ' + "VAT Registration No."` |
| `CustAddr[6..8]` | Vacío |

#### Cabecera Dinámica (`LHeader[1..5]` / `LHeaderLbl[1..5]`)
Filas de la cabecera derecha del documento, pasadas al encabezado de página via mecanismo `SetData/GetData`:

| Índice | Etiqueta | Valor |
|---|---|---|
| 1 | Nº Factura | `Header."No."` |
| 2 | Fecha | `Format(Header."Document Date")` |
| 3 | Nº Cliente | `Header."Bill-to Customer No."` |
| 4 | Nº Pedido Cliente | `Header."Your Reference"` |
| 5 | Términos Pago | `PaymentTerms.Description` |

#### Imágenes de Certificación
Campos añadidos por `BC_GEN-001 General` (table extension sobre `Company Information`):

| Columna AL | Campo en BC | Imagen esperada |
|---|---|---|
| `CompanyPicture2` | `CompanyInfo.Picture2` (Field 50000) | Imagen 2 (vacía por defecto) |
| `CompanyPicture3` | `CompanyInfo.Picture3` (Field 50001) | Imagen 3 (BRC) |
| `CompanyPicture4` | `CompanyInfo.Picture4` (Field 50002) | Imagen 4 (EU Orgánico) |
| `CompanyPicture5` | `CompanyInfo.Picture5` (Field 50003) | Imagen 5 (CESCE) |

Todos son Blob tipo Bitmap. Se requiere `CalcFields(Picture, Picture2, Picture3, Picture4, Picture5)` en `OnPreDataItem`.

### 4.3 Cálculo de IVA (TmpVATAmtLine)

En `OnAfterGetRecord` del `Header`, se recorre todas las `Sales Invoice Line` de la factura y se acumula en `TmpVATAmtLine` (tabla temporal). **Solo se insertan líneas con `VAT Identifier <> ''`** para evitar que comentarios o líneas sin IVA generen filas espurias en la tabla de detalle IVA y activen la fila de totales incorrectamente.

La fila de totales en la tabla de detalle IVA tiene condición `Hidden = NoOfVATIdentifiers < 2`, por lo que solo aparece cuando hay más de un tipo de IVA distinto.

---

## 5. Mecanismo SetData / GetData

El encabezado de página RDLC no puede acceder directamente a los campos del dataset (limitación de RDLC). El mecanismo funciona así:

1. En el **cuerpo del report** (fila del dataitem `Line`), hay un textbox oculto `Textbox9` cuya propiedad `Visibility.Hidden` contiene una expresión `Code.SetData(...)`.
2. `SetData` empaqueta todos los valores necesarios en una cadena única separada por `Chr(177)` (carácter ±) y los almacena en el objeto `Code` del RDLC.
3. En el **encabezado de página**, los textboxes leen los valores con `Code.GetData(n, 1)`.

### Mapa de slots SetData

| Slots | Contenido |
|---|---|
| 1–8 | `CompanyAddress1`–`CompanyAddress8` (dirección empresa) |
| 9–13 | `LHeaderLbl1`–`LHeaderLbl5` (etiquetas cabecera) |
| 14–18 | `LHeader1`–`LHeader5` (valores cabecera) |
| 19–20 | `ShipmentMethodDescription_Lbl` / valor |
| 21–22 | `CompanyBankName_Lbl` / valor |
| 23–24 | `CompanyBankAccountNo_Lbl` / valor |
| 25–26 | `ContainerNoLbl` / valor |
| 27 | `DueDate_Lbl` |
| 28–30 | `PT1`–`PT3` (líneas vencimiento) |
| 31–35 | `CustomerAddress1`–`CustomerAddress5` |
| 36 | `OrderNo` |

> **Nota importante:** Las columnas del dataitem `Header` cuyo valor proviene de variables array (e.g. `LHeaderValArr[n]`) pueden no propagarse correctamente a filas hijas del dataitem `Line` donde se ejecuta `SetData`. La solución es usar referencias directas al campo (`column(LHeader4; "Your Reference")`) en lugar de array variables para slots críticos.

---

## 6. Funcionalidad P.P. (Pronto Pago)

### 6.1 Lógica AL

En `OnAfterGetRecord` del dataitem `Header`:

```al
GFL_PmtDiscPctVal := PaymentTerms."Discount %";          // % desde los términos de pago
GFL_SubtotalAfterInvDiscVal := TotalLineAmt - TotalInvDiscAmt;
GFL_PmtDiscAmountVal := Round(GFL_SubtotalAfterInvDiscVal * GFL_PmtDiscPctVal / 100, 0.01);
GFL_TotalExclVATRecalcVal := GFL_SubtotalAfterInvDiscVal - GFL_PmtDiscAmountVal;
GFL_TotalInclVATRecalcVal := GFL_TotalExclVATRecalcVal + TotalVATAmt;
GFL_HasPmtDiscVal := GFL_PmtDiscPctVal > 0;
```

El mensaje de advertencia se activa solo cuando hay P.P.:
```al
if GFL_HasPmtDiscVal then
    GFL_PmtDiscWarningMsgTxt := 'Si la factura no es pagada en el periodo de pronto pago ...'
else
    GFL_PmtDiscWarningMsgTxt := '';
```

### 6.2 Implementación RDLC

| Fila RDLC | Condición de visibilidad | Valor mostrado |
|---|---|---|
| "Subtotal con descuento factura" | `Hidden = NOT(GFL_HasPmtDisc)` | `GFL_SubtotalAfterInvDiscFormat` |
| "Descuento P.P." | `Hidden = NOT(GFL_HasPmtDisc)` | `"-" & GFL_PmtDiscAmountFormat` |
| "Total € IVA excl." | Siempre visible | IIF(P.P. → `GFL_TotalExclVATRecalcFormat`, sino → estándar) |
| "Importe IVA" | Siempre visible | `TotalVATAmount` (sin modificar) |
| "Total € IVA incl." | Siempre visible (**Negrita**) | IIF(P.P. → `GFL_TotalInclVATRecalcFormat`, sino → estándar) |
| Aviso P.P. en Observaciones | Siempre visible (IIF para evitar colapso) | `GFL_PmtDiscWarningMsg` (o espacio si vacío) |

---

## 7. Procedimiento Local GetCountryName

```al
local procedure GetCountryName(CountryCode: Code[10]): Text
var
    Country: Record "Country/Region";
begin
    if CountryCode = '' then exit('');
    if Country.Get(CountryCode) then
        exit(Country.Name);
    exit(CountryCode);  // fallback: devuelve el código si no encuentra el nombre
end;
```

Se usa para convertir el código de país (e.g. `ES`) al nombre completo (e.g. `España`) en las direcciones de empresa, cliente y envío.

---

## 8. Limitaciones Conocidas

| Limitación | Descripción | Solución aplicada |
|---|---|---|
| Imágenes de certificación | Los campos `Picture2–5` pertenecen a `BC_GEN-001 General` de Aitana, no al estándar BC | Se declaró como dependencia en `app.json` |
| EORI Number vacío | Si la ficha empresa no tiene `EORI Number` relleno, se muestra `Country + VAT Registration No.` como fallback | Implementado en AL |
| SetData en filas hijas | Columnas con fuente array (`LHeaderValArr[n]`) no se propagan bien a filas `Line` | Columnas críticas usan referencia directa al campo |
| Línea de albarán | En producción, facturas con albaranes vinculados mostraban la fila de albarán | RDLC tiene `Hidden = true` fijo para `ShipmentLine` |
| P.P. no validado en producción | Solo se ha validado con facturas sin P.P. | Pendiente: validar con factura con `Discount % > 0` en términos de pago |

---

## 9. Instrucciones de Despliegue

### Requisitos previos
- VS Code con extensión AL Language
- Acceso a BC production (rol de administrador de extensiones)
- Extensiones de Aitana instaladas: `BC_GEN-001 General` y `BC_IMP-001 Impresos`

### Proceso

1. **Compilar:** `Ctrl+Shift+B` en VS Code → genera el archivo `.app` en la raíz del proyecto
2. **Acceder a BC:** Ir a `Gestión de extensiones` (buscar en la barra de búsqueda de BC)
3. **Subir:** Botón "Subir extensión" → seleccionar el archivo `.app` generado
4. **Verificar:** La extensión debe aparecer en la lista con estado "Instalado"
5. **Probar:** Imprimir una factura con el informe 50400

### Selección del informe por defecto (opcional)

Para que las facturas de un cliente usen el report 50400 automáticamente:
- Ficha Cliente → Relacionado → Ventas → Selección de informes
- Tipo de uso: Factura → Seleccionar ID informe `50400`

---

## 10. Repositorios Git

| Remoto | URL | Descripción |
|---|---|---|
| `origin` (personal) | `https://github.com/<usuario>/al-salesinvoice-pp.git` | Copia en cuenta personal |
| `empresa` | `https://github.com/<org>/al-salesinvoice-pp.git` | Cuenta organización empresa |

Cada commit se sube a ambos remotos simultáneamente:
```bash
git push origin master
git push empresa master
```

---

## 11. Historial de Versiones

| Versión | Fecha | Cambios |
|---|---|---|
| 1.0.0.1 | May 2026 | Versión inicial — report standalone basado en RDLC de Aitana. Funcionalidad P.P. básica |
| 1.0.0.3 | May 2026 | Primeras pruebas en producción |
| 1.0.0.4 | Jun 2026 | Fix dirección empresa: reorden de slots CompanyAddr, GetCountryName, CIF/NIF en slot bold |
| 1.0.0.5 | Jun 2026 | Fix dirección cliente: reorden CustAddr, CIF/NIF cliente, GetCountryName. Fix ShipmentLine siempre oculto. Fix imágenes certificación ocultas |
| 1.0.0.6 | Jun 2026 | Fix fila extra tabla IVA (skip líneas sin VAT Identifier). Fix espacio en Observaciones (IIF forzar espacio en LegalLbl2) |
| 1.0.0.7 | Jun 2026 | Añadida dependencia BC_GEN-001 General. CompanyPicture2–5 usan campos reales (Picture2–5). CCTxt = 'Compañía Certificada'. Imágenes certificación visibles en RDLC |
| 1.0.0.8 | Jun 2026 | Fix CIF/NIF: añade prefijo Country/Region Code. Fix EORI: usa campo estándar "EORI Number" con fallback a Country+VAT |
| 1.0.0.9 | Jun 2026 | Fix Nº Pedido Cliente: LHeader4 usa campo directo "External Document No." (no funcionó) |
| 1.0.1.0 | Jun 2026 | Fix Nº Pedido Cliente: LHeader4 corregido a campo "Your Reference" (fuente real en Aitana) |
