<%@page import="com.shoaib.modal.PackagePlan"%>
<%@page import="com.shoaib.modal.Rooms"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<jsp:include page="../css.jsp" />
<jsp:include page="../../AdminPanel/calendercss.jsp" />
<style type="text/css">
.input1_inner, .select1_wrapper {
	border: 1px solid lightgray;
}

.pm {
	display: flex;
	border: 1px solid lightgray;
	margin-bottom: 5px;
	padding-left: 15px;
	border-radius: 5px;
	transition: background-color 0.3s;
}

.pm.active {
	background-color: #f9af005c; /* Light green when selected */
}

.pm label {
	margin-bottom: 0;
}

.apply {
	color: #ffffff;
	font-weight: 500;
	position: relative;
	top: -48px;
	left: 78%;
	background: #fab000;
	padding: 5px;
	border-radius: 5px;
	text-decoration: none;
}

.input1_wrapper a:hover {
	color: blue !important;
}

.totalamt {
	font-weight: bold;
	float: right;
	background: #fab000;
	color: white;
	padding: 0 10px;
	border-radius: 3px;
}

.available-date {
	transition: transform 0.2s ease, border 0.2s ease;
}

.available-date:hover {
	transform: scale(1.1);
	border: 1px solid yellow !important;
	box-shadow: 0 0 5px rgba(255, 255, 255, 0.8);
	z-index: 10;
	background: #00ae00 !important;
}
.spinner {
  margin-left: 10px;
  border: 2px solid #f3f3f3;
  border-top: 2px solid #555;
  border-radius: 50%;
  width: 14px;
  height: 14px;
  animation: spin 0.6s linear infinite;
  display: inline-block;
  vertical-align: middle;
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

</style>
<style>
  .checkbox-wrapper-51 input[type="checkbox"] {
    visibility: hidden;
    display: none;
  }

  .checkbox-wrapper-51 .toggle {
    position: relative;
    display: block;
    width: 42px;
    height: 24px;
    cursor: pointer;
    -webkit-tap-highlight-color: transparent;
    transform: translate3d(0, 0, 0);
  }
  .checkbox-wrapper-51 .toggle:before {
    content: "";
    position: relative;
    top: 1px;
    left: 1px;
    width: 40px;
    height: 22px;
    display: block;
    background: #c8ccd4;
    border-radius: 12px;
    transition: background 0.2s ease;
  }
  .checkbox-wrapper-51 .toggle span {
    position: absolute;
    top: 0;
    left: 0;
    width: 24px;
    height: 24px;
    display: block;
    background: #fff;
    border-radius: 50%;
    box-shadow: 0 2px 6px rgba(154,153,153,0.75);
    transition: all 0.2s ease;
  }
  .checkbox-wrapper-51 .toggle span svg {
    margin: 7px;
    fill: none;
  }
  .checkbox-wrapper-51 .toggle span svg path {
    stroke: #c8ccd4;
    stroke-width: 2;
    stroke-linecap: round;
    stroke-linejoin: round;
    stroke-dasharray: 24;
    stroke-dashoffset: 0;
    transition: all 0.5s linear;
  }
  .checkbox-wrapper-51 input[type="checkbox"]:checked + .toggle:before {
    background: #52d66b;
  }
  .checkbox-wrapper-51 input[type="checkbox"]:checked + .toggle span {
    transform: translateX(18px);
  }
  .checkbox-wrapper-51 input[type="checkbox"]:checked + .toggle span path {
    stroke: #52d66b;
    stroke-dasharray: 25;
    stroke-dashoffset: 25;
  }
</style>


<script src="https://checkout.razorpay.com/v1/checkout.js"></script>

</head>
<%
List<Rooms> room = (List<Rooms>) request.getAttribute("room");
List<PackagePlan> pack = (List<PackagePlan>)request.getAttribute("pack");
%>
<body class="front" data-spy="scroll" data-target="#top-inner"
	data-offset="0">
	<div id="main">

		<jsp:include page="../header.jsp" />
		<div class="breadcrumbs1_wrapper"
			style="background-image: url(assets/images/breadcumimg.jpeg); background-repeat: no-repeat; background-size: cover; height: 300px;">
			<div class="container-fluid"
				style="background: #00000033; height: -webkit-fill-available;">
				<div class="title1 text-white" style="padding-top: 130px;"><%=room.get(0).getTitle()%></div>
				<div class="title2 text-white">
					<a href="./">Home</a><span> | </span>Booking
				</div>
			</div>
		</div>
		<div id="content" style="padding-bottom: 0;">
			<div class="container">
				<div class="booking2-wrapper">
					<div class="row">
						<div class="col-md-8">
							<div class="booking-inner clearfix">
								<form action="javascript:;"  id="booking_form" name="booking_form" class="form1 clearfix"
									style="padding: 40px;">
									<div class="row">
										<div class="col-12 mb-3"
											style="border-bottom: 1px solid lightgray; display: flex;justify-content: space-between;">
											<h4>Guest Details</h4>
											<p id="abroom" style="background: #fab000;padding: 0px 15px;border-radius: 3px;color: white; display: none;">Available Room: <span id="nroom"></span></p>
										</div>
										<div class="col-md-6 mb-3 c1">
											<div class="input1_wrapper">
												<label>Check in</label>
												<div class="input1_inner">
													<input type="text" class="form-control" id="check_in" name="check_in" placeholder="Check in" onclick="checkAvailability('checkin')" data-toggle="modal"
												data-target="#myModal">

												</div>
											</div>
										</div>
										<div class="col-md-6 mb-3 c2">
											<div class="input1_wrapper">
												<label>Check out</label>
												<div class="input1_inner">
													<input type="text" class="form-control" id="check_out"
														name="check_out" placeholder="Check out"
														onclick="checkAvailability('checkout')" 
														>
												</div>
											</div>
										</div>
										<%if(pack != null){ %>
										<div class="col-md-12">
											<p style="font-weight: bold;">Package Plan</p>
										<div class="row mb-3">
										<%
											for(PackagePlan p :pack){%>
											
										<div class="col-md-6">
											<div class="checkbox-wrapper-51" style="display: flex;">
											  <input type="checkbox" class="pack-checkbox" id="cbx-5<%=p.getSno()%>" data-price="<%=p.getFinal_price()%>" value="<%=p.getSno()%>" name="pack_plan"/>
											  <label for="cbx-5<%=p.getSno()%>" class="toggle" style="display: block;">
											    <span>
											      <svg width="10px" height="10px" viewBox="0 0 10 10">
											        <path d="M5,1 L5,1 C2.790861,1 1,2.790861 1,5 L1,5 C1,7.209139 2.790861,9 5,9 L5,9 C7.209139,9 9,7.209139 9,5 L9,5 C9,2.790861 7.209139,1 5,1 L5,9 L5,1 Z"></path>
											      </svg>
											    </span>
											  </label><span><%=p.getPlan_name() %> <span style="font-weight: bold;"><i class="fa fa-inr"></i> <%=p.getFinal_price() %></span></span>
											</div>
										</div>
										<%} %>
										</div>
										</div>
										<%} %>
										<div class="col-md-6 mb-3 c2">
											<div class="input1_wrapper">
												<label>No of Adult</label>
												<div class="">
													<input type="number" class="form-control" id="no_of_adult" onchange="calr()" name="no_of_adult"
														placeholder="No of Adult" style="padding: 20px;"  min="1" value="1">
												</div>
											</div>
										</div>
										<div class="col-md-6 mb-3 c2">
											<div class="input1_wrapper">
												<label>No of Child</label>
												<div class="">
													<input type="number" class="form-control" onchange="calr()" id="no_of_child" name="no_of_child"
														placeholder="No of child (Blew 10 years)" style="padding: 20px;"  min="0" value="0">
												</div>
											</div>
										</div>
										<!-- <div class="col-md-6 mb-3 c2">
											<div class="input1_wrapper">
												<label>No of Room</label>
												<div class="">
													<input type="text" class="form-control" id="no_of_room" name="no_of_room"
														placeholder="No of Room" style="padding: 20px;" disabled>
												</div>
											</div>
										</div> -->
										<div class="col-md-6 mb-3 c2">
											<div class="input1_wrapper">
												<label>Full Name</label>
												<div class="">
													<input type="text" class="form-control" id="name" onchange="calr()"
														name="name" placeholder="Full Name" style="padding: 20px;">
												</div>
											</div>
										</div>
										<div class="col-md-6 mb-3 c2">
											<div class="input1_wrapper">
												<label>Mobile Number</label>
												<div class="">
													<input type="text" class="form-control" id="phone"
														name="phone" placeholder="Mobile Number"
														style="padding: 20px;">
												</div>
											</div>
										</div>
										<div class="col-md-6 mb-3 c2">
											<div class="input1_wrapper">
												<label>Email</label>
												<div class="">
													<input type="email" class="form-control" id="email"
														name="email" placeholder="Email" style="padding: 20px;">
												</div>
											</div>
										</div>
										<div class="col-md-6 mb-3 c2">
											<div class="input1_wrapper">
												<label>Your City</label>
												<div class="">
													<input type="text" class="form-control" id="city"
														name="city" placeholder="Your City" style="padding: 20px;">
												</div>
											</div>
										</div>
										<div class="col-md-6 c4 mb-3">
											<div class="select1_wrapper">
												<label>Country</label>
												<div class="select1_inner">
													<select class="select2 select" style="width: 100%"
														id="country" name="country">
														<option disabled selected>Country</option>
														<option value="Indian">Indian</option>
														<option value="Foreigner">Foreigner</option>
													</select>
												</div>
											</div>
										</div>
										<div class="col-md-6 mb-3 c2">
											<div class="input1_wrapper">
												<label>Apply Coupon</label>
												<div class="">
													<input type="text" class="form-control" id="coupon_code"
														name="coupon_code" placeholder="Enter Coupon Code"
														style="padding: 20px;"> <a href="javacript:void(0)" onclick="apply_coupon()" class="apply">Apply</a>
												</div>
											</div>
										</div>
										<div class="col-md-6 c4 mb-3">
											<div class="select1_wrapper">
												<label>Payment Mode</label>
												<div class="select1_inner">
													<select class="select2 select" id="payment_mode"
														name="payment_mode" style="width: 100%">
														<option value="1">Payment Mode</option>
														<option value="Online">Online</option>
														<option value="Offline">Offline</option>
													</select>
												</div>
											</div>
										</div>
										<div class="col-md-6 mb-3" id="ptype" style="display: none;">
											<div class="pm">
												<input type="radio" id="pay20" name="payment" value="20%">
												  <label for="pay20" style="display: block;">20%
													Payment </label><i class="fa fa-inr" style="margin: 7px;"></i><span id="tp">0</span>
											</div>
											<div class="pm">
												  <input type="radio" id="full_payment" name="payment"
													value="100%">   <label for="full_payment"
													style="display: block;">Full Payment </label>  <i class="fa fa-inr" style="margin: 7px;"></i><span id="fullp">0</span>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
						<div class="col-md-4">
							<div class="booking-inner clearfix">
								<form action="javascript:;" class="form1 clearfix"
									style="padding: 40px;">
									<div class="row">
										<div class="col-12 mb-3"
											style="border-bottom: 1px solid lightgray;">
											<h4>Price Details</h4>
										</div>
										<div class="col-md-12 mb-3"
											style="border-bottom: 1px solid lightgray;">
											<div style="display: flex; justify-content: space-between;">
												<p style="font-weight: bold;">Base Price:</p>
												<p style="float: right;">
													<i class="fa fa-inr"></i> <span id="base_price"><%=room.get(0).getPrice()%></span>/Night
												</p>
											</div>
										</div>
										<div class="col-md-12 mb-3"
											style="border-bottom: 1px solid lightgray;">
											<div style="display: flex; justify-content: space-between;">
												<p style="font-weight: bold;">No of Room:</p>
												<p style="float: right;">
													<span id="no_of_room"></span>
												</p>
											</div>
										</div>
										<div class="col-md-12 mb-3"
											style="border-bottom: 1px solid lightgray;">
											<div style="display: flex; justify-content: space-between;">
												<p style="font-weight: bold;">No of Nights:</p>
												<p style="float: right;">
													<span id="no_of_nights"></span>
												</p>
											</div>
										</div>
										<div class="col-md-12 mb-3"
											style="border-bottom: 1px solid lightgray;">
											<div style="display: flex; justify-content: space-between;">
												<p style="font-weight: bold;">Sub-Total:</p>
												<p style="float: right;">
													<i class="fa fa-inr"></i> <span id="sub_total">0</span>
												</p>
											</div>
										</div>
										
										<div class="col-md-12 mb-3"
											style="border-bottom: 1px solid lightgray;">
											<div style="display: flex; justify-content: space-between;">
												<p style="font-weight: bold;">Discount:</p>
												<p style="float: right;">
													<i class="fa fa-inr"></i> <span id="discount">0</span>
												</p>
											</div>
										</div>
										<div class="col-md-12 mb-3"
											style="border-bottom: 1px solid lightgray;">
											<div style="display: flex; justify-content: space-between;">
												<p style="font-weight: bold;">Gst:</p>
												<p style="float: right;">
													<i class="fa fa-inr"></i> <span id="gst">0</span>
												</p>
											</div>
										</div>
										<div class="col-md-12 mb-3"
											style="border-bottom: 1px solid lightgray;">
											<div style="display: flex; justify-content: space-between;">
												<p style="font-weight: bold;">Package amount:</p>
												<p style="float: right;">
													<i class="fa fa-inr"></i> <span id="pkgamt">0</span>
												</p>
											</div>
										</div>
										<div class="col-md-12 mb-3"
											style="border-bottom: 1px solid lightgray;">
											<div style="display: flex; justify-content: space-between;">
												<p class="totalamt">Total Payable Amount:</p>
												<p class="totalamt" style="float: right;">
													<i class="fa fa-inr"></i> <span id="final_amount">0</span>
												</p>
											</div>
										</div>
										<div class="col-md-12 d-flex">
										<input type="checkbox" id="gs" name="gs" >
										<label for="gs" style="display: block; margin: 10px 10px;">GST Details (Not Mandatory)</label>
											
											
										</div>
										<div class="col-md-12" id="gin" style="display: none;">
											<div class="input1_wrapper" >
												<label>GST Number</label>
												<div class="">
													<input type="text" class="form-control" id="gst_number"
														name="gst_number" placeholder="GST Number" style="padding: 20px;">
												</div>
											</div>
										</div>
										<div class="col-12 d-flex">
											<input type="checkbox" id="termsCheckbox"
												style="margin-top: -35px; margin-right: 7px;"> <label
												for="termsCheckbox" style="display: block;">I have
												read and accept the <a href="terms&conditions"
												target="_blank">terms and conditions</a>
											</label>
										</div>
										<div class="col-12 c6">
											<button type="button" class="btn-form1-submit" id="sbmt">
											  <span class="btn-text" id="bk">Book Now</span>
											  <span class="spinner" style="display: none;"></span>
											</button>
										</div>
									</div>
								</form>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../footer.jsp" />
		<div class="modal fade" id="myModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title fs-5" id="exampleModalLabel">Check-In
							Date</h3>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="wrapper">

							<div class="container-calendar">
								<h3 id="monthAndYear"></h3>

								<div class="button-container-calendar">
									<button type="button" id="previous" onclick="previous()">&#8249;</button>
									<button type="button" id="next" onclick="next()">&#8250;</button>
								</div>

								<table class="table-calendar" id="calendar" data-lang="en">
									<thead id="thead-month"></thead>
									<tbody id="calendar-body"></tbody>
								</table>

								<div class="footer-container-calendar">
									<label for="month">Jump To: </label> <select id="month"
										onchange="jump()">
										<option value=0>Jan</option>
										<option value=1>Feb</option>
										<option value=2>Mar</option>
										<option value=3>Apr</option>
										<option value=4>May</option>
										<option value=5>Jun</option>
										<option value=6>Jul</option>
										<option value=7>Aug</option>
										<option value=8>Sep</option>
										<option value=9>Oct</option>
										<option value=10>Nov</option>
										<option value=11>Dec</option>
									</select> <select id="year" onchange="jump()"></select>
								</div>

							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
		<input type="hidden" id="room_id" name="room_id"
			value="<%=room.get(0).getSno()%>">

		<!--  <div id="loader" class="loader-holder">
        <div class="block"><img src="images/hearts.svg" width="100" alt="loader"></div>
    </div> -->
	</div>

	<jsp:include page="../js.jsp" />
	<jsp:include page="../../AdminPanel/calenderjs.jsp" />
	
	<script type="text/javascript">
 const radioButtons = document.querySelectorAll('input[name="payment"]');
 const pmDivs = document.querySelectorAll('.pm');

 radioButtons.forEach(radio => {
   radio.addEventListener('change', () => {
     pmDivs.forEach(div => div.classList.remove('active'));
     radio.closest('.pm').classList.add('active');
   });
 });
 $("#payment_mode").change(function(){
	 var val = $(this).val();
	 if($(this).val() == "Online"){
		 $("#bk").html("Pay and Continue");
		 $("#ptype").css("display","block");
		
		 
		 
	 }else{
		 $("#ptype").css("display","none");
		 $("#bk").html("Book Now")
	 }
 })
 $('#gs').change(function () {
    if ($(this).is(':checked')) {
      $('#gin').css("display","block");
    } else {
    	$("#gst_number").val("");
    	$('#gin').css("display","none");
    }
  });
 function next() {
	    currentYear = (currentMonth === 11) ? currentYear + 1 : currentYear;
	    currentMonth = (currentMonth + 1) % 12;
	    var mm = parseInt(currentMonth) +1;
	    checkAvailability(); 
	    showCalendar(currentMonth, currentYear);
	}

	function previous() {
	    currentYear = (currentMonth === 0) ? currentYear - 1 : currentYear;
	    currentMonth = (currentMonth === 0) ? 11 : currentMonth - 1;
	    var mm = parseInt(currentMonth) +1;
	    checkAvailability(); 
	    showCalendar(currentMonth, currentYear);
	}

	function jump() {
	    currentYear = parseInt(selectYear.value);
	    currentMonth = parseInt(selectMonth.value);
	    var mm = parseInt(currentMonth) +1;
	    checkAvailability();
	    showCalendar(currentMonth, currentYear);
	}
	function checkAvailability(type) {
		
	    // Prevent selecting checkout before checkin
	    if (type === "checkout" && !$("#check_in").val()) {
	        alert("Please select a check-in date first.");
	        return;
	    }
	    $('#myModal').modal('toggle');

	    // Get the date input ID and value
	    var dateInputId = type === "checkin" ? "#check_in" : "#check_out";
	    var dateValue = $(dateInputId).val().trim();
	    var checkInDate = $("#check_in").val().trim();

	    var room_id = $("#room_id").val();
	    var fd = new FormData();
	    fd.append("room_id", room_id);

	    $.ajax({
	        url: 'check_availability',
	        type: 'post',
	        data: fd,
	        contentType: false,
	        processData: false,
	        success: function (data) {
	            if (data.status === 'success') {
	                if (data.data && data.data.length) {
	                    $(".available_date").removeClass("available_date").css({
	                        background: '',
	                        color: '',
	                        cursor: 'auto',
	                        boxShadow: 'none',
	                        textShadow: 'none'
	                    }).off('mouseenter mouseleave click');

	                    for (var i = 0; i < data.data.length; i++) {
	                        var d = data.data[i].available_date.split("-");
	                        var yyyy = d[0];
	                        var mm = d[1];
	                        var dd = d[2];

	                        var formattedDate = yyyy + "-" + mm + "-" + dd;

	                        // Compare for checkout
	                        if (type === "checkout" && formattedDate <= checkInDate) {
	                            continue; // skip this date
	                        }

	                        var dayNoZero = dd.startsWith('0') ? dd.substring(1) : dd;
	                        var monthNoZero = mm.startsWith('0') ? mm.substring(1) : mm;

	                        var selector = '[data-date="' + dayNoZero + '"][data-month="' + monthNoZero + '"][data-year="' + yyyy + '"]';
	                        var targetElement = $(selector);

	                        if (targetElement.length) {
	                            if (data.data[i].available_rooms != "0") {
	                                // Set styles and attributes
	                                targetElement.css({
	                                    background: 'green',
	                                    color: 'white'
	                                }).addClass('available_date');
	                                targetElement.attr('data-available', data.data[i].available_rooms);
	                                targetElement.attr('title', data.data[i].available_rooms + ' rooms available');
	                                targetElement.hover(
	                                    function () {
	                                        $(this).css({
	                                            cursor: "pointer",
	                                            color: "#ffee10",
	                                            boxShadow: "0 0 15px #ffee10",
	                                            textShadow: "0 0 15px #ffee10"
	                                        });
	                                    },
	                                    function () {
	                                        $(this).css({
	                                            cursor: "auto",
	                                            color: "white",
	                                            boxShadow: "none",
	                                            textShadow: "none"
	                                        });
	                                    }
	                                );

	                                // Click to select date
	                                targetElement.off('click').on('click', function () {
	                                    var dd = $(this).data('date');
	                                    var mm = $(this).data('month');
	                                    var yy = $(this).data('year');
	                                    var available = $(this).data('available'); // Get available rooms

	                                    var date = yy + "-" + mm.toString().padStart(2, '0') + "-" + dd.toString().padStart(2, '0');

	                                    if (type === "checkin") {
	                                        $("#check_in").val(date);
	                                        $("#check_out").val("");
	                                    } else {
	                                    	 $("#abroom").css("display","block");
	                                        $("#check_out").val(date);
	                            	    	var cin = $("#check_in").val();
	                            			var fd = new FormData();
	                            			fd.append("room_id", room_id);
	                            			fd.append("check_in", cin);
	                            			fd.append("check_out", date);
	                            			$.ajax({
	                            				url : 'check_room',
	                            				type : 'post',
	                            				data : fd,
	                            				contentType : false,
	                            				processData : false,
	                            				success : function(data) {
	                            					if (data['status'] == 'success') {
	                            						$("#nroom").html(data['data'][0].available_rooms); // Show available rooms
	                            						
	                            					} else {
	                            						Swal.fire({
	                            							icon : 'Opps',
	                            							title : 'Warning!',
	                            							text : 'Invalid Details'
	                            						})
	                            					}
	                            				}
	                            			});
	                                        calculateNights();
	                                    }

	                                    $('#myModal').modal('toggle');
	                                });
	                            } else {
	                                targetElement.css({
	                                    background: 'red',
	                                    color: 'white'
	                                }).removeClass('available_date')
	                                  .off('mouseenter mouseleave click');
	                            }
	                        }
	                    }
	                } else {
	                    console.warn('No availability data returned.');
	                }
	            } else {
	                console.error('Failed to fetch data:', data.status);
	            }
	        },
	        error: function (xhr, status, error) {
	            console.error('AJAX error:', error);
	        }
	    });
	}


	function calculateNights() {
	    var checkIn = $("#check_in").val();
	    var checkOut = $("#check_out").val();
	   

	    if (checkIn && checkOut) {
	        var startDate = new Date(checkIn);
	        var endDate = new Date(checkOut);
	        var diffTime = endDate - startDate;

	        if (diffTime > 0) {
	            var diffDays = diffTime / (1000 * 60 * 60 * 24);
	            $("#no_of_nights").html(diffDays);
	        } else {
	            $("#no_of_nights").html('');
	        }
	    } else {
	        $("#no_of_nights").html('');
	    }
	}

	$(document).ready(function () {
		  $("#booking_form").validate({
		    rules: {
		      check_in: { required: true },
		      check_out: { required: true },
		      no_of_room: { required: true, digits: true },
		      no_of_adult: { required: true, digits: true }, // Added
		      name: { required: true },
		      phone: {
		        required: true,
		        digits: true,
		        minlength: 10,
		        maxlength: 10
		      },
		      email: {
		        required: true,
		        email: true
		      },
		      city: { required: true },
		      country: { required: true },
		      termsCheckbox: { required: true },
		      payment_mode: {
		        required: true
		      }
		    },

		    errorPlacement: function (error, element) {
		      return true; // No error message
		    },

		    highlight: function (element) {
		      $(element).css("border", "2px solid red");
		    },

		    unhighlight: function (element) {
		      $(element).css("border", "1px solid #ced4da");
		    }
		  });

		  // Custom submit button logic
		  $("#sbmt").on("click", function () {
		    if ($("#booking_form").valid()) {
		    	readytopayment();
		      // You can trigger form submission or AJAX here
		    }
		  });
		});
	function readytopayment() {
		
	    if ($("#booking_form").valid() && $('#termsCheckbox').is(':checked')) {
	    	var checkedValues = $("input[name='pack_plan']:checked").map(function() {
	    	    return this.value;
	    	}).get();
	    	var packPlanIds = checkedValues.join(",");
	    	var room_id = $('#room_id').val();
	    	var check_in = $('#check_in').val();
	    	var check_out = $('#check_out').val();
	    	var no_of_room = $('#no_of_room').html();
	    	var no_of_adult = $('#no_of_adult').val();
	    	var no_of_child = $('#no_of_child').val();
	    	var name = $('#name').val();
	    	var phone = $('#phone').val();
	    	var email = $('#email').val();
	    	var city = $('#city').val();
	    	var pkgamt = $('#pkgamt').html();
	    	var country = $('#country').val();
	    	var coupon_code = $('#coupon_code').val();
	    	var gst_number = $('#gst_number').val();
	    	var gst = $('#gst').html();

	    	var base_price = $('#base_price').text().trim();
	    	var no_of_nights = $('#no_of_nights').text().trim();
	    	var sub_total = $('#sub_total').text().trim();
	    	var discount = $('#discount').text().trim();
	    	var final_amount = $('#final_amount').text().trim();
	    	var payable_amount = $('#final_amount').text().trim();

	    	var payment_mode = $('#payment_mode').val();
	    	
	    	var terms_accepted = $('#termsCheckbox').is(':checked');
	    	
			if(payment_mode === "Online"){
				var due_amount = 0;
				var payment_option = $('input[name="payment"]:checked').val() || null;

				if (!payment_option) {
				    alert("Please select a payment option");
				    return false;
				} else {
					if(payment_option === "20%"){
						final_amount = Math.round(parseFloat($("#tp").text().trim()));
						due_amount = parseFloat($('#final_amount').text().trim()) - parseFloat($("#tp").text().trim());
					}else{
						final_amount = $('#final_amount').text().trim();
					}
				}
				$("#sbmt").prop("disabled", true); 
		    	$("#sbmt .btn-text").text("Please Wait..");
		    	$("#sbmt .spinner").show();
	        $.ajax({
	            url: 'create_order',
	            data: JSON.stringify({"amount": parseFloat(final_amount)}),
	            contentType: 'application/json',
	            type: 'POST',
	            dataType: 'json',
	            success: function (data) {
	                console.log(data);
	                var response = JSON.parse(data['razorOrder']);
	                var id = response.id;

	                if (response.status === "created") {
	                    var options = {
	                        "key": "rzp_test_TAsu9r4XMXPVIJ",
	                        "amount": response.amount,
	                        "currency": "INR",
	                        "name": "Dream View Resort Heritage",
	                        "description": "Transaction",
	                        "image": "assets/image/logo_white.png",
	                        "order_id": id,
	                        "handler": function (response) {
	                            var obj = {
	                            		"room_id": room_id,
	                            		"plan_ids": packPlanIds,
	                            		"check_in": check_in,
	                            	    "check_out": check_out,
	                            	    "no_of_rooms": no_of_room,
	                            	    "adult": no_of_adult,
	                            	    "child": no_of_child,
	                            	    "name": name,
	                            	    "mobile_number": phone,
	                            	    "gst_number": gst_number,
	                            	    "email": email,
	                            	    "city": city,
	                            	    "country": country,
	                            	    "coupon_code": coupon_code,
	                            	    "base_price": base_price,
	                            	    "night": no_of_nights,
	                            	    "sub_total": sub_total,
	                            	    "discount": discount,
	                            	    "total_amount": payable_amount,
	                            	    "paid_amount": final_amount,
	                            	    "due_amount": due_amount,
	                            	    "gst_amount": gst,
	                            	    "package_amount": pkgamt,
	                            	    "payment_mode": payment_mode,
	                            	    "payment_type": payment_option,
	                                "razorpay_payment_id": response.razorpay_payment_id,
	                                "razorpay_order_id": response.razorpay_order_id,
	                                "razorpay_signature": response.razorpay_signature,
	                                "placedBy": "Customer",
	                                "order_id": id,
	                            };
	                            $.ajax({
	                                url: 'reserve_room',
	                                type: 'post',
	                                dataType: 'json',
	                                data: JSON.stringify(obj),
	                                contentType: 'application/json',
	                                success: function (data) {
	                                    if (data['status'] === 'Success') {
	                                        $(".text-success").css("display", "block");
	                                        var booking_id = data['bid'];
	                                        $("#sbmt .btn-text").text("Booking Confirmed");
                                        	$("#sbmt .spinner").hide();
	                                        setTimeout(function () {
	                                            var mapForm = document.createElement("form");
		                                        mapForm.method = "POST";
		                                        mapForm.action = "thank_you";
		                                        var output = document.createElement("input");
		                                        output.type = "hidden";
		                                        output.name = "booking_id";
		                                        output.value = booking_id;
		                                        mapForm.appendChild(output);
		                                        document.body.appendChild(mapForm);
		                                        mapForm.submit();
	                                        }, 1000);

	                                    } else {
	                                        swal({
	                                            title: "Oops!",
	                                            text: "Something went wrong!",
	                                            icon: "error",
	                                            type: 'error',
	                                            button: "oh no!",
	                                            allowOutsideClick: false,
	                                            allowEscapeKey: false
	                                        });
	                                    }
	                                }
	                            });

	                            console.log(response);
	                        },
	                        "prefill": {
	                            "name": name,
	                            "email": email,
	                            "contact": phone
	                        },
	                        "notes": {
	                            "address": ""
	                        },
	                        "theme": {
	                            "color": "#3399cc"
	                        }
	                    };

	                    var rzp1 = new Razorpay(options);
	                    rzp1.open(); // This line opens the Razorpay payment modal

	                } else {
	                    alert(response.status);
	                }
	            }

	        });
	    }else{
	    	$("#sbmt").prop("disabled", true); 
	    	$("#sbmt .btn-text").text("Please Wait..");
	    	$("#sbmt .spinner").show();
	    	var obj = {
            		"room_id": room_id,
            		"plan_ids": packPlanIds,
            		"check_in": check_in,
            	    "check_out": check_out,
            	    "no_of_rooms": no_of_room,
            	    "adult": no_of_adult,
            	    "child": no_of_child,
            	    "name": name,
            	    "mobile_number": phone,
            	    "email": email,
            	    "city": city,
            	    "country": country,
            	    "package_amount": pkgamt,
            	    "coupon_code": coupon_code,
            	    "base_price": base_price,
            	    "night": no_of_nights,
            	    "sub_total": sub_total,
            	    "discount": discount,
            	    "total_amount": payable_amount,
            	    "paid_amount": final_amount,
            	    "due_amount": due_amount,
            	    "gst_amount": gst,
            	    "payment_mode": payment_mode,
            	    "payment_type": payment_option,
            };
            $.ajax({
                url: 'reserve_room',
                type: 'post',
                dataType: 'json',
                data: JSON.stringify(obj),
                contentType: 'application/json',
                success: function (data) {
                    if (data['status'] === 'Success') {
                        $(".text-success").css("display", "block");
                        var booking_id = data['bid'];
                        $("#sbmt .btn-text").text("Booking Confirmed");
                    	$("#sbmt .spinner").hide();
                        setTimeout(function () {
                            var mapForm = document.createElement("form");
                            mapForm.method = "POST";
                            mapForm.action = "thank_you";
                            var output = document.createElement("input");
                            output.type = "hidden";
                            output.name = "booking_id";
                            output.value = booking_id;
                            mapForm.appendChild(output);
                            document.body.appendChild(mapForm);
                            mapForm.submit();
                        }, 1000);

                    } else {
                        swal({
                            title: "Oops!",
                            text: "Something went wrong!",
                            icon: "error",
                            type: 'error',
                            button: "oh no!",
                            allowOutsideClick: false,
                            allowEscapeKey: false
                        });
                    }
                }
            });
	    }
	    } else {
	        return;
	    }
	}
	
	function calr() {
	    var adult = parseInt($("#no_of_adult").val()) || 0;
	    var maxAdultsPerRoom = 2;

	    if (adult < 1) {
	        alert("Minimum 1 adult is required");
	        $(this).val(1);
	        adult = 1;
	    }
	    var room = Math.ceil(adult / maxAdultsPerRoom);
	    var r = $("#nroom").html();
	    if(parseFloat(room) > parseFloat(r)){
	    	alert("Only "+r+ "room available and only 2 adult allow in 1 room");
	    	$("#no_of_room").html("");
	    	$("#no_of_adult").val("1");
	    	$("#no_of_child").val("0");
	    }else{
	    	 $("#no_of_room").html(room);
	    	 
	            var nt = $("#no_of_nights").html();
	            var b = parseFloat($("#base_price").html()) * parseFloat(room);
	            var d = $("#discount").html();
	            var subt = parseFloat(nt) * parseFloat(b);
	            var t = parseFloat(subt) - parseFloat(d);
	            var gs ="";
	            if(parseFloat(t) > 15000){
	            	gs = parseFloat(t) * 18/100;
	            }else{
	            	gs = parseFloat(t) * 12/100;
	            }
	            var pkg = $("#pkgamt").html();
	            var tot = parseFloat(t) + parseFloat(gs) + parseFloat(pkg);
	            $("#gst").html(gs);
	            $("#sub_total").html(subt);
	            $("#final_amount").html(tot);
	            $("#fullp").html(tot);
	           
	            var tn = parseFloat(tot) *20/100;
	            $("#tp").html(tn);
	    }
	}

	function apply_coupon() {
		var coupon_code =$("#coupon_code").val();
		var fd = new FormData();
		fd.append("coupon_code", coupon_code);
		$.ajax({
			url : 'get_data',
			type : 'post',
			data : fd,
			contentType : false,
			processData : false,
			success : function(data) {
				if (data['status'] == 'Success') {
					var amount = data['data'][0].coupon_value;
					if(data['data'][0].type === "Percentage"){
						var sub = $("#sub_total").html();
						if(parseFloat(sub) > 0){
							var amt = parseFloat(sub) * parseFloat(amount)/100;
							$("#discount").html(amt);
							calr();
						}
					}else{
						$("#discount").html(amount);
						calr();
					}
					
				} else {
					alert("Invalid Coupon code!!!!")
				}
			}
		});

	}
	
	$(function() {
	    $('.pack-checkbox').change(function() {
	      let total = 0;
	      let checkedBoxes = $('.pack-checkbox:checked');

	      checkedBoxes.each(function() {
	        total += parseFloat($(this).data('price'));
	      });

	      if (checkedBoxes.length > 0) {
	        $('#pkgamt').text(total.toFixed(2));
	        calr();
	      } else {
	        $('#pkgamt').text('0');
	        calr();
	      }
	    });
	});
 </script>

</body>

</html>