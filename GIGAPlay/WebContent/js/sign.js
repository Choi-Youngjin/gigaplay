$(document).ready(function() {
	$("#signup-btn").click(function() {
		 $('#mid_errormsg_null').css('display', 'none');
		 $('#mid_errormsg_redun').css('display', 'none');
		 $('#pw_errormsg').css('display', 'none');
		 $('#name_errormsg').css('display', 'none');
		 $('#email_errormsg').css('display', 'none');
		$.ajax({
	           type:"POST",
	           url:"play/signup",
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
	        	   var test = eval('(' + data + ')');
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
	           complete : function(data) {
	                 // 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
	                 // TODO
	           },
	           error : function(xhr, status, error) {
	                 alert("ERROR!");
	           }
	     });
	}); 
});