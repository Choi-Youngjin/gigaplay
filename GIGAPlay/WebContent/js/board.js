$("#newBoard-btn").click(function() {
	$('#board_category_errormsg_null').css('display', 'none');
	$('#board_title_errormsg_null').css('display', 'none');
	$('#board_content_errormsg_null').css('display', 'none');
	$.ajax({
		type : "POST",
		url : "/GIGAPlay/play/newBoard",
		data : {
			"category" : $('#newBoard-category').val(),
			"title" : $('#newBoard-title').val(),
			"content" : $('#newBoard-content').val(),
			"cid" : $('#newBoard-cid').val(),
			"member" : $('#newBoard-member').val()
		},
		datatype : "JSON",
		success : function(data) {
			// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
			// TODO
			var test = JSON.parse(data);
			if (test.succ == "write") {
				$('.modal-wrapper-newBoard').toggleClass('open');
				$('.page-wrapper').toggleClass('body-scroll')
				location.reload(true);
				return false;
			}
			if (test.err == "category_null") {
				$('#board_category_errormsg_null').css('display', 'inline');
			} else if (test.err == "title_null") {
				$('#board_title_errormsg_null').css('display', 'inline');
			} else if (test.err == "content_null") {
				$('#board_content_errormsg_null').css('display', 'inline');
			}
		},
		error : function(xhr, status, error) {
			alert("글쓰기 에러 발생!!");
		}
	});
});

$(".boardView").click(function() {
	$.urlParam = function(name){
	    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
	    if (results==null){
	       return null;
	    }
	    else{
	       return results[1] || 0;
	    }
	}
	var bid = this.parentNode.children[0].innerText;
	var cid = $.urlParam('cid'); 
	location.href="boardView?cid="+cid+"&bid="+bid;
	
});

$('#comment_write_submit').click(function() {
	$.urlParam = function(name){
	    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
	    if (results==null){
	       return null;
	    }
	    else{
	       return results[1] || 0;
	    }
	}
	var comm = $('#comment_write_submit').parent().children('textarea').val();
	var cid = $.urlParam('cid');
	var bid = $.urlParam('bid');
	var mid = "error";
	console.log(comm + bid);
	console.log(1);
	$('#comment_content_errormsg_null').css('display', 'none');
	$.ajax({
		type : "POST",
		url : "/GIGAPlay/play/commWrite",
		data : {
			"cid" : cid,
			"bid" : bid,
			"mid" : $('#writer').val(),
			"content" : comm
		},
		datatype : "JSON",
		success : function(data) {
			// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
			// TODO
			var test = JSON.parse(data);
			if (test.succ == "write") {
				
				location.reload(true);
				return false;
			}
			if (test.err == "content_null") {
				$('#comment_content_errormsg_null').css('display', 'inline');
			}
		},
		error : function(xhr, status, error) {
			alert("댓글쓰기 에러 발생");
		}
	});
})

// 게시글 삭제버튼 눌렀을 때
$(".buttonimage3").click(function() {
	$.urlParam = function(name){
	    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
	    if (results==null){
	       return null;
	    }
	    else{
	       return results[1] || 0;
	    }
	}
	var cid = $.urlParam('cid');
	var bid = $.urlParam('bid');
	$.ajax({
		type : "POST",
		url : "/GIGAPlay/play/boardDelete",
		data : {
			"bid" : bid,
			"cid" : cid
		},
		datatype : "JSON",
		success : function(data) {
			// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
			// TODO
			var test = JSON.parse(data);
			if (test.succ == "delete") {
				location.href = "clubDetail?tab=board&cid="+cid;
				return false;
			}
		},
		error : function(xhr, status, error) {
			alert("게시글 삭제 에러 발생");
		}
	});
});

// 댓글 삭제
$('.comment_delete_button').click(function() {
	var commid =$(this).parent().children('input').val()
	$.ajax({
		type : "POST",
		url : "/GIGAPlay/play/commDelete",
		data : {
			"commid" : commid
		},
		datatype : "JSON",
		success : function(data) {
			// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
			// TODO
			var test = JSON.parse(data);
			if (test.succ == "delete") {
				
				location.reload(true);
				return false;
			}
		},
		error : function(xhr, status, error) {
			alert("댓글 삭제 에러 발생");
		}
	});
})

// 동호회 가입 신청을 했을 때!!!!
$("#applyClub").click(function() {
		$.ajax({
	           type:"POST",
	           url:"/GIGAPlay/play/applyClub",
	           data: {
	        	   	"amid": $('#applyClubMid').val(),
	        	   	"cid" : $('#applyClubCid').val()
	           },
	           datatype:"JSON", 
	           success : function(data) {
	                 // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
	                 // TODO
	        	   var test = JSON.parse(data);
	        	   if(test.succ == "apply") {
	        		  alert("가입 신청 성공!");
	        	   }
	           },
	           error : function(xhr, status, error) {
	                 alert("가입 신청 실패!! 에러 발생!");
	           }
		});
});

$('#applyok').click(function(data){
	$.urlParam = function(name){
	    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
	    if (results==null){
	       return null;
	    }
	    else{
	       return results[1] || 0;
	    }
	}
	var cid = $.urlParam('cid');
	var amid = $(this).parent().parent().siblings('input').val();
	$.ajax({
        type:"POST",
        url:"/GIGAPlay/play/applyOk",
        data: {
        	"cid" : cid,
     	   	"amid" : amid
        },
        datatype:"JSON", 
        success : function(data) {
              // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
              // TODO
     	   var test = JSON.parse(data);
     	   if(test.succ == "apply") {
     		  alert("가입 허가 성공!");
     		 location.reload(true);
     	   }
        },
        error : function(xhr, status, error) {
              alert("가입 허가 실패!! 에러 발생!");
        }
	});
});
$('#applyno').click(function(data){
	$.urlParam = function(name){
	    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
	    if (results==null){
	       return null;
	    }
	    else{
	       return results[1] || 0;
	    }
	}
	var cid = $.urlParam('cid');
	var amid = $(this).parent().parent().siblings('input').val();
	console.log(amid);
	$.ajax({
        type:"POST",
        url:"/GIGAPlay/play/applyNo",
        data: {
     	   	"cid" : cid,
     	   	"amid" : amid
        },
        datatype:"JSON", 
        success : function(data) {
              // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
              // TODO
     	   var test = JSON.parse(data);
     	   if(test.succ == "apply") {
     		  alert("가입 거부 성공!");
     		  location.reload(true);
     	   }
        },
        error : function(xhr, status, error) {
              alert("가입 거부 실패!! 에러 발생!");
        }
	});
});