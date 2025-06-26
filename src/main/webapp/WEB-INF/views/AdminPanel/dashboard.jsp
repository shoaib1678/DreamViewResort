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
<style>
    .calendar-wrapper {
      margin: auto;
    }

    .tabs {
      display: flex;
      margin-bottom: 20px;
    }

    .tab-btn {
      padding: 10px 20px;
      cursor: pointer;
      background: #eee;
      margin-right: 5px;
      border: 1px solid #ccc;
      border-bottom: none;
    }

    .tab-btn.active {
      background: #fff;
      font-weight: bold;
      border-bottom: 1px solid #fff;
    }

    .tab-content {
      display: none;
    }

    .tab-content.active {
        display: grid;
	    grid-template-columns: repeat(7, 1fr);
	    gap: 0.5px;
    }

    .room-calendar-header {
      padding: 6px;
      background: #f3f3f3;
      font-weight: bold;
      text-align: center;
      border: 1px solid #ddd;
    }

    .room-calendar-day {
      background: #fff;
      min-height: 100px;
      border: 1px solid #ddd;
      box-sizing: border-box;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      padding: 6px;
      font-size: 12px;
      width: 160px;
    }

    .price {
      font-weight: bold;
      color: #333;
      font-size: 14px;
      text-align: left;
    }

    .rooms {
      font-size: 11px;
      max-height: 60px;
      overflow-y: auto;
      display: flex;
      flex-wrap: wrap;
      gap: 2px;
      justify-content: center;
    }

    .room-green, .room-red {
      color: #fff;
      padding: 2px 4px;
      border-radius: 4px;
      font-size: 10px;
      min-width: 32px;
      text-align: center;
      display: inline-block;
    }

    .room-green {
    	background-color: #dc3545;
     
    }

    .room-red {
      background-color: #28a745;
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
							<% if (rooms.size() > 0) {
							     for (int i = 0; i < rooms.size(); i++) {
							         Rooms r = rooms.get(i);
							%>
							<div class="col-lg-4 col-md-4 col-12 mb-4">
							    <div class="card">
							        <div class="card-body d-flex align-items-center justify-content-between">
							            <div class="form-check form-switch mb-2">
							                <input class="form-check-input amenity"
							                       type="checkbox"
							                       id="room_id<%=r.getSno()%>"
							                       value="<%=r.getSno()%>"
							                       name="room_select"
							                       <%= (i == 0 ? "checked" : "") %> >
							                <label class="form-check-label" for="room_id<%=r.getSno()%>"><%=r.getTitle()%></label>
							            </div>
							        </div>
							    </div>
							</div>
							<% } } %>

							<div class="col-lg-12 col-md-12 ">
								<div class="row">
									<div class="col-lg-12 col-md-12 col-12 mb-4">
											<div class="card">
												<div class="card-body  d-flex align-items-center justify-content-between">
													<div class="calendar-wrapper">
													  <h2>Room Calendar - Last 60 Days</h2>
													
													  <!-- Tabs -->
													  <div class="tabs">
													    <div class="tab-btn active" onclick="switchTab(0)">First 30 Days</div>
													    <div class="tab-btn" onclick="switchTab(1)">Next 31-60 Days</div>
													  </div>
													
													  <!-- Tab Contents -->
													  <div class="tab-content active" id="tab0">
													    <!-- Header Row -->
													    <div class="room-calendar-header">Sun</div>
													    <div class="room-calendar-header">Mon</div>
													    <div class="room-calendar-header">Tue</div>
													    <div class="room-calendar-header">Wed</div>
													    <div class="room-calendar-header">Thu</div>
													    <div class="room-calendar-header">Fri</div>
													    <div class="room-calendar-header">Sat</div>
													  </div>
													
													  <div class="tab-content" id="tab1">
													    <!-- Header Row -->
													    <div class="room-calendar-header">Sun</div>
													    <div class="room-calendar-header">Mon</div>
													    <div class="room-calendar-header">Tue</div>
													    <div class="room-calendar-header">Wed</div>
													    <div class="room-calendar-header">Thu</div>
													    <div class="room-calendar-header">Fri</div>
													    <div class="room-calendar-header">Sat</div>
													  </div>
													</div>
												</div>
	
											</div>
									</div>
								</div>
							</div>

							<!-- <div class="col-md-12  ">
								<div class="row">
									<div class="col-md-12 ">
										<div class="card">
											<div class="card-body" id="yourchartDiv">
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
											</div>
										</div>
									</div>
								</div>
							</div> -->
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
	$(document).ready(function() {
	    $('input[name="room_select"]').on('change', function() {
	        $('input[name="room_select"]').not(this).prop('checked', false);
	    });
	});
	/* function next() {
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
		getavailabilitydata(room_id);
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
	} */
</script>
<script>
$(document).ready(function() {
    $('input[name="room_select"]').on('change', function() {
        $('input[name="room_select"]').not(this).prop('checked', false);
        if ($(this).is(':checked')) {
            let roomId = $(this).val();
            getavailabilitydata(roomId);
        }
    });

    // Trigger the function initially for the default selected checkbox
    let defaultRoomId = $('input[name="room_select"]:checked').val();
    if (defaultRoomId) {
    	getavailabilitydata(defaultRoomId);
    }
});
function generateRoomDivsForDate(availableRooms, allRooms) {
    return allRooms.map(function(room) {
        const isBooked = !availableRooms.includes(room);
        return '<div class="' + (isBooked ? 'room-red' : 'room-green') + '">' + room + '</div>';
    }).join('');
}

function getavailabilitydata(room_id) {
    var tab0 = document.getElementById("tab0");
    var tab1 = document.getElementById("tab1");
    tab0.innerHTML = '';
    tab1.innerHTML = '';

    var fd = new FormData();
    fd.append("room_id", room_id);

    $.ajax({
        url: 'check_availability',
        type: 'post',
        data: fd,
        contentType: false,
        processData: false,
        success: function(data) {
            if (data.status === "success") {
                const availabilityData = data.data;
                const allRooms = data.total_room ? data.total_room.split(',').map(s => s.trim()) : [];

                availabilityData.forEach(function(dayInfo, i) {
                    const date = new Date(dayInfo.available_date);
                    const day = date.getDate();
                    const month = date.toLocaleString('default', { month: 'short' });

                    let bookedRooms = [];
                    if (dayInfo.room_number) {
                        bookedRooms = dayInfo.room_number.split(',').map(s => s.trim());
                    }

                    const availableRooms = allRooms.filter(r => !bookedRooms.includes(r));
                    const div = document.createElement('div');
                    div.className = 'room-calendar-day';
                    div.innerHTML =
                        '<div class="price">' + day + ' ' + month + '</div>' +
                        '<div class="rooms">' + generateRoomDivsForDate(availableRooms, allRooms) + '</div>';

                    if (i < 30) {
                        tab0.appendChild(div);
                    } else {
                        tab1.appendChild(div);
                    }
                });
            } else {
                alert("Error: " + data.message);
            }
        },
        error: function(xhr, status, error) {
            console.error("AJAX error:", status, error);
            alert("Failed to load room availability.");
        }
    });
}

// Call default on page load with room_id = 3
$(document).ready(function() {
    $("#room_id").val("3"); // optional default set
    getavailability();
});

function switchTab(index) {
    document.querySelectorAll('.tab-btn').forEach((btn, i) => {
        btn.classList.toggle('active', i === index);
    });
    document.querySelectorAll('.tab-content').forEach((tab, i) => {
        tab.classList.toggle('active', i === index);
    });
}
</script>





</body>
</html>
