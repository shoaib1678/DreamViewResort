<!DOCTYPE html>
<%@page import="com.shoaib.modal.Vendor"%>
<%@page import="com.shoaib.modal.Items"%>
<%@page import="java.util.List"%>
<html lang="en"
	class="light-style layout-navbar-fixed layout-menu-fixed" dir="ltr"
	data-theme="theme-default" data-assets-path="assets/adminpanel/"
	data-template="vertical-menu-template-starter">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<meta name="description" content="" />
<jsp:include page="../css.jsp"></jsp:include>
<style type="text/css">
.modal-xxl {
	--bs-modal-width: 95vw !important;
}
#tbody tr td{
	padding: 0;
	text-align: center;
}
</style>

</head>
<%
List<Items> data = (List<Items>)request.getAttribute("data");
List<Vendor> data1 = (List<Vendor>)request.getAttribute("data1");
%>
<body>
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<!-- Menu -->
			<jsp:include page="../header.jsp"></jsp:include>
			<!-- / Menu -->
			<!-- Layout container -->
			<div class="layout-page">
				<!-- Navbar -->
				<jsp:include page="../nav.jsp"></jsp:include>
				<!-- / Navbar -->
				<!-- Content wrapper -->
				<div class="content-wrapper">
					<!-- Content -->
					<div class="container-xxl flex-grow-1 container-p-y">
						<!-- Tender List Table -->
						<div class="card ">
							<div class="row p-4">
								<div class="col-3">
									<button class="btn btn-secondary btn-sm  add-new btn-primary"
										id="clear_btn" data-bs-toggle="modal" type="button"
										data-bs-target="#amenity_modal">
										<span><i class="bx bx-plus me-0 me-sm-1"></i><span
											class="d-none d-sm-inline-block">Add New</span></span>
									</button>
									<button class="btn btn-secondary btn-sm  add-new btn-primary"
										id="clear_btn" data-bs-toggle="modal" type="button"
										data-bs-target="#report_modal">
										<span><i class="bx bx-file-report me-0 me-sm-1"></i><span
											class="d-none d-sm-inline-block">Report</span></span>
									</button>
									<button class="btn btn-secondary btn-sm  add-new btn-primary"
										id="clear_btn" data-bs-toggle="modal" type="button"
										data-bs-target="#stock_modal">
										<span><i class="bx bx-database me-0 me-sm-1"></i><span
											class="d-none d-sm-inline-block">Stock</span></span>
									</button>
								</div>
							</div>
							<div class="row p-4">
								<div class="col-12">
									<div class="card-datatable table-responsive">
										<table id="amenities_table" class="table nowrap"
											style="width: 100%">
											<thead class="bg-primary">
												<tr>
													<th class="text-white">S.NO.</th>
													<th class="text-white">Purchase For</th>
													<th class="text-white">Vendor Name</th>
													<th class="text-white">PO Number</th>
													<th class="text-white">PO Date</th>
													<th class="text-white">Taxable Amount</th>
													<th class="text-white">Total GST</th>
													<th class="text-white">Total Tax</th>
													<th class="text-white">Grand Total</th>
												 	<th class="text-white">Actions</th>
												</tr>
											</thead>
										</table>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
				<!-- / Content -->
					<jsp:include page="../footer.jsp"></jsp:include>
				<div class="content-backdrop fade"></div>
			</div>
			<!-- Content wrapper -->
		</div>
		<!-- / Layout page -->
	</div>

	<!-- Overlay -->
	<div class="layout-overlay layout-menu-toggle"></div>

	<!-- Drag Target Area To SlideIn Menu On Small Screens -->
	<div class="drag-target"></div>
	<!-- / Layout wrapper -->
	
	<div class="modal fade" id="amenity_modal" data-bs-backdrop="static" tabindex="-1">
    <div class="modal-dialog modal-xxl modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header" style="border-bottom: 1px solid lightgray;">
            <h6>Add Purchase Details</h6>
                <button type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
             <form name="purchaseform" id="purchaseform">
					<div class="modal-body">
						<div class="nav-align-top mb-4">
							<div class="row">
								<h6 class="m-0">VENDOR DETAILS</h6>
								<hr>
								<div class=" col-lg-3 mb-6 mt-1">
									<label class="form-label" for="vendor_name">Vendor Name<span style="color: red;">*</span></label> 
									<select class="form-control" id="vendor_name" name="vendor_name" onchange="getVendor()">
										<option selected disabled>Select Vendor</option>
										 <%if(data1 != null){
											for(Vendor c: data1){%>
											<option value="<%=c.getSno()%>"><%=c.getVendor_code()+"/"+c.getVendor_name()%></option>
										<%}}%>
									</select>
								</div>
								<div class=" col-lg-3 mb-6 mb-3">
									<label class="form-label" for="mobile_number">Mobile Number<span style="color: red;">*</span></label> <input
										type="text" class="form-control" id="mobile_number" placeholder=" "
										name="mobile_number" aria-label=" " disabled/>
								</div>
								<div class=" col-lg-3 mb-6 mb-3">
									<label class="form-label" for="gstin">GSTIN<span style="color: red;">*</span></label> <input
										type="text" class="form-control" id="gstin" placeholder=" "
										name="gstin" aria-label=" " disabled/>
								</div>
								<div class=" col-lg-3 mb-6 mb-3">
									<label class="form-label" for="state_code">State Code<span style="color: red;">*</span></label> <input
										type="text" class="form-control" id="state_code" placeholder=" "
										name="state_code" aria-label=" " disabled/>
								</div>
								<div class=" col-lg-3 mb-6 mb-3">
									<label class="form-label" for="po_no">PO Number<span style="color: red;">*</span></label> <input
										type="text" class="form-control" id="po_no" placeholder=" "
										name="po_no" aria-label=" " />
								</div>
								<div class=" col-lg-3 mb-6 mb-3">
									<label class="form-label" for="po_date">PO Date<span style="color: red;">*</span></label> <input
										type="date" class="form-control" id="po_date" name="po_date"/>
								</div>
								<div class=" col-lg-3 mb-6">
									<label class="form-label" for="category_name">Category<span style="color: red;">*</span></label> 
									<select class="form-control" id="category_name" name="category_name">
										<option selected disabled>--Select Category--</option>
										<option value="Accessory">Accessory</option>
										<option value="Grocery">Grocery</option>
									</select>
								</div>
								<div class=" col-lg-3 mb-6">
									<label class="form-label" for="purchase_for">Purchase For<span style="color: red;">*</span></label> 
									<select class="form-control" id="purchase_for" name="purchase_for">
										<option selected disabled>--Select Location--</option>
										<option value="Madhai">Madhai</option>
										<option value="Bandhavgarh">Bandhavgarh</option>
									</select>
								</div>
								<hr>
								<div class=" col-lg-12 mb-6 mt-1">
									<div style="display: flex;justify-content: space-between;">
										<h6 class="m-0" style="font-weight: 600">ITEM DETAILS</h6>
										<!-- <button type="button" class="btn btn-white bt-sm" style="border: 1px dashed;color: #28476a; height: fit-content;">Select Items</button> -->
									</div>
									<hr>
									<table class="table table-bordered" id="stockentrytable">
									  <!-- Header: Item Details -->
									  <thead class="bg-primary text-white">
									    <tr>
									      <th class="text-center text-white">NO</th>
									      <th class="text-center text-white">Description of Goods</th>
									      <th class="text-center text-white">HSN Code</th>
									      <th class="text-center text-white">Unit</th>
									      <th class="text-center text-white">Qty</th>
									      <th class="text-center text-white">Price/Qty</th>
									      <th class="text-center text-white">Taxable Amt</th>
									      <th class="text-center text-white">GST %</th>
									      <th class="text-center text-white">GST Amt</th>
									      <th class="text-center text-white">CESS %</th>
									      <th class="text-center text-white">CESS Amt</th>
									    </tr>
									  </thead>
									
									  <!-- Body -->
									  <tbody id="tbody">
									    <!-- Main Entry Row -->
									    <tr class="item1">
									      <td class="text-center">1</td>
									      <td>
									        <select name="item1" class="form-control" id="item1" onchange="getItemdata(1)" style="width: 250px; height: 30px; line-height: 1">
									          <option selected disabled>Select Item</option>
									          <%if(data != null){
													for(Items c: data){%>
														<option value="<%=c.getSno()%>"><%=c.getItem_name()%></option>
												<%}}%>
									        </select>
									      </td>
									      <td><input type="text" class="form-control" name="hsn1" id="hsn1" placeholder="HSN Code" style="height: 30px;"></td>
									      <td><input type="text" class="form-control" name="unit1" id="unit1" placeholder="Unit" disabled style="height: 30px;"></td>
									      <td><input type="text" class="form-control" name="qty1" id="qty1" onkeyup="calculattions(1)" placeholder="Qty" style="height: 30px;"></td>
									      <td><input type="text" class="form-control" name="price1" id="price1" onkeyup="calculattions(1)" placeholder="Price/Qty" style="height: 30px;"></td>
									      <td><input type="text" class="form-control" name="taxable_amt1" id="taxable_amt1" placeholder="Taxable Amt" style="height: 30px;" disabled></td>
									      <td><input type="text" class="form-control" name="gst_per1" id="gst_per1" onkeyup="calculattions(1)" placeholder="GST %" style="height: 30px;"></td>
									      <td><input type="text" class="form-control" name="gst_amt1" id="gst_amt1" placeholder="GST Amt" style="height: 30px;" disabled></td>
									      <td><input type="text" class="form-control" name="cess_per1" onkeyup="calculattions(1)" id="cess_per1" placeholder="CESS %" style="height: 30px;"></td>
									      <td><input type="text" class="form-control" name="cess_amt1" id="cess_amt1" placeholder="CESS Amt" style="height: 30px;" disabled></td>
									    
									    </tr>
									    <tr>
									    	<td></td>
									    	<td style="text-align: right;">CGST %</td>
									    	<td><input type="text" class="form-control" name="cgst_per1" id="cgst_per1" placeholder="CGST %" style="height: 30px;" disabled></td>
									      	<td>CGST Amt</td>
									      	<td><input type="text" class="form-control" name="cgst_amt1" id="cgst_amt1" placeholder="CGST Amt" style="height: 30px;" disabled></td>
									    	<td>SGST %</td>
									    	<td><input type="text" class="form-control" name="sgst_per1" id="sgst_per1" placeholder="SGST %" style="height: 30px;" disabled></td>
									      	<td>SGST Amt</td>
									      	<td><input type="text" class="form-control" name="sgst_amt1" id="sgst_amt1" placeholder="SGST Amt" style="height: 30px;" disabled></td>
									   		<td>Total Tax</td>
									      	<td><input type="text" class="form-control" name="tax_amt1" id="tax_amt1" placeholder="Total Tax Amt" style="height: 30px;" disabled></td>
									    </tr>
									    <tr>
									    	<td colspan="9"></td>
									    	<td>Net Amount</td>
									      	<td><input type="text" class="form-control" name="net_amt1" id="net_amt1" placeholder="Net Amt" style="height: 30px;" disabled></td>
									    </tr>
									  </tbody>
									   <tbody id="stockBody">
										    <!-- Rows will be added here dynamically -->
									  </tbody>
									  <tfoot>
									 <tr>
									  	<td colspan="10"></td>
									  	<td><button type="button"
											class=" btn btn-success add fa fa-plus"
											onclick="addrow()" name="add" onclick="addrow()">Add</button></td>
									  </tr>
									  </tfoot>
									</table>
								</div>
								<div class="col-md-2"></div>
								<div class="col-md-2 mb-3">
									<label class="form-label" for="total_qty">Total Quantity<span style="color: red;">*</span></label>
									<input type="text" class="form-control" id="total_qty" name="total_qty" placeholder="Total Quantity" disabled>
								</div>
								<div class="col-md-2 mb-3">
									<label class="form-label" for="total_taxable">Total Taxable Amt<span style="color: red;">*</span></label>
									<input type="text" class="form-control" id="total_taxable" name="total_taxable" placeholder="Total Taxable Amt" disabled>
								</div>
								<div class="col-md-2 mb-3">
									<label class="form-label" for="total_gst_amt">Total GST Amt<span style="color: red;">*</span></label>
									<input type="text" class="form-control" id="total_gst_amt" name="total_gst_amt" placeholder="Total GST Amt" disabled>
								</div>
								<div class="col-md-2 mb-3">
									<label class="form-label" for="total_tax_amt">Total Tax Amt<span style="color: red;">*</span></label>
									<input type="text" class="form-control" id="total_tax_amt" name="total_tax_amt" placeholder="Total Tax Amt" disabled>
								</div>
								<div class="col-md-2">
									<label class="form-label" for="grand_total">Grand Total<span style="color: red;">*</span></label>
									<input type="text" class="form-control" id="grand_total" name="grand_total" placeholder="Grand Total" disabled>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer" style="border-top: 1px solid lightgray;">
                	 	<div class="col-md-12">
                          <div class=" " style="float: right; margin-top:1rem;" >
                               <button type="button"  class="btn btn-secondary btn-sm" data-bs-dismiss="modal" aria-label="Close">Close</button>
                               <button type="submit" id="sbmt"  class="btn btn-primary btn-sm" >Save</button>
                          </div>
                      </div>
                	</div>
                </form>
            </div>
        </div>
    </div>
    <div class="modal fade" id="report_modal" data-bs-backdrop="static" tabindex="-1">
    <div class="modal-dialog modal-md modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header" style="border-bottom: 1px solid lightgray;">
            <h6>GST Output Report</h6>
                <button type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
					<div class="modal-body">
						<div class="nav-align-top mb-4">
							<div class="row">
								<div class=" col-lg-12 mb-6 mt-1" style="display: none;">
									<label class="form-label" for="party_name">Vendor Name<span style="color: red;">*</span></label> 
									<select class="form-control" id="party_name" name="party_name">
										<option selected disabled>Select Vendor</option>
										 <%if(data1 != null){
											for(Vendor c: data1){%>
											<option value="<%=c.getSno()%>"><%=c.getVendor_code()+"/"+c.getVendor_name()%></option>
										<%}}%>
									</select>
								</div>
								<div class=" col-lg-12 mb-6 mt-1">
									<label class="form-label" for="from_date">From Date<span style="color: red;">*</span></label> <input
										type="date" class="form-control" id="from_date" placeholder=" "
										name="from_date" aria-label=" " />
								</div>
								<div class=" col-lg-12 mb-6 mt-1">
									<label class="form-label" for="to_date">To Date<span style="color: red;">*</span></label> <input
										type="date" class="form-control" id="to_date" placeholder=" "
										name="to_date" aria-label=" " />
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer" style="border-top: 1px solid lightgray;">
                	 <div class="col-md-12">
                          <div class=" " style="float: right; margin-top:1rem;" >
                               <button type="button"  class="btn btn-secondary btn-sm"  data-bs-dismiss="modal"  aria-label="Close">Close </button>
                               <button type="button" onclick="generateReport()"  class="btn btn-primary btn-sm" >Generate Report</button>
                          </div>
                      </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal -->
	<div class="modal modal-right fade" id="item_modal" tabindex="-1">
		<div class="modal-dialog modal-xxl" style="width: 100%;">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Purchase Items</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="table-responsive">
								<table id="item_table"
									class="table table-striped nowrap">
									<thead class="bg-primary">
										<tr>
											<th class="text-white">S.No</th>
											<th class="text-white">Item Description</th>
											<th class="text-white">HSN Code</th>
											<th class="text-white">Qty</th>
											<th class="text-white">Unit</th>
											<th class="text-white">Price</th>
											<th class="text-white">Taxable Amt.</th>
											<th class="text-white">GST(%)</th>
											<th class="text-white">CGST(%)</th>
											<th class="text-white">CGST(RS)</th>
											<th class="text-white">SGST(%)</th>
											<th class="text-white">SGST(RS)</th>
											<th class="text-white">CESS(%)</th>
											<th class="text-white">CESS(RS)</th>
											<th class="text-white">Total GST Amt.</th>
											<th class="text-white">Total tax Amt.</th>
											<th class="text-white">Net Amt.</th>
										</tr>
									</thead>
								</table>
							</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.modal -->
	<div class="modal modal-right fade" id="stock_modal" tabindex="-1">
		<div class="modal-dialog modal-xl" style="width: 100%;">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Purchase Stock</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<hr>
				<div class="modal-body">
					<div class="table-responsive">
								<table id="stock_table"
									class="table table-striped nowrap">
									<thead class="bg-primary">
										<tr>
											<th class="text-white">S.No</th>
											<th class="text-white">Purchase For</th>
											<th class="text-white">Item Name</th>
											<th class="text-white">Unit</th>
											<th class="text-white">Qty</th>
											<th class="text-white">Remaining Qty</th>
											<th class="text-white">Last Recd Qty </th>
										</tr>
									</thead>
								</table>
							</div>
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" id="sno" name="sno" value="0">
	<jsp:include page="../js.jsp"></jsp:include>
	<script type="text/javascript">
	function calculattions(i) {
	    var qty  = parseFloat($("#qty" + i).val()) || 0;
	    var price = parseFloat($("#price" + i).val()) || 0;
	    var gstPer = parseFloat($("#gst_per" + i).val()) || 0;
	    var cessPer = parseFloat($("#cess_per" + i).val()) || 0;

	    // Taxable amount
	    var taxable = qty * price;
	    $("#taxable_amt" + i).val(taxable.toFixed(2));

	    // GST calculation
	    var gstAmt = parseFloat(taxable) * gstPer / 100;
	    $("#gst_amt" + i).val(gstAmt.toFixed(2));

	    // CGST & SGST = half-half
	    var halfGstPer = gstPer / 2;
	    var halfGstAmt = gstAmt / 2;

	    $("#cgst_per" + i).val(halfGstPer.toFixed(2));
	    $("#sgst_per" + i).val(halfGstPer.toFixed(2));
	    $("#cgst_amt" + i).val(halfGstAmt.toFixed(2));
	    $("#sgst_amt" + i).val(halfGstAmt.toFixed(2));

	    // CESS calculation
	    var cessAmt = taxable * cessPer / 100;
	    $("#cess_amt" + i).val(cessAmt.toFixed(2));

	    // Total Tax
	    var totalTax = gstAmt + cessAmt;
	    $("#tax_amt" + i).val(totalTax.toFixed(2));

	    // Net Amount
	    var netAmt = taxable + totalTax;
	    $("#net_amt" + i).val(netAmt.toFixed(2));

	    // Recalculate footer totals
	    calculateFooterTotals();
	}
	function calculateFooterTotals() {
	    var totalQty = 0;
	    var grandTotal = 0;
	    var taxable = 0;
	    var taxamt = 0;
	    var gstamt = 0;

	    // Loop through all qty inputs
	    $("input[id^='qty']").each(function () {
	        var val = parseFloat($(this).val()) || 0;
	        totalQty += val;
	    });

	    // Loop through all net amount inputs
	    $("input[id^='net_amt']").each(function () {
	        var val = parseFloat($(this).val()) || 0;
	        grandTotal += val;
	    });
	    $("input[id^='taxable_amt']").each(function () {
	        var val = parseFloat($(this).val()) || 0;
	        taxable += val;
	    });
	    $("input[id^='gst_amt']").each(function () {
	        var val = parseFloat($(this).val()) || 0;
	        gstamt += val;
	    });
	    $("input[id^='tax_amt']").each(function () {
	        var val = parseFloat($(this).val()) || 0;
	        taxamt += val;
	    });

	    $("#total_qty").val(totalQty.toFixed(2));
	    $("#grand_total").val(grandTotal.toFixed(2));
	    $("#total_taxable").val(taxable.toFixed(2));
	    $("#total_gst_amt").val(gstamt.toFixed(2));
	    $("#total_tax_amt").val(taxamt.toFixed(2));
	}
	function addrow() {
	    // Each item uses 3 rows
	    var totalRows = $('#tbody tr').length;
	    var count = totalRows / 3;   // how many items already
	    var i = count + 1;

	    // Validate previous row
	    var prev = i - 1;
	    if (prev >= 1) {
	        var quantity = $("#qty" + prev).val();
	        var item = $("#item" + prev).val();
	        var price = $("#price" + prev).val();

	        if (!quantity || !item || !price) {
	            alert("Please fill current row before adding new row");
	            return;
	        }
	    }

	    var html = '';

	    // ================= Row 1: Item Row =================
	    html += '<tr class="item' + i + '">';
	    html += '<td class="text-center">' + i + '</td>';

	    html += '<td>';
	    html += '<select name="item' + i + '" class="form-control" id="item' + i + '" onchange="getItemdata(' + i + ')" style="width: 250px; height: 30px; line-height: 1">';
	    html += $('#item1').html(); // clone options from first select
	    html += '</select>';
	    html += '</td>';

	    html += '<td><input type="text" class="form-control" name="hsn' + i + '" id="hsn' + i + '" placeholder="HSN Code" style="height: 30px;"></td>';
	    html += '<td><input type="text" class="form-control" name="unit' + i + '" id="unit' + i + '" placeholder="Unit" disabled style="height: 30px;"></td>';
	    html += '<td><input type="text" class="form-control" name="qty' + i + '" id="qty' + i + '" onkeyup="calculattions(' + i + ')" placeholder="Qty" style="height: 30px;"></td>';
	    html += '<td><input type="text" class="form-control" name="price' + i + '" id="price' + i + '" onkeyup="calculattions(' + i + ')" placeholder="Price/Qty" style="height: 30px;"></td>';
	    html += '<td><input type="text" class="form-control" name="taxable_amt' + i + '" id="taxable_amt' + i + '" placeholder="Taxable Amt" disabled style="height: 30px;"></td>';
	    html += '<td><input type="text" class="form-control" name="gst_per' + i + '" id="gst_per' + i + '" onkeyup="calculattions(' + i + ')" placeholder="GST %" style="height: 30px;"></td>';
	    html += '<td><input type="text" class="form-control" name="gst_amt' + i + '" id="gst_amt' + i + '" placeholder="GST Amt" disabled style="height: 30px;"></td>';
	    html += '<td><input type="text" class="form-control" name="cess_per' + i + '" id="cess_per' + i + '" onkeyup="calculattions(' + i + ')" placeholder="CESS %" style="height: 30px;"></td>';
	    html += '<td><input type="text" class="form-control" name="cess_amt' + i + '" id="cess_amt' + i + '" placeholder="CESS Amt" disabled style="height: 30px;"></td>';
	    html += '</tr>';

	    // ================= Row 2: CGST / SGST =================
	    html += '<tr class="itemtax' + i + '">';
	    html += '<td></td>';
	    html += '<td style="text-align: right;">CGST %</td>';
	    html += '<td><input type="text" class="form-control" name="cgst_per' + i + '" id="cgst_per' + i + '" placeholder="CGST %" disabled style="height: 30px;"></td>';
	    html += '<td>CGST Amt</td>';
	    html += '<td><input type="text" class="form-control" name="cgst_amt' + i + '" id="cgst_amt' + i + '" placeholder="CGST Amt" disabled style="height: 30px;"></td>';
	    html += '<td>SGST %</td>';
	    html += '<td><input type="text" class="form-control" name="sgst_per' + i + '" id="sgst_per' + i + '" placeholder="SGST %" disabled style="height: 30px;"></td>';
	    html += '<td>SGST Amt</td>';
	    html += '<td><input type="text" class="form-control" name="sgst_amt' + i + '" id="sgst_amt' + i + '" placeholder="SGST Amt" disabled style="height: 30px;"></td>';
	    html += '<td>Total Tax</td>';
	    html += '<td><input type="text" class="form-control" name="tax_amt' + i + '" id="tax_amt' + i + '" placeholder="Total Tax Amt" disabled style="height: 30px;"></td>';
	    html += '</tr>';

	    // ================= Row 3: Net Amount =================
	    html += '<tr class="itemnet' + i + '">';
	    html += '<td colspan="8"></td>';
	    html += '<td class="text-center">';
	    html += '<span class="delete-set btn btn-danger btn-sm" data-id="'+i+'" style="cursor:pointer;"><i class="fa fa-trash"></i></span>';
	    html += '</td>';
	    html += '<td>Net Amount</td>';
	    html += '<td><input type="text" class="form-control" name="net_amt' + i + '" id="net_amt' + i + '" placeholder="Net Amt" disabled style="height: 30px;"></td>';
	    html += '</tr>';

	    $('#tbody').append(html);
	}
	$(document).on("click", ".deleteRow", function () {
	    // Remove 3 rows: item row + tax row + net row
	    var $row = $(this).closest("tr");

	    $row.next().remove();        // tax row
	    $row.next().remove();        // net row
	    $row.remove();               // item row

	    reindexRows();
	    calculateFooterTotals();     // update total qty & grand total
	});

	function reindexRows() {
	    var itemIndex = 0;

	    // Loop through only main item rows
	    $("#tbody tr").each(function () {
	        if ($(this).hasClass("item1") || $(this).attr("class")?.startsWith("item")) {
	            // But better: detect by first cell having number
	        }
	    });

	    // Better approach: loop by blocks of 3 rows
	    var rows = $("#tbody tr");

	    for (var r = 0; r < rows.length; r += 3) {
	        itemIndex++;
	        var i = itemIndex;

	        var $itemRow = $(rows[r]);
	        var $taxRow  = $(rows[r + 1]);
	        var $netRow  = $(rows[r + 2]);

	        // Update serial number
	        $itemRow.find("td:first").text(i);

	        // Update IDs and names in all 3 rows
	        $itemRow.add($taxRow).add($netRow).find("select, input").each(function () {
	            var id = $(this).attr("id");
	            var name = $(this).attr("name");

	            if (id) {
	                var newId = id.replace(/\d+$/, i);
	                $(this).attr("id", newId);
	            }
	            if (name) {
	                var newName = name.replace(/\d+$/, i);
	                $(this).attr("name", newName);
	            }
	        });

	        // Update onchange / onkeyup handlers
	        $itemRow.find("select[id^='item']").attr("onchange", "getItemdata(" + i + ")");
	        $itemRow.find("#qty" + i + ", #price" + i + ", #gst_per" + i + ", #cess_per" + i)
	                .attr("onkeyup", "calculattions(" + i + ")");
	    }
	}
	function data() {
		$("#amenities_table").DataTable({
			dom : "Blfrtip",
			destroy : true,
			autoWidth : true,
			responsive : true,
			buttons : [ {
				extend : 'pdf',
				exportOptions : {
					columns : [ 0, 1, 2, 3, 4,6,7 ]
				}
			}, {
				extend : 'csv',
				exportOptions : {
					columns : [ 0, 1, 2, 3, 4,6,7 ]
				}

			}, {
				extend : 'print',
				exportOptions : {
					columns : [ 0, 1, 2, 3, 4,6,7 ]
				}

			}, {
				extend : 'excel',
				exportOptions : {
					columns : [ 0, 1, 2, 3, 4,6,7 ]
				}
			}, {
				extend : 'pageLength'
			} ],
			lengthChange : true,
			ordering : false,
			ajax : {
				url : "get_groceries",
				type : "POST",
			},
			columnDefs : [ {
				"defaultContent" : "-",
				"targets" : "_all"
			} ],
			serverSide : true,
			columns : [
			{
				data: 'SrNo',
			           render: function (data, type, row, meta) {
			                return meta.row + meta.settings._iDisplayStart + 1;
			          }
			 },	
			{
				"data" : "purchase_for"
			}, 
			{
				"data" : "vendor_name"
			}, 
			{
				"data" : "po_number"
			}, 
			{
				"data" : "po_date"
			}, 
			{
				"data" : "taxable_amount"
			}, 
			{
				"data" : "total_gst"
			}, 
			{
				"data" : "total_tax"
			}, 
			{
				"data" : "grand_total"
			}, 
			{
				"data" : function(data, type,
						dataToSet) {
						var sno = data.sno;
						var string = "<button class='btn btn-sm btn-secondary add-new btn-primary btn-sm '  type='button'  onclick='edit("+sno+")'>Edit</button> ";
						//string +='<button type="button" class="btn btn-sm btn-danger btn-sm ml-1 "  onclick="deletedata('+sno+')" style="margin-left: 10px;">Delete</button>';
						string +='<button type="button" class="btn btn-sm btn-secondary btn-sm ml-1 "  onclick="items('+sno+')" style="margin-left: 10px;">Items</button>';
						return string;
						}
					},

			],
			"lengthMenu" : [ [ 5, 10, 25, 50 ], [ 5, 10, 25, 50 ] ],
			select : true
		});
	}
	data();

	$(function() {
		$("form[name='purchaseform']").validate(
				{
					rules : {
						vendor_name : {
							required : true,

						},
						po_no : {
							required : true,

						},
						po_date : {
							required : true,
						},  
						category_name : {
							required : true,
						},  
						purchase_for : {
							required : true,
						},  
						  
					},
					messages : {
						vendor_name : {
							required : "Please select vendor"
						},
						po_no : {
							required : "Please enter po number"
						},
						po_date : {
							required : "Please enter po date"
						},
						category_name : {
							required : "Please select category"
						},
						purchase_for : {
							required : "Please select location"
						},
					},
					submitHandler : function(form) {
						$("#sbmt").html("Please Wait...");
						$("#sbmt").prop("disabled",true);
						var vendor_name = $("#vendor_name").val();
						var po_number = $("#po_no").val();
						var po_date = $("#po_date").val();
						var category_name = $("#category_name").val();
						var purchase_for = $("#purchase_for").val();
						var total_qty = $("#total_qty").val();
						var total_taxable = $("#total_taxable").val();
						var total_gst_amt = $("#total_gst_amt").val();
						var total_tax_amt = $("#total_tax_amt").val();
						var grand_total = $("#grand_total").val();
						var sno = $("#sno").val();
						var totaldata2 = $('#tbody > tr').length;
						var totalrows2 = parseInt(totaldata2) / 3;
						var fd = {
							'vid' : vendor_name,
							'sno' : sno,
							'po_number' : po_number,
							'po_date' : po_date,
							'category_name' : category_name,
							'purchase_for' : purchase_for,
							'total_qty' : total_qty,
							'taxable_amount' : total_taxable,
							'total_gst' : total_gst_amt,
							'total_tax' : total_tax_amt,
							'grand_total' : grand_total,
							'gi' : []
						};
						for (var i = 1; i <= totalrows2; i++) {

						    var item = $("#item" + i).val();
						    var hsn  = $("#hsn" + i).val();
						    var unit = $("#unit" + i).val();
						    var qty  = $("#qty" + i).val();
						    var price = $("#price" + i).val();

						    var taxable_amt = $("#taxable_amt" + i).val();

						    var gst_per = $("#gst_per" + i).val();
						    var gst_amt = $("#gst_amt" + i).val();

						    var cgst_per = $("#cgst_per" + i).val();
						    var cgst_amt = $("#cgst_amt" + i).val();

						    var sgst_per = $("#sgst_per" + i).val();
						    var sgst_amt = $("#sgst_amt" + i).val();

						    var cess_per = $("#cess_per" + i).val();
						    var cess_amt = $("#cess_amt" + i).val();

						    var tax_amt = $("#tax_amt" + i).val();
						    var net_amt = $("#net_amt" + i).val();

						    // Basic validation: only push filled rows
						    if (item && item.trim() !== "" && qty && qty.trim() !== "" && price && price.trim() !== "") {

						        fd.gi.push({
						            item_id: item,
						            hsn: hsn,
						            unit: unit,
						            qty: qty,
						            price: price,

						            taxable_amt: taxable_amt,

						            gst_per: gst_per,
						            gst_amt: gst_amt,

						            cgst_per: cgst_per,
						            cgst_amt: cgst_amt,

						            sgst_per: sgst_per,
						            sgst_amt: sgst_amt,

						            cess_per: cess_per,
						            cess_amt: cess_amt,

						            tax_amt: tax_amt,
						            net_amt: net_amt
						        });
						    }
						}
						$.ajax({
							url : 'add_groceries', //add company Master controller name LocationController
							type : 'post',
							dataType : 'json',
							data : JSON.stringify(fd),
							contentType : 'application/json',
							success : function(data) {
								if (data['status'] == 'Success') {
									$("#sbmt").html("Save Changes");
									$("#sbmt").prop("disabled",false);
									$('#amenity_modal').modal('toggle');
									$('#amenities_table').DataTable().ajax.reload( null, false );
									 Swal.fire({
											icon : 'success',
											title : 'successfully!',
											text : data['message']
										})
								}else if(data['status'] == 'Already_Exist'){
									$('#amenity_modal').modal('toggle');
									$("#sbmt").html("Save Changes");
									$("#sbmt").prop("disabled",false);
									 Swal.fire({
											icon : 'warning',
											title : 'Already Exist!',
											text : data['message']
										})
								}else {
									$("#sbmt").html("Save Changes");
									$("#sbmt").prop("disabled",false);
									$('#amenity_modal').modal('toggle');
									 Swal.fire({
											icon : 'error',
											title : 'Failed!',
											text : data['message']
										})
								}
							}
						});

					}
				});
	});

	function getItemdata(i){
		var sno = $("#item_id"+i).val();
		var fd = new FormData();
		fd.append("sno", i);
		$.ajax({
			url : 'edit_item',
			type : 'post',
			data : fd,
			contentType : false,
			processData : false,
			success : function(data) {
				if (data['status'] == 'Success') {
					$("#unit"+i).val(data['data'][0].unit);
					$("#hsn"+i).val(data['data'][0].hsn_code);
				} else {
					Swal.fire({
						icon : 'Opps',
						title : 'Warning!',
						text : 'Invalid Details'
					})
				}
			}
		});
	}
	 function edit(i) {
		 $("#sno").val(i);
		var fd = new FormData();
		fd.append("sno", i);
		$.ajax({
			url : 'edit_item',
			type : 'post',
			data : fd,
			contentType : false,
			processData : false,
			success : function(data) {
				if (data['status'] == 'Success') {
					$('#amenity_modal').modal('toggle');
					$("#item_name").val(data['data'][0].item_name);
				} else {
					Swal.fire({
						icon : 'Opps',
						title : 'Warning!',
						text : 'Invalid Details'
					})
				}
			}
		});

	}
		 
		 
		  function deletedata(sno)
			{	 
			 Swal.fire({
				  title: 'Do you want to Delete Employee Details?',
				  showDenyButton: true,
				  //showCancelButton: true,
				  confirmButtonText: 'Yes',
				  denyButtonText: 'No',
				  customClass: {
				    actions: 'my-actions',
				    cancelButton: 'order-1 right-gap',
				    confirmButton: 'order-2',
				    denyButton: 'order-3',
				  }
				}).then((result) => {
				  if (result.isConfirmed) {
					 
					  	console.log(sno);
					    console.log(status)
						var fd = {
					    	"category_id":sno,
					    	};					
						$.ajax({
							url : 'delete_category', //add  Course  controller name AdminController
							type : 'post',
							data : JSON.stringify(fd),
							contentType : 'application/json',
							dataType : 'json',
							success : function(data) {
								if (data['status'] == 'success') {
									$('#tenderdata_table').DataTable().ajax.reload( null, false );
								 Swal.fire({
									  icon: 'success',
									  title: 'Delete successfully',
									  showConfirmButton: false,
									  timer: 1500
									})
								}  
							}
						});
				  
				   }
				});
			}; 
			function getVendor() {
				var sno = $("#vendor_name").val();
				var fd = new FormData();
				fd.append("sno", sno);
				$.ajax({
					url : 'get_vendorById',
					type : 'post',
					data : fd,
					contentType : false,
					processData : false,
					success : function(data) {
						if (data['status'] == 'Success') {
							$("#mobile_number").val(data['data'][0].mobile_number);
							$("#gstin").val(data['data'][0].gstin);
							$("#state_code").val(data['data'][0].state_code);
							 
						} else {
							Swal.fire({
								icon : 'Opps',
								title : 'Warning!',
								text : 'Invalid Details'
							})
						}
					}
				});

			}
			function generateReport() {
				
				let from_date = document.getElementById("from_date").value;
			    let to_date = document.getElementById("to_date").value;
			    let vendor_id = document.getElementById("party_name").value;
			    if(vendor_id=="Select Vendor"){
			    	vendor_id = "";
			    }
				var mapForm = document.createElement("form");
				 mapForm.method = "POST";
				 mapForm.target = "_blank"; 
				 mapForm.action = "gst_output_report";
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
			      var output2 = document.createElement("input");
			      output2.type = "hidden";
			      output2.name = "vendor_id";
			      output2.value = vendor_id;
			      mapForm.appendChild(output2);
			      document.body.appendChild(mapForm);
			      mapForm.submit();     
			}
			function items(sno) {
				  $('#item_modal').modal('toggle');
				  if ($.fn.DataTable.isDataTable("#item_table")) {
				    $('#item_table').DataTable().clear().destroy();
				  }

				  $("#item_table").DataTable({
				    dom: "Blfrtip",
				    destroy: true,
				    autoWidth: true,
				    responsive: true,
				    buttons: [
				    	  {
				    	    extend: 'pdf',
				    	    title: 'Purchase Entry',
				    	    exportOptions: { columns: [...Array(19).keys()] }
				    	  },
				    	  {
				    	    extend: 'csv',
				    	    title: 'Purchase Entry',
				    	    exportOptions: { columns: [...Array(19).keys()] }
				    	  },
				    	  {
				    	    extend: 'print',
				    	    title: 'Purchase Entry',
				    	    exportOptions: { columns: [...Array(19).keys()] }
				    	  },
				    	  {
				    	    extend: 'excel',
				    	    title: 'Purchase Entry',
				    	    exportOptions: { columns: [...Array(19).keys()] }
				    	  }
				    	],
				    lengthChange: true,
				    ordering: false,
				    ajax: {
				      url: "get_grocery_items",
				      type: "POST",
				      data: { sno: sno }
				    },
				    columnDefs: [
				      { "defaultContent": "-", "targets": "_all" }
				    ],
				    serverSide: true,
				    columns: [
				      {
				        data: 'SrNo',
				        render: function(data, type, row, meta) {
				          return meta.row + meta.settings._iDisplayStart + 1;
				        }
				      },
				      { data: "item_name" },
				      { data: "hsn_code" },
				      { data: "qty" },
				      { data: "unit" },
				      { data: "price" },
				      { data: "taxable_amt" },
				      { data: "gst_per" },
				      { data: "cgst_per" },
				      { data: "cgst_amt" },
				      { data: "sgst_per" },
				      { data: "sgst_amt" },
				      { data: "cess_per" },
				      { data: "cess_amt" },
				      { data: "gst_amt" },
				      { data: "tax_amt" },
				      { data: "net_amt" }
				    ],
				    lengthMenu: [[5, 10, 25, 50], [5, 10, 25, 50]],
				    select: true
				  });
				}
			function data1() {
				$("#stock_table").DataTable({
					dom : "Blfrtip",
					destroy : true,
					autoWidth : true,
					responsive : true,
					buttons : [ {
						extend : 'pdf',
						exportOptions : {
							columns : [ 0, 1, 2, 3, 5 ]
						}
					}, {
						extend : 'csv',
						exportOptions : {
							columns : [ 0, 1, 2, 3, 5 ]
						}

					}, {
						extend : 'print',
						exportOptions : {
							columns : [ 0, 1, 2, 3, 5 ]
						}

					}, {
						extend : 'excel',
						exportOptions : {
							columns : [ 0, 1, 2, 3, 5 ]
						}
					}, {
						extend : 'pageLength'
					} ],
					lengthChange : true,
					ordering : false,
					ajax : {
						url : "get_stock",
						type : "POST",
					},
					columnDefs : [ {
						"defaultContent" : "-",
						"targets" : "_all"
					} ],
					serverSide : true,
					columns : [
					{
						data: 'SrNo',
					           render: function (data, type, row, meta) {
					                return meta.row + meta.settings._iDisplayStart + 1;
					          }
					 },	
					{
						"data" : "purchase_for"
					}, 
					{
						"data" : "item_name"
					}, 
					{
						"data" : "unit"
					}, 
					{
						"data" : "qty"
					}, 
					{
						"data" : "rem_qty"
					}, 
					{
						"data" : "las_qty"
					}, 
					],
					"lengthMenu" : [ [ 10, 25, 50 ], [ 5, 10, 25, 50 ] ],
					select : true
				});
			}
			data1();
			
			$("#clear_btn").click(function() {
				$("#brandImage1").attr("src", "");
		        $("input[type='text'], input[type='date'],input[type='hidden'],input[type='number'],input[type='file']").val("");
		      });
	</script>
</body>
</html>
