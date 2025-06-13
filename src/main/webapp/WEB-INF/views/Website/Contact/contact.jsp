<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
     <jsp:include page="../css.jsp" />
     <style>
    .right_conatct_social_icon{
         background: linear-gradient(to top right, #fab000 -5%, #db8136 100%);
}
.contact_us{
    background-color: #f1f1f1;
    padding: 60px 0px;
}

.contact_inner{
    background-color: #fff;
    position: relative;
    box-shadow: 20px 22px 44px #cccc;
    border-radius: 25px;
}
.contact_field{
    padding: 60px 340px 90px 100px;
}
.right_conatct_social_icon{
    height: 100%;
}

.contact_field h3{
   color: #000;
    font-size: 40px;
    letter-spacing: 1px;
    font-weight: 600;
    margin-bottom: 10px
}
.contact_field p{
    color: #000;
    font-size: 13px;
    font-weight: 400;
    letter-spacing: 1px;
    margin-bottom: 35px;
}
.contact_field .form-control{
    border-radius: 0px;
    border: none;
    border-bottom: 1px solid #ccc;
}
.contact_field .form-control:focus{
    box-shadow: none;
    outline: none;
    border-bottom: 2px solid #1325e8;
}
.contact_field .form-control::placeholder{
    font-size: 13px;
    letter-spacing: 1px;
}

.contact_info_sec {
    position: absolute;
    background-color: #2d2d2d;
    right: 1px;
    top: 18%;
    height: 340px;
    width: 340px;
    padding: 40px;
    border-radius: 25px 0 0 25px;
}
.contact_info_sec h4{
    letter-spacing: 1px;
    padding-bottom: 15px;
    color: white;
}

.info_single{
    margin: 30px 0px;
}
.info_single i{
    margin-right: 15px;
}
.info_single span{
    font-size: 14px;
    letter-spacing: 1px;
    color: white;
}

button.contact_form_submit {
    background: linear-gradient(to top right, #fab000 -5%, #db8136 100%);
    border: none;
    color: #fff;
    padding: 10px 15px;
    width: 100%;
    margin-top: 25px;
    border-radius: 35px;
    cursor: pointer;
    font-size: 14px;
    letter-spacing: 2px;
}
.socil_item_inner li{
    list-style: none;
}
.socil_item_inner li a{
    color: #fff;
    margin: 0px 15px;
    font-size: 14px;
}
.socil_item_inner{
    padding-bottom: 10px;
}
@media only screen and (max-width: 768px) {
  .contact_field {
    padding: 20px 10px;
  }

  .contact_info_sec {
    margin-top: 350px;
  }

  .contact_field p,h3 {
    text-align: center;
  }
  .contact_form_inner{
      height: 870px;
  }
}
.map_sec{
    padding: 50px 0px;
}
.map_inner h4, .map_inner p{
    color: #000;
    text-align: center
}
.map_inner p{
    font-size: 13px;
}
.map_bind{
   margin-top: 50px;
    border-radius: 30px;
    overflow: hidden;
}
.error{
color: red;
}
  </style>
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
 <section class="contact_us">
        <div class="container">
            <div class="row">
                <div class="col-md-10 offset-md-1">
                    <div class="contact_inner">
                        <div class="row">
                            <div class="col-md-10">
                                <div class="contact_form_inner">
                                    <div class="contact_field">
                                        <h3>Contact Us</h3>
                                        <p>Feel Free to contact us any time. We will get back to you as soon as we can!.</p>
                                        <form action="" id="contact_form" name="contact_form">
                                         <input type="text" class="form-control form-group" id="name" name="name" placeholder="Name" />
                                        <input type="text" class="form-control form-group" id="mobile_number" name="mobile_number" placeholder="Phone Number" />
                                        <input type="text" class="form-control form-group" id="email" name="email" placeholder="Email" />
                                        <textarea class="form-control form-group" id="message" name="message" placeholder="Message"></textarea>
                                        <button type="submit" class="contact_form_submit" id="sndbtn">Send</button>
                                        </form>
                                       
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="right_conatct_social_icon d-flex align-items-end">
                                   <div class="socil_item_inner d-flex">
                                      <li><a href="https://www.facebook.com/dreamviewresort.madhai/"><i class="fa fa-facebook-square"></i></a></li>
                                      <li><a href="https://www.instagram.com/dreamviewresortmadhai/"><i class="fa fa-instagram"></i></a></li>
                                   </div>
                                </div>
                            </div>
                        </div>
                        <div class="contact_info_sec">
                            <h4>Contact Info</h4>
                            <div class="d-flex info_single align-items-center">
                                <i class="fas fa-headset"></i>
                                <span>+919329197477, +919098753337</span>
                            </div>
                            <div class="d-flex info_single align-items-center">
                                <i class="fas fa-envelope-open-text"></i>
                                <span>info.dreamviewheritage@gmail.com</span>
                            </div>
                            <div class="d-flex info_single align-items-center">
                                <i class="fas fa-map-marked-alt"></i>
                                <span><b>Resort Address:</b> Infront MPT Bison Village – Sarangpur, Sohagpur Madhai</span>
                            </div>
            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
     <section class="map_sec">
        <div class="container">
            <div class="row">
                <div class="col-md-10 offset-md-1">
                    <div class="map_inner">
                        <h4>Find Us on Google Map</h4>
                        <p>Dream View Resort is nestled amidst nature, offering a peaceful escape from the city. Visit us and enjoy a relaxing stay surrounded by scenic beauty.</p>
                        <div class="map_bind">
                            <iframe src="https://maps.google.com/maps?width=100%25&amp;height=600&amp;hl=en&amp;q=23.213300,%2081.534010+(My%20Business%20Name)&amp;t=&amp;z=10&amp;ie=UTF8&amp;iwloc=B&amp;output=embed" width="100%" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <jsp:include page="../footer.jsp" />
  

   <!--  <div id="loader" class="loader-holder">
        <div class="block"><img src="images/hearts.svg" width="100" alt="loader"></div>
    </div> -->
</div>

 <jsp:include page="../js.jsp" />
 
 <script>
 $(function () {
	    $("form[name='contact_form']").validate({
	        rules: {
	            name: { required: true },
	            email: { required: true },
	            mobile_number: { required: true },
	            message: { required: true }
	        },
	        messages: {
	            name: "",
	            email: "",
	            mobile_number: "",
	            message: ""
	        },
	        highlight: function (element) {
	            $(element).css({
	                "border": "none",
	                "border-bottom": "2px solid red",
	                "outline": "none",
	                "box-shadow": "none"
	            });
	        },
	        unhighlight: function (element) {
	            $(element).css({
	                "border": "none",
	                "border-bottom": "2px solid #ccc",
	                "outline": "none",
	                "box-shadow": "none"
	            });
	        },
	        errorPlacement: function () {
	            return false; // Prevent error message display
	        },
	        submitHandler: function (form) {
	            $("#sndbtn").attr("disabled", true).html("Please wait...");

	            const obj = {
	                name: $("#name").val(),
	                email: $("#email").val(),
	                mobile_number: $("#mobile_number").val(),
	                message: $("#message").val()
	            };

	            $.ajax({
	                url: 'add_enquiry',
	                type: 'post',
	                data: JSON.stringify(obj),
	                dataType: 'json',
	                contentType: 'application/json',
	                success: function (data) {
	                    if (data['status'] === 'Success') {
	                        $("#sndbtn").css("background", "green").html(data['message']);
	                        $('#contact_form').trigger("reset");

	                        setTimeout(function () {
	                            $("#sndbtn").html("send")
	                                .css("background", "linear-gradient(to top right, #fab000 -5%, #db8136 100%)")
	                                .attr("disabled", false);
	                        }, 3000);
	                    } else {
	                        alert(data['message']);
	                    }
	                }
	            });
	        }
	    });
	});

	
	</script>

</body>

</html>