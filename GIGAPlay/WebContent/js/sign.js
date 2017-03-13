$(document).ready(function() {
	$("#signup-btn").click(function() {
		 $('#mid_errormsg_null').css('display', 'none');
		 $('#mid_errormsg_redun').css('display', 'none');
		 $('#pw_errormsg').css('display', 'none');
		 $('#name_errormsg').css('display', 'none');
		 $('#email_errormsg').css('display', 'none');
		$.ajax({
	           type:"POST",
	           url:"/GIGAPlay/play/signup",
	           data: {
	        	   	"mid":$('#signup-mid').val(),
		   		   	"pw":$('#signup-pw').val(),
		   		   	"name":$('#signup-name').val(),
		   		   	"birth":$('#signup-birth').val(),
		   		   	"groups":$('#signup-groups').val(),
		   		   	"phone":$('#signup-phone').val(),
		   		   	"email":$('#signup-email').val()  
	           },
	           datatype:"JSON", 
	           success : function(data) {
	                 // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
	                 // TODO
	        	   var test = JSON.parse(data);
	        	   if(test.succ == "signup") {
	        		   $('.modal-wrapper').toggleClass('open');
	        		   $('.page-wrapper').toggleClass('body-scroll')
	        		   return false;
	        	   }
	        	   if(test.err == "redun") {
	        		   $('#mid_errormsg_redun').css('display', 'inline');
	        	   }
	        	   else {
	        		   if(test.err == "mid_null") {
		        		   $('#mid_errormsg_null').css('display', 'inline');
		        	   }
		        	   if(test.err == "pw_null") {
		        		   $('#pw_errormsg').css('display', 'inline');
		        	   }
		        	   if(test.err == "name_null") {
		        		   $('#name_errormsg').css('display', 'inline');
		        	   }
		        	   if(test.err == "email_null") {
		        		   $('#email_errormsg').css('display', 'inline');
		        	   }
	        	   }
	        	  
	           },
	           error : function(xhr, status, error) {
	                 alert("ERROR!");
	           }
	     });
	}); 
	
	$("#login-btn").click(function() {
		 $('#login_errormid').css('display', 'none');
		 $('#login_errorpw').css('display', 'none');
		 $('#login_nomid').css('display', 'none');
		 $('#login_fail').css('display', 'none');
		$.ajax({
	           type:"POST",
	           url:"/GIGAPlay/play/login",
	           data: {
	        	   	"mid":$('#login-mid').val(),
		   		   	"pw":$('#login-pw').val(),
	           },
	           datatype:"JSON", 
	           success : function(data) {
	                 // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
	                 // TODO
	        	   var test = JSON.parse(data);  
	        	   if(test.succ == "login") {
	        		   $('.modal-wrapper-login').toggleClass('open');
	        		   $('.page-wrapper').toggleClass('body-scroll')
	        		   location.reload();
	        	   }
	        	   if(test.err == "mid_null") {
	        		   $('#login_errormid').css('display', 'inline');
	        	   }
	        	   if(test.err == "pw_null") {
	        		   $('#login_errorpw').css('display', 'inline');
	        	   }
	        	   if(test.err == "mid_novalue") {
	        		   $('#login_nomid').css('display', 'inline');
	        	   }
	        	   if(test.err == "loginfail") {
	        		   $('#login_fail').css('display', 'inline');
	        	   }
	           },
	           error : function(xhr, status, error) {
	                 alert("ERROR!");
	           }
	     });
	}); 
	$(".trigger-logout").click(function() {
		$.ajax({
	           type:"POST",
	           url:"/GIGAPlay/play/logout",
	           data: {
	        	   	"session" : "true"
	           },
	           datatype:"JSON", 
	           success : function(data) {
	        	   location.reload();
	           },
	           error : function(xhr, status, error) {
	                 alert("ERROR!");
	           }
	     });
	}); 
});