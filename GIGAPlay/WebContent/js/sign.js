$(document).ready(function() {
	$("#signup-btn").bind(function() {
		alert("1111");
	});
	$("#signup-btn").click(function() {
		alert("2222");
		$.ajax({
	           type:"POST",
	           url:"play/signup",
	           data: {
	        	 'mid':$('#signup-mid').val(),
	        	 'pw':$('#signup-pw').val(),
	        	 'name':$('#signup-name').val(),
	        	 'birth':$('#signup-birth').val(),
	        	 'groups':$('#signup-groups').val(),
	        	 'phone':$('#signup-phone').val(),
	        	 'email':$('#signup-email').val()
	           },
	           datatype:"JSON", 
	           success : function(data) {
	                 // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
	                 // TODO
	        	   alert(1);
	           },
	           complete : function(data) {
	                 // 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
	                 // TODO
	        	   alert(2);
	           },
	           error : function(xhr, status, error) {
	                 alert("에러발생");
	           }
	     });
	}); 
});