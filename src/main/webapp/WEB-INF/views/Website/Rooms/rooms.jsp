<%@page import="com.shoaib.modal.Rooms"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
     <jsp:include page="../css.jsp" />
</head>
<%
List<Rooms> room = (List<Rooms>)request.getAttribute("room");
%>
<body class="front" data-spy="scroll" data-target="#top-inner" data-offset="0">
<div id="main">
    
     <jsp:include page="../header.jsp" />
    <div class="breadcrumbs1_wrapper" style="background-image: url(assets/images/breadcumimg.jpeg); background-repeat: no-repeat; background-size: cover; height: 300px;">
			<div class="container-fluid"
				style="background: #00000033; height: -webkit-fill-available;">
				<div class="title1 text-white" style="padding-top: 130px;">Rooms</div>
				<div class="title2 text-white">
					<a href="./">Home</a><span> | </span>Rooms
				</div>
			</div>
		</div>
<div id="rooms">
        <div class="container">

            <div class="title1">OUR ROOMS</div>

            <div class="title2">Comfort meets nature in every room — relax, unwind, and feel at home.</div>

            <div class="row">
            <%if(room != null){
            	for(Rooms r : room){%>
                <div class="col-lg-4">
                    <div class="room-wrapper">
                        <div class="room-inner">
                            <div class="room">
                                <figure>
                                    <img src="displayimage?url=<%=r.getTitle_image() %>" alt="" class="img-fluid" style="height: 259.45px; object-fit:cover;">
                                    <figcaption>
                                        <div class="txt1"><%=r.getTitle() %></div>
                                        <div class="txt2"><i class="fa fa-inr"></i><%=r.getPrice()%>/Night</div>
                                    </figcaption>
                                </figure>
                                <div class="caption">
                                    <div class="txt1"><%=r.getCategory_name() %></div>
                                    <!-- <div class="txt2">
                                        39 REVEW
                                        <div class="small-stars">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                    </div> -->
                                    <div class="txt3">
                                        <%=r.getSummery() %>
                                    </div>
                                    <div class="txt4">
                                        <a href="javacript:void(0)" onclick="getDetails(<%=r.getSno()%>,'<%=r.getTitle()%>')">VIEW DETAIL<i class="fa fa-caret-right"
                                                                             aria-hidden="true"></i></a>
                                    </div>
                                </div>
                                <div class="select-txt">
                                    <a href="javascript:void(0)" onclick="getDetails(<%=r.getSno()%>,'<%=r.getTitle()%>')"><span>SELECT THIS ROOM<i class="fa fa-angle-right"
                                                                                    aria-hidden="true"></i></span></a>
                                </div>
                                <div class="room-icons">
                                    <div class="room-ic room-ic-wifi">
                                        <i class="fa fa-wifi" aria-hidden="true"></i>
                                        <div class="txt1">FREE WIFI</div>
                                    </div>
                                    <div class="room-ic room-ic-person">
                                        <i class="fa fa-user" aria-hidden="true"></i>
                                        <i class="fa fa-user" aria-hidden="true"></i>
                                        <div class="txt1">MAX<br>PERSON</div>
                                    </div>
                                    <div class="room-ic room-ic-breakfast">
                                        <i class="fa fa-coffee" aria-hidden="true"></i>
                                        <div class="txt1">BREAKFAST<br>INCLUDED</div>
                                    </div>
                                    <div class="room-ic room-ic-left">
                                        <div class="txt0"><%=r.getNo_of_rooms() %></div>
                                        <div class="txt1">ROOMS LEFT</div>
                                    </div>
                                    <!-- <div class="room-ic room-ic-refund">
                                        <i class="fa fa-tags" aria-hidden="true"></i>
                                        <div class="txt1">NO REFUND</div>
                                    </div> -->
                                    <div class="room-price">
                                        <div class="txt1" style="font-size: 15px;"><i class="fa fa-inr"></i><span><%=r.getPrice() %></span></div>
                                        <div class="txt2">PER NIGHT</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%}} %>
        </div>
    </div>
    </div>
    <jsp:include page="../footer.jsp" />
  

   <!--  <div id="loader" class="loader-holder">
        <div class="block"><img src="assets/images/hearts.svg" width="100" alt="loader"></div>
    </div> -->
</div>

 <jsp:include page="../js.jsp" />

</body>

</html>