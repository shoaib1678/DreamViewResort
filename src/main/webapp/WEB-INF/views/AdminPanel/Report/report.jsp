<!DOCTYPE html>
<%@page import="com.shoaib.modal.PackagePlan"%>
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
.room_box{
 background: lightgray;
/*  padding-bottom: 15px; */
 margin: 0px;
}
</style>

</head>
<%
List<Rooms> room = (List<Rooms>)request.getAttribute("rooms");
List<PackagePlan> plan = (List<PackagePlan>)request.getAttribute("plan");
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
								<div class="col-12">
									<button class="btn btn-secondary btn-sm  add-new btn-primary"
										id="clear_btn" data-bs-toggle="modal" type="button"
										data-bs-target="#tenderform">
										<span><i class="bx bx-plus me-0 me-sm-1"></i><span
											class="d-none d-sm-inline-block">Add Booking Details</span></span>
									</button>
									<button class="btn btn-secondary btn-sm  add-new btn-primary"
										id="clear_btn" data-bs-toggle="modal" type="button"
										data-bs-target="#report_modal">
										<span><i class="bx bx-plus me-0 me-sm-1"></i><span
											class="d-none d-sm-inline-block">Generate Report</span></span>
									</button>
								</div>
							</div>
							<div class="row p-4">
								<div class="col-12">
									<div class="card-datatable table-responsive">
										<table id="zone_table" class="table nowrap"
											style="width: 100%">
											<thead class="bg-primary">
												<tr>
													<th class="text-white text-center">Customer Name</th>
													<th class="text-white text-center">City</th>
													<th class="text-white text-center">Mobile Number</th>
													<th class="text-white text-center">Room Name</th>
													<th class="text-white text-center">Check-in Date</th>
													<th class="text-white text-center">Check-out Date</th>
													<th class="text-white text-center">Night</th>
													<th class="text-white text-center">Room Nos</th>
													<th class="text-white text-center">E-Bed</th>
													<th class="text-white text-center">Rent/Night</th>
													<th class="text-white text-center">E-Bed Charge/Night</th>
													<th class="text-white text-center">Guest</th>
													<th class="text-white text-center">Total Room Charge</th>
													<th class="text-white text-center">Total E-Bed Charge</th>
													<th class="text-white text-center">Taxable Amount</th>
													<th class="text-white text-center">GST(%)</th>
													<th class="text-white text-center">Total Amount</th>
													<th class="text-white text-center">Plan Name</th>
													<!-- <th class="text-white text-center">Base Price</th> -->
													<th class="text-white text-center">GST(%)</th>
													<th class="text-white text-center">Plan Price</th>
													<th class="text-white text-center">Final Price</th>
													<th class="text-white text-center">Net Amount</th>
													<th class="text-white text-center">Paid  Amount</th>
													<th class="text-white text-center">Balance Amount</th>
													<th class="text-white text-center">Final Amount Date</th>
													<th class="text-white text-center">Action</th>
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
	<div class="modal fade" id="tenderform" data-bs-backdrop="static" tabindex="-1">
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header" style="border-bottom: 1px solid lightgray;">
            <h6>Booking Details</h6>
                <button type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
             <form name="category_form" id="category_form">
					<div class="modal-body">
						<div class="nav-align-top mb-4">
							<div class="row">
								<div class=" col-lg-4 mb-6 mt-1">
									<label class="form-label" for="name">Customer Name<span style="color: red;">*</span></label> <input
										type="text" class="form-control" id="name" placeholder=" "
										name="name" aria-label=" " />
								</div>
								<div class=" col-lg-4 mb-6 mt-1">
									<label class="form-label" for="city">City<span style="color: red;">*</span></label> <input
										type="text" class="form-control" id="city" placeholder=" "
										name="city" aria-label=" " />
								</div>
								<div class=" col-lg-4 mb-6 mt-1">
									<label class="form-label" for="mobile_number">Mobile Number<span style="color: red;">*</span></label> <input
										type="text" class="form-control" id="mobile_number" placeholder=" "
										name="mobile_number" aria-label=" " />
								</div>
								<div class=" col-lg-4 mb-6 mt-1">
									<label class="form-label" for="booking_date">Check-in Date<span style="color: red;">*</span></label> <input
										type="date" class="form-control" id="booking_date" placeholder=" "
										name="booking_date" aria-label=" "/>
								</div>
								<div class=" col-lg-4 mb-6 mt-1">
									<label class="form-label" for="booking_date">Check-out Date<span style="color: red;">*</span></label> <input
										type="date" class="form-control" id="check_date" placeholder=" "
										name="check_date" aria-label=" "/>
								</div>
								<div class="col-md-4 mb-3">
				                	<label class="form-label" for="night">No of night <span style="color: red;">*</span></label>
				                    <input type="text" class="form-control number" id="night" name="night" disabled/>
				                </div>
								<% if (room.size() > 0) {
							     for (int i = 0; i < room.size(); i++) {
							         Rooms r = room.get(i);
								%>
								<div class="col-lg-4 col-md-4 col-12 mb-4">
								            <div class="form-check form-switch mb-2">
								                <input class="form-check-input amenity"
								                       type="checkbox"
								                       id="room_id<%=r.getSno()%>"
								                       value="<%=r.getSno()%>"
								                       name="room_select" onchange="getroomNumber(<%=r.getSno()%>, this)">
								                <label class="form-check-label" for="room_id<%=r.getSno()%>"><%=r.getTitle()%></label>
								            </div>
								            <div class="col-md-12">
										<div class="row room_box" id="room_box<%=r.getSno()%>">
										    <!-- Dynamically injected col-3 room checkboxes will appear here -->
										</div>
									</div>
								</div>
								<% } } %>
								<%-- <div class=" col-lg-6 mb-6 mt-1">
									<label class="form-label" for="category_name">Room Name<span style="color: red;">*</span></label> 
									<select class="form-control" id="room" name="room" onchange="getroomNumber()">
										<option selected disabled>--Select Room--</option>
										<%if(room != null){
											for(Rooms r : room){%>
										<option value="<%=r.getSno()%>"><%=r.getTitle()%></option>
										<%}} %>
									</select>
								</div> --%>
							<div class="col-md-4 mb-3">
			                	<label class="form-label" for="troom">Total room<span style="color: red;">*</span></label>
			                    <input type="text" class="form-control decimalOnly" id="troom" name="troom" disabled/>
			                </div>
							
							<div class="col-md-4 mb-3">
			                	<label class="form-label" for="rent">No of Guest<span style="color: red;">*</span></label>
			                	<div style="display: flex;">
			                	<input type="text" class="form-control number" id="adult" name="adult" placeholder="Adult"/>
			                    <input type="text" class="form-control number" id="child" name="child" placeholder="Child"/>
			                	</div>
			                </div>
							<div class="col-md-4 mb-3">
			                	<label class="form-label" for="rent">Rent / Night (in INR) <span style="color: red;">*</span></label>
			                    <input type="text" class="form-control decimalOnly" id="rent" name="rent"/>
			                </div>
			                <div class="col-md-4 mb-3">
			                    <label class="form-label" for="bed_charge">Extra Bed charge <span style="color: red;">*</span></label> 
			                     <input type="text"  class="form-control decimalOnly" id="bed_charge" name="bed_charge"/>
			                </div>                  	 
			                <div class="col-md-4 mb-3">
			                    <label class="form-label" for="extra_bed">No of Extra Bed <span style="color: red;">*</span></label> 
			                     <input type="text"  class="form-control number" id="extra_bed" name="extra_bed"/>
			                </div>                  	 
			                <div class="col-md-4 mb-3">
			                	<label class="form-label" for="trent">Total room Rent<span style="color: red;">*</span></label>
			                    <input type="text" class="form-control decimalOnly" id="trent" name="trent" disabled/>
			                </div>
			                <div class="col-md-4 mb-3">
			                    <label class="form-label" for="tbed_charge">Total E-Bed charge <span style="color: red;">*</span></label> 
			                     <input type="text"  class="form-control decimalOnly" id="tbed_charge" name="tbed_charge" disabled/>
			                </div>  
			                <div class="col-md-4 mb-3">
			                    <label class="form-label" for="taxable_amount">Taxable Amount<span style="color: red;">*</span></label> 
			                     <input type="text"  class="form-control decimalOnly" id="taxable_amount" name="taxable_amount" disabled/>
			                </div>          
			                <div class="col-md-4 mb-3">
			                    <label class="form-label" for="room_gst">GST(%)<span style="color: red;">*</span></label> 
			                     <input type="text"  class="form-control decimalOnly" id="room_gst" name="room_gst"/>
			                </div>   
			                <div class="col-md-4 mb-3">
			                    <label class="form-label" for="total_amount">Total Amount<span style="color: red;">*</span></label> 
			                     <input type="text"  class="form-control decimalOnly" id="total_amount" name="total_amount" disabled/>
			                </div>         
								<div class=" col-lg-4 mb-6 mt-1">
									<label class="form-label" for="plan_id">Package Plan<span style="color: red;">*</span></label> 
									<select class="form-control" id="plan_id" name="plan_id">
										<option selected disabled>--Select Plan--</option>
										<%if(plan != null){
											for(PackagePlan r : plan){%>
												<option value="<%=r.getSno()%>"><%=r.getPlan_name()%></option>
										<%}} %>
									</select>
								</div>
								<div class="col-lg-4 mb-6 mt-1" style="display: none;">
									<label class="form-label" for="base_price">Base Price<span style="color: red;">*</span></label> <input
										type="text" class="form-control decimalOnly" id="base_price" placeholder=" "
										name="base_price" aria-label=" " disabled/>
								</div>
								<div class=" col-lg-4 mb-6 mt-1" style="display: none;">
									<label class="form-label" for="gst">Gst(%)<span style="color: red;">*</span></label> <input
										type="text" class="form-control decimalOnly" id="gst" placeholder=" "
										name="gst" aria-label=" "  disabled/>
								</div>
								<div class=" col-lg-4 mb-6 mt-1">
									<label class="form-label" for="final_price">Plan Price(With GST)<span style="color: red;">*</span></label> <input
										type="text" class="form-control" id="final_price" placeholder=" "
										name="final_price" aria-label=" " />
								</div>
								<div class=" col-lg-4 mb-6 mt-1">
									<label class="form-label" for="total_price">Final Price<span style="color: red;">*</span></label> <input
										type="text" class="form-control" id="total_price" placeholder=" "
										name="total_price" aria-label=" " />
								</div>
								<div class=" col-lg-4 mb-6 mt-1">
									<label class="form-label" for="net_amount">Net Amount<span style="color: red;">*</span></label> <input
										type="text" class="form-control" id="net_amount" placeholder=" "
										name="net_amount" aria-label=" "  disabled/>
								</div>
								<div class=" col-lg-4 mb-6 mt-1">
									<label class="form-label" for="advance_amount">Advance Amount<span style="color: red;">*</span></label> <input
										type="text" class="form-control" id="advance_amount" placeholder=" "
										name="advance_amount" aria-label=" " />
								</div>
								<div class=" col-lg-4 mb-6 mt-1">
									<label class="form-label" for="balance_amount">Balance Amount<span style="color: red;">*</span></label> <input
										type="text" class="form-control" id="balance_amount" placeholder=" "
										name="balance_amount" aria-label=" " disabled/>
								</div>
								
								<div class=" col-lg-4 mb-6 mt-1">
									<label class="form-label" for="final_payment_date">Final Amount Paid Date<span style="color: red;">*</span></label> <input
										type="date" class="form-control" id="final_payment_date" placeholder=" "
										name="final_payment_date" aria-label=" "/>
								</div>

						</div>
					</div>
					<div class="modal-footer" style="border-top: 1px solid lightgray;">
                	 <div class="col-md-12">
                          <div class=" " style="float: right; margin-top:1rem;" >
                               <button type="button"  class="btn btn-secondary btn-sm"  data-bs-dismiss="modal"  aria-label="Close">Close </button>
                               <button type="submit"  class="btn btn-primary btn-sm" id="sbmt">Save </button>
                          </div>
                      </div>
                      </div>
                      </div>
                 </form>
            </div>
         <input type="hidden" id="sno" name="sno" value="0">
        </div>
    </div>
	
