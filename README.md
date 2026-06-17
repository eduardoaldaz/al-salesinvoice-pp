# GFL Sales Invoice PP — Report 50400

Extensión AL de Business Central para Global Food Link S.L. que genera facturas de venta con desglose de descuento por pronto pago (P.P.) y logos de certificación.

## Descripción

Report standalone (ID 50400) basado en el diseño de Aitana (50000) con las siguientes adiciones:

- Desglose del descuento por pronto pago en la sección de totales
- Descripción del término de pago en la cabecera
- Mensaje de advertencia condicional sobre P.P. en observaciones
- Logos de certificación (BRC, EU Orgánico, CESCE) tomados de la ficha de empresa

## Requisitos

- Business Central 28.0 (cloud)
- Extensión `BC_GEN-001 General` de Aitana Management S.L. (≥ 1.0.0.0)
- Extensión `BC_IMP-001 Impresos` de Aitana Management S.L. (≥ 1.0.0.0)

## Estructura del Proyecto

```
GFL-SalesInvoicePP/
├── app.json                          # Configuración de la extensión AL
├── src/
│   ├── GFLSalesInvoicePP.Report.al  # Lógica del report
│   └── GFLSalesInvoicePP.rdlc       # Layout RDLC
└── docs/
    ├── informe-tecnico.md            # Documentación técnica
    └── manual-usuario.md             # Manual de usuario
```

## Compilar y Desplegar

1. Abrir el proyecto en VS Code con la extensión AL Language
2. Ejecutar `AL: Download Symbols` si es la primera vez
3. Compilar con `Ctrl+Shift+B` → se genera el archivo `.app`
4. En BC: **Gestión de extensiones → Subir extensión** → seleccionar el `.app`

## Documentación

- [Informe Técnico](docs/informe-tecnico.md) — arquitectura, dataset, mecanismo SetData/GetData, lógica P.P., despliegue
- [Manual de Usuario](docs/manual-usuario.md) — cómo imprimir, descripción de secciones, preguntas frecuentes

## Versión Actual

**1.0.1.0** — Fix campo "Nº Pedido Cliente" (fuente: "Your Reference")

Ver historial completo en el [Informe Técnico](docs/informe-tecnico.md#11-historial-de-versiones).

## Publisher

Global Food Link S.L.
