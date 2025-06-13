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
	  if(bookin_id != null && booking_id != ""){
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
</script>