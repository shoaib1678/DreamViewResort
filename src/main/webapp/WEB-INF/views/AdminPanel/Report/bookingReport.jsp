<%@page import="com.shoaib.modal.ManualBooking"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.ZoneId"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="hi">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Booking Register</title>

  <!-- Bootstrap CDN (optional) -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
    .report {
      max-width: 100%;
    padding: 18px 30px;
    background: white;
    font-size: 13px;
    color: #111;
    }

    /* Header title */
    .report .title {
      text-align: center;
      font-weight: 700;
      font-size: 18px;
      margin-bottom: 4px;
    }
    .report .subtitle {
      text-align: center;
      font-size: 14px;
      margin-bottom: 10px;
      font-weight: 700
    }

    /* Top info row */
    .meta {
      display:flex;
      justify-content:space-between;
      align-items:center;
      gap:8px;
      margin-bottom:8px;
      font-size:13px;
    }
    .company-code { font-weight:600; }

    /* Table styles */
    table.purchase {
      width: 100%;
      border-collapse: collapse;
     /*  table-layout: fixed; */
      margin-top: 6px;
      margin-bottom: 10px;
    }
    table.purchase thead th {
      font-size: 12px;
      font-weight: 700;
      padding: 1px 2px;
     /*  text-align: center; */
      border-bottom: none;
    }
    table.purchase tbody tr {
      border-bottom: 1px dotted #8b8b8b;
    }
    table.purchase tbody tr td {
      padding: 1px 4px;
      vertical-align: middle;
      font-size: 12px;
      color: #111;
      /* text-align: center; */
    }

    /* larger numeric columns align right */
    .text-right { text-align: right; }

    /* Totals style */
    .total-row td { font-weight:700; border-top: px solid #222 !important; border-bottom: px solid #222 !; padding-top:10px; padding-bottom:10px; }

    /* Make the dotted row separators extend full width (no left/right visible border) */
    table.purchase tr::after {
      content: "";
      display:block;
      margin-top:-1px;
    }

    /* smaller muted text used for dates/notes */
    .muted { color:#555; font-size:12px; }

    /* for very long tables look consistent on small screens */
    @media (max-width: 800px) {
      .report { padding:12px; font-size:12px; }
      table.purchase thead { display:none; }
      table.purchase tbody td { display:block; width:100%; box-sizing:border-box; padding:6px 0; }
      table.purchase tbody td:before { content: attr(data-label); font-weight:700; display:inline-block; width:42%; }
      .text-right { text-align:left; }
    }
     @media print {
    body { margin:0; }
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
<%
List<ManualBooking> data = (List<ManualBooking>)request.getAttribute("data");
String from_date = (String) request.getAttribute("from_date");
String to_date   = (String) request.getAttribute("to_date");
DateTimeFormatter inputFmt = DateTimeFormatter.ofPattern("yyyy-MM-dd");
DateTimeFormatter outputFmt = DateTimeFormatter.ofPattern("dd-MM-yyyy");
LocalDate fromDate = LocalDate.parse(from_date, inputFmt);
LocalDate toDate   = LocalDate.parse(to_date, inputFmt);
String formattedFromDate = fromDate.format(outputFmt);
String formattedToDate   = toDate.format(outputFmt);
List<String> months = (List<String>)request.getAttribute("months");

%>
<body>
<div id="buttons">
  <button class="btn btn-sm" onclick="window.print()"><i class="fa fa-print" aria-hidden="true"></i></button>
  <button class="btn btn-sm" onclick="exportPurchaseRegister()"><i class="fa fa-file-excel-o" aria-hidden="true"></i></button>
</div>
  <div class="report">
    <div class="title">DREAM VIEW HERITAGE RESORT, MADHAI</div>
    <div class="subtitle">BOOKING - REGISTER</div>
 <%
		for(int i=0; i < months.size(); i++){
			int count= 1;
		%>
<div class="meta">
		 <div><span class="company-code" style="font-size: 16px;"><%=months.get(i) %></span> </div>
		 <%if(i==0){ %>
      <div class="muted">From <strong><%=formattedFromDate %></strong> To <strong><%=formattedToDate %></strong></div>
      <%} %>
       </div>
    <table class="purchase">
      <thead style="border-bottom: 1px solid; border-top: 1px solid;">
        <tr>
          <th class="text-center">S.No.</th>
          <th class="text-center">Customer Name <br>City<br> Mobile Number</th>
          <th class="text-center">Room Name </th>
          <th class="text-center">Check-in Date<br> Check-out Date</th>
          <th class="text-right">Night<br>Room Nos<br>E-Bed</th>
          <th class="text-right">Rent/Night <br> E-Bed Charge/Night<br>Guest</th>
          <th class="text-right">Total Room Charge <br> Total E-Bed Charge <br> Taxable Amount</th>
          <th class="text-right">GST(%)<br>GST Amount<br>Total Amount</th>
          <th class="text-right">Plan Name</th>
          <th class="text-right">Plan Price<br>Final Price</th>
          <th class="text-right">Net Amount<br>Paid Amount<br>Balance Amount</th>
        </tr>
      </thead>
      <tbody>
       <% 
		float trc=0;
        float tbc=0;
        float ta=0;
		float rga=0;
        float rta=0;
        float ptga=0;
        float pfp=0;
        float net=0;
        float adv=0;
        float bal=0;
		for(ManualBooking p : data){
			float tpgst= p.getTotal_price() * p.getBed_gst() /100;
			float tgst= p.getTaxable_amount() * p.getRoom_gst() /100;
			Date idate = p.getBooking_date();
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
			String formattedDate = sdf.format(idate);
			float ppaid =0;
			float pbal =0;
			Date createdAt = p.getBooking_date(); // could be java.util.Date OR java.sql.Date
			LocalDate createdLocal;
			if (createdAt instanceof java.sql.Date) {
			    createdLocal = ((java.sql.Date) createdAt).toLocalDate(); // ✅ direct conversion
			} else {
			    createdLocal = createdAt.toInstant()
			                            .atZone(ZoneId.systemDefault())
			                            .toLocalDate();
			}
			DateTimeFormatter monthYearFormat = DateTimeFormatter.ofPattern("MMMM yyyy");
			String createdMonthYear = createdLocal.format(monthYearFormat).toUpperCase();
			if(months.get(i).equalsIgnoreCase(createdMonthYear)){
				
				trc += p.getTotal_room_charge();
				tbc += p.getTotal_bed_charge();
				ta += p.getTaxable_amount();
				rga += tgst;
				rta += p.getTotal_amount();
				ptga += tpgst;
				pfp += p.getTotal_price();
				net += p.getNet_amount();
				adv += p.getAdvance_amount();
				bal += p.getBalance_amount();
				String[] rm = p.getRoom_title().split("@@@");
				String room = "";
				for(int r=0; r< rm.length; r++){
					if(r== 0){
						room = rm[r];
					}else{
						room += "<br>"+rm[r];
					}
				}
	           
		%>
		
        <!-- sample rows (content based on image) -->
        <tr>
          <td class="text-center" data-label="Sl. No."><%=count %></td>
         <td class="text-center"><%=p.getName() %><br><%=p.getCity() %><br><span><%=p.getMobile_number() %></span></td>
          <td class="text-center"><%=room %></td>
          <td class="text-center"><%=p.getBooking_date() %><br><%=p.getCheck_date() %></td>
          <td class="text-right" ><%=p.getNight() %><br><%=p.getRoom_number() %><br><%=p.getExtrabed() %></td>
          <td class="text-right" ><%=p.getRoom_charge() %><br><%=p.getBed_charge() %><br><%=p.getAdult()+" Adult "+p.getChild()+" child" %></td>
          <td class="text-right" ><%=p.getTotal_room_charge() %><br><%=p.getTotal_bed_charge() %><br><%=p.getTaxable_amount() %></td>
          <td class="text-right" ><%=p.getRoom_gst() %><br><%=tgst%><br><%=p.getTotal_amount() %></td>
          <td class="text-right" ><%=p.getPlan_name()%></td>
          <td class="text-right" ><%=p.getFinal_price() %><br><%=p.getTotal_price() %></td>
          <td class="text-right"><%=p.getNet_amount() %><br><%=p.getAdvance_amount() %><br><%=p.getBalance_amount() %></td>
        </tr>
  <% count++;}} %>
        <!-- Totals row similar to scanned image -->
        <tr class="total-row" style="border-bottom: 1px solid; border-top: 1px solid;">
          <td colspan="6" data-label="TOTAL" style="text-align: center;">TOTAL</td>
          <td class="text-right" data-label="Qty."><%=String.format("%.2f", trc)%><br><%=String.format("%.2f", tbc)%><br><%=String.format("%.2f", ta)%></td>
          <td class="text-right" data-label="Value of Goods"><%=String.format("%.2f", rga)%><br><%=String.format("%.2f", rta)%></td>
          <td class="text-right" data-label="CGST Amount">-</td>
          <td class="text-right" data-label="SGST Amount">-</td>
         <%--  <td class="text-right" data-label="IGST Amount"><%=String.format("%.2f", ptga)%><br><%=String.format("%.2f", pfp)%></td> --%>
          <td class="text-right" data-label="IGST Amount"><%=String.format("%.2f", net)%><br><%=String.format("%.2f", adv)%><br><%=String.format("%.2f", bal)%></td>
        </tr>
      </tbody>
    </table>
     <%} %>
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
	 mapForm.action = "export_booking_register";
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
</script>
</body>
</html>
