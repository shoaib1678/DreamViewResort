<%@page import="com.shoaib.modal.Rooms"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<Rooms> room = (List<Rooms>) request.getAttribute("room");
%>
<!doctype html>
<html lang="en">
<head>
<meta name="description"
	content="<%=room.get(0).getMeta_description()%>">
<meta name="keywords" content="<%=room.get(0).getMeta_keywords()%>">
<jsp:include page="../css.jsp" />
<style type="text/css">
@media ( min-width : 992px) {
	.sb {
		width: 977px !important;
		height: 550px !important;
		object-fit: cover;
	}
	.ss {
		width: 135px !important;
		height: 132.99px !important;
		object-fit: cover;
	}
	.slick-list.draggable {
		height: 550px !important;
	}
}

.rmt a {
	border: 1px solid #fab000;
	width: fit-content;
	padding: 0px 10px;
	border-radius: 3px;
	display: inline-block;
	line-height: 3.2
}
/* CSS */
.details2-link {
	display: inline-block;
	animation: zoomPulse 3s ease-in-out infinite; /* ⬅ automatic loop */
	transform-origin: center; /* keeps it centered */
}

@
keyframes zoomPulse { 0%, 100% {
	transform: scale(1);
} /* normal size */
50
%
{
transform
:
scale(
1.08
);
} /* zoomed-in midpoint */
}

/* Optional: pause the animation while the user hovers or taps */
.details2-link:hover, .details2-link:active {
	animation-play-state: paused;
}

.price {
	background: #fab000;
	color: white;
	width: fit-content;
	padding: 10px;
	border-radius: 5px;
	float: right;
	margin-bottom: 10px;
}
/* Slide-in modal from right */
.modal.right .modal-dialog {
	position: fixed;
	margin: 0;
	top: 0;
	right: 0;
	left: auto;
	height: 100%;
	transform: translateX(100%);
	transition: transform 0.3s ease-out;
}

.modal.right.show .modal-dialog {
	transform: translateX(0);
}

.modal-dialog-slideout {
	max-width: 350px;
	height: 100%;
}

