<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
     <jsp:include page="../css.jsp" />
</head>
<body class="front" data-spy="scroll" data-target="#top-inner" data-offset="0">
<div id="main">
    
     <jsp:include page="../header.jsp" />
   <div class="breadcrumbs1_wrapper" style="background-image: url(assets/images/breadcumimg.jpeg); background-repeat: no-repeat; background-size: cover; height: 300px;">
			<div class="container-fluid"
				style="background: #00000033; height: -webkit-fill-available;">
				<div class="title1 text-white" style="padding-top: 130px;">Contacts</div>
				<div class="title2 text-white">
					<a href="./">Home</a><span> | </span>Contacts
				</div>
			</div>
		</div>
<div id="content">
        <div class="container">

            <div class="title1">CONTACT INFORMATION</div>

            <div class="title2">Lorem ipsum dolor sit amet concateur non troppo di saronno la prada</div>

            <div class="contact-location-wrapper">
                <div id="google_map">
                	<iframe width="100%" height="500" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?width=100%25&amp;height=600&amp;hl=en&amp;q=23.213300,%2081.534010+(My%20Business%20Name)&amp;t=&amp;z=10&amp;ie=UTF8&amp;iwloc=B&amp;output=embed"></iframe>
                </div>
                <div class="contact-location">
                    <div class="txt1">KEEP IN TOUCH</div>
                    <div class="txt2">Dream View Resort Heritage</div>
                    <!-- <div class="txt3"></div> -->
                    <div class="txt4">Infront MPT Bison Village – Sarangpur, Sohagpur Madhai</div>
                    <div class="txt5">
                        <dl class="dl1">
                            <dt>Call:</dt>
                            <dd>+919329197477, +919098753337</dd>
                            <dt>Email:</dt>
                            <dd><a href="mailto:info.dreamviewheritage@gmail.com">info.dreamviewheritage@gmail.com</a></dd>
                           
                            <!-- <dd>Delvatore.Hotel</dd>
                            <dt>Facebook:</dt>
                            <dd>Delvatore.facebook</dd>
                            <dt>Twitter:</dt>
                            <dd>@Delvatore.Hotel</dd> -->
                        </dl>
                    </div>
                </div>
            </div>

            <div class="title3">CONTACT FORM</div>

            <div id="note"></div>
            <div id="fields">
                <form id="ajax-contact-form" class="form-horizontal clearfix" action="javascript:;">
                    <div class="row">
                        <div class="col-md-6">

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="inputName2">Name <span>*</span></label>
                                        <input type="text" class="form-control" id="inputName2" name="name" value=""
                                               placeholder="">
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="inputEmail">Email <span>*</span></label>
                                        <input type="text" class="form-control" id="inputEmail" name="email" value=""
                                               placeholder="">
                                    </div>
                                </div>
                            </div>


                        </div>

                        <div class="col-md-6">

                            <div class="form-group">
                                <label for="inputMessage2">Comments <span>*</span></label>
                                <textarea class="form-control" rows="5" id="inputMessage2" name="content"
                                          placeholder=""></textarea>
                            </div>

                        </div>

                    </div>

                    <button type="submit" class="btn-default btn-cf-submit">send your message</button>
                </form>
            </div>


        </div>
    </div>
    <jsp:include page="../footer.jsp" />
  

   <!--  <div id="loader" class="loader-holder">
        <div class="block"><img src="images/hearts.svg" width="100" alt="loader"></div>
    </div> -->
</div>

 <jsp:include page="../js.jsp" />

</body>

</html>