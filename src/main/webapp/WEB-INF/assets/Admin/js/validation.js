
        
        /*Only Characters are allowed */
        $(function () {
            $(".name").keypress(function (e) { 
                var keyCode = e.keyCode || e.which;
    
                 /* $("#lblError").html(""); */
    
                //Regex for Valid Characters i.e. Alphabets.
                var regex = /^[A-Za-z. ]+$/;
    
    
                //Validate TextBox value against the Regex.
                var isValid = regex.test(String.fromCharCode(keyCode));
                /* if (!isValid) {
                    $("#lblError").html("Only Alphabets allowed.");
                } */
    
                return isValid;
             })
         });

        /*Only Mobile Number are allowed */
        $(function () {
            $(".number").keyup(function (e) { 
                var keyCode = e.keyCode || e.which;
    
                 /* $("#lblError").html(""); */
    
                //Regex for Valid Characters i.e. Alphabets.
                var regex = /^[0-9]+$/;
    
                //Validate TextBox value against the Regex.
                var isValid = regex.test(String.fromCharCode(keyCode));
                var value = $(this).val();
                if(value.length > 9)
                {
                    e.preventDefault();
                }
                /* if (!isValid) {
                    $("#lblError").html("Only Alphabets allowed.");
                } */
    
                return isValid;
             })
         });
        $(function () {
            $(".mobilenumber").keyup(function (e) { 
                var keyCode = e.keyCode || e.which;
    
                 /* $("#lblError").html(""); */
    
                //Regex for Valid Characters i.e. Alphabets.
                var regex = /^[0-9]+$/;
    
                //Validate TextBox value against the Regex.
                var isValid = regex.test(String.fromCharCode(keyCode));
                var value = $(this).val();
                if(value.length > 9)
                {
                    e.preventDefault();
                }
                /* if (!isValid) {
                    $("#lblError").html("Only Alphabets allowed.");
                } */
    
                return isValid;
             })
         });
        /*Integer and decimal number both are allowed*/
         $(function () {
            $(".number_decimal").keypress(function (e) {
                var keyCode = e.keyCode || e.which;
    
                 /* $("#lblError").html(""); */
    
                //Regex for Valid Characters i.e. Alphabets.
                var regex = /^[0-9. ]+$/;
    
                //Validate TextBox value against the Regex.
                var isValid = regex.test(String.fromCharCode(keyCode));
                /* if (!isValid) {
                    $("#lblError").html("Only Alphabets allowed.");
                } */
    
                return isValid;
             })
         });
		 /*Only numbers are allowed*/
			 $(function () {
            $(".numberAllowed").keypress(function (e) {
                var keyCode = e.keyCode || e.which;
    
                var regex = /^[0-9]+$/;
    
                var isValid = regex.test(String.fromCharCode(keyCode));
                if (!isValid) {
                   e.preventDefault();
                } 
    
                return isValid;
             })
         });



        /*Only email are allowed */
         $(function () {
            $(".email").keypress(function (e) {
                var keyCode = e.keyCode || e.which;
    
                 /* $("#lblError").html(""); */
    
                //Regex for Valid Characters i.e. Alphabets.
                 var regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    
                //Validate TextBox value against the Regex.
                var isValid = regex.test(String.escapeSelector(keyCode));
                /* if (!isValid) {
                    $("#lblError").html("Only Alphabets allowed.");
                } */
    
                return isValid;
             })
         });

	

        /*Only Characters and Number are allowed */
        $(function () {
            $(".alphaNumeric").keypress(function (e) { 
                var keyCode = e.keyCode || e.which;
    
                 /* $("#lblError").html(""); */
    
                //Regex for Valid Characters i.e. Alphabets.
                var regex = /^[A-Za-z0-9 ]+$/;
    
                //Validate TextBox value against the Regex.
                var isValid = regex.test(String.fromCharCode(keyCode));
                /* if (!isValid) {
                    $("#lblError").html("Only Alphabets allowed.");
                } */
    
                return isValid;
             })
         });
        
        /*Only Characters and Number are allowed */
        $(function () {
            $(".alphaNumericwithspacial").keypress(function (e) { 
                var keyCode = e.keyCode || e.which;
    
                 /* $("#lblError").html(""); */
    
                //Regex for Valid Characters i.e. Alphabets.
                var regex = /^[-A-Za-z0-9 .& ]+$/;
    
                //Validate TextBox value against the Regex.
                var isValid = regex.test(String.fromCharCode(keyCode));
                /* if (!isValid) {
                    $("#lblError").html("Only Alphabets allowed.");
                } */
    
                return isValid;
             })
         });
        
        $(document).ready(function(){     
            
        	$(".pan").change(function () {      
        	var inputvalues = $(this).val();      
        	  var regex = /[A-Z]{5}[0-9]{4}[A-Z]{1}$/;    
        	  if(!regex.test(inputvalues)){      
        	  $(".pan").val("");    
        	  alert("invalid PAN no");    
        	  return regex.test(inputvalues);    
        	  }    
        	});      
        	    
        });
        $(document).ready(function(){     
        	
        	$('.pincode').keypress(function(e) {
            	
                var a = [];
                var k = e.which;

                for (i = 48; i<=58; i++)
                    a.push(i);
                

                if (!(a.indexOf(k)>=0))
                    e.preventDefault();
                	
            });
        });
          
   /* Phone validation */
	
   $.validator.addMethod("phonenu", function (value, element) {
      if ( /^[6-9][0-9]{9}$/g.test(value)) {
          return true;
      } else {
          return false;s
      };
  }, "Invalid phone number");
  
  /* Password validation */
  $.validator.addMethod("pwcheck", function(value) {
	   return /^[A-Za-z0-9\d=!\-@._*]*$/.test(value) // consists of only
														// these
	       && /[a-z]/.test(value)
	       && value.length >= 8 
	        && /[A-Z]/.test(value)// has a lowercase letter
	       && /\d/.test(value) // has a digit
	},"Password must contains 8 characters with atleast 1 special character, 1 upper case, 1 lower case and 1 number.");
  
  	jQuery.validator.addMethod("lettersonly", function(value, element) {
  		 var regex = /^[a-zA-Z ]*$/;
	          if (regex.test(value)) {
	          return true;
	          } else {
	          return false;
	          }
	  }, "Letters only please");
  	  

  	jQuery.validator.addMethod("smalllettersonly", function(value, element) {
	  var regex = /^[a-z]+$/;
	          if (regex.test(value)) {
	          return true;
	          } else {
	          return false;
	          }
	  }, "Small letters only please");
  	
	  jQuery.validator.addMethod("letterWithSpecial", function(value, element) {
	  var regex = /^[a-zA-Z0-9 /,/&-.)(% ]*$/;
	  if (regex.test(value)) {
	          return true;
	          } else {
	          return false;
	          }
	  }, "Special characters allowed are ,&-.()");

	  jQuery.validator.addMethod("letterWithSpecialNotNum", function(value, element) {
	  var regex = /^[a-zA-Z /,/&-.)( ]*$/;
	          if (regex.test(value)) {
	          return true;
	          } else {
	          return false;
	          }
	  }, "Numbers not allowed and Allowed special characters are ,&-.()");


	  jQuery.validator.addMethod("letterWithSpecialType2", function(value, element) {
	  var regex = /^[a-zA-Z0-9 /,/&-.* (\n|\r\n) ]*$/;
	          if (regex.test(value)) {
	          return true;
	          } else {
	          return false;
	          }
	  }, "Special characters allowed are ,&-.*");

	  jQuery.validator.addMethod("alphaNumeric", function(value, element) {
	  var regex = /^[a-zA-Z0-9]*$/;
	          if (regex.test(value)) {
	          return true;
	          } else {
	          return false;
	          }
	  }, "No special character allowed");

	  jQuery.validator.addMethod("onlyNumericNot", function(value, element) {
	  var regex = /^[0-9]*$/;
	  if(value != ""){
	          if (regex.test(value)) {
	          return false;
	          } else {
	          return true;
	          }
	  }else{
	  return true;
	  }
	  }, "Only numeric is not allowed.");
	  
	  jQuery.validator.addMethod("onlyNumeric", function(value, element) {
		  var regex = /^[0-9]*$/;
		  if(value != ""){
		          if (regex.test(value)) {
		          return true;
		          } else {
		          return false;
		          }
		  }else{
		  return false;
		  }
		  }, "Only numeric is allowed.");
		  
		  jQuery.validator.addMethod("onlyNumericcomma", function(value, element) {
		  var regex = /^[0-9,]*$/;
		  if(value != ""){
		          if (regex.test(value)) {
		          return true;
		          } else {
		          return false;
		          }
		  }else{
		  return false;
		  }
		  }, "Only numeric is allowed.");
	
	  jQuery.validator.addMethod("onlyCharacterNot", function(value, element) {
	  var regex = /^[a-zA-Z]*$/;
	          if (regex.test(value)) {
	          return false;
	          } else {
	          return true;
	          }
	  }, "Only character is not allowed.");

	  $.validator.addMethod("noDecimal", function(value, element) {
	  if(value.includes(".")) {
	  return false;
	  }else {
	  return true;
	  }
	  }, "No decimal numbers");
	  
	
	  jQuery.validator.addMethod("emailvalid", function(value, element) {
		  var regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
		  if (regex.test(value)) {
		       return true;
		   } else {
		       return false;
		   }
	  }, "Invalid Email");
	  
	  jQuery.validator.addMethod("wordlimit", function(value, element) {
		  var regex = /^[a-zA-Z &-]{1,30}$/;
		          if (regex.test(value)) {
		          return true;
		          } else {
		          return false;
		          }
		  }, "Characters more than 30 is not allowed");
	  
	  jQuery.validator.addMethod("letterswithcharacters", function(value, element) {
		  var regex = /^[a-zA-Z & -]*$/;
		          if (regex.test(value)) {
		          return true;
		          } else {
		          return false;
		          }
		  }, "Numbers not allowed and Allowed special characters are & -");
	  
	  jQuery.validator.addMethod("lwnc", function(value, element) {
		  var regex = /^[a-zA-Z0-9 & -]*$/;
		  if (regex.test(value)) {
			  return true;
		  } else {
			  return false;
		  }
	  }, "You can use numbers, alphabets and these special characters only & -");
	  
	  /*For Gst*/ 
	  jQuery.validator.addMethod("gstvalid", function(value, element) {
		  var length = value.length;
		  if (length <= 15) {
			  return true;
		  } else {
			  return false;
		  }
	  }, "You can use numbers, alphabets and these special characters only & -");
	 	  
	 jQuery.validator.addMethod("wordrange", function(value, element) {
		  if (value.length >= 3 && value.length <= 50){
			  return true;
		  } else {
			  return false;
		  }
	  }, "The minimum word must be 3 characters and maximum upto 30.");
	 
	 jQuery.validator.addMethod("notEqual", function(value, element, param) {
		  return this.optional(element) || value != param;
	 }, "Please specify a different (non-default) value");




	