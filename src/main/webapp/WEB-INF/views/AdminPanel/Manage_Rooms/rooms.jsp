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
.upload {
  &__box {
    padding: 40px;
  }
  &__inputfile {
    width: .1px;
    height: .1px;
    opacity: 0;
    overflow: hidden;
    position: absolute;
    z-index: -1;
  }
  
  &__btn {
    display: inline-block;
    font-weight: 600;
    color: #fff;
    text-align: center;
    min-width: 116px;
    padding: 5px;
    transition: all .3s ease;
    cursor: pointer;
    border: 2px solid;
    background-color: #4045ba;
    border-color: #4045ba;
    border-radius: 10px;
    line-height: 26px;
    font-size: 14px;
    
    &:hover {
      background-color: unset;
      color: #4045ba;
      transition: all .3s ease;
    }
    
    &-box {
      margin-bottom: 10px;
    }
  }
  
  &__img {
    &-wrap {
      display: flex;
      flex-wrap: wrap;
      margin: 0 -10px;
    }
    
    &-box {
      width: 200px;
      padding: 0 10px;
      margin-bottom: 12px;
    }
    
    &-close {
        width: 24px;
        height: 24px;
        border-radius: 50%;
        background-color: rgba(0, 0, 0, 0.5);
        position: absolute;
        top: 10px;
        right: 10px;
        text-align: center;
        line-height: 24px;
        z-index: 1;
        cursor: pointer;

        &:after {
          content: '\2716';
          font-size: 14px;
          color: white;
        }
      }
  }
}

.img-bg {
  background-repeat: no-repeat;
  background-position: center;
  background-size: cover;
  position: relative;
  padding-bottom: 100%;
}
.prod-box{
	position: relative;
}
.prod_img{
	height: 150px;
    object-fit: cover;
    width: 100%;
}
.prod-box:hover .dlt_icon{
	opacity: 1;
}
.dlt_icon a{
		color: #fff !important;
		font-size: 22px;
	}
.dlt_icon{
	background: #000000ad;
	position: absolute;
	top: 0%;
	left: 0%;
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100%;
	height: 100%;
	opacity: 0;
	transition: all .5s ease;
}
</style>

