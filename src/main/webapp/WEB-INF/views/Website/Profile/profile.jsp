<%@page import="com.shoaib.modal.Booking"%>
<%@page import="java.util.List"%>
<%@page import="com.shoaib.modal.LoginCredentials"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>User Profile - Bookings</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <jsp:include page="../css.jsp" />
  <style>
    .booking-card {
      border: 1px solid #ddd;
      border-radius: 10px;
      padding: 15px;
      margin-bottom: 20px;
      box-shadow: 0 0 10px rgba(0,0,0,0.05);
    }
    .profile-photo {
      width: 80px;
      height: 80px;
      border-radius: 50%;
      object-fit: cover;
      border: 2px solid #ccc;
    }
  </style>
</head>
<%
    LoginCredentials user = (LoginCredentials) session.getAttribute("logindata");
  %>
<body class="front" data-spy="scroll" data-target="#top-inner"
	data-offset="0">
	<div id="main">

		<jsp:include page="../header.jsp" />
		<div class="breadcrumbs1_wrapper"
			style="background-image: url(assets/images/breadcumimg.jpeg); background-repeat: no-repeat; background-size: cover; height: 300px;">
			<div class="container-fluid"
				style="background: #00000033; height: -webkit-fill-available;">
				<div class="title1 text-white" style="padding-top: 130px;"><%=user.getUser_name()%></div>
				<div class="title2 text-white">
					<a href="./">Home</a><span> | </span>Profile
				</div>
			</div>
		</div>
<div class="container mt-4">

  <%-- ✅ User Info --%>
  
 

  <%-- ✅ Booking List --%>
  <h3 class="mb-4">My Bookings</h3>
  <div class="row">
    <%
      List<Booking> bookings = (List<Booking>) request.getAttribute("book");
      if (bookings != null && !bookings.isEmpty()) {
        for (Booking b : bookings) {
    %>
    <div class="col-md-6 col-lg-4">
      <div class="booking-card">
        <h5><%= b.getTitle() %></h5>
        <p><strong>Check-in:</strong> <%= b.getCheck_in() %></p>
        <p><strong>Check-out:</strong> <%= b.getCheck_out() %></p>
        <p><strong>Guests:</strong> <%= b.getAdult() %> Adults, <%= b.getChild() %> Children</p>
        <p><strong>Payable Amount:</strong> ₹<%= b.getTotal_amount() %></p>
        <p><strong>Paid Amount:</strong> ₹<%= b.getPaid_amount() %></p>
        <span class="badge badge-<%= "Confirmed".equals(b.getStatus()) ? "success" : "secondary" %>">
          <%= b.getPayment_status() %>
        </span>
        <button class="btn btn-primary btn-sm" onclick="generateReceipt('<%=b.getBooking_id()%>')" style="float: right;">Generate Receipt</button>
      </div>
    </div>
    <%
        }
      } else {
    %>
    <div class="col-12">
      <p>No bookings found.</p>
    </div>
    <% } %>
  </div>

</div>
<jsp:include page="../footer.jsp" />
</div>

<jsp:include page="../js.jsp" />
 <script type="text/javascript">
  function generateReceipt(booking_id) {
	        var mapForm = document.createElement("form");
	        mapForm.method = "POST";
	        mapForm.target = "_blank";
	        mapForm.action = "reciept";
	        var output = document.createElement("input");
	        output.type = "hidden";
	        output.name = "booking_id";
	        output.value = booking_id;
	        mapForm.appendChild(output);
	        document.body.appendChild(mapForm);
	        mapForm.submit();
	}
  </script>
</body>
</html>
