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
										data-bs-target="#category_modal">
										<span><i class="bx bx-plus me-0 me-sm-1"></i><span
											class="d-none d-sm-inline-block">Block New Date</span></span>
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
													<th class="text-white">Block Date</th>
													<th class="text-white">Remarks</th>
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
    <div class="modal-dialog modal-md modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header" style="border-bottom: 1px solid lightgray;">
            <h6>Block New Date</h6>
                <button type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
             <form name="category_form" id="category_form">
					<div class="modal-body">
						<div class="nav-align-top mb-4">
							<div class="row">
								<div class=" col-lg-12 mb-6 mt-1">
									<label class="form-label" for="category_name">Room Name<span style="color: red;">*</span></label> 
									<select class="form-control" id="room" name="room">
										<option selected disabled>--Select Room--</option>
										<%if(room != null){
											for(Rooms r : room){%>
										<option value="<%=r.getSno()%>"><%=r.getTitle()%></option>
										<%}} %>
									</select>
								</div>
								<div class=" col-lg-12 mb-6 mt-1">
									<label class="form-label" for="block_date">Block Date<span style="color: red;">*</span></label> <input
										type="date" class="form-control" id="block_date" placeholder=" "
										name="block_date" aria-label=" " />
								</div>
								<div class=" col-lg-12 mb-6 mt-1">
									<label class="form-label" for="block_date">Remarks</label> 
									<textarea class="form-control" rows="" cols="" id="remarks" name="remarks"></textarea>
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
				url : "get_blockdate",
				type : "POST",
				"data" : {
					"type" : "Blogs",
				}
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
				"data" : "room_title"
			}, 
			{
				"data" : "block_date"
			}, 
			{
				"data" : "remarks"
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