<div class="modal fade" id="report_modal" data-bs-backdrop="static" tabindex="-1">
    <div class="modal-dialog modal-md modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header" style="border-bottom: 1px solid lightgray;">
            <h6>Generate Booking Report</h6>
                <button type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
             <form name="report_form" id="report_form">
					<div class="modal-body">
						<div class="nav-align-top mb-4">
							<div class="row">
								<div class=" col-lg-12 mb-6 mt-1">
									<label class="form-label" for="from_date">From Date<span style="color: red;">*</span></label> <input
										type="date" class="form-control" id="from_date" placeholder=" "
										name="from_date" aria-label=" " />
								</div>
								<div class=" col-lg-12 mb-6 mt-1">
									<label class="form-label" for="to_date">To Date<span style="color: red;">*</span></label> <input
										type="date" class="form-control" id="to_date" placeholder=" "
										name="to_date" aria-label=" " />
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer" style="border-top: 1px solid lightgray;">
                	 <div class="col-md-12">
                          <div class=" " style="float: right; margin-top:1rem;" >
                               <button type="button"  class="btn btn-secondary btn-sm"  data-bs-dismiss="modal"  aria-label="Close">Close </button>
                               <button type="button"  class="btn btn-primary btn-sm"  onclick="generateReport()">Generate</button>
                          </div>
                      </div>
                </div>
                 </form>
            </div>
         <input type="hidden" id="sno" name="sno" value="0">
        </div>
    </div>
	<jsp:include page="../js.jsp"></jsp:include>
	<script type="text/javascript">
