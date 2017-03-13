$(".gathering-border-playpage").hover(
		function() {
			$(this).css("background", "black");
			$(this).find('a').css("color", "white");
		},
		function() {
			$(this).css("background", "white");
			$(this).find('a').css("color", "black");
		}
);

$(".gathering-border").hover(
		function() {
			$(this).css("background", "black");
			$(this).find('a').css("color", "white");
		},
		function() {
			$(this).css("background", "white");
			$(this).find('a').css("color", "black");
		}
);

$("#error-btn").click(function() {
	 $('.modal-wrapper-error-nologin').toggleClass('open');
	    $('.page-wrapper').toggleClass('body-scroll')
	   //$('.page-wrapper').toggleClass('blur-it');
	    return false;
});

$("#tempplay-submit-btn").click(function() {
	 $('#tempplay_name_errormsg').css('display', 'none');
	$.ajax({
           type:"POST",
           url:"/GIGAPlay/play/tempplay-add",
           data: {
        	   	"name":$('#play-temp-name').val(),
	   		   	"category1":$('#play-temp-category1').val(),
	   		   	"category2":$('#play-temp-category2').val(),
	   		   	"cgroup": $('#play-temp-groups').val(),
	   		   	"price":($('#play-temp-price').val() * 1),
	   		   	"intro":$('#play-temp-intro').val()
           },
           datatype:"JSON", 
           success : function(data) {
                 // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
                 // TODO
        	   var test = JSON.parse(data);
        	   if(test.succ == "clubadd") {
        		   $('.modal-wrapper-tempplay').toggleClass('open');
        		   $('.page-wrapper').toggleClass('body-scroll')
        		   location.reload(true);
        		   return false;
        	   }
        	   if(test.err == "name_null") {
        		   $('#tempplay_name_errormsg').css('display', 'inline');
        	   }
           },
           error : function(xhr, status, error) {
                 alert("번개 등록 에러 발생!!");
           }
	});
});