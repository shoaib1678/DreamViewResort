<!DOCTYPE html>
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

</style>

</head>
<%
List<Items> data = (List<Items>)request.getAttribute("data");
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
													<th class="text-white">PO Number</th>
													<th class="text-white">PO Date</th>
													<th class="text-white">Total</th>
													<th class="text-white">Total GST</th>
													<th class="text-white">Sub Total</th>
													<th class="text-white">Discount</th>
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
            <h6>Add Grocery Details</h6>
                <button type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
             <form name="purchaseform" id="purchaseform">
					<div class="modal-body">
						<div class="nav-align-top mb-4">
							<div class="row">
								<div class=" col-lg-6 mb-6 mb-3">
									<label class="form-label" for="po_no">PO Number<span style="color: red;">*</span></label> <input
										type="text" class="form-control" id="po_no" placeholder=" "
										name="po_no" aria-label=" " />
								</div>
								<div class=" col-lg-6 mb-6 mb-3">
									<label class="form-label" for="po_date">PO Date<span style="color: red;">*</span></label> <input
										type="date" class="form-control" id="po_date" name="po_date"/>
								</div>
								<hr>
								<div class=" col-lg-12 mb-6 mt-1">
									<div style="display: flex;justify-content: space-between;">
										<h6 class="m-0">ITEM DETAILS</h6>
										<button type="button" class="btn btn-white bt-sm" style="border: 1px dashed;color: #28476a; height: fit-content;">Select Items</button>
									</div>
									<hr>
									<table class="table table-bordered" id="stockentrytable">
									  <!-- Header: Item Details -->
									  <thead class="bg-primary text-white">
									    <tr>
									      <th class="text-center text-white">NO</th>
									      <th class="text-center text-white">Item Name</th>
									      <th class="text-center text-white">Unit</th>
									      <th class="text-center text-white">Qty</th>
									      <th class="text-center text-white">Price/Qty</th>
									      <th class="text-center text-white">Total</th>
									      <th class="text-center text-white" colspan="2">Gst Details</th>
									      <th class="text-center text-white">Total Amount</th>
									      <th class="text-center text-white">Action</th>
									    </tr>
									  </thead>
									
									  <!-- Body -->
									  <tbody id="tbody">
									    <!-- Main Entry Row -->
									    <tr class="item1">
									      <td class="text-center">1</td>
									      <td>
									        <select name="item1" class="form-control" id="item1" onchange="getItemdata(1)" style="width: auto; height: 30px; line-height: 1">
									          <option selected disabled>Select Item</option>
									          <%if(data != null){
													for(Items c: data){%>
														<option value="<%=c.getSno()%>"><%=c.getItem_name()%></option>
												<%}}%>
									        </select>
									      </td>
									      <td><input type="text" class="form-control" name="unit1" id="unit1" placeholder="Unit" disabled style="height: 30px;"></td>
									      <td><input type="text" class="form-control" name="qty1" id="qty1" onkeyup="calculattions(1)" placeholder="Recd Qty" style="height: 30px;"></td>
									      <td><input type="text" class="form-control" name="price1" id="price1" onkeyup="calculattions(1)" placeholder="Price" style="height: 30px;"></td>
									      <td><input type="text" class="form-control" name="total1" id="total1" placeholder="Total" style="height: 30px;" disabled></td>
									      <td><input type="text" class="form-control" name="gst_per1" id="gst_per1" onkeyup="calculattions(1)" placeholder="GST %" value="18" style="height: 30px;"></td>
									      <td><input type="text" class="form-control" name="gst_amt1" id="gst_amt1" placeholder="Gst Amt" style="height: 30px;" disabled></td>
									      <td><input type="text" class="form-control" name="total_amount1" id="total_amount1" placeholder="Total Amount" style="height: 30px;" disabled></td>
									      <td>-</td>
									    </tr>
									  </tbody>
									   <tbody id="stockBody">
										    <!-- Rows will be added here dynamically -->
									  </tbody>
									  <tfoot>
									  <tr>
									  	<td colspan="3"></td>
									  	 <td><input type="text" class="form-control" name="total_qty" id="total_qty" placeholder="Total Qty" style="height: 30px;" disabled></td>
									  	 <td></td>
									  	 <td><input type="text" class="form-control" name="total_price" id="total_price" placeholder="Total Price" style="height: 30px;" disabled></td>
									  	  <td></td>
									  	 <td><input type="text" class="form-control" name="total_gst" id="total_gst" placeholder="Total GST" style="height: 30px;" disabled></td>
									  	 <td><input type="text" class="form-control" name="sub_total" id="sub_total" placeholder="Sub Total" style="height: 30px;" disabled></td>
									  	<td><button type="button"
											class=" btn btn-success add fa fa-plus"
											onclick="addrow()" name="add" onclick="addrow()">Add</button></td>
									  </tr>
									  </tfoot>
									</table>
								</div>
								<div class="col-md-7"></div>
								<div class="col-md-3"><p style="float: right; margin-top: 10px;">Discount</p></div>
								<div class="col-md-2 mb-3"><input type="text" class="form-control" id="discount" name="discount" placeholder="Discount"></div>
								<div class="col-md-7"></div>
								<div class="col-md-3"><p style="float: right; margin-top: 10px;">Grand Total</p></div>
								<div class="col-md-2"><input type="text" class="form-control" id="grand_total" name="grand_total" placeholder="Grand Total" disabled></div>
							</div>
						</div>
					</div>
					<div class="modal-footer" style="border-top: 1px solid lightgray;">
                	 	<div class="col-md-12">
                          <div class=" " style="float: right; margin-top:1rem;" >
                               <button type="button"  class="btn btn-secondary btn-sm" data-bs-dismiss="modal" aria-label="Close">Close</button>
                               <button type="submit"  class="btn btn-primary btn-sm" >Save</button>
                          </div>
                      </div>
                	</div>
                </form>
            </div>
         	<input type="hidden" id="sno" name="sno" value="0">
        </div>
    </div>
	<input type="hidden" id="sno" name="sno" value="0">
	<jsp:include page="../js.jsp"></jsp:include>
	<script type="text/javascript">
	function calculattions(i) {
	    var qty = parseFloat($("#qty" + i).val()) || 0;
	    var price = parseFloat($("#price" + i).val()) || 0;
	    var gstPer = parseFloat($("#gst_per" + i).val()) || 0;

	    var total = qty * price;
	    $("#total" + i).val(total.toFixed(2));

	    var gstAmt = (total * gstPer) / 100;
	    $("#gst_amt" + i).val(gstAmt.toFixed(2));

	    var totalAmt = total + gstAmt;
	    $("#total_amount" + i).val(totalAmt.toFixed(2));

	    calculateFooter();
	}
	$("#discount").on("keyup change", function () {
	    calculateFooter();
	});
	function calculateFooter() {
	    var totalQty = 0;
	    var totalPrice = 0;
	    var totalGst = 0;
	    var subTotal = 0;

	    $("#tbody tr").each(function () {
	        var row = $(this);
	        var idx = row.find("td:first").text();

	        var qty = parseFloat($("#qty" + idx).val()) || 0;
	        var total = parseFloat($("#total" + idx).val()) || 0;
	        var gst = parseFloat($("#gst_amt" + idx).val()) || 0;
	        var totalAmt = parseFloat($("#total_amount" + idx).val()) || 0;

	        totalQty += qty;
	        totalPrice += total;
	        totalGst += gst;
	        subTotal += totalAmt;
	    });

	    $("#total_qty").val(totalQty.toFixed(2));
	    $("#total_price").val(totalPrice.toFixed(2));
	    $("#total_gst").val(totalGst.toFixed(2));
	    $("#sub_total").val(subTotal.toFixed(2));
	    // 🔽 Discount & Grand Total
	    var discount = parseFloat($("#discount").val()) || 0;
	    var grandTotal = subTotal - discount;

	    if (grandTotal < 0) grandTotal = 0; // safety

	    $("#grand_total").val(grandTotal.toFixed(2));
	}
	function addrow() {
	    var count = $('#tbody > tr').length;
	    var i = count + 1;

	    var quantity = $("#qty" + count).val();
	    var item = $("#item" + count).val();
	    var price = $("#price" + count).val();

	    if (quantity && item && price) {
	        var html = '';
	        html += '<tr class="item'+i+'">';
	        html += '<td class="text-center">'+i+'</td>';
	        html += '<td><select name="item' + i + '" class="form-control" id="item' + i + '" onchange="getItemdata(' + i + ')" style="width: auto; height: 30px; line-height: 1">';
	        html += $('#item1').html();
	        html += '</select></td>';
	        html += '<td><input type="text" class="form-control" name="unit' + i + '" id="unit' + i + '" placeholder="Unit" disabled style="height: 30px;"></td>';
	        html += '<td><input type="text" class="form-control" name="qty' + i + '" id="qty' + i + '" onkeyup="calculattions(' + i + ')" placeholder="Recd Qty" style="height: 30px;"></td>';
	        html += '<td><input type="text" class="form-control" name="price' + i + '" id="price' + i + '" onkeyup="calculattions(' + i + ')" placeholder="price" style="height: 30px;"></td>';
	        html += '<td><input type="text" class="form-control" name="total' + i + '" id="total' + i + '" placeholder="Total" disabled style="height: 30px;"></td>';
	        html += '<td><input type="text" class="form-control" name="gst_per' + i + '" id="gst_per' + i + '" value="18" onkeyup="calculattions(' + i + ')" placeholder="GST %" style="height: 30px;"></td>';
	        html += '<td><input type="text" class="form-control" name="gst_amt' + i + '" id="gst_amt' + i + '" placeholder="GST Amt" disabled style="height: 30px;"></td>';
	        html += '<td><input type="text" class="form-control" name="total_amount' + i + '" id="total_amount' + i + '" placeholder="Total Amount" disabled style="height: 30px;"></td>';
	        html += '<td class="text-center"><button type="button" class="btn btn-danger btn-sm deleteRow"><i class="fa fa-trash"></i></button></td>';
	        html += '</tr>';

	        $('#tbody').append(html);
	    } else {
	        alert("Please fill current row before adding new row");
	    }
	}
	$(document).on("click", ".deleteRow", function () {
	    $(this).closest("tr").remove();
	    reindexRows();
	    calculateFooter();
	});

	function reindexRows() {
	    $("#tbody tr").each(function (index) {
	        var i = index + 1;
	        $(this).find("td:first").text(i);

	        $(this).find("select, input").each(function () {
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

	        // Update calculation handlers
	        $(this).find("#qty" + i + ", #price" + i + ", #gst_per" + i)
	               .attr("onkeyup", "calculattions(" + i + ")");
	    });
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
				"data" : "po_number"
			}, 
			{
				"data" : "po_date"
			}, 
			{
				"data" : "total_price"
			}, 
			{
				"data" : "total_gst"
			}, 
			{
				"data" : "sub_total"
			}, 
			{
				"data" : "discount"
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
						po_no : {
							required : true,

						},
						po_date : {
							required : true,
						},  
						  
					},
					messages : {
						po_no : {
							required : "Please enter po number"
						},
						po_date : {
							required : "Please enter po date"
						},
					},
					submitHandler : function(form) {
						$("#sbmt").html("Please Wait...");
						$("#sbmt").prop("disabled",true);
						var po_number = $("#po_no").val();
						var po_date = $("#po_date").val();
						var total_qty = $("#total_qty").val();
						var total_price = $("#total_price").val();
						var total_gst = $("#total_gst").val();
						var sub_total = $("#sub_total").val();
						var discount = $("#discount").val();
						var grand_total = $("#grand_total").val();
						var sno = $("#sno").val();
						var totaldata2 = $('#tbody > tr').length;
						var totalrows2 = parseInt(totaldata2)/4;
						var fd = {
							'sno' : sno,
							'po_number' : po_number,
							'po_date' : po_date,
							'total_qty' : total_qty,
							'total_price' : total_price,
							'total_gst' : total_gst,
							'sub_total' : sub_total,
							'discount' : discount,
							'grand_total' : grand_total,
							'gi' : []
						};
						for (var i = 1; i <= totalrows2; i++) {
							var str0 = "#item" + i;
							var str = "#qty" + i;
							var str1 = "#price" + i;
							var str2 = "#total" + i;
							var str3 = "#gst_per" + i;
							var str4 = "#gst_amt" + i;
							var str5 = "#total_amount" + i;

							var item = $(str0).val();
							var qty = $(str).val();
							var price = $(str1).val();
							var total = $(str2).val();
							var gst_per = $(str3).val();
							var gst_amt = $(str4).val();
							var total_amount = $(str5).val();
							
						if (item && item.trim() !== "" && price && price.trim() !== "" && qty && qty.trim() !== "") {
							fd.pi.push({
								'item_id' : item,
								'qty' : qty,
								'price' : price,
								'total' : total,
								'gst_per' : gst_per,
								'gst_amt' : gst_amt,
								'gst_amt' : gst_amt,
								'total_amount' : total_amount,
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
									 Swal.fire({
											icon : 'success',
											title : 'successfully!',
											text : data['message']
										})
								}else if(data['status'] == 'Already_Exist'){
									 Swal.fire({
											icon : 'warning',
											title : 'Already Exist!',
											text : data['message']
										})
								}else {
									$("#sbmt").html("Save Changes");
									$("#sbmt").prop("disabled",false);
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

			$("#clear_btn").click(function() {
				$("#brandImage1").attr("src", "");
		        $("input[type='text'], input[type='date'],input[type='hidden'],input[type='number'],input[type='file']").val("");
		      });
	</script>
</body>
</html>
