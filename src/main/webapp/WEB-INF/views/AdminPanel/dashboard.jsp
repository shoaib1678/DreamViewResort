<!DOCTYPE html>
<%@page import="com.shoaib.modal.Rooms"%>
<%@page import="java.util.List"%>
<html lang="en"
	class="light-style layout-navbar-fixed layout-menu-fixed" dir="ltr"
	data-theme="theme-default" data-assets-path="assets/adminpanel/"
	data-template="vertical-menu-template">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<jsp:include page="css.jsp"></jsp:include>
<jsp:include page="calendercss.jsp"></jsp:include>

<style type="text/css">
	.avatar {
		display: flex;
		justify-content: center;
		align-items: center;
		    width: 3rem;
    		height: 3rem;
	}
	.bg-info{
		background: #d6f5fc !important;
	}
	.bg-warning{
		background: #fef4e4 !important;
	}
	.bg-success{
		background: #e4fdd8  !important;
	}
	.available-date {
    transition: transform 0.2s ease, border 0.2s ease;
    border: 2px solid transparent;
    border-radius: 4px;
}

.available-date:hover {
    transform: scale(1.1);
    border: 1px solid yellow !important;
    box-shadow: 0 0 5px rgba(255, 255, 255, 0.8);
    z-index: 10;
    background: #00ae00 !important;
}
.table-calendar td, .table-calendar th {
    padding: 30px 10px !important;
    }
    .container-calendar {
    max-width: 100% !important;
}
	
