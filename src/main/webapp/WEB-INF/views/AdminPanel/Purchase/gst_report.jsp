<%@page import="com.shoaib.modal.GroceryItems"%>
<%@page import="com.shoaib.modal.GroceryDetails"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.ZoneId"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="hi">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>GST Output Report</title>
<style>
  @page { size: A4; margin: 15mm; }
  body { font-family: "Arial", sans-serif; color:#000; font-size:12px; margin:0; background:#fff; }
  .sheet { max-width: 100%; margin:18px auto; padding:14px; box-sizing: border-box; }
  .header { text-align: center; margin-bottom:50px; }
  .header .name { font-weight:700; font-size:16px; letter-spacing:0.6px; }
  .header .title { font-weight:600; font-size:13px; margin-top:2px; }
  .header .range { font-size:11px; margin-top:6px; }
  .page-info { text-align: right; font-size:11px; margin-top:-38px; }
  table { width:100%; border-collapse: collapse; table-layout: fixed; font-size:12px; }
  thead th { border: 1px solid #000; padding:6px 6px; background: #fff; font-weight:700; text-align:left; }
  tbody td { border-left: none; border-right: none; padding-top:6px; vertical-align: middle; }
  tbody tr + tr td { border-top: 1px dotted #444; }
  table > thead > tr > th { border-left:none; border-right:none; width: max-content !important;}
 /*  table > tbody > tr:first-child td { border-top:1px solid #000; }
  table > tbody > tr:last-child td { border-bottom:1px solid #000; } */
  .small { font-size:11px; color:#111; }
  .month-row td { border:none !important; font-weight:700; padding-top:10px; padding-bottom:6px; text-align:left; }
  .totals td { font-weight:700; border-top:none;padding-top: 0;padding-bottom: 6px; border-bottom:1px dotted #444; !important; vertical-align: middle; word-wrap: break-word;}
 .ta-r{
 text-align: right;
 }
 .text-center{
 text-align: center;
 }
  @media print {
     @page {
        size: legal landscape;
        margin: minimum; 
    }
    body { margin:0;
     transform: scale(0.98, 0.85);
   }
    .sheet { margin:0; }
    .page-info { margin-top:-34px; }
    #buttons { display:none; }
  }
  #buttons { margin: 15px; }
  #buttons button {
    padding: 6px 12px;
    margin-right: 10px;
    background: #0073e6;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
  }
  #buttons button:hover { background: #005bb5; }
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
</head>
<%List<GroceryDetails> data = (List<GroceryDetails>)request.getAttribute("data");
String from_date = (String)request.getAttribute("from_date");
String to_date = (String)request.getAttribute("to_date");
DateTimeFormatter inputFmt = DateTimeFormatter.ofPattern("yyyy-MM-dd");
DateTimeFormatter outputFmt = DateTimeFormatter.ofPattern("dd-MM-yyyy");
LocalDate fromDate = LocalDate.parse(from_date, inputFmt);
LocalDate toDate   = LocalDate.parse(to_date, inputFmt);
String formattedFromDate = fromDate.format(outputFmt);
String formattedToDate   = toDate.format(outputFmt);
String company_code = (String)session.getAttribute("company_code");

%>
<body>
<div id="buttons">
  <button onclick="printInvoice()"><i class="fa fa-print" aria-hidden="true"></i></button>
  <button onclick="exportPurchaseRegister()"><i class="fa fa-file-excel-o" aria-hidden="true"></i></button>
</div>

  <div class="sheet" id="invoiceTableContent">
    <div class="sheet-outer">

      <div class="header">
      
    <div class="name">DREAMVIEW RESORT HERITAGE, MADHAI</div>
        <div class="title">Purchase - GST Output Report</div>
      </div>

      <div class="page-info small">
        From <span style="padding: 10px; font-weight: bold;"><%=formattedFromDate %></span> To <span style="padding: 10px;font-weight: bold;"><%=formattedToDate %></span>
      </div>
      <table id="purchaseTable">
        <thead>
          <tr>
            <th class="text-center">S.No</th>
            <th>Vendor_Details</th>
            <th colspan="2" class="text-center">SGTIN</th>
            <th style="text-align: right;">HSN.No</th>
            <th style="text-align: center;">Inv.No.</th>
            <th>Date</th>
            <th class="ta-r">Qty.</th>
            <th class="ta-r">Price</th>
            <th class="ta-r">Taxable Amt</th>
            <th class="ta-r">CGST%</th>
            <th class="ta-r">CGST Amt</th>
            <th class="ta-r">SGST%</th>
            <th class="ta-r">SGST Amt</th>
            <th class="ta-r">Cess%</th>
            <th class="ta-r">Cess Amt</th>
            <th class="ta-r">Net Amt</th>
          </tr>
        </thead>
		
        <tbody>
        <% 
        int tq=0;
	    float tcp=0;
	    float tta=0;
	    float tca=0;
	    float tsa=0;
	    float tia=0;
	    float tna=0;
		int count =1;
		for(GroceryDetails p : data){
			Date idate = p.getPo_date();
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
			String formattedDate = sdf.format(idate);
			for(int i=0; i < p.getGi().size(); i++){
				GroceryItems it = p.getGi().get(i);
				 tq += it.getQty();
		            tcp += it.getPrice();
		            tta += it.getTaxable_amt();
		            tca += it.getCgst_amt();
		            tsa += it.getSgst_amt();
		            tia += it.getCess_amt();
		            tna += it.getNet_amt();
		%>
          <tr>
            <td class="text-center"><%=count %></td>
            <td ><%=p.getVendor_code()%></td>
            <td colspan="2" class="text-center"><%=p.getGstin() %></td>
            <td style="text-align: right;"><%=p.getGi().get(i).getHsn_code() %></td>
             <td style="text-align: center;"><%=p.getPo_number() %></td>
             <td><%=formattedDate %></td>
            <td class="ta-r"><%=p.getGi().get(i).getQty() %></td>
            <td class="ta-r"><%=p.getGi().get(i).getPrice() %></td>
            <td class="ta-r"><%=p.getGi().get(i).getTaxable_amt() %></td>
            <td class="ta-r"><%=p.getGi().get(i).getCgst_per() %></td>
            <td class="ta-r"><%=p.getGi().get(i).getCgst_amt() %></td>
            <td class="ta-r"><%=p.getGi().get(i).getSgst_per() %></td>
            <td class="ta-r"><%=p.getGi().get(i).getSgst_amt() %></td>
            <td class="ta-r"><%=p.getGi().get(i).getCess_per() %></td>
            <td class="ta-r"><%=p.getGi().get(i).getCess_amt() %></td>
            <td class="ta-r"><%=p.getGi().get(i).getNet_amt() %></td>
            
          </tr>
           <tr class="totals">
            <td></td>
            <td colspan="4"><%=p.getVendor_name() %>, <%=p.getAddress() %></td>
            <td colspan="12"></td>
          </tr>
           <% count++;} }%> 
           <tr class="total-row" style="border-top: 1px solid;border-bottom: 1px solid; padding: 4px;">
          <td colspan="7" class="text-right" data-label="TOTAL" style="text-align: center;font-weight: 700;">TOTAL :</td>
          <td class="text-right" style="text-align: right;font-weight: 700;"><%=tq%></td>
          <td class="text-right" style="text-align: right;font-weight: 700;"><%=String.format("%.2f", tcp)%></td>
          <td class="text-right" style="text-align: right;font-weight: 700;"><%=String.format("%.2f", tta)%></td>
          <td class="text-right" style="text-align: right;font-weight: 700;">-</td>
          <td class="text-right" style="text-align: right;font-weight: 700;"><%=String.format("%.2f", tca)%></td>
          <td class="text-right" style="text-align: right;font-weight: 700;">-</td>
          <td class="text-right" style="text-align: right;font-weight: 700;"><%=String.format("%.2f", tsa)%></td>
          <td class="text-right" style="text-align: right;font-weight: 700;">-</td>
          <td class="text-right" style="text-align: right;font-weight: 700;"><%=String.format("%.2f", tia)%></td>
          <td class="text-right" style="text-align: right;font-weight: 700;"><%=String.format("%.2f", tna)%></td>
        </tr>
        </tbody>
       
      </table>
    </div>
  </div>
  <input type="hidden" id="from_date" name="from_date" value="<%=from_date%>">
  <input type="hidden" id="to_date" name="to_date" value="<%=to_date%>">
<script type="text/javascript">
function exportPurchaseRegister() {
	let from_date = document.getElementById("from_date").value;
    let to_date = document.getElementById("to_date").value;
	var mapForm = document.createElement("form");
	 mapForm.method = "POST";
	 mapForm.target = "_blank"; 
	 mapForm.action = "invoice_details";
      var output = document.createElement("input");
      output.type = "hidden";
      output.name = "from_date";
      output.value = from_date;
      mapForm.appendChild(output);
      var output1 = document.createElement("input");
      output1.type = "hidden";
      output1.name = "to_date";
      output1.value = to_date;
      mapForm.appendChild(output1);
      document.body.appendChild(mapForm);
      mapForm.submit();     
}
function printInvoice() {
    var content = document.getElementById("invoiceTableContent").innerHTML;

    // Open new window
    var printWindow = window.open("", "PrintWindow", "width=1000,height=800");
    printWindow.document.open();

    // Write content with styles
    printWindow.document.write("<html><head><title>Purchase Register</title>");
    printWindow.document.write("<style>");
    printWindow.document.write("@page { size: auto; margin: 15mm; }"); // allows Portrait/Landscape selection
    printWindow.document.write("body { font-family: Arial, sans-serif; font-size: 12px; }");
    // Copy existing CSS from main page if needed
    var styles = document.querySelectorAll('style, link[rel="stylesheet"]');
    styles.forEach(function(style) {
        printWindow.document.write(style.outerHTML);
    });
    printWindow.document.write("</style></head><body>");
    printWindow.document.write(content);
    printWindow.document.write("</body></html>");
    
    printWindow.document.close();

    // Give it a short delay to ensure rendering before printing
    printWindow.onload = function() {
        printWindow.focus();
        printWindow.print();
    };
}
</script>

</body>
</html>
