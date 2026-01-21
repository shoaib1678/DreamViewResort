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

<style>
.calendar-wrapper {
  margin: auto;
  width: 100%;
  background: #ffffff;
  border-radius: 18px;
  box-shadow: 0 8px 30px rgba(0, 0, 0, 0.08);
  overflow: hidden;
  padding: 25px;
  animation: fadeIn 0.6s ease;
}

@keyframes fadeIn {
  from { opacity: 0; transform: translateY(10px); }
  to { opacity: 1; transform: translateY(0); }
}

.calendar-wrapper h2 {
  text-align: center;
  font-size: 24px;
  color: #222;
  font-weight: 700;
  margin-bottom: 25px;
  letter-spacing: 0.6px;
}

/* Tabs */
.tabs {
  display: flex;
  justify-content: center;
  margin-bottom: 15px;
  border-bottom: 2px solid #eee;
}
.tab-btn {
  padding: 10px 22px;
  cursor: pointer;
  border: none;
  background: transparent;
  font-weight: 600;
  color: #666;
  border-bottom: 3px solid transparent;
  transition: all 0.3s ease;
}
.tab-btn:hover {
  color: #007bff;
}
.tab-btn.active {
  color: #007bff;
  border-bottom: 3px solid #007bff;
}

/* Calendar Layout */
.tab-content {
  display: none;
}
.tab-content.active {
  display: grid;
  grid-template-columns: repeat(7, 1fr);
  gap: 10px;
  margin-top: 15px;
}

/* Weekday Header */
.room-calendar-header {
  text-align: center;
  font-weight: 700;
  padding: 12px 0;
  color: #fff;
  background: linear-gradient(135deg, #007bff, #00c3ff);
  border-radius: 12px;
  font-size: 15px;
  box-shadow: 0 2px 6px rgba(0, 123, 255, 0.25);
}

/* Animated Border Effect */
.room-calendar-day {
  position: relative;
  background: #ffffff;
  border-radius: 14px;
  padding: 10px;
  min-height: 130px;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  overflow: hidden;
  z-index: 1;
}

.room-calendar-day::before {
     content: "";
    position: absolute;
    inset: 0;
    border-radius: 14px;
    padding: 3px;
    background: linear-gradient(120deg, #c1302a, #0d3562, #46c96b);
    background-size: 200% 200%;
    animation: borderFlow 2s linear infinite;
    -webkit-mask: linear-gradient(#41c364 0 0) content-box, linear-gradient(#fff 0 0);
    -webkit-mask-composite: xor;
    mask-composite: exclude;
}

@keyframes borderFlow {
  0% { background-position: 0% 50%; }
  50% { background-position: 100% 50%; }
  100% { background-position: 0% 50%; }
}

/* Date Label */
.price {
  font-weight: 700;
  color: #0d3562;
  font-size: 16px;
  margin-bottom: 8px;
}

/* Room Status Section */
.rooms {
  display: flex;
  flex-wrap: wrap;
  gap: 6px;
  justify-content: center;
  margin-top: 6px;
  max-height: 75px;
  overflow: hidden;
}

/* Booking Status Colors */
.room-green, .room-red {
  color: #fff;
  padding: 5px 8px;
  border-radius: 6px;
  font-size: 12px;
  font-weight: 600;
  min-width: 45px;
  text-align: center;
  position: relative;
  z-index: 2;
  transition: 0.3s;
}

.room-green {
  background: linear-gradient(135deg, #dc3545, #ff6b6b); /* RED for Booked */
  box-shadow: 0 0 10px rgba(255, 0, 0, 0.25);
}

.room-red {
  background: linear-gradient(135deg, #28a745, #4dd174); /* GREEN for Available */
  box-shadow: 0 0 10px rgba(0, 255, 100, 0.25);
}

.room-green:hover, .room-red:hover {
  transform: scale(1.1);
}

/* Responsive Layout */
@media (max-width: 992px) {
  .tab-content.active {
    grid-template-columns: repeat(3, 1fr);
  }
}
@media (max-width: 576px) {
  .tab-content.active {
    grid-template-columns: repeat(2, 1fr);
  }
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
													 <h2><i class="bx bx-calendar text-primary"></i> Room Availability Calendar (Last 60 Days)</h2>
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