.modal-content {
	height: 100%;
	border: none;
	border-radius: 0;
}
</style>
</head>
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
					<a href="./">Home</a><span> | </span><a href="rooms">Rooms</a> |
					Rooms Details
				</div>
			</div>
		</div>
		<div id="content">
			<div class="container">

				<%-- <div class="title1"><%=room.get(0).getTitle() %></div>

            <div class="title2">Lorem ipsum dolor sit amet concateur non troppo di saronno la prada</div> --%>

				<!-- <div class="booking2-wrapper">
					<div class="">
						<div class="booking-inner clearfix">
							<form action="javascript:;" class="form1 clearfix">
								<div class="col1 c1">
									<div class="input1_wrapper">
										<label>Check in</label>
										<div class="input1_inner">
											<input type="text" class="form-control input datepicker"
												placeholder="Check in">
										</div>
									</div>
								</div>
								<div class="col1 c2">
									<div class="input1_wrapper">
										<label>Check out</label>
										<div class="input1_inner">
											<input type="text" class="form-control input datepicker"
												placeholder="Check out">
										</div>
									</div>
								</div>
								<div class="col2 c3">
									<div class="select1_wrapper">
										<label>Adults</label>
										<div class="select1_inner">
											<select class="select2 select" style="width: 100%">
												<option value="1">1 Adult</option>
												<option value="2">2 Adults</option>
												<option value="3">3 Adults</option>
												<option value="4">4 Adults</option>
											</select>
										</div>
									</div>
								</div>
								<div class="col2 c4">
									<div class="select1_wrapper">
										<label>Children</label>
										<div class="select1_inner">
											<select class="select2 select" style="width: 100%">
												<option value="1">Children</option>
												<option value="2">1 Child</option>
												<option value="3">2 Children</option>
												<option value="4">3 Children</option>
												<option value="5">4 Children</option>
											</select>
										</div>
									</div>
								</div>
								<div class="col2 c5">
									<div class="select1_wrapper">
										<label>Rooms</label>
										<div class="select1_inner">
											<select class="select2 select" style="width: 100%">
												<option value="1">1 Room</option>
												<option value="2">2 Rooms</option>
												<option value="3">3 Rooms</option>
												<option value="4">4 Rooms</option>
											</select>
										</div>
									</div>
								</div>
								<div class="col3 c6">
									<button type="submit" class="btn-form1-submit">CHECK
										AVAILABILITY</button>
								</div>
							</form>
						</div>
					</div>
				</div> -->

				<div class="slider2-wrapper">
					<div class="slider-for2">
						<%
						if (room.get(0).getSimg().size() > 0) {
							for (int i = 0; i < room.get(0).getSimg().size(); i++) {
						%>
						<div class="slider-item">
							<img
								src="displayimage?url=<%=room.get(0).getSimg().get(i).getImage()%>"
								alt="" class=" img-fluid bs">
						</div>
						<%
						}
						}
						%>
					</div>

					<div class="slider-nav2">
						<%
						if (room.get(0).getSimg().size() > 0) {
							for (int i = 0; i < room.get(0).getSimg().size(); i++) {
						%>
						<div class="slider-item">
							<div class="slider-item-inner">
								<img
									src="displayimage?url=<%=room.get(0).getSimg().get(i).getImage()%>"
									alt="" class="img-fluid ss">
							</div>
						</div>
						<%
						}
						}
						%>
					</div>
				</div>


				<div class="details-wrapper clearfix">
					<!-- <div class="txt1">
                    159 REVEW
                    <div class="small-stars">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                    </div>
                </div> -->
					<div class="txt2"><%=room.get(0).getTitle()%></div>
					<div class="txt3">
						<%=room.get(0).getDescription()%>
					</div>
					<div class="details-caption">
						<div class="txt1">01</div>
						<div class="txt21"><%=room.get(0).getCategory_name()%></div>
					</div>
				</div>

				<div class="details2-wrapper">
					<div class="row">
						<div class="col-md-8">
							<div class="our-rooms-icons">
								<div class="our-rooms-icon">
									<h4>Amenities</h4>
									<div class="our-rooms-icon-txt1 rmt">
										<%
										if(room.get(0).getAmenity_ids() != null && room.get(0).getAmenity_ids() != ""){
										String[] amm = room.get(0).getAmenities_name().split("@@@");
										for (int i = 0; i < amm.length; i++) {
										%>
										<a><%=amm[i]%></a>
										<%
										}}
										%>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="details2-info">
								<div class="price">
									<i class="fa fa-inr"></i><%=room.get(0).getPrice()%><span>/NIGHT</span></span>
								</div>
								<div>
									<a href="javascript:void(0)" onclick="bookRoom(<%=room.get(0).getSno()%>,'<%=room.get(0).getTitle()%>')" class="details2-link"
										onclick="reserverdRom(<%=room.get(0).getSno()%>,<%=room.get(0).getPrice()%>)">
										<%-- <div class="txt"><i class="fa fa-inr"></i><%=room.get(0).getPrice()%><span>/NIGHT</span></div> --%>
										<div class="txt">RESERVE THIS ROOM</div>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- <div class="share-to-frends-wrapper clearfix">
                <div class="share-to-friends clearfix">
                    <div class="share-to-friends-txt">Share to friends:</div>
                    <div class="share-to-friends-icons">
                        <ul class="social4 clearfix">
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-whatsapp"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div> -->
			</div>
		</div>

		<jsp:include page="../footer.jsp" />
		
		<!--  <div id="loader" class="loader-holder">
        <div class="block"><img src="assets/images/hearts.svg" width="100" alt="loader"></div>
    </div> -->
	</div>

	<jsp:include page="../js.jsp" />

	<script type="text/javascript">

 </script>

</body>

</html>