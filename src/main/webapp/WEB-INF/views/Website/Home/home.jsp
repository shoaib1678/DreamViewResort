<%@page import="com.shoaib.modal.Testimonial"%>
<%@page import="com.shoaib.modal.Blogs"%>
<%@page import="com.shoaib.modal.Rooms"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
     <jsp:include page="../css.jsp" />
     <style type="text/css">
		@media (max-width: 767px) {
		  .findimg {
		    height: 320.99px !important;
		  }
		}
		
		@media (min-width: 768px) and (max-width: 991px) {
		  .findimg {
		    height: 450px !important;
		  }
		}
     .txt4{
     text-align: justify;
     }
     </style>
</head>
<%
List<Rooms> room = (List<Rooms>)request.getAttribute("room");
List<Blogs> blog = (List<Blogs>)request.getAttribute("blog");
List<Testimonial> test = (List<Testimonial>)request.getAttribute("test");
%>
<body class="front" data-spy="scroll" data-target="#top-inner" data-offset="0">
<div id="main">
    
     <jsp:include page="../header.jsp" />
    <div id="home" class="">
        <div id="home-inner" class="home-inner">
            <div id="slides_wrapper" class="">
                <div id="slides">
                    <ul class="slides-container">
                        <li>
                            <img src="assets/images/slide01.jpg" alt="" class="img" style="height: 90vh; object-fit: cover;">
                        </li>
                        <li>
                            <img src="assets/images/slide04.jpg" alt="" class="img" style="height: 90vh; object-fit: cover;">
                        </li>
                        <li>
                            <img src="assets/images/slide03.jpg" alt="" class="img" style="height: 90vh; object-fit: cover;">
                        </li>
                        <li>
                            <img src="assets/images/slide02.jpg" alt="" class="img" style="height: 90vh; object-fit: cover;">
                        </li>
                        <li>
                            <img src="assets/images/slide05.jpg" alt="" class="img" style="height: 90vh; object-fit: cover;">
                        </li>
                        <li>
                            <img src="assets/images/slide06.jpg" alt="" class="img" style="height: 90vh; object-fit: cover;">
                        </li>

                    </ul>
                </div>
            </div>
            <div class="slide-text-wrapper">
                <div class="container">
                    <div class="slide-text clearfix">
                        <div class="img1">
                            <img src="assets/images/logo_white.png" alt="" class="img-fluid">
                        </div>
                        <div class="txt1"><span style="font-size: 24px;">Escape into nature’s tranquility — where heritage meets the wild.<i><img src="assets/images/logo_white.png" alt="" class="img-fluid"></i></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="slide-buttons-wrapper">
                <div class="container">
                    <div class="slide-buttons clearfix">
                        <div class="slide-button">
                            <a href="#">
                                <div class="ic"><img src="assets/images/slide-ic1.png" alt="" class="img-fluid"></div>
                                <div class="hr"></div>
                                <div class="txt1">Hotel</div>
                            </a>
                        </div>
                        <div class="slide-button">
                            <a href="#">
                                <div class="ic"><img src="assets/images/slide-ic2.png" alt="" class="img-fluid"></div>
                                <div class="hr"></div>
                                <div class="txt1">Breakfast</div>
                            </a>
                        </div>
                        <!-- <div class="slide-button">
                            <a href="#">
                                <div class="ic"><img src="assets/images/slide-ic3.png" alt="" class="img-fluid"></div>
                                <div class="hr"></div>
                                <div class="txt1">Fitness Club</div>
                            </a>
                        </div> -->
                        <div class="slide-button">
                            <a href="#">
                                <div class="ic"><img src="assets/images/slide-ic4.png" alt="" class="img-fluid"></div>
                                <div class="hr"></div>
                                <div class="txt1">Support 24/7</div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="booking-wrapper">
            <div class="container">
                <div class="booking-inner clearfix">
                    <form action="javascript:;" class="form1 clearfix">
                    <div class="col2 c1" style="width: 280px;">
                            <div class="select1_wrapper">
                                <label>Select Room</label>
                                <div class="select1_inner">
                                    <select class="select2 select" style="width: 100%">
                                        <option disabled selected>Select Room</option>
                                       <%if(room != null){
                                    	   for(Rooms r: room){%>
                                    	    <option value="<%=r.getSno()%>"><%=r.getTitle()%></option>
                                    	   <%}} %>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col1 c2">
                            <div class="input1_wrapper">
                                <label>Check in</label>
                                <div class="input1_inner">
                                    <input type="text" class="form-control input datepicker" placeholder="Check in">
                                </div>
                            </div>
                        </div>
                        <div class="col1 c3">
                            <div class="input1_wrapper">
                                <label>Check out</label>
                                <div class="input1_inner">
                                    <input type="text" class="form-control input datepicker" placeholder="Check out">
                                </div>
                            </div>
                        </div>
                        <div class="col2 c4">
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
                        <div class="col3 c5">
                            <button type="submit" class="btn-form1-submit">CHECK AVAILABILITY</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="top-wrapper"></div>
    <div id="about">
        <div class="container">

            <div class="title1">LITTLE ABOUT US</div>

            <div class="title2">Dedicated to nature, comfort, and unforgettable experiences in the heart of Madhai.</div>

            <div class="about-slider-wrapper clearfix">
                <div class="about-slider-left">
                    <figure class="about-slider-thumb">
                        <img src="assets/images/about00.jpg" alt="" class="img-fluid">
                    </figure>
                    <div class="slider-for">
                        <div class="slider-item">
                            <img src="assets/images/about1.webp" alt="" class="img-fluid abtimg">
                        </div>
                        <div class="slider-item">
                            <img src="assets/images/about2.webp" alt="" class="img-fluid abtimg">
                        </div>
                        <div class="slider-item">
                            <img src="assets/images/about3.webp" alt="" class="img-fluid abtimg">
                        </div>
                    </div>
                </div>
                <div class="about-slider-right">
                    <div class="slider-nav">
                        <div class="slider-item">
                            <div class="txt1">
                                 Embrace the Wild Serenity of Madhai
                            </div>
                            <div class="txt2">
                                <p style="text-align: justify;">
                                   Bordered on three sides by the Satpura forests' lush green landscape and the wide expanse of the Tawa Reservoir to the north, Madhai is a serene jungle town located just three to four hours southeast of Bhopal. It provides the tranquility of a jungle town as an escape from the mayhem of city life, attracting nature enthusiasts and seekers of peace as much as anyone else. This quaint town is not simply a point of arrival—it's an experience in which nature presents itself in all its unadulterated splendor. The rustling of leaves, the exotic birdsong, and the soft lapping of waves blend together in a backdrop that elicits serenity, introspection, and awe. Whether you are venturing into the dense forests, watching wildlife in their natural surroundings, or just relaxing amidst nature's beauty, Madhai welcomes you to shed the ordinary and connect with nature once again.
                                </p>
                                <p style="text-align: justify;">
                                    As the entry point to Satpura Tiger Reserve, Madhai is ideal for initiating unforgettable wildlife experiences and eco-tourism explorations.
                                </p>
                            </div>
                           <!--  <div class="txt3">
                                GEORGE BAGRATION
                            </div>
                            <div class="txt4">
                                MANAGER
                            </div>
                            <div class="txt5">
                                HOTEL DELVATORE
                            </div> -->
                        </div>
                        <div class="slider-item">
                            <div class="txt1">
                                Embrace the Wild Serenity of Madhai
                            </div>
                            <div class="txt2">
                                <p style="text-align: justify;">
                                    Bordered on three sides by the Satpura forests' lush green landscape and the wide expanse of the Tawa Reservoir to the north, Madhai is a serene jungle town located just three to four hours southeast of Bhopal. It provides the tranquility of a jungle town as an escape from the mayhem of city life, attracting nature enthusiasts and seekers of peace as much as anyone else. This quaint town is not simply a point of arrival—it's an experience in which nature presents itself in all its unadulterated splendor. The rustling of leaves, the exotic birdsong, and the soft lapping of waves blend together in a backdrop that elicits serenity, introspection, and awe. Whether you are venturing into the dense forests, watching wildlife in their natural surroundings, or just relaxing amidst nature's beauty, Madhai welcomes you to shed the ordinary and connect with nature once again.
                                </p>
                                <p style="text-align: justify;">
                                 As the entry point to Satpura Tiger Reserve, Madhai is ideal for initiating unforgettable wildlife experiences and eco-tourism explorations.
                                </p>
                            </div>
                            <!-- <div class="txt3">
                                ELENE ERISTAVI
                            </div>
                            <div class="txt4">
                                STAFF MANAGER
                            </div>
                            <div class="txt5">
                                HOTEL DELVATORE
                            </div> -->
                        </div>
                        <div class="slider-item">
                            <div class="txt1">
                                Embrace the Wild Serenity of Madhai
                            </div>
                            <div class="txt2">
                                <p style="text-align: justify;">
                                   Bordered on three sides by the Satpura forests' lush green landscape and the wide expanse of the Tawa Reservoir to the north, Madhai is a serene jungle town located just three to four hours southeast of Bhopal. It provides the tranquility of a jungle town as an escape from the mayhem of city life, attracting nature enthusiasts and seekers of peace as much as anyone else. This quaint town is not simply a point of arrival—it's an experience in which nature presents itself in all its unadulterated splendor. The rustling of leaves, the exotic birdsong, and the soft lapping of waves blend together in a backdrop that elicits serenity, introspection, and awe. Whether you are venturing into the dense forests, watching wildlife in their natural surroundings, or just relaxing amidst nature's beauty, Madhai welcomes you to shed the ordinary and connect with nature once again.
                                </p>
                                <p style="text-align: justify;">
                                  As the entry point to Satpura Tiger Reserve, Madhai is ideal for initiating unforgettable wildlife experiences and eco-tourism explorations.
                                </p>
                            </div>
                           <!--  <div class="txt3">
                                DAVID ORBELIANI
                            </div>
                            <div class="txt4">
                                ADMINISTRATOR
                            </div>
                            <div class="txt5">
                                HOTEL DELVATORE
                            </div> -->
                        </div>
                    </div>
                </div>
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
    <div id="best-places">
        <div class="container">

            <div class="title1">BEST PLACES AROUND THE DREAM VIEW RESORT</div>
            <div class="title2">FIND YOUR PLACE</div>

            <div class="owl-carousel owl-carousel-wide">
                <div class="item">
                    <div class="place-wrapper">
                        <div class="place-inner">
                            <div class="place clearfix">
                                <div class="caption">
                                    <div class="txt1">BEST PLACE GALLERY</div>
                                    <div class="text-block1">
                                        <div class="text-block1-inner">
                                            <div class="txt2">Madhai is Diversity</div>
                                            <div class="txt3"><i class="fa fa-map-marker" aria-hidden="true"></i>
                                                	Itarsi, Narmadapuram District, Madhya Pradesh
                                            </div>
                                        </div>
                                    </div>
                                    <div class="txt4">
                                        Geographically speaking, one may argue that Madhai is part of Satpura National Park. It’s merely a wooded glade with a few sporadic human habitations. As a result, Dream View Resort provides you with a variety of unexpectedly engaging nature tourism experiences.
                                    </div>
                                </div>
                                <figure class="figure">
                                    <img src="assets/images/mid.webp" alt="" class="img-fluid findimg"  style="height: 571.5px; object-fit:cover;">
                                </figure>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="place-wrapper">
                        <div class="place-inner">
                            <div class="place clearfix">
                                <div class="caption">
                                    <div class="txt1">BEST PLACE GALLERY</div>
                                    <div class="text-block1">
                                        <div class="text-block1-inner">
                                            <div class="txt2">Madhai is Historical</div>
                                            <div class="txt3"><i class="fa fa-map-marker" aria-hidden="true"></i>
                                               Itarsi, Narmadapuram District, Madhya Pradesh
                                            </div>
                                        </div>
                                    </div>
                                    <div class="txt4">
                                       That was unexpected, isn’t it? This is not your average jungle town. Madhai’s nearly 200-year colonial past is quite fascinating. This village is situated in the central region of the Pachmarhi Biosphere Reserve, which is made up of Satpura National Park. Bori and Pachmarhi Sanctuary are the other two Pachmarhi Biosphere Reserve protection sites.

                                    </div>
                                </div>
                                <figure class="figure">
                                    <img src="assets/images/mih.webp" alt="" class="img-fluid findimg" style="height: 571.5px; object-fit:cover;">
                                </figure>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="place-wrapper">
                        <div class="place-inner">
                            <div class="place clearfix">
                                <div class="caption">
                                    <div class="txt1">BEST PLACE GALLERY</div>
                                    <div class="text-block1">
                                        <div class="text-block1-inner">
                                            <div class="txt2">Madhai is Calmness</div>
                                            <div class="txt3"><i class="fa fa-map-marker" aria-hidden="true"></i>
                                                 Itarsi, Narmadapuram District, Madhya Pradesh
                                            </div>
                                        </div>
                                    </div>
                                    <div class="txt4">
                                       Dream View Resort Heritage The topography of Madhai is not totally level. You’ll find valleys, caverns, flatlands, savannas and glades, dense woods and sandbanks, marshes and slushes—the rivers that meander through this area have done their job well! Better bring your safari boots and jacket! Apart from adventurous pursuits like kayaking, trekking in Madhai is highly recommended by travelers.
                                    </div>
                                </div>
                                <figure class="figure">
                                    <img src="assets/images/mic.webp" alt="" class="img-fluid findimg"  style="height: 571.5px; object-fit:cover;">
                                </figure>
                            </div>
                        </div>
                    </div>
                </div>

            </div>


        </div>
    </div>
    <div id="what-client-say">
        <div class="container">

            <div class="title1">WHAT CLIENT SAY</div>

            <div class="title2">Voices of experience — real stories of comfort, adventure, and lasting memories.</div>

            <div class="owl-carousel owl-carousel-testimonials">
            <%if(test != null){
            	for(Testimonial t : test){%>
                <div class="item">
                    <div class="testimonial-wrapper">
                        <div class="testimonial-inner">
                            <div class="testimonial clearfix">
                                <div class="testimonial-caption">
                                    "<%=t.getReview()%>"
                                </div>
                                <div class="author clearfix">
                                    <figure><img src="displayimage?url=<%=t.getImage()%>" alt="" class="img-fluid" style="height: 75px; object-fit:cover;"></figure>
                                    <div class="caption">
                                        <div class="txt1"><%=t.getName()%></div>
                                       <!--  <div class="txt2">Web Developer</div> -->
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
    <div id="latest-news">
        <div class="container">

            <div class="title1">LATEST Blogs</div>
            <div class="title2">Experience unmatched serenity nestled in the heart of nature’s heritage.</div>

            <div class="row">
            <%if(blog != null){
            	int bsize = 2;
            	if(blog.size() > 2){
            		bsize = 2;
            	}else{
            		bsize = blog.size();
            	}
            	for(int i=0; i<bsize; i++){%>
                <div class="col-md-6">
                    <div class="latest-news-wrapper">
                        <div class="latest-news-inner">
                            <div class="latest-news clearfix">
                                <figure><img src="displayimage?url=<%=blog.get(i).getImage() %>" alt="" class="img-fluid"></figure>
                                <div class="caption">
                                    <div class="txt1"><a href="javascript:void(0)" onclick="blogdetails(<%=blog.get(i).getSno()%>,'<%=blog.get(i).getTitle()%>')"><%=blog.get(i).getTitle() %></a></div>
                                    <div class="txt2"><%=blog.get(i).getSummery() %>...<a href="javascript:void(0)" onclick="blogdetails(<%=blog.get(i).getSno()%>,'<%=blog.get(i).getTitle()%>')">Read more</a>
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