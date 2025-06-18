<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/superfish.js"></script>
<script src="assets/js/jquery.superslides.js"></script>
<script src="assets/js/jquery.fancybox.js"></script>
<script src="assets/js/jquery.sticky.js"></script>
<script src="assets/js/jquery.easing.1.3.js"></script>
<script src="assets/js/select2.js"></script>
<script src="assets/js/jquery-ui.js"></script>
<script src="assets/js/owl.carousel.js"></script>
<script src="assets/js/slick.js"></script>
<script src="assets/js/jquery.appear.js"></script>
<script src="assets/js/popper.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.21.0/jquery.validate.min.js"></script>
<script>
  window.addEventListener('scroll', function () {
    var header = document.querySelector('.top2-wrapper');
    if (window.scrollY > 50) {
      header.classList.add('scrolled');
    } else {
      header.classList.remove('scrolled');
    }
  });
  function blogdetails(sno,name){
		
		 var url = "blog_details?id=" + sno + "&/" + name;
		    window.location.href = url;
	}
  function getDetails(sno,name){
		 var url = "room_details?id=" + sno + "&/" + name;
		    window.location.href = url;
	}
  function bookRoom(sno,name){
		 var url = "booking?id=" + sno + "&/" + name;
		    window.location.href = url;
	}
  
  function generatereceipt() {
	  var booking_id = $("#bkid").val()
	  if(booking_id != null && booking_id != ""){
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
	  }else{
		 alert("Please Enter Booking Id for generate receipt"); 
	  }
     
}
  function getroom() {
	  var rm_id = $("#rm_id").val()
	  if(rm_id != null && rm_id != ""){
		  var mapForm = document.createElement("form");
	      mapForm.method = "POST";
	      mapForm.target = "_blank";
	      mapForm.action = "rooms";
	      var output = document.createElement("input");
	      output.type = "hidden";
	      output.name = "room_id";
	      output.value = rm_id;
	      mapForm.appendChild(output);
	      document.body.appendChild(mapForm);
	      mapForm.submit();
	  }else{
		 alert("Please Enter Booking Id for generate receipt"); 
	  }
     
}
  function getData(){
	  var booking_id = $("#bking_id").val();
	  var fd = new FormData();
		fd.append("booking_id", booking_id.trim());
		$.ajax({
			url : 'getBdata',
			type : 'post',
			data : fd,
			contentType : false,
			processData : false,
			success : function(data) {
				if (data['status'] == 'Success') {
					$("#name").val(data['data'][0].name);
					$("#email").val(data['data'][0].email);
					$("#phone").val(data['data'][0].mobile_number);
					$("#title").val(data['data'][0].title);
					$("#due_amount").val(data['data'][0].due_amount);
				} else {
					$("#getin").html("Invalid Booking ID");
					  setTimeout(function () {
                          $("#getin").html("Get Details")
                      }, 2000);
				}
			}
		});
  }
  
  function payment(){
	  var booking_id = $("#bking_id").val();
	  var amount = $("#due_amount").val();
	  if (booking_id != null && booking_id != "" && parseFloat(amount) > 0) {
	         
	         var name = $("#name").val();
	         var email = $("#email").val();
	         var mobile = $("#phone").val();
			$("#sbmtbtn").attr("disabled",true);
	        $.ajax({
	            url: 'create_order',
	            data: JSON.stringify({"amount": parseFloat(amount)}),
	            contentType: 'application/json',
	            type: 'POST',
	            dataType: 'json',
	            success: function (data) {
	                console.log(data);
	                var response = JSON.parse(data['razorOrder']);
	                var id = response.id;

	                if (response.status === "created") {
	                    var options = {
	                        "key": "rzp_test_TAsu9r4XMXPVIJ",
	                        "amount": response.amount,
	                        "currency": "INR",
	                        "name": "Dream View Resort",
	                        "description": "Transaction",
	                        "image": "	http://localhost:8081/safariBooking/assets/img/logo.png",
	                        "order_id": id,
	                        "handler": function (response) {
	                        	var obj = {
	                                    "booking_id": booking_id,
	                                    "amount": amount,
	                                    "razorpay_payment_id": response.razorpay_payment_id,
	                                    "razorpay_order_id": response.razorpay_order_id,
	                                    "razorpay_signature": response.razorpay_signature,
	                                    "order_id": id,
	                                };
	                           
	                            $.ajax({
	                                url: 'add_Payment',
	                                type: 'post',
	                                dataType: 'json',
	                                data: JSON.stringify(obj),
	                                contentType: 'application/json',
	                                success: function (data) {
	                                    if (data['status'] === 'Success') {
	                                        $("#pmntbtn").html(data['message']);
	                                        setTimeout(function () {
	                                        	$("#pmntbtn").html("Pay");
	                                        	 $('#pModal').modal('toggle');
	                                        	
	                                        }, 3000);

	                                    } else {
	                                        swal({
	                                            title: "Oops!",
	                                            text: "Something went wrong!",
	                                            icon: "error",
	                                            type: 'error',
	                                            button: "oh no!",
	                                            allowOutsideClick: false,
	                                            allowEscapeKey: false
	                                        });
	                                    }
	                                }
	                            });

	                            console.log(response);
	                        },
	                        "prefill": {
	                            "name": name,
	                            "email": email,
	                            "contact": mobile
	                        },
	                        "notes": {
	                            "address": ""
	                        },
	                        "theme": {
	                            "color": "#3399cc"
	                        }
	                    };

	                    var rzp1 = new Razorpay(options);
	                    rzp1.open(); // This line opens the Razorpay payment modal

	                } else {
	                    alert(response.status);
	                }
	            }

	        });
	    } else {
		    $("#pmntbtn").html("No payment required (INR 0)");
		    setTimeout(function () {
            	$("#pmntbtn").html("Pay");
            	 $('#pModal').modal('toggle');
            	
            }, 3000);
	    }
  }
</script>