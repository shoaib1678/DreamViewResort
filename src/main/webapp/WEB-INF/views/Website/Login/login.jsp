<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
     <jsp:include page="../css.jsp" />
     <style type="text/css">
     section {
  position: relative;
  min-height: 100vh;
 background-image: url("assets/images/loginubg.jpg");background-repeat: no-repeat; background-size: cover;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 20px;
}

section .container {
  position: relative;
  width: 800px;
  height: 500px;
  background: #fff;
  box-shadow: 0 15px 50px rgba(0, 0, 0, 0.1);
  overflow: hidden;
}

section .container .user {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  display: flex;
}

section .container .user .imgBx {
  position: relative;
  width: 50%;
  height: 100%;
  background: #ff0;
  transition: 0.5s;
}

section .container .user .imgBx img {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  object-fit: cover;
}

section .container .user .formBx {
  position: relative;
  width: 50%;
  height: 100%;
  background: #fff;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 40px;
  transition: 0.5s;
}

section .container .user .formBx form h2 {
  font-size: 18px;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 2px;
  text-align: center;
  width: 100%;
  margin-bottom: 10px;
  color: #555;
}

section .container .user .formBx form input {
  position: relative;
  width: 100%;
  padding: 10px;
  background: #f5f5f5;
  color: #333;
  border: none;
  outline: none;
  box-shadow: none;
  margin: 8px 0;
  font-size: 14px;
  letter-spacing: 1px;
  font-weight: 300;
}

section .container .user .formBx form input[type='submit'] {
  max-width: 100px;
  background: #677eff;
  color: #fff;
  cursor: pointer;
  font-size: 14px;
  font-weight: 500;
  letter-spacing: 1px;
  transition: 0.5s;
}

section .container .user .formBx form .signup {
  position: relative;
  margin-top: 20px;
  font-size: 12px;
  letter-spacing: 1px;
  color: #555;
  text-transform: uppercase;
  font-weight: 300;
}

section .container .user .formBx form .signup a {
  font-weight: 600;
  text-decoration: none;
  color: #677eff;
}

section .container .signupBx {
  pointer-events: none;
}

section .container.active .signupBx {
  pointer-events: initial;
}

section .container .signupBx .formBx {
  left: 100%;
}

section .container.active .signupBx .formBx {
  left: 0;
}

section .container .signupBx .imgBx {
  left: -100%;
}

section .container.active .signupBx .imgBx {
  left: 0%;
}

section .container .signinBx .formBx {
  left: 0%;
}

section .container.active .signinBx .formBx {
  left: 100%;
}

section .container .signinBx .imgBx {
  left: 0%;
}

section .container.active .signinBx .imgBx {
  left: -100%;
}

