<!DOCTYPE html>
<%@page import="com.shoaib.modal.Rooms"%>
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
List<Rooms> room = (List<Rooms>)request.getAttribute("room");
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
										data-bs-target="#category_modal" disabled>
										<span><i class="bx bx-plus me-0 me-sm-1"></i><span
											class="d-none d-sm-inline-block">Reserved Room</span></span>
									</button>
								</div>
							</div>
							<div class="row p-4">
								<div class="col-12">
									<div class="card-datatable table-responsive">
										<table id="category_table" class="table nowrap"
											style="width: 100%">
											<thead class="bg-primary">
												<tr>
													<th class="text-white">S.NO.</th>
													<th class="text-white">Room Title</th>
													<th class="text-white">Booking_id</th>
													<th class="text-white">Order_id</th>
													<th class="text-white">Rooms</th>
													<th class="text-white">Guest</th>
													<th class="text-white">Check-in date</th>
													<th class="text-white">Check-out date</th>
												 	<th class="text-white">Name</th>
												 	<th class="text-white">Email</th>
												 	<th class="text-white">Phone Number</th>
												 	<th class="text-white">Payment Mode</th>
												 	<th class="text-white">Payment Type</th>
												 	<th class="text-white">Payment Status</th>
												 	<!-- <th class="text-white">Actions</th> -->
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
	<input type="hidden" id="sno" name="sno" value="0">
	<jsp:include page="../js.jsp"></jsp:include>
	<script type="text/javascript">

	function data() {
		$("#category_table").DataTable({
			dom : "Blfrtip",
			destroy : true,
			autoWidth : true,
			responsive : true,
			buttons : [ {
				extend : 'pdf',
				exportOptions : {
					columns : [ 0, 1, 2, 3, 4 ,5,6,7,8,9,10,11,12,13]
				}
			}, {
				extend : 'csv',
				exportOptions : {
					columns : [ 0, 1, 2, 3, 4 ,5,6,7,8,9,10,11,12,13]
				}

			}, {
				extend : 'print',
				exportOptions : {
					columns : [ 0, 1, 2, 3, 4 ,5,6,7,8,9,10,11,12,13]
				}

			}, {
				extend : 'excel',
				exportOptions : {
					columns : [ 0, 1, 2, 3, 4 ,5,6,7,8,9,10,11,12,13]
				}
			}, {
				extend : 'pageLength'
			} ],
			lengthChange : true,
			ordering : false,
			ajax : {
				url : "get_booking",
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
				"data" : "title"
			}, 
			{
				"data" : "booking_id"
			}, 
			{
				"data" : "order_id"
			}, 
			{
				"data" : "no_of_rooms"
			}, 
			{
				"data" : function(data, type,
						dataToSet) {
						var adult = data.adult;
						var child = data.child;
						var string = adult+" Adult and "+child+" Child";
						return string;
						}
					},
			{
				"data" : "check_in"
			}, 
			{
				"data" : "check_out"
			}, 
			{
				"data" : "name"
			}, 
			{
				"data" : "email"
			}, 
			{
				"data" : "mobile_number"
			}, 
			{
				"data" : "payment_mode"
			}, 
			{
				"data" : "payment_type"
			}, 
			{
				"data" : "payment_status"
			}, 
			/* {
				"data" : function(data, type,
						dataToSet) {
						var sno = data.sno;
						var string = "<button class='btn btn-sm btn-secondary add-new btn-primary btn-sm '  type='button'  onclick='edit("+sno+")'>Edit</button> ";
						string +='<button type="button" class="btn btn-sm btn-danger btn-sm ml-1 "  onclick="deletedata('+sno+')" style="margin-left: 10px;">Delete</button>';
						return string;
						}
					}, */

			],
			"lengthMenu" : [ [ 5, 10, 25, 50 ], [ 5, 10, 25, 50 ] ],
			select : true
		});
	}
	data();

	$(function() {
		$("form[name='category_form']")
				.validate(
						{
							rules : {
								room : {
									required : true,
								},
								block_date : {
									required : true,
								},
							},

							messages : {

								room : {
									required : "Please select room",
								},
								block_date : {
									required : "Please choose date",
								},
							},

							submitHandler : function(form) {
								var room = $("#room").val();
								var block_date = $("#block_date").val();
								var remarks = $("#remarks").val();
								var sno = $("#sno").val();

								var obj = {
									"room_id" : room,
									"block_date" : block_date,
									"remarks" : remarks,
									"sno" : sno
								};
								
								$.ajax({
									url : 'add_blockdate',
									type : 'post',
									data : JSON.stringify(obj),
									dataType : 'json',
									contentType :  'application/json',
									success : function(data) {
										if (data['status'] == 'Success') {
											$('#category_table').DataTable().ajax.reload( null, false );
											 Swal.fire({
													icon : 'success',
													title : 'successfully!',
													text : data['message']
												})
												$('#category_modal').modal('toggle');
											
											} else if(data['status'] == 'Already_Exist'){
												$('#category_modal').modal('toggle');
												Swal.fire({
													icon : 'warning',
													title : 'Already!',
													text : data['message']
												})
											}
											else if(data['status'] == 'Failed'){
												$('#category_modal').modal('toggle');
												Swal.fire({
													icon : 'Sorry',
													title : 'Invalid!',
													text : data['message']
												})
											}
									}
								});

							}
						});

	});

	 function edit(i) {
		 $("#sno").val(i);
		var fd = new FormData();
		fd.append("sno", i);
		$.ajax({
			url : 'edit_category',
			type : 'post',
			data : fd,
			contentType : false,
			processData : false,
			success : function(data) {
				if (data['status'] == 'Success') {
					$('#category_modal').modal('toggle');
					$("#category_name").val(data['data'][0].category_name);
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

			$("#clear_btn").click(function() {
				$("#brandImage1").attr("src", "");
		        $("input[type='text'], input[type='date'],input[type='hidden'],input[type='number'],input[type='file']").val("");
		      });
	</script>
</body>
</html>
