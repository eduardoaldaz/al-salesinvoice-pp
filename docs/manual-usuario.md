# Manual de Usuario — Factura de Venta GFL (Informe 50400)

**Empresa:** Empresa X  
**Versión:** 1.0.1.0  
**Fecha:** Junio 2026

---

## ¿Qué es este informe?

El informe 50400 "GFL Sales Invoice PP" es la plantilla de factura de venta personalizada de Empresa X para Business Central. Está diseñada para mostrar automáticamente el **desglose del descuento por pronto pago (P.P.)** cuando aplica, junto con los logos de certificación de la empresa (BRC, EU Orgánico, CESCE).

Es el informe que debe utilizarse en lugar del informe estándar de Aitana (50000) para facturas de la empresa.

---

## 1. Cómo Imprimir una Factura

### Desde una factura registrada

1. En Business Central, ir a **Historial → Facturas de venta registradas**
2. Abrir la factura que se desea imprimir
3. Hacer clic en **Imprimir / Enviar → Imprimir**
4. En el cuadro de diálogo, buscar y seleccionar el informe **50400 – GFL Sales Invoice PP**
5. Hacer clic en **Aceptar**

### Configurar como informe predeterminado por cliente

Si se desea que un cliente use siempre el informe 50400 de forma automática:

1. Ir a la **Ficha del cliente**
2. Clic en **Relacionado → Ventas → Selección de informes**
3. En "Tipo de uso" seleccionar **Factura**
4. En "ID de informe" escribir `50400`
5. Guardar

Una vez configurado, al imprimir facturas de ese cliente se usará el 50400 sin necesidad de seleccionarlo manualmente.

---

## 2. Estructura de la Factura

### 2.1 Cabecera (parte superior)

La cabecera aparece en todas las páginas de la factura.

**Columna izquierda — Datos de la empresa:**
- Logotipo de la empresa
- Nombre, dirección completa, teléfono
- CIF/NIF (con prefijo de país, ej.: ES12345678X)
- Número EORI

**Columna central — Logos de certificación:**
- Logotipo de certificación BRC (si está configurado)
- Logotipo EU Orgánico (si está configurado)
- Logotipo CESCE (si está configurado)
- Texto "Compañía Certificada"

> Los logos de certificación se gestionan en **Configuración → Información de empresa → pestaña Imágenes adicionales**. Si una imagen está vacía, el espacio simplemente no se muestra.

**Columna derecha — Datos del documento:**

| Campo | Descripción |
|---|---|
| Nº Factura | Número de la factura registrada |
| Fecha | Fecha del documento |
| Nº Cliente | Código del cliente en BC |
| Nº Pedido Cliente | Referencia del cliente (campo "Your Reference" en la ficha de la factura) |
| Términos Pago | Descripción del método de pago (ej.: "30 días FF", "60 días FF") |

> El campo "Nº Pedido Cliente" corresponde al campo **"Su referencia"** en la ficha de la factura de BC.

### 2.2 Datos del Cliente

Bloque con el nombre completo, dirección de facturación y CIF/NIF del cliente.

### 2.3 Líneas de la Factura

Tabla con las líneas del pedido:

| Columna | Descripción |
|---|---|
| Referencia | Código del artículo |
| Descripción | Nombre del producto |
| Cantidad | Unidades facturadas |
| Unidad | Unidad de medida |
| Precio Unitario | Precio por unidad (sin IVA) |
| % Dto. | Descuento de línea aplicado |
| Importe | Total de la línea (sin IVA) |

### 2.4 Vencimientos

Debajo de las líneas aparecen las fechas de vencimiento del pago, según los términos del cliente.

### 2.5 Sección de Totales

Esta sección aparece siempre en la parte inferior de la última página. Las filas que se muestran dependen de si la factura tiene descuento por pronto pago:

**Factura sin pronto pago (la más habitual):**

| Fila | Descripción |
|---|---|
| Descuento Factura | Descuento total aplicado a la factura (si hay) |
| Total € IVA excl. | Subtotal sin IVA |
| Importe IVA | Importe del IVA (al tipo aplicable) |
| **Total € IVA incl.** | **Total a pagar (en negrita)** |

**Factura con pronto pago (cuando los términos tienen un % de descuento P.P.):**

| Fila | Descripción |
|---|---|
| Descuento Factura | Descuento total de factura (si hay) |
| Subtotal con descuento factura | Subtotal después del descuento de factura |
| Descuento P.P. | Importe del descuento por pronto pago |
| Total € IVA excl. | Subtotal recalculado tras descontar el P.P. |
| Importe IVA | Importe del IVA (sobre la base recalculada) |
| **Total € IVA incl.** | **Total con P.P. aplicado (en negrita)** |

> Las filas "Subtotal con descuento factura" y "Descuento P.P." solo aparecen cuando la factura tiene un descuento por pronto pago (términos de pago con Discount % > 0). En facturas normales esas filas quedan ocultas.

### 2.6 Detalle de IVA

Si la factura tiene más de un tipo de IVA distinto, aparece una tabla adicional con el desglose por tipo.

### 2.7 Observaciones (sección inferior)

Contiene el texto legal habitual ("Rogamos nos indiquen siempre el número de factura...").

Cuando la factura tiene pronto pago, aparece además el aviso:

> *Si la factura no es pagada en el periodo de pronto pago acordado se refacturará el descuento por pronto pago aplicado.*

En facturas sin pronto pago, este aviso no aparece.

---

## 3. Diferencias con el Informe de Aitana (50000)

| Característica | Informe 50000 (Aitana) | Informe 50400 (GFL) |
|---|---|---|
| Logos certificación | No muestra | BRC, EU Orgánico, CESCE |
| Desglose P.P. en totales | No | Sí (solo cuando aplica) |
| Aviso P.P. en observaciones | No | Sí (solo cuando aplica) |
| CIF/NIF empresa | Sin prefijo de país | Con prefijo (ej.: ESB...) |
| EORI empresa | Muestra campo EORI de BC | Con fallback si EORI vacío |
| Nº Pedido Cliente | Campo "Your Reference" | Mismo campo |

---

## 4. Preguntas Frecuentes

**¿Por qué no aparecen los logos de certificación?**  
Los logos deben estar subidos en BC: ir a **Configuración → Información de empresa → pestaña Imágenes adicionales**. Las imágenes se almacenan en los campos Imagen 3 (BRC), Imagen 4 (EU Orgánico) e Imagen 5 (CESCE).

**¿Por qué el campo "Nº Pedido Cliente" aparece en blanco?**  
Ese campo se lee del campo "Su referencia" en la cabecera de la factura (no del número de pedido de venta). Verificar que el campo esté rellenado en la factura original antes de registrarla.

**¿Por qué no veo el aviso de pronto pago?**  
El aviso solo aparece cuando los términos de pago de la factura tienen un Descuento % mayor que cero. Si la factura usa términos sin descuento (ej.: "60 días FF" sin P.P.), el espacio queda en blanco — esto es correcto.

**¿El importe del IVA cambia con el pronto pago?**  
No. El importe del IVA siempre se muestra sobre la base estándar sin modificar. Solo los importes de subtotal e importe total se recalculan para reflejar el descuento P.P.

**¿Puedo usar este informe para facturas de abono (crédito)?**  
Este informe está diseñado para facturas de venta registradas. Para abonos, consultar con el departamento de sistemas si se requiere una versión adaptada.

---

## 5. Contacto y Soporte

Para incidencias con el informe, contactar con el departamento de sistemas indicando:
- Número de factura que presentó el problema
- Descripción del error o comportamiento incorrecto
- Captura de pantalla si es posible
