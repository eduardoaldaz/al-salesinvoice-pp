report 50400 "GFL Sales Invoice PP"
{
    Caption = 'GFL Ventas - Factura PP';
    DefaultRenderingLayout = GFLSalesInvoicePP;
    WordMergeDataItem = Header;
    PreviewMode = PrintLayout;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = Basic, Suite;

    dataset
    {
        dataitem(Header; "Sales Invoice Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.", "Sell-to Customer No.";

            // === COMPANY ===
            column(CompanyAddress1; CompanyAddr[1]) { }
            column(CompanyAddress2; CompanyAddr[2]) { }
            column(CompanyAddress3; CompanyAddr[3]) { }
            column(CompanyAddress4; CompanyAddr[4]) { }
            column(CompanyAddress5; CompanyAddr[5]) { }
            column(CompanyAddress6; CompanyAddr[6]) { }
            column(CompanyAddress7; CompanyAddr[7]) { }
            column(CompanyAddress8; CompanyAddr[8]) { }
            column(CompanyHomePage; CompanyInfo."Home Page") { }
            column(CompanyEMail; CompanyInfo."E-Mail") { }
            column(CompanyPicture; CompanyInfo.Picture) { }
            column(CompanyPicture2; CompanyInfo.Picture2) { }
            column(CompanyPicture3; CompanyInfo.Picture3) { }
            column(CompanyPicture4; CompanyInfo.Picture4) { }
            column(CompanyPicture5; CompanyInfo.Picture5) { }
            column(CompanyPhoneNo; CompanyInfo."Phone No.") { }
            column(CompanyPhoneNo_Lbl; 'Teléfono') { }
            column(CompanyGiroNo; '') { }
            column(CompanyGiroNo_Lbl; '') { }
            column(CompanyBankName; CompanyBankAcc.Name) { }
            column(CompanyBankName_Lbl; 'Banco') { }
            column(CompanyBankBranchNo; '') { }
            column(CompanyBankBranchNo_Lbl; 'Sucursal') { }
            column(CompanyBankAccountNo; CompanyBankAccountNoTxt) { }
            column(CompanyBankAccountNo_Lbl; 'Nº Cuenta Bancaria') { }
            column(CompanyIBAN; CompanyBankAcc.IBAN) { }
            column(CompanyIBAN_Lbl; 'IBAN') { }
            column(CompanySWIFT; CompanyBankAcc."SWIFT Code") { }
            column(CompanySWIFT_Lbl; 'SWIFT') { }
            column(CompanyLogoPosition; 0) { }
            column(CompanyRegistrationNumber; CompanyInfo."Registration No.") { }
            column(CompanyRegistrationNumber_Lbl; 'Reg. Mercantil') { }
            column(CompanyVATRegNo; CompanyInfo."VAT Registration No.") { }
            column(CompanyVATRegNo_Lbl; 'CIF/NIF') { }
            column(CompanyVATRegistrationNo; CompanyInfo."VAT Registration No.") { }
            column(CompanyVATRegistrationNo_Lbl; 'CIF/NIF') { }
            column(CompanyLegalStatement; CompanyLegalStatementTxt) { }
            column(DisplayAdditionalFeeNote; false) { }
            column(NetWeightLbl; 'Peso Neto') { }
            column(GrossWeightLbl; 'Peso Bruto') { }

            // === CUSTOMER ADDRESS ===
            column(CustomerAddress1; CustAddr[1]) { }
            column(CustomerAddress2; CustAddr[2]) { }
            column(CustomerAddress3; CustAddr[3]) { }
            column(CustomerAddress4; CustAddr[4]) { }
            column(CustomerAddress5; CustAddr[5]) { }
            column(CustomerAddress6; CustAddr[6]) { }
            column(CustomerAddress7; CustAddr[7]) { }
            column(CustomerAddress8; CustAddr[8]) { }
            column(CustomerPostalBarCode; '') { }
            column(YourReference; "Your Reference") { }
            column(YourReference_Lbl; 'Su Referencia') { }

            // === SHIPMENT ===
            column(ShipmentMethodDescription; ShipmentMethodDesc) { }
            column(ShipmentMethodDescription_Lbl; 'Cond. Envío') { }
            column(ShipmentDate; Format("Shipment Date")) { }
            column(ShipmentDate_Lbl; 'Fecha Envío') { }
            column(Shipment_Lbl; 'Albarán') { }
            column(ShowShippingAddress; ShowShipAddr) { }
            column(ShipToAddress_Lbl; 'Dirección de Envío') { }
            column(ShipToAddress1; ShipToAddr[1]) { }
            column(ShipToAddress2; ShipToAddr[2]) { }
            column(ShipToAddress3; ShipToAddr[3]) { }
            column(ShipToAddress4; ShipToAddr[4]) { }
            column(ShipToAddress5; ShipToAddr[5]) { }
            column(ShipToAddress6; ShipToAddr[6]) { }
            column(ShipToAddress7; ShipToAddr[7]) { }
            column(ShipToAddress8; ShipToAddr[8]) { }

            // === CONTACT INFO ===
            column(SellToContactPhoneNoLbl; 'Teléfono') { }
            column(SellToContactMobilePhoneNoLbl; 'Móvil') { }
            column(SellToContactEmailLbl; 'E-mail') { }
            column(BillToContactPhoneNoLbl; 'Teléfono') { }
            column(BillToContactMobilePhoneNoLbl; 'Móvil') { }
            column(BillToContactEmailLbl; 'E-mail') { }
            column(SellToContactPhoneNo; SellToContactPhone) { }
            column(SellToContactMobilePhoneNo; SellToContactMobilePhone) { }
            column(SellToContactEmail; SellToContactEmailTxt) { }
            column(BillToContactPhoneNo; BillToContactPhone) { }
            column(BillToContactMobilePhoneNo; BillToContactMobilePhone) { }
            column(BillToContactEmail; BillToContactEmailTxt) { }

            // === PAYMENT / TERMS ===
            column(PaymentTermsDescription; PaymentTermsDesc) { }
            column(PaymentTermsDescription_Lbl; 'Condiciones de Pago') { }
            column(PaymentMethodDescription; PaymentMethodDesc) { }
            column(PaymentMethodDescription_Lbl; 'Forma de Pago') { }

            // === DOCUMENT INFO ===
            column(BilltoCustumerNo; "Bill-to Customer No.") { }
            column(BilltoCustomerNo_Lbl; 'Nº Cliente') { }
            column(DocumentDate; Format("Document Date")) { }
            column(DocumentDate_Lbl; 'Fecha') { }
            column(DueDate; Format("Due Date")) { }
            column(DueDate_Lbl; 'Fecha Vencimiento') { }
            column(DocumentNo; "No.") { }
            column(DocumentNo_Lbl; 'Nº Factura') { }
            column(OrderNo; "Order No.") { }
            column(OrderNoLbl; 'Nº Pedido') { }
            column(PricesIncludingVAT; "Prices Including VAT") { }
            column(PricesIncludingVAT_Lbl; 'Precios IVA incl.') { }
            column(PricesIncludingVATYesNo; PricesIncVATYesNoTxt) { }
            column(SalesPerson_Lbl; 'Comercial') { }
            column(SalesPersonBlank_Lbl; SalesPersonNameTxt) { }
            column(SalesPersonName; SalesPersonNameTxt) { }
            column(SelltoCustomerNo; "Sell-to Customer No.") { }
            column(SelltoCustomerNo_Lbl; 'Nº Cliente Envío') { }
            column(VATRegistrationNo; "VAT Registration No.") { }
            column(VATRegistrationNo_Lbl; 'NIF') { }
            column(SellToFaxNo; '') { }
            column(SellToPhoneNo; "Sell-to Phone No.") { }
            column(PaymentReference; "Payment Reference") { }
            column(ExternalDocumentNo; "External Document No.") { }
            column(ExternalDocumentNo_Lbl; 'Nº Pedido Cliente') { }

            // === LABELS MISC ===
            column(From_Lbl; 'De') { }
            column(BilledTo_Lbl; 'Facturado a') { }
            column(ChecksPayable_Lbl; '') { }
            column(PaymentReference_Lbl; 'Referencia Pago') { }
            column(LegalEntityType; '') { }
            column(LegalEntityType_Lbl; '') { }
            column(Copy_Lbl; 'COPIA') { }
            column(EMail_Lbl; 'E-mail') { }
            column(HomePag_Lbl; 'Web') { }
            column(InvoiceDiscountBaseAmount_Lbl; 'Base Dto. Factura') { }
            column(InvoiceDiscountAmount_Lbl; 'Descuento en Factura') { }
            column(LineAmountAfterInvoiceDiscount_Lbl; 'Importe después de Dto.') { }
            column(LocalCurrency_Lbl; 'Moneda Local') { }
            column(ExchangeRateAsText; ExchangeRateText) { }
            column(Page_Lbl; 'Página') { }
            column(SalesInvoiceLineDiscount_Lbl; '% Dto.') { }
            column(Questions_Lbl; '¿Alguna pregunta?') { }
            column(Contact_Lbl; 'Contacto') { }
            column(DocumentTitle_Lbl; 'FACTURA') { }
            column(YourDocumentTitle_Lbl; 'Su Factura') { }
            column(Thanks_Lbl; 'Gracias por su confianza') { }
            column(ShowWorkDescription; false) { }
            column(RemainingAmount; 0) { }
            column(RemainingAmountText; '') { }
            column(Subtotal_Lbl; 'Subtotal') { }
            column(Total_Lbl; 'Total') { }
            column(VATAmount_Lbl; 'Importe IVA') { }
            column(VATBase_Lbl; 'Base IVA') { }
            column(VATAmountSpecification_Lbl; 'Detalle IVA') { }
            column(VATClauses_Lbl; 'Cláusulas IVA') { }
            column(VATIdentifier_Lbl; 'Id. IVA') { }
            column(VATPercentage_Lbl; '% IVA') { }
            column(VATClause_Lbl; 'Cláusula IVA') { }
            column(PackageTrackingNo; "Package Tracking No.") { }
            column(PackageTrackingNo_Lbl; 'Nº Seguimiento') { }
            column(ShippingAgentCode; "Shipping Agent Code") { }
            column(ShippingAgentCode_Lbl; 'Agencia Transporte') { }
            column(PaymentInstructions_Txt; '') { }

            // === AITANA CUSTOM ===
            column(CCTxt; 'Compañía Certificada') { }
            column(LHeaderLbl1; LHeaderLblArr[1]) { }
            column(LHeaderLbl2; LHeaderLblArr[2]) { }
            column(LHeaderLbl3; LHeaderLblArr[3]) { }
            column(LHeaderLbl4; LHeaderLblArr[4]) { }
            column(LHeaderLbl5; LHeaderLblArr[5]) { }
            column(LHeader1; LHeaderValArr[1]) { }
            column(LHeader2; LHeaderValArr[2]) { }
            column(LHeader3; LHeaderValArr[3]) { }
            column(LHeader4; LHeaderValArr[4]) { }
            column(LHeader5; LHeaderValArr[5]) { }
            column(PT1; PTArr[1]) { }
            column(PT2; PTArr[2]) { }
            column(PT3; PTArr[3]) { }
            column(RegMercantilTxt; CompanyInfo."Registration No.") { }
            column(RCVatNo; '') { }
            column(RCEORI; '') { }
            column(ContainerNo; "Package Tracking No.") { }
            column(ContainerNoLbl; 'Contenedor') { }
            column(IsOrganic; false) { }
            column(OrganicLbl; '') { }
            column(LegalStampLbl; 'Productos congelados a una temperatura de -18°C') { }
            column(RemarksLbl; 'Observaciones') { }
            column(LegalLbl; LegalLblTxt) { }
            column(LegalLbl1; 'Rogamos devuelvan firmada la factura una vez haya sido entregada la mercancía en destino final.') { }
            column(LegalLbl2; GFL_PmtDiscWarningMsgTxt) { }
            column(LegalLbl3; 'Inscrita en el Registro Mercantil de Pamplona, Tomo 1818, Libro 0, Folio 134, Hoja NA-36074, Inscripción 1ª') { }
            column(TotalNetWeight; 0) { }
            column(TotalGrossWeight; 0) { }
            column(TotalNetWeightLbl; 'Peso Neto Total') { }
            column(TotalGrossWeightLbl; 'Peso Bruto Total') { }

            // === PAYMENT SERVICE / LETTER / MISC DATAITEMS (in Header for simplicity) ===
            column(PaymentServiceLogo; CompanyInfo.Picture) { }
            column(PaymentServiceLogo_UrlText; '') { }
            column(PaymentServiceLogo_Url; '') { }
            column(PaymentServiceText_UrlText; '') { }
            column(PaymentServiceText_Url; '') { }
            column(GreetingText; '') { }
            column(BodyText; '') { }
            column(ClosingText; '') { }
            column(PmtDiscText; '') { }
            column(LeftHeaderName; '') { }
            column(LeftHeaderValue; '') { }
            column(RightHeaderName; '') { }
            column(RightHeaderValue; '') { }
            column(LineFeeCaptionText; '') { }

            column(CurrencyCode; CurrCode) { }
            column(CurrencySymbol; CurrSymbol) { }

            // === GFL PRONTO PAGO ===
            column(GFL_PmtDiscPct; GFL_PmtDiscPctVal) { }
            column(GFL_SubtotalAfterInvDiscCaption; 'Subtotal con descuento factura') { }
            column(GFL_PmtDiscCaption; 'Descuento P.P.') { }
            column(GFL_PmtDiscWarningMsg; GFL_PmtDiscWarningMsgTxt) { }
            column(GFL_HasPmtDisc; GFL_HasPmtDiscVal) { }
            column(GFL_SubtotalAfterInvDiscFormat; GFL_SubtotalAfterInvDiscFmtTxt) { }
            column(GFL_PmtDiscAmountFormat; GFL_PmtDiscAmountFmtTxt) { }
            column(GFL_TotalExclVATRecalcFormat; GFL_TotalExclVATRecalcFmtTxt) { }
            column(GFL_TotalInclVATRecalcFormat; GFL_TotalInclVATRecalcFmtTxt) { }

            // =============================================
            // LÍNEAS
            // =============================================
            dataitem(Line; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemLinkReference = Header;
                DataItemTableView = sorting("Document No.", "Line No.");

                column(LineNo_Line; "Line No.") { }
                column(AmountExcludingVAT_Line_Lbl; 'Importe IVA excl.') { }
                column(Description_Line; Description) { }
                column(Description_Line_Lbl; 'Descripción') { }
                column(LineDiscountPercentText_Line; LineDiscPctText) { }
                column(LineAmount_Line_Lbl; 'Importe') { }
                column(ItemNo_Line; "No.") { }
                column(ItemNo_Line_Lbl; 'Cód. Artículo') { }
                column(ItemReferenceNo_Line; "Item Reference No.") { }
                column(ItemReferenceNo_Line_Lbl; 'Ref. Cliente') { }
                column(ShipmentDate_Line; Format("Shipment Date")) { }
                column(ShipmentDate_Line_Lbl; 'Fecha Envío') { }
                column(Quantity_Line; Format(Quantity, 0, '<Precision,0:5><Standard Format,0>')) { }
                column(Quantity_Line_Lbl; 'Cantidad') { }
                column(Type_Line; Format(Type)) { }
                column(UnitPrice_Lbl; 'Precio') { }
                column(UnitOfMeasure; "Unit of Measure Code") { }
                column(UnitOfMeasure_Lbl; 'UM') { }
                column(VATIdentifier_Line; "VAT Identifier") { }
                column(VATIdentifier_Line_Lbl; 'Id. IVA') { }
                column(VATPct_Line; Format("VAT %", 0, '<Precision,0:2><Standard Format,0>')) { }
                column(VATPct_Line_Lbl; '% IVA') { }
                column(JobTaskNo_Lbl; 'Nº Tarea') { }
                column(JobTaskNo; "Job Task No.") { }
                column(JobTaskDescription; JobTaskDesc) { }
                column(JobTaskDesc_Lbl; 'Descripción Tarea') { }
                column(JobNo_Lbl; 'Nº Proyecto') { }
                column(JobNo; "Job No.") { }
                column(Unit_Lbl; 'Unidad') { }
                column(Qty_Lbl; 'Cant.') { }
                column(Price_Lbl; 'Precio') { }
                column(PricePer_Lbl; 'Precio/UM') { }
                column(Net_Weight; 0) { }
                column(TariffNoLbl; '') { }
                column(CountryCodeLbl; '') { }
                column(LineCountryCode; '') { }
                column(LineTariffNo; '') { }
                // Numeric columns (BC auto-generates _Format companions)
                column(LineDiscountPercent_Line; "Line Discount %")
                {
                    AutoFormatType = 0;
                }
                column(LineAmount_Line; "Line Amount")
                {
                    AutoFormatType = 1;
                    AutoFormatExpression = Header."Currency Code";
                }
                column(AmountExcludingVAT_Line; Amount)
                {
                    AutoFormatType = 1;
                    AutoFormatExpression = Header."Currency Code";
                }
                column(AmountIncludingVAT_Line; "Amount Including VAT")
                {
                    AutoFormatType = 1;
                    AutoFormatExpression = Header."Currency Code";
                }
                column(AmountIncludingVAT_Line_Lbl; 'Importe IVA incl.') { }
                column(UnitPrice; "Unit Price")
                {
                    AutoFormatType = 2;
                    AutoFormatExpression = Header."Currency Code";
                }
                column(TransHeaderAmount; 0) { }

                dataitem(ShipmentLine; "Sales Shipment Line")
                {
                    DataItemLink = "Document No." = field("Shipment No."), "Line No." = field("Shipment Line No.");
                    DataItemLinkReference = Line;
                    DataItemTableView = sorting("Document No.", "Line No.");

                    column(DocumentNo_ShipmentLine; "Document No.") { }
                    column(PostingDate_ShipmentLine; "Posting Date") { }
                    column(PostingDate_ShipmentLine_Lbl; 'Fecha Registro') { }
                    column(Quantity_ShipmentLine; Quantity)
                    {
                        AutoFormatType = 0;
                    }
                    column(Quantity_ShipmentLine_Lbl; 'Cantidad') { }
                }

                dataitem(AssemblyLine; Integer)
                {
                    DataItemTableView = WHERE(Number = CONST(0));

                    column(LineNo_AssemblyLine; '') { }
                    column(Description_AssemblyLine; '') { }
                    column(Quantity_AssemblyLine; '') { }
                    column(UnitOfMeasure_AssemblyLine; '') { }
                    column(VariantCode_AssemblyLine; '') { }
                }

                trigger OnAfterGetRecord()
                var
                    JobTask: Record "Job Task";
                begin
                    if "Line Discount %" = 0 then
                        LineDiscPctText := ''
                    else
                        LineDiscPctText := Format("Line Discount %", 0, '<Precision,0:2><Standard Format,0>') + '%';

                    JobTaskDesc := '';
                    if ("Job No." <> '') and ("Job Task No." <> '') then
                        if JobTask.Get("Job No.", "Job Task No.") then
                            JobTaskDesc := JobTask.Description;
                end;
            }

            // =============================================
            // WORK DESCRIPTION (stub)
            // =============================================
            dataitem(WorkDescriptionLines; Integer)
            {
                DataItemTableView = WHERE(Number = CONST(0));

                column(WorkDescriptionLineNumber; Number) { }
                column(WorkDescriptionLine; '') { }
            }

            // =============================================
            // DETALLE IVA
            // =============================================
            dataitem(VATAmountLine; "VAT Amount Line")
            {
                DataItemLinkReference = Header;
                UseTemporary = true;

                column(InvoiceDiscountAmount_VATAmountLine_Lbl; 'Dto. Factura') { }
                column(InvoiceDiscountBaseAmount_VATAmountLine_Lbl; 'Base Dto. Factura') { }
                column(LineAmount_VatAmountLine_Lbl; 'Importe Línea') { }
                column(VATAmount_VatAmountLine_Lbl; 'Importe IVA') { }
                column(VATAmountLCY_VATAmountLine; "VAT Amount")
                {
                    AutoFormatType = 1;
                    AutoFormatExpression = Header."Currency Code";
                }
                column(VATAmountLCY_VATAmountLine_Lbl; 'Importe IVA LCY') { }
                column(ECAmount_VatAmountLine; 0) { }
                column(ECAmount_VatAmountLine_Lbl; '') { }
                column(ECAmountLCY_VatAmountLine; 0) { }
                column(ECAmountLCY_VatAmountLine_Lbl; '') { }
                column(VATBase_VatAmountLine_Lbl; 'Base IVA') { }
                column(VATBaseLCY_VATAmountLine; "VAT Base")
                {
                    AutoFormatType = 1;
                    AutoFormatExpression = Header."Currency Code";
                }
                column(VATBaseLCY_VATAmountLine_Lbl; 'Base IVA LCY') { }
                column(VATIdentifier_VatAmountLine; "VAT Identifier") { }
                column(VATIdentifier_VatAmountLine_Lbl; 'Id. IVA') { }
                column(VATPct_VatAmountLine_Lbl; '% IVA') { }
                column(ECPct_VatAmountLine; 0) { }
                column(ECPct_VatAmountLine_Lbl; '') { }
                column(NoOfVATIdentifiers; NoOfVATIdent) { }
                // Numeric columns
                column(VATBase_VatAmountLine; "VAT Base")
                {
                    AutoFormatType = 1;
                    AutoFormatExpression = Header."Currency Code";
                }
                column(VATPct_VatAmountLine; "VAT %") { }
                column(VATAmount_VatAmountLine; "VAT Amount")
                {
                    AutoFormatType = 1;
                    AutoFormatExpression = Header."Currency Code";
                }
                column(LineAmount_VatAmountLine; "Line Amount")
                {
                    AutoFormatType = 1;
                    AutoFormatExpression = Header."Currency Code";
                }
                column(InvoiceDiscountAmount_VATAmountLine; "Invoice Discount Amount")
                {
                    AutoFormatType = 1;
                    AutoFormatExpression = Header."Currency Code";
                }
                column(InvoiceDiscountBaseAmount_VATAmountLine; "Line Amount")
                {
                    AutoFormatType = 1;
                    AutoFormatExpression = Header."Currency Code";
                }

                trigger OnPreDataItem()
                begin
                    TmpVATAmtLine.Reset();
                    if TmpVATAmtLine.FindSet() then
                        repeat
                            VATAmountLine := TmpVATAmtLine;
                            VATAmountLine.Insert();
                        until TmpVATAmtLine.Next() = 0;
                end;
            }

            // =============================================
            // CLÁUSULAS IVA
            // =============================================
            dataitem(VATClauseLine; "VAT Clause")
            {
                DataItemLinkReference = Header;
                UseTemporary = true;

                column(VATClausesHeader; 'Cláusulas IVA') { }
                column(VATIdentifier_VATClauseLine; VATClauseVATIdentifier) { }
                column(Code_VATClauseLine; Code) { }
                column(Code_VATClauseLine_Lbl; 'Cód. Cláusula') { }
                column(Description_VATClauseLine; Description) { }
                column(Description2_VATClauseLine; "Description 2") { }
                column(VATAmount_VATClauseLine; VATClauseAmt)
                {
                    AutoFormatType = 1;
                    AutoFormatExpression = Header."Currency Code";
                }
                column(NoOfVATClauses; NoOfVATClausesInt) { }

                trigger OnPreDataItem()
                var
                    VATClause: Record "VAT Clause";
                    SalesInvLine: Record "Sales Invoice Line";
                    VATPostingSetup: Record "VAT Posting Setup";
                begin
                    SalesInvLine.SetRange("Document No.", Header."No.");
                    if SalesInvLine.FindSet() then
                        repeat
                            if VATPostingSetup.Get(SalesInvLine."VAT Bus. Posting Group", SalesInvLine."VAT Prod. Posting Group") then
                                if VATPostingSetup."VAT Clause Code" <> '' then
                                    if VATClause.Get(VATPostingSetup."VAT Clause Code") then begin
                                        VATClauseLine := VATClause;
                                        if VATClauseLine.Insert() then;
                                    end;
                        until SalesInvLine.Next() = 0;
                    NoOfVATClausesInt := Count();
                end;

                trigger OnAfterGetRecord()
                var
                    SalesInvLine: Record "Sales Invoice Line";
                    VATPostingSetup: Record "VAT Posting Setup";
                begin
                    VATClauseAmt := 0;
                    VATClauseVATIdentifier := '';
                    SalesInvLine.SetRange("Document No.", Header."No.");
                    if SalesInvLine.FindSet() then
                        repeat
                            if VATPostingSetup.Get(SalesInvLine."VAT Bus. Posting Group", SalesInvLine."VAT Prod. Posting Group") then
                                if VATPostingSetup."VAT Clause Code" = Code then begin
                                    VATClauseAmt += SalesInvLine."Amount Including VAT" - SalesInvLine.Amount;
                                    VATClauseVATIdentifier := SalesInvLine."VAT Identifier";
                                end;
                        until SalesInvLine.Next() = 0;
                end;
            }

            // =============================================
            // TOTALES REPORT (stub)
            // =============================================
            dataitem(ReportTotalsLine; Integer)
            {
                DataItemTableView = WHERE(Number = CONST(0));

                column(Description_ReportTotalsLine; '') { }
                column(Amount_ReportTotalsLine; 0) { }
                column(AmountFormatted_ReportTotalsLine; '') { }
                column(FontBold_ReportTotalsLine; false) { }
                column(FontUnderline_ReportTotalsLine; false) { }
            }

            // =============================================
            // LINEFEE / LETTER / PAYMENT (stubs)
            // =============================================
            dataitem(LineFee; Integer)
            {
                DataItemTableView = WHERE(Number = CONST(0));
            }

            dataitem(PaymentReportingArgument; Integer)
            {
                DataItemTableView = WHERE(Number = CONST(0));
            }

            dataitem(LetterText; Integer)
            {
                DataItemTableView = WHERE(Number = CONST(0));
            }

            dataitem(LeftHeader; Integer)
            {
                DataItemTableView = WHERE(Number = CONST(0));
            }

            dataitem(RightHeader; Integer)
            {
                DataItemTableView = WHERE(Number = CONST(0));
            }

            dataitem(Totals; Integer)
            {
                DataItemTableView = WHERE(Number = CONST(0));

                column(TotalNetAmount; TotalNetAmtTxt) { }
                column(TotalVATBaseLCY; TotalVATBaseAmt)
                {
                    AutoFormatType = 1;
                    AutoFormatExpression = Header."Currency Code";
                }
                column(TotalAmountIncludingVAT; TotalAmtInclVATTxt) { }
                column(TotalVATAmount; TotalVATAmtTxt) { }
                column(TotalVatMinusECAmount; TotalVATAmt)
                {
                    AutoFormatType = 1;
                    AutoFormatExpression = Header."Currency Code";
                }
                column(TotalECAmount; 0) { }
                column(TotalECAmountLCY; 0) { }
                column(TotalVATAmountLCY; TotalVATAmt)
                {
                    AutoFormatType = 1;
                    AutoFormatExpression = Header."Currency Code";
                }
                column(TotalInvoiceDiscountAmount; TotalInvDiscAmtTxt) { }
                column(TotalPaymentDiscountOnVAT; 0) { }
                column(TotalVATAmountText; TotalVATAmtTxt) { }
                column(TotalExcludingVATText; TotalExclVATTxt) { }
                column(TotalIncludingVATText; TotalInclVATTxt) { }
                column(TotalSubTotal; TotalSubTotalTxt) { }
                column(TotalSubTotalMinusInvoiceDiscount; TotalSubTotalMinusInvDiscTxt) { }
                column(TotalText; TotalTextTxt) { }
                column(TotalAmountExclInclVAT; TotalAmtExclInclVATTxt) { }
                column(TotalAmountExclInclVATText; '') { }
                column(TotalVATBaseOnVATAmtLine; TotalVATBaseAmt)
                {
                    AutoFormatType = 1;
                    AutoFormatExpression = Header."Currency Code";
                }
                column(TotalVATAmountOnVATAmtLine; TotalVATAmt)
                {
                    AutoFormatType = 1;
                    AutoFormatExpression = Header."Currency Code";
                }
            }

            trigger OnPreDataItem()
            begin
                CompanyInfo.Get();
                NewLineTxt[1] := 10;
                CompanyInfo.CalcFields(Picture, Picture2, Picture3, Picture4, Picture5);

                CompanyAddr[1] := CompanyInfo.Name;
                if CompanyInfo."Address 2" <> '' then
                    CompanyAddr[2] := CompanyInfo.Address + ', ' + CompanyInfo."Address 2"
                else
                    CompanyAddr[2] := CompanyInfo.Address;
                CompanyAddr[3] := CompanyInfo."Post Code" + ' ' + CompanyInfo.City;
                CompanyAddr[4] := GetCountryName(CompanyInfo."Country/Region Code");
                CompanyAddr[5] := CompanyInfo."Phone No.";
                CompanyAddr[6] := 'CIF/NIF: ' + CompanyInfo."VAT Registration No.";
                if CompanyInfo."EORI Number" <> '' then
                    CompanyAddr[7] := 'EORI: ' + CompanyInfo."EORI Number"
                else
                    CompanyAddr[7] := '';
                CompanyAddr[8] := '';

                if not CompanyBankAcc.FindFirst() then
                    CompanyBankAcc.Init();

                CompanyBankAccountNoTxt := CompanyBankAcc.IBAN;
                if CompanyBankAcc."SWIFT Code" <> '' then
                    CompanyBankAccountNoTxt += ' - ' + CompanyBankAcc."SWIFT Code";

                GLSetup.Get();

                CompanyLegalStatementTxt := '';
                LegalLblTxt :=
                    'Global Food link se compromete a atender los requisitos que el cliente nos comunique, pero es el cliente el responsable del chequeo de los requisitos:' + NewLineTxt +
                    '- Información de la etiqueta.' + NewLineTxt +
                    '- Cumplimiento legal de los requisitos legales del país de destino: requisitos de exportación, requerimientos de composición (lista de ingredientes, alérgenos) o legislación específica de seguridad del producto.' + NewLineTxt +
                    '- Cumplimiento con los requisitos de control de pesos.';
            end;

            trigger OnAfterGetRecord()
            var
                PaymentTerms: Record "Payment Terms";
                PaymentMethod: Record "Payment Method";
                ShipmentMethod: Record "Shipment Method";
                SalespersonPurchaser: Record "Salesperson/Purchaser";
                Currency: Record "Currency";
                SellToContact: Record "Contact";
                BillToContact: Record "Contact";
                SalesInvLine: Record "Sales Invoice Line";
            begin
                // Reset
                TotalLineAmt := 0;
                TotalInvDiscAmt := 0;
                TotalNetAmt := 0;
                TotalAmtInclVAT := 0;
                TotalVATAmt := 0;
                TotalVATBaseAmt := 0;

                // Addresses
                CustAddr[1] := "Bill-to Name";
                CustAddr[2] := "Bill-to Address";
                if "Bill-to County" <> '' then
                    CustAddr[3] := "Bill-to County" + ' ' + "Bill-to Post Code" + ' ' + "Bill-to City"
                else
                    CustAddr[3] := "Bill-to Post Code" + ' ' + "Bill-to City";
                CustAddr[4] := GetCountryName("Bill-to Country/Region Code");
                CustAddr[5] := 'CIF/NIF: ' + "VAT Registration No.";
                CustAddr[6] := '';
                CustAddr[7] := '';
                CustAddr[8] := '';

                ShipToAddr[1] := "Ship-to Name";
                ShipToAddr[2] := "Ship-to Name 2";
                ShipToAddr[3] := "Ship-to Address";
                ShipToAddr[4] := "Ship-to Address 2";
                ShipToAddr[5] := "Ship-to Post Code" + ' ' + "Ship-to City";
                ShipToAddr[6] := GetCountryName("Ship-to Country/Region Code");
                ShipToAddr[7] := '';
                ShipToAddr[8] := '';
                ShowShipAddr := "Ship-to Code" <> '';

                // Salesperson
                SalesPersonNameTxt := '';
                if "Salesperson Code" <> '' then
                    if SalespersonPurchaser.Get("Salesperson Code") then
                        SalesPersonNameTxt := SalespersonPurchaser.Name;

                // Payment Terms + GFL P.P.
                PaymentTermsDesc := '';
                GFL_PmtDiscPctVal := 0;
                if "Payment Terms Code" <> '' then
                    if PaymentTerms.Get("Payment Terms Code") then begin
                        PaymentTermsDesc := PaymentTerms.Description;
                        GFL_PmtDiscPctVal := PaymentTerms."Discount %";
                    end;

                PTArr[1] := '';
                PTArr[2] := '';
                PTArr[3] := '';

                // Payment Method
                PaymentMethodDesc := '';
                if "Payment Method Code" <> '' then
                    if PaymentMethod.Get("Payment Method Code") then
                        PaymentMethodDesc := PaymentMethod.Description;

                // Shipment Method
                ShipmentMethodDesc := '';
                if "Shipment Method Code" <> '' then
                    if ShipmentMethod.Get("Shipment Method Code") then
                        ShipmentMethodDesc := ShipmentMethod.Description;

                // Currency
                CurrCode := "Currency Code";
                CurrSymbol := '';
                if CurrCode = '' then begin
                    CurrCode := GLSetup."LCY Code";
                    CurrSymbol := GLSetup."Local Currency Symbol";
                end else
                    if Currency.Get(CurrCode) then
                        CurrSymbol := Currency.Symbol;

                // Exchange rate
                if "Currency Factor" <> 0 then
                    ExchangeRateText := StrSubstNo('%1 %2 / 1 %3',
                        Format(1 / "Currency Factor", 0, '<Precision,4:4><Standard Format,0>'),
                        CurrCode, GLSetup."LCY Code")
                else
                    ExchangeRateText := '';

                if "Prices Including VAT" then
                    PricesIncVATYesNoTxt := 'Sí'
                else
                    PricesIncVATYesNoTxt := 'No';

                // Contacts
                SellToContactPhone := '';
                SellToContactMobilePhone := '';
                SellToContactEmailTxt := '';
                BillToContactPhone := '';
                BillToContactMobilePhone := '';
                BillToContactEmailTxt := '';
                if "Sell-to Contact No." <> '' then
                    if SellToContact.Get("Sell-to Contact No.") then begin
                        SellToContactPhone := SellToContact."Phone No.";
                        SellToContactMobilePhone := SellToContact."Mobile Phone No.";
                        SellToContactEmailTxt := SellToContact."E-Mail";
                    end;
                if "Bill-to Contact No." <> '' then
                    if BillToContact.Get("Bill-to Contact No.") then begin
                        BillToContactPhone := BillToContact."Phone No.";
                        BillToContactMobilePhone := BillToContact."Mobile Phone No.";
                        BillToContactEmailTxt := BillToContact."E-Mail";
                    end;

                // Totals loop
                TmpVATAmtLine.DeleteAll();
                SalesInvLine.SetRange("Document No.", "No.");
                if SalesInvLine.FindSet() then
                    repeat
                        TotalLineAmt += SalesInvLine."Line Amount";
                        TotalInvDiscAmt += SalesInvLine."Inv. Discount Amount";
                        TotalNetAmt += SalesInvLine.Amount;
                        TotalAmtInclVAT += SalesInvLine."Amount Including VAT";
                        TotalVATAmt += SalesInvLine."Amount Including VAT" - SalesInvLine.Amount;
                        TotalVATBaseAmt += SalesInvLine.Amount;

                        if SalesInvLine."VAT Identifier" <> '' then begin
                            TmpVATAmtLine.Init();
                            TmpVATAmtLine."VAT Identifier" := SalesInvLine."VAT Identifier";
                            TmpVATAmtLine."VAT %" := SalesInvLine."VAT %";
                            if TmpVATAmtLine.Find() then begin
                                TmpVATAmtLine."VAT Base" += SalesInvLine.Amount;
                                TmpVATAmtLine."VAT Amount" += SalesInvLine."Amount Including VAT" - SalesInvLine.Amount;
                                TmpVATAmtLine."Line Amount" += SalesInvLine."Line Amount";
                                TmpVATAmtLine."Invoice Discount Amount" += SalesInvLine."Inv. Discount Amount";
                                TmpVATAmtLine.Modify();
                            end else begin
                                TmpVATAmtLine."VAT Base" := SalesInvLine.Amount;
                                TmpVATAmtLine."VAT Amount" := SalesInvLine."Amount Including VAT" - SalesInvLine.Amount;
                                TmpVATAmtLine."Line Amount" := SalesInvLine."Line Amount";
                                TmpVATAmtLine."Invoice Discount Amount" := SalesInvLine."Inv. Discount Amount";
                                TmpVATAmtLine.Insert();
                            end;
                        end;
                    until SalesInvLine.Next() = 0;

                TmpVATAmtLine.Reset();
                NoOfVATIdent := 0;
                if TmpVATAmtLine.FindSet() then
                    repeat
                        NoOfVATIdent += 1;
                    until TmpVATAmtLine.Next() = 0;

                // GFL P.P. calculations
                GFL_SubtotalAfterInvDiscVal := TotalLineAmt - TotalInvDiscAmt;
                GFL_PmtDiscAmountVal := Round(GFL_SubtotalAfterInvDiscVal * GFL_PmtDiscPctVal / 100, 0.01);
                GFL_TotalExclVATRecalcVal := GFL_SubtotalAfterInvDiscVal - GFL_PmtDiscAmountVal;
                GFL_TotalInclVATRecalcVal := GFL_TotalExclVATRecalcVal + TotalVATAmt;
                GFL_HasPmtDiscVal := GFL_PmtDiscPctVal > 0;
                if GFL_HasPmtDiscVal then
                    GFL_PmtDiscWarningMsgTxt := 'Si la factura no es pagada en el periodo de pronto pago acordado se refacturará el descuento por pronto pago aplicado.'
                else
                    GFL_PmtDiscWarningMsgTxt := '';


                GFL_SubtotalAfterInvDiscFmtTxt := Format(GFL_SubtotalAfterInvDiscVal, 0, '<Precision,2:2><Integer Thousand><Decimals>');
                GFL_PmtDiscAmountFmtTxt := Format(GFL_PmtDiscAmountVal, 0, '<Precision,2:2><Integer Thousand><Decimals>');
                GFL_TotalExclVATRecalcFmtTxt := Format(GFL_TotalExclVATRecalcVal, 0, '<Precision,2:2><Integer Thousand><Decimals>');
                GFL_TotalInclVATRecalcFmtTxt := Format(GFL_TotalInclVATRecalcVal, 0, '<Precision,2:2><Integer Thousand><Decimals>');

                // Total formatted texts
                TotalSubTotalTxt := Format(TotalLineAmt, 0, '<Precision,2:2><Sign><Integer Thousand><Decimals>');
                TotalInvDiscAmtTxt := Format(-TotalInvDiscAmt, 0, '<Precision,2:2><Sign><Integer Thousand><Decimals>');
                TotalNetAmtTxt := Format(TotalNetAmt, 0, '<Precision,2:2><Sign><Integer Thousand><Decimals>');
                TotalAmtInclVATTxt := Format(TotalAmtInclVAT, 0, '<Precision,2:2><Sign><Integer Thousand><Decimals>');
                TotalVATAmtTxt := Format(TotalVATAmt, 0, '<Precision,2:2><Sign><Integer Thousand><Decimals>');
                TotalSubTotalMinusInvDiscTxt := Format(TotalLineAmt - TotalInvDiscAmt, 0, '<Precision,2:2><Sign><Integer Thousand><Decimals>');
                TotalExclVATTxt := 'Total € IVA excl.';
                TotalInclVATTxt := 'Total € IVA incl.';
                TotalAmtExclInclVATTxt := Format(TotalAmtInclVAT, 0, '<Precision,2:2><Sign><Integer Thousand><Decimals>');
                TotalTextTxt := 'Total ' + CurrCode;

                // LHeader dynamic rows - order matters: [1],[2] before PT1, [5] before Banco fixed, [3],[4] after Banco
                LHeaderLblArr[1] := 'Nº Factura';
                LHeaderValArr[1] := "No.";
                LHeaderLblArr[2] := 'Fecha';
                LHeaderValArr[2] := Format("Document Date");
                LHeaderLblArr[3] := 'Nº Cliente';
                LHeaderValArr[3] := "Bill-to Customer No.";
                LHeaderLblArr[4] := 'Nº Pedido Cliente';
                LHeaderValArr[4] := "External Document No.";
                LHeaderLblArr[5] := 'Términos Pago';
                LHeaderValArr[5] := CopyStr(PaymentTermsDesc, 1, 100);

                // Update PTArr[1] now that TotalAmtInclVAT is computed
                PTArr[1] := Format("Due Date") + ': ' + Format(TotalAmtInclVAT, 0, '<Precision,2:2><Integer Thousand><Decimals>') + ' €';
            end;
        }
    }

    rendering
    {
        layout(GFLSalesInvoicePP)
        {
            Type = RDLC;
            LayoutFile = 'src/GFLSalesInvoicePP.rdlc';
            Caption = 'GFL Factura Venta PP';
        }
    }

    var
        CompanyInfo: Record "Company Information";
        CompanyBankAcc: Record "Bank Account";
        GLSetup: Record "General Ledger Setup";
        TmpVATAmtLine: Record "VAT Amount Line" temporary;
        CompanyAddr: array[8] of Text[100];
        CustAddr: array[8] of Text[100];
        ShipToAddr: array[8] of Text[100];
        LHeaderLblArr: array[5] of Text[100];
        LHeaderValArr: array[5] of Text[100];
        PTArr: array[3] of Text[100];
        CompanyBankAccountNoTxt: Text[100];
        CompanyLegalStatementTxt: Text;
        LegalLblTxt: Text;
        NewLineTxt: Text[1];
        ShowShipAddr: Boolean;
        SellToContactPhone: Text[30];
        SellToContactMobilePhone: Text[30];
        SellToContactEmailTxt: Text[80];
        BillToContactPhone: Text[30];
        BillToContactMobilePhone: Text[30];
        BillToContactEmailTxt: Text[80];
        PaymentTermsDesc: Text[100];
        PaymentMethodDesc: Text[100];
        ShipmentMethodDesc: Text[100];
        SalesPersonNameTxt: Text[100];
        PricesIncVATYesNoTxt: Text[10];
        ExchangeRateText: Text;
        CurrCode: Code[10];
        CurrSymbol: Text[10];
        // Totals
        TotalLineAmt: Decimal;
        TotalInvDiscAmt: Decimal;
        TotalNetAmt: Decimal;
        TotalAmtInclVAT: Decimal;
        TotalVATAmt: Decimal;
        TotalVATBaseAmt: Decimal;
        NoOfVATIdent: Integer;
        // Total texts (pre-formatted)
        TotalSubTotalTxt: Text;
        TotalInvDiscAmtTxt: Text;
        TotalNetAmtTxt: Text;
        TotalAmtInclVATTxt: Text;
        TotalVATAmtTxt: Text;
        TotalSubTotalMinusInvDiscTxt: Text;
        TotalExclVATTxt: Text;
        TotalInclVATTxt: Text;
        TotalAmtExclInclVATTxt: Text;
        TotalTextTxt: Text;
        // VAT Clauses
        VATClauseVATIdentifier: Code[20];
        VATClauseAmt: Decimal;
        NoOfVATClausesInt: Integer;
        // Line
        LineDiscPctText: Text;
        JobTaskDesc: Text[100];
        // GFL P.P.
        GFL_SubtotalAfterInvDiscVal: Decimal;
        GFL_PmtDiscAmountVal: Decimal;
        GFL_PmtDiscPctVal: Decimal;
        GFL_TotalExclVATRecalcVal: Decimal;
        GFL_TotalInclVATRecalcVal: Decimal;
        GFL_PmtDiscWarningMsgTxt: Text;
        GFL_HasPmtDiscVal: Boolean;
        GFL_SubtotalAfterInvDiscFmtTxt: Text;
        GFL_PmtDiscAmountFmtTxt: Text;
        GFL_TotalExclVATRecalcFmtTxt: Text;
        GFL_TotalInclVATRecalcFmtTxt: Text;

    local procedure GetCountryName(CountryCode: Code[10]): Text
    var
        Country: Record "Country/Region";
    begin
        if CountryCode = '' then exit('');
        if Country.Get(CountryCode) then
            exit(Country.Name);
        exit(CountryCode);
    end;
}