</style>
</head>
<%
List<Rooms> rooms = (List<Rooms>)request.getAttribute("rooms");
%>
<body>
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<!-- Menu -->
			<jsp:include page="header.jsp"></jsp:include>
			<!-- / Menu -->

			<!-- Layout container -->
			<div class="layout-page">
				<!-- Navbar -->
				<jsp:include page="nav.jsp"></jsp:include>
				<!-- / Navbar -->

				<!-- Content wrapper -->
				<div class="content-wrapper">
					<!-- Content -->

					<div class="container-xxl flex-grow-1 container-p-y">
						<div class="row">
							
							<div class="col-lg-12 col-md-12 ">
								<div class="row">
									<div class="col-lg-3 col-md-3 col-6 mb-4">
										<a href="enquiry">
											<div class="card">
												<div class="card-body  d-flex align-items-center justify-content-between">
													<div>
														<span class=" fw-semibold mb-1">All Enquiry</span>
														<h3 class="card-title mt-3 mb-0">sadfgsd</h3>
													</div>
													<div class="avatar flex-shrink-0 bg-info rounded ">
															<i class="fas fa-question-circle text-info fs-3"></i>
														</div>
												</div>
	
											</div>
										</a>
										
									</div>
									<div class="col-lg-3 col-md-3 col-6 mb-4">
									<a href="enquiry">
										<div class="card">
											<div class="card-body  d-flex align-items-center justify-content-between">
												<div>
													<span class=" fw-semibold mb-1">Pending Enquiry</span>
													<h3 class="card-title mt-3 mb-0">dgfh</h3>
												</div>
												<div class="avatar flex-shrink-0 rounded " style="background: #f5454545;">
														<i class="fas fa-question-circle text-danger fs-3"></i>
													</div>
											</div>

										</div>
									</a>
										
									</div>
									<div class="col-lg-3 col-md-3 col-6 mb-4">
										<a href="enquiry">
											<div class="card">
											<div class="card-body  d-flex align-items-center justify-content-between">
												<div>
													<span class=" fw-semibold mb-1">Completed Enquiry</span>
													<h3 class="card-title mt-3 mb-0">43</h3>
												</div>
												<div class="avatar flex-shrink-0 bg-warning rounded ">
														<i class='fas fa-question-circle text-success fs-3'></i>
													</div>
											</div>

										</div>
										</a>
										
									</div>
									<div class="col-lg-3 col-md-3 col-6 mb-4">
										<a href="customer">
											<div class="card">
											<div class="card-body  d-flex align-items-center justify-content-between">
												<div>
													<span class=" fw-semibold mb-1">Customers</span>
													<h3 class="card-title mt-3 mb-0">45</h3>
												</div>
												<div class="avatar flex-shrink-0 ">
														<div class="avatar flex-shrink-0 bg-success rounded ">
														<i class='bx bxs-user text-success fs-3'></i>
													</div>
													</div>
											</div>

										</div>
										</a>
										
									</div>
									
								</div>
							</div>

							<div class="col-md-12  ">
								<div class="row">
									<div class="col-md-12 ">
										<div class="card">
											<div class="card-body" id="yourchartDiv">
													<div class="mb-3" style="padding: 0px 30px;">
														<!-- <label>Rooms</label> -->
														<select class="form-control" id="room_id" name="room_id" onchange="getavailability()">
														<option selected disabled>--Select Room--</option>
														<%if(rooms != null){
															for(Rooms r: rooms){%>
															<option value="<%=r.getSno()%>"><%=r.getTitle()%></option>
														<%}} %>
														</select>
													</div>
													<div class="container-calendar">
															<h3 id="monthAndYear" style="transform: translateY(40px);"></h3>
								
															<div class="button-container-calendar">
																<button id="previous" onclick="previous()">&#8249;</button>
																<button id="next" onclick="next()">&#8250;</button>
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
												<!-- <div class="row">
													<div class="col-md-4">
													
													</div>
													<div class="col-md-6">
														
													</div>
													
												</div> -->
												
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- / Content -->
					<jsp:include page="footer.jsp"></jsp:include>

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
	</div>
	<!-- / Layout wrapper -->

	<!-- Core JS -->
	<jsp:include page="js.jsp"></jsp:include>
	<jsp:include page="calenderjs.jsp"></jsp:include>
	
	<script>
	function next() {
	    currentYear = (currentMonth === 11) ? currentYear + 1 : currentYear;
	    currentMonth = (currentMonth + 1) % 12;
	    var mm = parseInt(currentMonth) +1;
	    getavailability(); 
	    showCalendar(currentMonth, currentYear);
	}

	function previous() {
	    currentYear = (currentMonth === 0) ? currentYear - 1 : currentYear;
	    currentMonth = (currentMonth === 0) ? 11 : currentMonth - 1;
	    var mm = parseInt(currentMonth) +1;
	    getavailability(); 
	    showCalendar(currentMonth, currentYear);
	}

	function jump() {
	    currentYear = parseInt(selectYear.value);
	    currentMonth = parseInt(selectMonth.value);
	    var mm = parseInt(currentMonth) +1;
	    getavailability();
	    showCalendar(currentMonth, currentYear);
	}
	getavailability();
	function getavailability() {
		var room_id = $("#room_id").val();
	    var fd = new FormData();
	    fd.append("room_id", room_id);
	    $.ajax({
	        url: 'check_availability',
	        type: 'post',
	        data: fd,
	        contentType: false,
	        processData: false,
	        success: function(data) {
	            if (data.status === 'success') {
	            	if (data.data && data.data.length) {
	            	    for (var i = 0; i < data.data.length; i++) {
	            	        var d = data.data[i].available_date.split("-");
	            	        var sd = d[2].split("");
	            	        if (sd[0] === "0") {
	            	            d[2] = sd[1];
	            	        }
	            	        var md = d[1].split("");
	            	        if (md[0] === "0") {
	            	            d[1] = md[1];
	            	        }

	            	        var selector = '[data-date="' + d[2] + '"][data-month="' + d[1] + '"][data-year="' + d[0] + '"]';
	            	        const targetElement = $(selector);

	            	        if (targetElement.length) {
	            	            if (data.data[i].available_rooms != "0") {
	            	                targetElement
	            	                    .css({ background: 'green', color: 'white', cursor: 'pointer' })
	            	                    .addClass('available-date') // 👈 Add CSS class for zoom effect
	            	                    .attr('data-available', 'Available Rooms: ' + data.data[i].available_rooms);

	            	                // Tooltip logic (optional)
	            	                targetElement.hover(function (e) {
	            	                    const tooltip = $('<div class="custom-tooltip"></div>').text($(this).attr('data-available'));
	            	                    $('body').append(tooltip);
	            	                    tooltip.css({
	            	                        position: 'absolute',
	            	                        top: e.pageY + 10 + 'px',
	            	                        left: e.pageX + 10 + 'px',
	            	                        background: '#333',
	            	                        color: '#fff',
	            	                        padding: '5px 10px',
	            	                        borderRadius: '5px',
	            	                        fontSize: '12px',
	            	                        zIndex: 9999,
	            	                        whiteSpace: 'nowrap'
	            	                    }).fadeIn('fast');

	            	                    $(this).on('mousemove.tooltip', function (e) {
	            	                        tooltip.css({ top: e.pageY + 10 + 'px', left: e.pageX + 10 + 'px' });
	            	                    });
	            	                }, function () {
	            	                    $('.custom-tooltip').remove();
	            	                    $(this).off('mousemove.tooltip');
	            	                });
	            	            } else {
	            	                targetElement.css({ background: 'red', color: 'white' });
	            	            }
	            	        }
	            	    }
	            	}

 else {
	                    console.warn('No attendance data found.');
	                }
	            } else {
	                console.error('Failed to retrieve attendance data. Status:', data.status);
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error('Error occurred during the AJAX request:', error);
	        }
	    });
	}
</script>
</body>
</html>
