<%@page import="com.shoaib.modal.Testimonial"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<jsp:include page="../css.jsp" />
<style type="text/css">
h6{
font-weight: 900;
}
</style>
</head>
<%
List<Testimonial> test = (List<Testimonial>)request.getAttribute("test");
%>
<body class="front" data-spy="scroll" data-target="#top-inner"
	data-offset="0">
	<div id="main">

		<jsp:include page="../header.jsp" />
		<div class="breadcrumbs1_wrapper"
			style="background-image: url(assets/images/breadcumimg.jpeg); background-repeat: no-repeat; background-size: cover; height: 300px;">
			<div class="container-fluid"
				style="background: #00000033; height: -webkit-fill-available;">
				<div class="title1 text-white" style="padding-top: 130px;">ABOUT
					US</div>
				<div class="title2 text-white">
					<a href="./">Home</a><span> | </span>About us
				</div>
			</div>
		</div>
		<div id="about" style="padding: 80px 0 0 8px;">
			<div class="container">
				<div class="about-slider-wrapper clearfix">
					<div class="about-slider-left">
						<figure class="about-slider-thumb">
							<img src="assets/images/about00.jpg" alt="" class="img-fluid">
						</figure>
						<div class="slider-for">
							<div class="slider-item">
								<img src="assets/images/about1.webp" alt=""
									class="img-fluid abtimg">
							</div>
							<div class="slider-item">
								<img src="assets/images/about2.webp" alt=""
									class="img-fluid abtimg">
							</div>
							<div class="slider-item">
								<img src="assets/images/about3.webp" alt=""
									class="img-fluid abtimg">
							</div>
						</div>
					</div>
					<div class="about-slider-right">
						<div class="slider-nav">
							<div class="slider-item">
								<div class="txt1">Embrace the Wild Serenity of Madhai</div>
								<div class="txt2">
									<p style="text-align: justify;">Bordered on three sides by
										the Satpura forests' lush green landscape and the wide expanse
										of the Tawa Reservoir to the north, Madhai is a serene jungle
										town located just three to four hours southeast of Bhopal. It
										provides the tranquility of a jungle town as an escape from
										the mayhem of city life, attracting nature enthusiasts and
										seekers of peace as much as anyone else. This quaint town is
										not simply a point of arrival—it's an experience in which
										nature presents itself in all its unadulterated splendor. The
										rustling of leaves, the exotic birdsong, and the soft lapping
										of waves blend together in a backdrop that elicits serenity,
										introspection, and awe. Whether you are venturing into the
										dense forests, watching wildlife in their natural
										surroundings, or just relaxing amidst nature's beauty, Madhai
										welcomes you to shed the ordinary and connect with nature once
										again.</p>
									<p style="text-align: justify;">As the entry point to
										Satpura Tiger Reserve, Madhai is ideal for initiating
										unforgettable wildlife experiences and eco-tourism
										explorations.</p>
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
								<div class="txt1">Embrace the Wild Serenity of Madhai</div>
								<div class="txt2">
									<p style="text-align: justify;">Bordered on three sides by
										the Satpura forests' lush green landscape and the wide expanse
										of the Tawa Reservoir to the north, Madhai is a serene jungle
										town located just three to four hours southeast of Bhopal. It
										provides the tranquility of a jungle town as an escape from
										the mayhem of city life, attracting nature enthusiasts and
										seekers of peace as much as anyone else. This quaint town is
										not simply a point of arrival—it's an experience in which
										nature presents itself in all its unadulterated splendor. The
										rustling of leaves, the exotic birdsong, and the soft lapping
										of waves blend together in a backdrop that elicits serenity,
										introspection, and awe. Whether you are venturing into the
										dense forests, watching wildlife in their natural
										surroundings, or just relaxing amidst nature's beauty, Madhai
										welcomes you to shed the ordinary and connect with nature once
										again.</p>
									<p style="text-align: justify;">As the entry point to
										Satpura Tiger Reserve, Madhai is ideal for initiating
										unforgettable wildlife experiences and eco-tourism
										explorations.</p>
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
								<div class="txt1">Embrace the Wild Serenity of Madhai</div>
								<div class="txt2">
									<p style="text-align: justify;">Bordered on three sides by
										the Satpura forests' lush green landscape and the wide expanse
										of the Tawa Reservoir to the north, Madhai is a serene jungle
										town located just three to four hours southeast of Bhopal. It
										provides the tranquility of a jungle town as an escape from
										the mayhem of city life, attracting nature enthusiasts and
										seekers of peace as much as anyone else. This quaint town is
										not simply a point of arrival—it's an experience in which
										nature presents itself in all its unadulterated splendor. The
										rustling of leaves, the exotic birdsong, and the soft lapping
										of waves blend together in a backdrop that elicits serenity,
										introspection, and awe. Whether you are venturing into the
										dense forests, watching wildlife in their natural
										surroundings, or just relaxing amidst nature's beauty, Madhai
										welcomes you to shed the ordinary and connect with nature once
										again.</p>
									<p style="text-align: justify;">As the entry point to
										Satpura Tiger Reserve, Madhai is ideal for initiating
										unforgettable wildlife experiences and eco-tourism
										explorations.</p>
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
	<div id="content" style="padding-bottom: 25px; padding-top: 15px;">
        <div class="container">
            <div class="details-wrapper clearfix" style="padding-right: 0; min-height: auto !important;">
                <div class="txt3">
                    <h6>🔹 Our Mission</h6>
                    <p style="text-align: justify;">At <I>Dream View Resort Heritage</I>, our mission is to offer a tranquil, nature-immersed escape where guests enjoy unmatched comfort, heritage charm, and warm hospitality amidst the lush forests of Madhai and the serene Tawa Reservoir.</p>
                    <h6>🔹 Our Goal</h6>
                    <p style="text-align: justify;">To establish <I>Dream View Resort Heritage</I> as the most sought-after eco-luxury destination in the region, blending natural beauty, cultural heritage, and sustainability in every guest experience.</p>
                    <h6>🔹 Our Values</h6>
                    <ul style="list-style-type: none;">
                    	<li><strong>✔ Guest-Centric Service: </strong>Your comfort is our priority.</li>
                    	<li><strong>✔ Eco-Conscious Living: </strong>We operate responsibly and in harmony with nature.</li>
                    	<li><strong>✔ Authentic Experience: </strong>Showcasing local traditions, flavors, and hospitality.</li>
                    	<li><strong>✔ Integrity First: </strong>We act with honesty, fairness, and transparency.</li>
                    	<li><strong>✔ Respect for All: </strong>We value our guests, team, and environment alike.</li>
                    </ul>
                   
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

		<jsp:include page="../footer.jsp" />


		<!--  <div id="loader" class="loader-holder">
        <div class="block"><img src="assets/images/hearts.svg" width="100" alt="loader"></div>
    </div> -->
	</div>

	<jsp:include page="../js.jsp" />

</body>

</html>