</head>
<%
List<Category> cat = (List<Category>)request.getAttribute("cat");
List<Amenities> ame = (List<Amenities>)request.getAttribute("ame");
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
													<th class="text-white">Title</th>
													<th class="text-white">Category</th>
													<th class="text-white">Image</th>
													<th class="text-white">Rent/Night</th>
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
	
	<div class="modal fade" id="amenity_modal" data-bs-backdrop="static" tabindex="-1">
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header" style="border-bottom: 1px solid lightgray;">
            <h6>Add New Rooms</h6>
                <button type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
             <form name="amenity_form" id="amenity_form">
					<div class="modal-body">
						<div class="nav-align-top mb-4">
							<div class="row p-4">
									<div class="col-12">
										<div class="row">
										 <div class="col-md-6 mb-3">
			                                  	<label class="form-label" for="title">Room Title<span style="color: red;">*</span></label> <input
													type="text" class="form-control" id="title" 
													name="title" />
			                                </div>
										 <div class="col-md-6 mb-3">
			                                  	<label class="form-label" for="category">Category<span style="color: red;">*</span></label> 
			                                  	<select class="form-control" id="category" name="category" >
													<option selected disabled>--Select Category--</option>
													<%if(cat != null){
														for(Category c : cat){%>
															<option value="<%=c.getSno()%>"><%=c.getCategory_name()%></option>
													<%}} %>
												</select>
			                                </div>
											  <div class="col-md-6 mb-3" id="cat">
											  	<label class="form-label" for="no_of_rooms">No of Rooms<span style="color: red;">*</span></label> <input
													type="text" class="form-control" id="no_of_rooms" 
													name="no_of_rooms" />
												<div class="mt-3">
					                               <label class="form-label" for="categoryImage">Title Image<span class="mandatory">*</span></label>
					                      					 <input type="file" accept="image/*" class="form-control" id="title_image" name="title_image" onchange='document.getElementById("viewImg").src = window.URL.createObjectURL(this.files[0])'>
					                                </div>	
			                                </div>
			                                <div class="col-md-6 mb-3">
			                                  	<img id="viewImg" name="viewImg" height="115px" width="100px" style="margin-top: 30px;">
			                                </div>
											 <div class="col-md-6 mb-3">
			                                  	 
			                                <label class="form-label" for="rent">Rent / Night (in INR) <span style="color: red;">*</span></label> <input
													type="text" class="form-control decimalOnly" id="rent" 
													name="rent" />
			                                </div>
			                            
			                                
			                                <div class="col-md-6 mb-3">
			                                  	<label class="form-label" for="bed">Bed <span style="color: red;">*</span></label> <input
													type="text"  class="form-control numberOnly" id="bed" 
													name="bed" />
			                                </div>
			                                <div class="col-md-6 mb-3">
			                                  	<label class="form-label" for="bath">Bath <span style="color: red;">*</span></label> <input
													type="text" class="form-control numberOnly" id="bath" 
													name="bath" />
			                                </div>
			                                <div class="col-md-6 mb-3">
			                                  	<label class="form-label" for="guest">Max Guest <span style="color: red;">*</span></label> <input
													type="text" class="form-control numberOnly" id="guest" 
													name="guest" />
			                                </div>
			                                <div class="col-md-12 mb-3">
			                                  	<div class="upload__box">
												  <div class="upload__btn-box">
												    <label class="upload__btn">
												      <p>Upload Slider images</p>
												      <input type="file" multiple="" data-max_length="20" id="slider_image" name="slider_image" class="form-control upload__inputfile mb-3">
												    </label>
												  </div>
												  
												  <div class="upload__img-wrap row"></div>
												</div>
			                                </div>
			                                <div class="row p-4" id="image_column">
			                                </div>
			                                <h5>Amenities</h5>
			                                <%if(ame != null){ 
			                                for(int i=0; i<ame.size(); i++){%>
				                                <div class="col-4">
					                    			<div class="form-check form-switch mb-2">
					                                    <input class="form-check-input amenity" type="checkbox" id="amenity<%=i %>" value="<%=ame.get(i).getSno() %>" name="amenity">
					                                    <label class="form-check-label" for="amenity<%=i %>"><%=ame.get(i).getAmenity_name() %></label>
					                                </div>
				                    			</div>
			                                <%} }%>
											<div class=" col-lg-12">
												<label class="form-label" for="summery">Summery</label>
												<textarea class="form-control" id="summery" name="summery"></textarea>
											</div>
											<div class=" col-lg-12 mb-3">
												<label class="form-label" for="description">Description<span style="color: red;">*</span></label>
												<textarea class="form-control ckeditor" id="description" name="description"></textarea>
											</div>
											<div class="col-md-12 mb-3">
			                                  	<label class="form-label" for="meta_keywords">Meta Keywords</label> <input
													type="text" class="form-control" id="meta_keywords" 
													name="meta_keywords" data-role="tagsinput"/>
			                                </div>
											<div class=" col-lg-12">
												<label class="form-label" for="meta_description">Meta Description</label>
												<textarea class="form-control" id="meta_description" name="meta_description"></textarea>
											</div>
										</div>
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
        </div>
    </div>

	<input type="hidden" id="sno" name="sno" value="0">
	<jsp:include page="../js.jsp"></jsp:include>
	<script type="text/javascript">
	
	jQuery(document).ready(function () {
		  ImgUpload();
		});

	function ImgUpload() {
		  var imgWrap = "";
		  var html = "";

		  $('.upload__inputfile').each(function () {
		    $(this).on('change', function (e) {
		      imgWrap = $(this).closest('.upload__box').find('.upload__img-wrap');
		      var maxLength = $(this).attr('data-max_length');
		      var files = e.target.files;
		      var filesArr = Array.prototype.slice.call(files);

		      // Clear previously shown images and reset array
		      imgWrap.empty();
		      var imgArray = [];

		      filesArr.forEach(function (f, index) {
		        if (!f.type.match('image.*')) {
		          return;
		        }

		        if (imgArray.length >= maxLength) {
		          return false;
		        }

		        imgArray.push(f);

		        var reader = new FileReader();
		        reader.onload = function (e) {
		          html = "<div class='col-3 upload__img-box'>" +
		                   "<div style='background-image: url(" + e.target.result + ")' " +
		                   "data-number='" + $(".upload__img-close").length + "' " +
		                   "data-file='" + f.name + "' class='img-bg'>" +
		                   "<div class='upload__img-close'></div>" +
		                 "</div></div>";
		          imgWrap.append(html);
		        }
		        reader.readAsDataURL(f);
		      });
		    });
		  });

		  // Delete preview image on close button click
		  $('body').on('click', ".upload__img-close", function (e) {
		    $(this).parent().parent().remove();
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
				url : "get_rooms",
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
				"data" : "category_name"
			}, 
			{
				"data":function(data,type,dataToSet){
		      		var imageName = data.title_image;
		      		if(imageName != null  && imageName != ""){
		      			return '<img src="displayimage?url='+imageName+'" width="50" height="50"/>';
		      		}else{
		      			return "NA"
		      		}
		        	
		        }
			},
			{
				"data" : "price"
			}, 
			{
				"data": "status"
			},{
				"data" : function(data, type,
						dataToSet) {
						var sno = data.sno;
						var string = "<button class='btn btn-sm btn-secondary add-new btn-primary btn-sm '  type='button'  onclick='edit("+sno+")'>Edit</button> ";
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
								title : {
									required : true,
								},
								category : {
									required : true,
								},
								/* title_image : {
									required : true,
								}, */
								rent : {
									required : true,
								},
								summery : {
									required : true,
								},
								bed : {
									required : true,
								},
								bath : {
									required : true,
								},
								guest : {
									required : true,
								},
								/* slider_image : {
									required : true,
								}, */
								no_of_rooms : {
									required : true,
								},
							},

							messages : {

								title : {
									required : "Please enter amenity name",
								},
								category : {
									required : "Please select category",
								},
								/* title_image : {
									required : "Please upload title image",
								}, */
								rent : {
									required : "Please enter rent per night",
								},
								summery : {
									required : "Please write 	summery here",
								},
								rent : {
									required : "Please enter rent per night",
								},
								bed : {
									required : "Please enter no of bed",
								},
								bath : {
									required : "Please enter no of babh",
								},
								guest : {
									required : "Please enter no of guest",
								},
								/* slider_image : {
									required : "Please upload slider image",
								}, */
								no_of_rooms : {
									required : "Please enter no of rooms",
								},
							},

							submitHandler : function(form) {
								var sno = $("#sno").val();
								if(sno == ""){
									sno =0;
								}
								var title = $("#title").val();
								var category = $("#category").val();
								var rent = $("#rent").val();
								var bed = $("#bed").val();
								var bath = $("#bath").val();
								var guest = $("#guest").val();
								var summery = $("#summery").val();
								var no_of_rooms = $("#no_of_rooms").val();
								var description = descriptionEditor.getData();
								var meta_keywords = $("#meta_keywords").val();
								var meta_description = $("#meta_description").val();
								var image = $("#title_image")[0].files[0];
								var file = document.getElementById("slider_image");
								var checkedValues = $("input[name='amenity']:checked").map(function() {
								    return this.value;
								}).get();
								var amenities = checkedValues.join(",");
							

								var obj = {
									"title" : title,
									"category_id" : category,
									"price" : rent,
									"summery" : summery,
									"bed" : bed,
									"bath" : bath,
									"no_of_rooms" : no_of_rooms,
									"guest" : guest,
									"description" : description,
									"meta_keywords" : meta_keywords,
									"meta_description" : meta_description,
									"amenity_ids" : amenities,
									"sno" : sno
								};
								var fd = new FormData();
								var ff = file.files;
								 for(var i=0;i<ff.length;i++){
									var f = ff[i];
									fd.append("sliderImages",f);
								} 
								 fd.append("image",image);
								 fd.append("roomdata",JSON.stringify(obj));
									$.ajax({
										url : 'add_rooms',
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
			url : 'edit_room',
			type : 'post',
			data : fd,
			contentType : false,
			processData : false,
			success : function(data) {
				if (data['status'] == 'Success') {
					$('#amenity_modal').modal('toggle');
					$("#title").val(data['data'][0].title);
					 $("#category > option").each(function() {
						    if (this.value ==  data['data'][0].category_id) {
						    	$(this).prop("selected", "selected");
						    }
						});
					 $("#no_of_rooms").val(data['data'][0].no_of_rooms);
					 $("#rent").val(data['data'][0].price);
					 $("#bed").val(data['data'][0].bed);
					 $("#bath").val(data['data'][0].bath);
					 $("#guest").val(data['data'][0].guest);
					 $("#summery").val(data['data'][0].summery);
					 if (descriptionEditor) {
				            descriptionEditor.setData(data['data'][0].description);
				        } else {
				            console.warn("CKEditor not ready yet.");
				        }
					 $("#meta_kywords").val(data['data'][0].meta_keywords);
					 $("#meta_description").val(data['data'][0].meta_description);
					 $("#viewImg").attr("src", "displayimage?url="+data['data'][0].title_image+"");
					 var am = data['data'][0].amenity_ids.split(",");

					 if (am != null && am != "") {
					     for (var i = 0; i < am.length; i++) {
					         if (am[i] == $("#amenity" +i).val()) {
					             $("#amenity" +i).prop("checked", true);
					         }
					     }
					 }
					 var html = '';
					 var img = data['data'][0].simg;
						if(img != null && img != ""){
							for(var i = 0; i < img.length; i++){
								var image = img[i].image;
								html += '<div class="col-md-3" id="im'+img[i].sno+'">'
									+ '<div class="prod-box">'
									+ '<div class="inner-box">' + '<figure class="image-box">'
									+ '<span class="dlt_icon"><a href="javascript:void(0);" onclick="deleteimg('+img[i].sno+')" class="fa-solid fa-xmark"></a></span>'
									+ '<img class="prod_img" alt="product img" src="displayimage?url='+image+'">'
									+ '</div>' 
									+ '</div>' 
									+ '</div>';
							}
							$("#image_column").html(html);
						}
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

			function deleteimg(sno) {
				
				 /* Swal.fire({
			    	  title: 'Do you want to delete image?',
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
			    	  if (result.isConfirmed) { */
			    		  var fd = new FormData();
							fd.append("sno", sno);
							$.ajax({
								url : 'delete_image',
								type : 'post',
								data : fd,
								contentType : false,
								processData : false,
								success : function(data) {
									if (data['status'] == 'Success') {
										 $('#im' + sno).remove();  
									} else {
										Swal.fire({
											icon : 'Opps',
											title : 'Warning!',
											text : 'No Data'
										})
									}
								}
							});
			    	  
			    	   /* }
			    	}); */
					
					
				};
			$("#clear_btn").click(function() {
				$("#brandImage1").attr("src", "");
		        $("input[type='text'], input[type='date'],input[type='hidden'],input[type='number'],input[type='file']").val("");
		      });
	</script>
</body>
</html>