$(document).ready(function () {

    // Load table
    function loadData() {
        $("#zone_table").DataTable({
            dom: "Blfrtip",
            destroy: true,
            autoWidth: true,
            responsive: true,
            buttons: [
                { extend: 'pdf', exportOptions: { columns: [0, 1, 2, 3, 4, 5, 6] } },
                { extend: 'csv', exportOptions: { columns: [0, 1, 2, 3, 4, 5, 6] } },
                { extend: 'print', exportOptions: { columns: [0, 1, 2, 3, 4, 5, 6] } },
                { extend: 'excel', exportOptions: { columns: [0, 1, 2, 3, 4, 5, 6] } },
                { extend: 'pageLength' }
            ],
            lengthChange: true,
            ordering: false,
            ajax: {
                url: "get_bookdate",
                type: "POST"
            },
            columnDefs: [{ "defaultContent": "-", "targets": "_all" }],
            serverSide: true,
            columns: [
            	  { data: "name" },                     // Customer Name
            	  { data: "city" },            // Mobile Number
            	  { data: "mobile_number" },            // Mobile Number
            	  { 
            		  data: "room_title",
            		  render: function (data, type, row) {
            		    if (!data) return "";
            		    return data.split("@@@").map(item => item.trim()).join("<br>");
            		  }
            		},              // Room Name
            	  { data: "booking_date" },             // Check-in Date
            	  { data: "check_date" },               // Check-out Date
            	  { data: "night" },                    // Night
            	  { data: "room_number" },              // Room Nos
            	  { data: "extrabed" },                 // E-Bed
            	  { data: "room_charge" },              // Rent/Night
            	  { data: "bed_charge" },               // E-Bed Charge/Night
            	  { data: "adult" },                    // Guest (Adult count)
            	  { data: "total_room_charge" },        // Total Room Charge
            	  { data: "total_bed_charge" },         // Total E-Bed Charge
            	  { data: "taxable_amount" },           // Taxable Amount
            	  { data: "room_gst" },                 // GST(%)
            	  { data: "total_amount" },             // Total Amount
            	  { data: "plan_name" },                // Plan Name
            	  { data: "room_gst" },                 // GST(%)
            	  { data: "final_price" },              // Plan Price
            	  { data: "total_price" },              // Final Price
            	  { data: "net_amount" },                // Net Amount
            	  { data: "advance_amount" },                // Net Amount
            	  { data: "balance_amount" },                // Net Amount
            	  { data: "final_payment_date" },  
            	  {
      				"data" : function(data, type,
      						dataToSet) {
      						var sno = data.sno;
      						var string = "<button class='btn btn-secondary add-new btn-danger btn-xs '  type='button'  onclick='cancelbooking("+sno+")'>Cancel</button> ";
      						//string +='<button type="button" class="btn btn-primary btn-xs ml-1 "  onclick="edit('+sno+')" style="margin-left: 10px;">Edit</button>';
      						return string;
      						}
      					},
            	],
            lengthMenu: [[5, 10, 25, 50], [5, 10, 25, 50]],
            select: true
        });
    }
    loadData();

    // 🧮 Calculate nights difference
    $("#booking_date, #check_date").on("change", function () {
        let checkIn = $("#booking_date").val();
        let checkOut = $("#check_date").val();
        if (checkIn && checkOut) {
            let diff = (new Date(checkOut) - new Date(checkIn)) / (1000 * 60 * 60 * 24);
            if (diff >= 0) {
                $("#night").val(diff);
            } else {
                $("#night").val("");
                Swal.fire("Invalid Date", "Check-out date must be after Check-in date!", "warning");
            }
        }
    });

 // 🧮 Trigger recalculation when any of these fields change
    $("#extra_bed, #room_gst, #final_price, #advance_amount, #night, input[name='room_number']").on("input change", function () {
        calculateTotals();
    });

    function calculateTotals() {
        let rent = parseFloat($("#rent").val()) || 0;
        let bedCharge = parseFloat($("#bed_charge").val()) || 0;
        let extraBed = parseFloat($("#extra_bed").val()) || 0;
        let gst = parseFloat($("#room_gst").val()) || 0;
        let final_price = parseFloat($("#final_price").val());
        let advance = parseFloat($("#advance_amount").val()) || 0;

        // ✅ Handle empty or invalid plan price safely
        if (isNaN(final_price)) {
            final_price = 0;
        }

        // ✅ Count selected rooms
        let roomCount = $("input[name='room_number']:checked").length || 0;
        let nights = parseFloat($("#night").val()) || 0;
        $("#troom").val(roomCount);
        // ✅ Base Calculations
        let totalRent = rent * nights * roomCount;
        let totalBedCharge = bedCharge * extraBed * nights;
        let taxableAmount = totalRent + totalBedCharge;
        if(final_price == 0){
       	 $("#total_price").val(0);
       }else{
       	  var tot = nights * roomCount * parseFloat(final_price);
       	  $("#total_price").val(tot.toFixed(2));
       }
        // ✅ GST calculation
        let gstAmount = taxableAmount * gst / 100;
        let totalAmount = taxableAmount + gstAmount;

        // ✅ Add plan price to get final total
        let netAmount = totalAmount + final_price;

        // ✅ Calculate balance after advance
        let balanceAmount = netAmount - advance;

        // ✅ Update all fields
        $("#trent").val(totalRent.toFixed(2));
        $("#tbed_charge").val(totalBedCharge.toFixed(2));
        $("#taxable_amount").val(taxableAmount.toFixed(2));
        $("#total_amount").val(totalAmount.toFixed(2));
        $("#net_amount").val(netAmount.toFixed(2));         // total payable
        $("#balance_amount").val(balanceAmount.toFixed(2)); // remaining balance
    }


    // ✅ Form Validation and Submit
    $("form[name='category_form']").validate({
        rules: {
            name: { required: true },
            mobile_number: { required: true, digits: true, minlength: 10, maxlength: 10 },
            city: { required: true },
            plan_id: { required: true },
            room_select: { required: true },
            booking_date: { required: true },
            check_date: { required: true },
            room_gst: { required: true, number: true }
        },
        messages: {
            name: { required: "Please enter customer name" },
            mobile_number: {
                required: "Please enter mobile number",
                digits: "Only digits allowed",
                minlength: "Must be 10 digits",
                maxlength: "Must be 10 digits"
            },
            city: { required: "Please enter city" },
            room_select: { required: "Please select room" },
            booking_date: { required: "Please choose check-in date" },
            check_date: { required: "Please choose check-out date" },
            room_gst: { required: "Please enter GST percentage" },
            plan_id: { required: "Please select package plan" }
        },
        errorElement: "span",
        errorPlacement: function (error, element) {
            error.addClass("text-danger");
            element.closest(".form-group, .col-lg-6, .col-md-4").append(error);
        },
        submitHandler: function (form) {
            $("#sbmt").prop("disabled", true);
            $("#sbmt").html("Please Wait...");

         // 🏨 Collect room info by room type
            let roomDetails = [];
            let allRoomIds = [];
            let allRoomNumbers = [];

            $("input[name='room_select']:checked").each(function () {
                let roomId = $(this).val();
                // ✅ Get room title text from label
                let roomTitle = $("label[for='room_id" + roomId + "']").text().trim();

                allRoomIds.push(roomId);

                // ✅ Collect all selected room numbers under this room
                let roomNumbers = $("#room_box" + roomId + " input[name='room_number']:checked")
                    .map(function () { return $(this).val(); })
                    .get();

                if (roomNumbers.length > 0) {
                    allRoomNumbers.push(...roomNumbers);
                    roomDetails.push(roomTitle + " (" + roomNumbers.join(",") + ")");
                }
            });

            // 🧾 Combine for submission
            let room_ids = allRoomIds.join(",");         // e.g. "1,2"
            let room_number = allRoomNumbers.join(",");  // e.g. "101,102,201"
            let room_title = roomDetails.join("@@@");     // e.g. "Deluxe Room (101,102), Suite (201)"

            let payload = {
                sno: $("#sno").val(),
                name: $("#name").val(),
                mobile_number: $("#mobile_number").val(),
                city: $("#city").val(),
                booking_date: $("#booking_date").val(),
                check_date: $("#check_date").val(),
                room_ids: room_ids,                // ✅ all selected room IDs
                room_title: room_title,           // ✅ formatted title with numbers
                room_number: room_number,         // ✅ all selected room numbers
                noroom: $("input[name='room_number']:checked").length,
                night: $("#night").val(),
                adult: $("#adult").val(),
                child: $("#child").val(),
                room_charge: $("#rent").val(),
                bed_charge: $("#bed_charge").val(),
                extrabed: $("#extra_bed").val(),
                total_room_charge: $("#trent").val(),
                total_bed_charge: $("#tbed_charge").val(),
                taxable_amount: $("#taxable_amount").val(),
                room_gst: $("#room_gst").val(),
                total_amount: $("#total_amount").val(),
                plan_id: $("#plan_id").val(),
                base_price: $("#base_price").val(),
                bed_gst: $("#gst").val(),
                final_price: $("#final_price").val(),
                total_price: $("#total_price").val(),
                net_amount: $("#net_amount").val(),
                advance_amount: $("#advance_amount").val(),
                balance_amount: $("#balance_amount").val(),
                final_payment_date: $("#final_payment_date").val(),
                type: "Manual"
            };

            $.ajax({
                url: 'add_bookdate',
                type: 'POST',
                data: JSON.stringify(payload),
                dataType: 'json',
                contentType: 'application/json',
                success: function (data) {
                    $("#sbmt").prop("disabled", false);
                    $("#sbmt").html("Save");

                    if (data.status === 'Success') {
                        $("#zone_table").DataTable().ajax.reload(null, false);
                        Swal.fire("Success", data.message, "success");
                        $('#tenderform').modal('hide');
                        form.reset();
                    } else if (data.status === 'Already_Exist') {
                        Swal.fire("Warning", data.message, "warning");
                    } else {
                        Swal.fire("Error", data.message, "error");
                    }
                },
                error: function () {
                    Swal.fire("Error", "Something went wrong. Please try again.", "error");
                }
            });
        }
    });

});
function getroomNumber(i, checkbox) {
    var bdate = $("#booking_date").val();
    var cdate = $("#check_date").val();

    if (bdate === "" || cdate === "") {
      alert("Please select both Check-in and Check-out dates first.");
      $(checkbox).prop("checked", false);
      return;
    }

    if (!$(checkbox).is(":checked")) {
      $("#room_box" + i).html("");
      return;
    }

    var fd = new FormData();
    fd.append("room_id", i);
    fd.append("check_in", bdate);
    fd.append("check_out", cdate);

    $.ajax({
      url: "check_abvlty", // must return valid JSON
      type: "POST",
      data: fd,
      contentType: false,
      processData: false,
      success: function (data) {
        try {
          var json = typeof data === "string" ? JSON.parse(data) : data;
          if (json.status === "success" && json.data.length > 0) {
            var room = json.data[0];
            var rooms = room.room_number ? room.room_number.split(",") : [];
            var html = "";
            rooms.forEach(function(rn) {
              rn = rn.trim();
              html += '<div class="col-md-6"><input type="checkbox" name="room_number" value="'+rn+'"> Room ' + rn + '</div>';
            });
            $("#room_box" + i).html(html);
          } else {
            $("#room_box" + i).html("<p class='text-danger'>No rooms available.</p>");
          }
        } catch(e) {
          alert("Invalid JSON from server");
        }
      },
      error: function() {
        alert("Error fetching room availability.");
      }
    });
  }

 $("#room").change(function(){
    var room = $("#room").val();
	var fd = new FormData();
	fd.append("sno", room);
	$.ajax({
		url : 'edit_room',
		type : 'post',
		data : fd,
		contentType : false,
		processData : false,
		success : function(data) {
			if (data['status'] == 'Success') {
				 $("#rent").val(data['data'][0].price);
 				$("#bed_charge").val(data['data'][0].extra_bed_charge);
			} else {
				Swal.fire({
					icon : 'Opps',
					title : 'Warning!',
					text : 'Invalid Details'
				})
			}
		}
	});
})
 $("#plan_id").change(function(){
    var plan_id = $("#plan_id").val();
	var fd = new FormData();
	fd.append("sno", plan_id);
	$.ajax({
		url : 'get_plandata',
		type : 'post',
		data : fd,
		contentType : false,
		processData : false,
		success : function(data) {
			if (data['status'] == 'Success') {
				 $("#base_price").val(data['data'][0].base_price);
 				$("#gst").val(data['data'][0].gst);
 				$("#final_price").val(data['data'][0].final_price);
 				var total_amount = parseFloat($("#total_amount").val()) || 0;
 				var roomCount = $("input[name='room_number']:checked").length || 0;
 			    var nights = parseFloat($("#night").val()) || 0;
 			    var tot = nights * roomCount * parseFloat(data['data'][0].final_price);
 				var net = total_amount + parseFloat(tot);
 				$("#total_price").val(tot.toFixed(2));
 				$("#net_amount").val(net.toFixed(2));
			} else {
				Swal.fire({
					icon : 'Opps',
					title : 'Warning!',
					text : 'Invalid Details'
				})
			}
		}
	});
})
 function cancelbooking(sno)
			{	 
			 Swal.fire({
				  title: 'Do you want to Cancel Booking?',
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
					  var fd = new FormData();
						fd.append("sno", sno);
						$.ajax({
							url : 'cancel_booking',
							type : 'post',
							data : fd,
							contentType : false,
							processData : false,
							success : function(data) {
								if (data['status'] == 'Success') {
									$('#zone_table').DataTable().ajax.reload( null, false );
								 Swal.fire({
									  icon: 'success',
									  title: 'Canceled successfully',
									  showConfirmButton: false,
									  timer: 1500
									})
								}  
							}
						});
				  
				   }
				});
			}; 
function generateReport(){
	 let from_date = document.getElementById("from_date").value;
	 let to_date = document.getElementById("to_date").value;
	 if(from_date != null && from_date != "" && to_date != null && to_date != "")
		var mapForm = document.createElement("form");
		 mapForm.method = "POST";
		 mapForm.target = "_blank"; 
		 mapForm.action = "booking_register";
	      var output = document.createElement("input");
	      output.type = "hidden";
	      output.name = "from_date";
	      output.value = from_date;
	      mapForm.appendChild(output);
	      var output1 = document.createElement("input");
	      output1.type = "hidden";
	      output1.name = "to_date";
	      output1.value = to_date;
	      mapForm.appendChild(output1);
	      document.body.appendChild(mapForm);
	      mapForm.submit();     
 }
</script>

</body>
</html>
