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
List<Rooms> room = (List<Rooms>)request.getAttribute("rooms");
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
										data-bs-target="#category_modal">
										<span><i class="bx bx-plus me-0 me-sm-1"></i><span
											class="d-none d-sm-inline-block">Add New</span></span>
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
													<th class="text-white">Coupon Name</th>
													<th class="text-white">Coupon Code</th>
													<th class="text-white">Value</th>
													<th class="text-white">Start Date</th>
													<th class="text-white">End Date</th>
													<th class="text-white">Status</th>
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
	
	<div class="modal fade" id="category_modal" data-bs-backdrop="static" tabindex="-1">
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header" style="border-bottom: 1px solid lightgray;">
            <h6>Add Coupon</h6>
                <button type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
             <form name="category_form" id="category_form">
					<div class="modal-body">
						<div class="nav-align-top mb-4">
							<div class="row">
								<div class="col-12 col-lg-12 mb-3">
									<div class="row">
										 <%if(room != null){ 
			                                for(Rooms a : room){%>
				                                <div class="col-4">
					                    			<div class="form-check form-switch mb-2">
					                                    <input class="form-check-input" type="checkbox" id="room<%=a.getSno() %>" value="<%=a.getSno() %>" name="room">
					                                    <label class="form-check-label" for="room<%=a.getSno() %>"><%=a.getTitle() %></label>
					                                </div>
				                    			</div>
			                                <%} }%>
									</div>
										<%-- <label class="form-label" for="city">Select Modules<span
											class="mandatory">*</span></label>
											<select id="module" name="module" class="multiple-select"  multiple="multiple">
												<%if(room != null){
													for(Rooms r : room){%>
													<option value="<%=r.getSno()%>"><%=r.getTitle()%></option>
												<%}} %>
											</select> --%>
									</div>
								<div class=" col-lg-6 mb-6 mt-1">
										<label class="form-label" for="coupon_name">Coupon Name<span style="color: red;">*</span></label> <input
											type="text" class="form-control" id="coupon_name" placeholder=" "
											name="coupon_name" aria-label=" " />
								</div>
								
								<div class=" col-lg-6 mb-6 mt-1">
									<label class="form-label" for="type">Coupon Type<span style="color: red;">*</span></label> 
									<select class="form-control" id="type" name="type">
										<option selected disabled>--Select Type--</option>
										<option value="Fixed">Fixed</option>
										<option value="Percentage">Percentage</option>
									</select>
								</div>
								<div class=" col-lg-6 mb-6 mt-1">
									<label class="form-label" for="coupon_value">Coupon Value<span style="color: red;">*</span></label> <input
										type="text" class="form-control" id="coupon_value" placeholder=" "
										name="coupon_value" aria-label=" " />
								</div>
								<div class=" col-lg-6 mb-6 mt-1">
									<label class="form-label" for="start_date">Start Date<span style="color: red;">*</span></label> <input
										type="date" class="form-control" id="start_date" placeholder=" "
										name="start_date" aria-label=" " />
								</div>
								<div class=" col-lg-6 mb-6 mt-1">
									<label class="form-label" for="end_date">End Date<span style="color: red;">*</span></label> <input
										type="date" class="form-control" id="end_date" placeholder=" "
										name="end_date" aria-label=" " />
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer" style="border-top: 1px solid lightgray;">
                	 <div class="col-md-12">
                          <div class=" " style="float: right; margin-top:1rem;" >
                               <button type="button"  class="btn btn-secondary btn-sm"  data-bs-dismiss="modal"  aria-label="Close">Close </button>
                               <button type="submit"  class="btn btn-primary btn-sm" >Save </button>
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

	function data() {
		$("#category_table").DataTable({
			dom : "Blfrtip",
			destroy : true,
			autoWidth : true,
			responsive : true,
			buttons : [ {
				extend : 'pdf',
				exportOptions : {
					columns : [ 0, 1, 2, 3, 4 ]
				}
			}, {
				extend : 'csv',
				exportOptions : {
					columns : [ 0, 1, 2, 3, 4 ]
				}

			}, {
				extend : 'print',
				exportOptions : {
					columns : [ 0, 1, 2, 3, 4 ]
				}

			}, {
				extend : 'excel',
				exportOptions : {
					columns : [ 0, 1, 2, 3, 4 ]
				}
			}, {
				extend : 'pageLength'
			} ],
			lengthChange : true,
			ordering : false,
			ajax : {
				url : "get_coupon",
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
				"data" : "coupon_name"
			}, 
			{
				"data" : "coupon_Code"
			}, 
			{
				"data" : "coupon_value"
			}, 
			{
				"data" : "start_date"
			}, 
			{
				"data" : "end_date"
			}, 
			{
				"data" : "status"
			}, 
			{
				"data" : function(data, type,
						dataToSet) {
						var sno = data.sno;
						var string = "<button class='btn btn-sm btn-secondary add-new btn-primary btn-sm '  type='button'  onclick='edit("+sno+")'>Edit</button> ";
						string +='<button type="button" class="btn btn-sm btn-danger btn-sm ml-1 "  onclick="deletedata('+sno+')" style="margin-left: 10px;">Delete</button>';
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
		$("form[name='category_form']")
				.validate(
						{
							rules : {
								room : {
									required : true,
								},
								coupon_name : {
									required : true,
								},
								coupon_value : {
									required : true,
								},
								type : {
									required : true,
								},
								start_date : {
									required : true,
								},
								end_date : {
									required : true,
								},
							},

							messages : {

								room : {
									required : "Please select room",
								},
								coupon_name : {
									required : "Please enter coupon name",
								},
								coupon_value : {
									required : "Please enter coupon value",
								},
								type : {
									required : "Please select coupon type",
								},
								start_date : {
									required : "Please choose start date",
								},
								end_date : {
									required : "Please choose end date",
								},
								
							},

							submitHandler : function(form) {
								var checkedValues = $("input[name='room']:checked").map(function() {
								    return this.value;
								}).get();
								var room = checkedValues.join(",");
								var coupon_name = $("#coupon_name").val();
								var coupon_value = $("#coupon_value").val();
								var type = $("#type").val();
								var start_date = $("#start_date").val();
								var end_date = $("#end_date").val();
								var sno = $("#sno").val();

								var obj = {
									"room_ids" : room,
									"coupon_name" : coupon_name,
									"coupon_value" : coupon_value,
									"type" : type,
									"start_date" : start_date,
									"end_date" : end_date,
									"sno" : sno
								};
								
								$.ajax({
									url : 'add_coupon',
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
