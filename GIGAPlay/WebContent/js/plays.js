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
	/*
	var posting = new FormData();
	var myImage = $('#fileup').prop("files");
	posting.append("name", $('#play-temp-name').val());
	posting.append("category", $('#play-temp-category1').val());
	posting.append("category2", $('#play-temp-category2').val());
	posting.append("cgroup", $('#play-temp-groups').val());
	posting.append("price", $('#play-temp-price').val());
	posting.append("intro", $('#play-temp-intro').val());
	posting.append("mid", $('#getSessionMid').val());
	 
	var hasFile = false;
    if (myImage[0] === undefined) {
       ;
    } else {
       hasFile = true;
       posting.append("file", myImage[0]);
    }
    
    for (var key of posting.entries()) {
        console.log(key[0] + ', ' + key[1]);
    }
    */
    $.ajax({
        type:"POST",
        url:"tempplay-add",
        data: {
 	   		"name":$('#play-temp-name').val(),
   		   	"category1":$('#play-temp-category1').val(),
   		   	"category2":$('#play-temp-category2').val(),
   		   	"cgroup": $('#play-temp-groups').val(),
   		   	"price":($('#play-temp-price').val() * 1),
   		   	"intro":$('#play-temp-intro').val(),
   		   	"mid": $('#getSessionMid').val()
        },
        datatype:"JSON", 
        success : function(data) {
              // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
              // TODO
     	   var test = JSON.parse(data);
     	   if(test.succ == "clubadd") {
     		   $('.modal-wrapper-eduplay').toggleClass('open');
     		   $('.page-wrapper').toggleClass('body-scroll')
     		   location.reload(true);
     		   return false;
     	   }
     	   if(test.err == "name_null") {
     		   $('#eduplay_name_errormsg').css('display', 'inline');
     	   }
        },
        error : function(xhr, status, error) {
              alert("강좌 등록 에러 발생!!");
        }
	});
});	
	$("#eduplay-submit-btn").click(function() {
		 $('#edu_name_errormsg').css('display', 'none');
		$.ajax({
	           type:"POST",
	           url:"eduplay-add",
	           data: {
	        	   	"name":$('#play-edu-name').val(),
		   		   	"category1":$('#play-edu-category1').val(),
		   		   	"category2":$('#play-edu-category2').val(),
		   		   	"cgroup": $('#play-edu-groups').val(),
		   		   	"price":($('#play-edu-price').val() * 1),
		   		   	"intro":$('#play-edu-intro').val(),
		   		   	"mid": $('#getSessionMid').val()
	           },
	           datatype:"JSON", 
	           success : function(data) {
	                 // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
	                 // TODO
	        	   var test = JSON.parse(data);
	        	   if(test.succ == "clubadd") {
	        		   $('.modal-wrapper-eduplay').toggleClass('open');
	        		   $('.page-wrapper').toggleClass('body-scroll')
	        		   location.reload(true);
	        		   return false;
	        	   }
	        	   if(test.err == "name_null") {
	        		   $('#eduplay_name_errormsg').css('display', 'inline');
	        	   }
	           },
	           error : function(xhr, status, error) {
	                 alert("강좌 등록 에러 발생!!");
	           }
		});
});