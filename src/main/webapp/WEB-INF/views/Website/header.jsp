<%@page import="com.shoaib.modal.LoginCredentials"%>
<%
LoginCredentials log = (LoginCredentials)session.getAttribute("logindata");
%>
    <div class="top-wrapper top-wrapper-dark">
            <div class="top2-wrapper">
                <div class="container">
                    <div class="top2 clearfix">
                        <header>
                            <div class="logo_wrapper">
                                <a href="./" class="logo">
                                    <img src="assets/images/logo_white.png" class="img-fluid" style="height:60px;">
                                </a>
                            </div>
                        </header>
                        <nav class="navbar_ navbar navbar-expand-md clearfix">

                            <button class="navbar-toggler" type="button" data-toggle="collapse"
                                    data-target="#navbarSupportedContent2" aria-controls="navbarSupportedContent2"
                                    aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>

                            <div class="collapse navbar-collapse" id="navbarSupportedContent2">
                            <div class="logo_wrapper" style=" width: min-content;">
                                <a href="./" class="logo">
                                    <img src="assets/images/logo_white.png" class="img-fluid" style="margin-right: 330px; height: 65px;">
                                </a>
                            </div>
                                <ul class="nav navbar-nav sf-menu clearfix">
                                    <li class="nav-item "><a href="./" class="nav-link">Home</a></li>
                                    <li class="nav-item"><a href="about" class="nav-link">About us</a></li>
                                   <!--  <li class="nav-item"><a href="activities" class="nav-link">Activities</a></li> -->
                                    <li class="nav-item"><a href="rooms" class="nav-link">Rooms</a></li>
                                    <li class="nav-item"><a href="gallery" class="nav-link">Gallery</a></li>
                                    <li class="nav-item"><a href="blog" class="nav-link">Blog</a></li>
                                    <%if(log == null){ %>
                                     <li class="nav-item"><a href="javascript:void(0)" class="nav-link" data-toggle="modal" data-target="#genModal">Generate Receipt</a></li>
                                    <%} %>
                                     <li class="nav-item"><a href="javascript:void(0)" class="nav-link" data-toggle="modal" data-target="#pModal">Payment</a></li>
                                    <li class="nav-item"><a href="contacts" class="nav-link">Contact</a></li>
                                   <%if(log != null){ %>
                                   		 <li class="nav-item sub-menu sub-menu-2">
                                        <a href="javascript:void(0)" class="nav-link">Account <i class="fa fa-angle-down" aria-hidden="true"></i></a>
                                        <div class="sf-mega">
                                            <ul>
                                                <li><a href="profile">Profile</a></li>
                                                <li><a href="logout">Logout</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                   <%}else{ %>
                                    <li class="nav-item"><a href="user_auth" class="nav-link btn btn-primary" style="line-height: 30px !important;background: #0073b7;margin-top: 20px;">Login</a></li>
                                   <%} %>
                                </ul>
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- The Modal -->
<div class="modal fade" id="pModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Payment Details</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      	<form action="">
      <div class="modal-body">
       		<div class="row">
       			<div class="col-12 mb-3">
       				<input class="form-control" id="bking_id" name="bking_id" placeholder="Booking ID"><button type="button" id="getin" class="btn btn-primary btn-sm" onclick="getData()" style="position: absolute;top: 3px;right: 19px;">Get Details</button>
       			</div>
       			<div class="col-12 mb-3">
       				<input class="form-control" id="name" name="name" placeholder="Name" disabled>
       			</div>
       			<div class="col-12 mb-3">
       				<input class="form-control" id="email" name="email" placeholder="Email" disabled>
       			</div>
       			<div class="col-12 mb-3">
       				<input class="form-control" id="phone" name="phone" placeholder="Phone Number" disabled>
       			</div>
       			<div class="col-12 mb-3">
       				<input class="form-control" id="title" name="title" placeholder="Room Name" disabled>
       			</div>
       			<div class="col-12 mb-3">
       				<input class="form-control" id="due_amount" name="due_amount" placeholder="Due Amount" disabled>
       			</div>
       		</div>
       	
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">Close</button>
        <button type="button" id="pmntbtn" class="btn btn-primary btn-sm" onclick="payment()">Pay</button>
      </div>
	</form>
    </div>
  </div>
</div>
        <!-- The Modal -->
<div class="modal fade" id="genModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Generate Receipt</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      	<form action="">
      <div class="modal-body">
       		<div class="row">
       			<div class="col-12">
       				<input class="form-control" id="bkid" name="bkid" placeholder="Booking ID">
       			</div>
       		</div>
       	
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-primary btn-sm" onclick="generatereceipt()">Generate</button>
      </div>
	</form>
    </div>
  </div>
</div>