@media (max-width: 991px) {
  section .container {
    max-width: 400px;
  }

  section .container .imgBx {
    display: none;
  }

  section .container .user .formBx {
    width: 100%;
  }
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
				<div class="title1 text-white" style="padding-top: 130px;">Login / Register</div>
				<div class="title2 text-white">
					<a href="./">Home</a><span> | </span>Login / Register
				</div>
			</div>
		</div>
   <section>
    <div class="container">
      <div class="user signinBx">
        <div class="imgBx"><img src="assets/images/loginf.webp" alt="" /></div>
        <div class="formBx">
          <form action="./" id="login" name="login" method ="post">
            <h2>Sign In</h2>
            <input type="text" name="email" id="lemail" placeholder="Username" />
            <input type="password" name="password" id="lpassword" placeholder="Password" />
            <input type="submit" name="" id="bttnn" value="Login" />
            <p class="signup">
              Don't have an account ?
              <a href="#" onclick="toggleForm();">Sign Up.</a>
            </p>
          </form>
        </div>
      </div>
      <div class="user signupBx">
        <div class="formBx">
          <form action="" onsubmit="return false;" id="register" name="register">
            <h2>Create an account</h2>
            <input type="text" name="user_name" id="user_name" placeholder="Username" />
            <input type="email" name="remail" id="remail" placeholder="Email Address" />
            <input type="password" name="password" id="password" placeholder="Create Password" />
            <input type="password" name="cpassword" id="cpassword" placeholder="Confirm Password" />
            <input type="submit" name="" id="rbtn" value="Sign Up" />
            <p class="signup">
              Already have an account ?
              <a href="#" onclick="toggleForm();">Sign in.</a>
            </p>
          </form>
        </div>
        <div class="imgBx"><img src="assets/images/signupim.webp" alt="" /></div>
      </div>
    </div>
  </section>

    <jsp:include page="../footer.jsp" />
  

   <!--  <div id="loader" class="loader-holder">
        <div class="block"><img src="images/hearts.svg" width="100" alt="loader"></div>
    </div> -->
</div>

 <jsp:include page="../js.jsp" />
 <script type="text/javascript">
 function toggleForm() {
	  $('.container').toggleClass('active');
	}
 
 $(function() {
		$("form[name='register']")
				.validate(
						{
							rules : {
								user_name : {
									required : true,
								},
								remail : {
									required : true,
									email: true 
								},
								password : {
									required : true,
									minlength: 6
								},
								cpassword : {
									required : true,
									equalTo: "#password" 
								},
							},

							messages : {

								user_name : {
									required : "Please enter user name",
								},
								remail : {
									required : "Please enter email",
									email: "Please enter a valid email address"
								},
								password : {
									required : "Please enter pasword",
									minlength: "Password must be at least 6 characters"
								},
								cpassword : {
									required : "Please enter confirm password",
									 equalTo: "Passwords do not match"
									
								},
							},

							submitHandler : function(form) {
								$("#rbtn").attr("disabled", true);
								$("#rbtn").val("Please Wait...");
								var user_name = $("#user_name").val();
								var email = $("#remail").val();
								var password = $("#password").val();

								var obj = {
									"user_name" : user_name,
									"email" : email,
									"password" : password
								};
								
								$.ajax({
									url : 'add_user',
									type : 'post',
									data : JSON.stringify(obj),
									dataType : 'json',
									contentType :  'application/json',
									success : function(data) {
										if (data['status'] == 'Success') {
											$("#rbtn").val(data['message']);
											setTimeout(function () {
												$("#rbtn").attr("disabled", false);
												$("#rbtn").val("Sign Up");
												toggleForm();
	                                        }, 3000);
											
											} else if(data['status'] == 'Already_Exist'){
												$("#rbtn").val(data['message']);
												setTimeout(function () {
													$("#rbtn").attr("disabled", false);
													$("#rbtn").val("Sign Up");
		                                        }, 3000);
											}
											else if(data['status'] == 'Failed'){
												$("#rbtn").val(data['message']);
												setTimeout(function () {
													$("#rbtn").attr("disabled", false);
													$("#rbtn").val("Sign Up");
		                                        }, 3000);
											}
									}
								});

							}
						});

	});
 $(function() {
		$("form[name='login']").validate({
			rules : {
				email : {
					required : true,
				},
				password : {
					required : true,
				}
			},
			messages : {
				email : "Please enter valid username",
				password : "Please enter password",

			},
			submitHandler : function(form) {
				$("#bttnn").html("Please Wait..");
				var email = $("#lemail").val();
				var password = $("#lpassword").val();
				
				var fd = new FormData();
				
				fd.append("email",email);
				fd.append("password",password);
				fd.append("user_type","User");
				

				$.ajax({
					url : 'checklogin',
					type : 'post',
					data : fd,
					contentType : false,
					processData : false,
					success : function(data) {

						if (data['status'] == 'Success') {
							$("#bttnn").val("Success");
							form.submit();
						
						} else{
							$("#bttnn").val("Invalid Credentials");
							setTimeout(function() {
								$("#bttnn").val("Login");
						      }, 3000);
						}
						
					}
				});
			}
		});
	});
 </script>

</body>

</html>