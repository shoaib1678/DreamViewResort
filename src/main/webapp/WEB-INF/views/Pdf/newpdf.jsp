<%@ page import="com.lowagie.text.*" %>
<%@ page import="com.lowagie.text.pdf.*" %>
<%@ page import="java.io.*" %>
<%
    // Set PDF response headers
    response.setContentType("application/pdf");
    response.setHeader("Content-Disposition", "attachment; filename=invoice.pdf");

    // Create document
    Document document = new Document();
    PdfWriter.getInstance(document, response.getOutputStream());
    document.open();

    Font bold = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12);

    document.add(new Paragraph("Purchase Invoice - Himalaya Traders, Bhopal", bold));
    document.add(new Paragraph("Invoice No.: 1219"));
    document.add(new Paragraph("Date: 27-September-2024"));
    document.add(new Paragraph(" "));

    // Create table
    PdfPTable table = new PdfPTable(13);
    table.setWidthPercentage(100);
    String[] headers = {"S.No", "Item", "Code", "HSN", "Qty", "CP", "SP", "Taxable", "GST%", "CGST", "SGST", "IGST", "Net Amt"};

    for (String h : headers) {
        PdfPCell cell = new PdfPCell(new Phrase(h, bold));
        table.addCell(cell);
    }

    // Sample data rows
    String[][] rows = {
        {"1", "SEED", "Q1010101", "40169200", "1", "128.4", "130", "128.4", "5", "3.21", "3.21", "0", "134.82"},
        {"2", "ERASER SMALL", "SR03010101", "4820", "1", "34556.07", "40000", "34556.07", "18", "3110.05", "3110.05", "0", "40776.17"},
        {"3", "REGISTER", "SSP3010101", "82141010", "1", "950.88", "1000", "950.88", "12", "57.05", "57.05", "0", "1064.98"}
    };

    for (String[] row : rows) {
        for (String col : row) {
            table.addCell(col);
        }
    }

    document.add(table);
    document.close();
%>
