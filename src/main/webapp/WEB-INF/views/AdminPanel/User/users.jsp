<!DOCTYPE html>
<%@page import="com.shoaib.modal.Amenities"%>
<%@page import="com.shoaib.modal.Category"%>
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
List<Category> cat = (List<Category>)request.getAttribute("cat");
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
										data-bs-target="#amenity_modal" disabled>
										<span><i class="bx bx-plus me-0 me-sm-1"></i><span
											class="d-none d-sm-inline-block">Registered Users</span></span>
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
													<th class="text-white">User Name</th>
													<th class="text-white">Email</th>
													<th class="text-white">Password</th>
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
	
     <input type="hidden" id="sno" name="sno" value="0">
	<jsp:include page="../js.jsp"></jsp:include>
	<script type="text/javascript">
	var sno = $("#sno").val();
	function data() {
		$("#amenities_table").DataTable({
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
				url : "get_user",
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
				"data" : "user_name"
			}, 
			{
				"data" : "email"
			}, 
			
			{
				"data" : "password"
			}, 
			{
				"data": "status"
			},{
				"data" : function(data, type,
						dataToSet) {
						var sno = data.sno;
						var string = "<button class='btn btn-sm btn-secondary add-new btn-danger btn-xs '  type='button'  onclick='delete("+sno+")'>Delete</button> ";
					//	string +='<button type="button" class="btn btn-sm btn-danger btn-sm ml-1 "  onclick="deletedata('+sno+')" style="margin-left: 10px;">Delete</button>';
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
		$("form[name='amenity_form']")
				.validate(
						{
							rules : {
								name : {
									required : true,
								},
								image : {
									required : true,
								},
								review : {
									required : true,
								},
							},

							messages : {

								name : {
									required : "Please enter reviewer name",
								},
								image : {
									required : "Please Upload Title Image",
								},
								review : {
									required : "Please write review here",
								},
							},

							submitHandler : function(form) {
								var name = $("#name").val();
								var review = $("#review").val();
								var image = $("#image")[0].files[0];
								var obj = {
										"name" : name,
										"review": review,
										"sno": sno
								}
								
								var fd = new FormData();
								fd.append("image",image);
								fd.append("testimonialdata",JSON.stringify(obj));
								$.ajax({
									url : 'add_testimonial',
									type : 'post',
									data : fd,
									processData : false,
									contentType :  false,
									success : function(data) {
										if (data['status'] == 'Success') {
											$('#amenities_table').DataTable().ajax.reload( null, false );
											 Swal.fire({
													icon : 'success',
													title : 'successfully!',
													text : data['message']
												})
												$('#amenity_modal').modal('toggle');
											
											} else if(data['status'] == 'Already_Exist'){
												$('#amenity_modal').modal('toggle');
												Swal.fire({
													icon : 'warning',
													title : 'Already!',
													text : data['message']
												})
											}
											else if(data['status'] == 'Failed'){
												$('#amenity_modal').modal('toggle');
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
			url : 'edit_amenity',
			type : 'post',
			data : fd,
			contentType : false,
			processData : false,
			success : function(data) {
				if (data['status'] == 'Success') {
					$('#amenity_modal').modal('toggle');
					$("#amenity_name").val(data['data'][0].amenity_name);
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
