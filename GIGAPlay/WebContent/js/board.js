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
	var bid = this.parentNode.children[0].innerText;
	location.href="boardView?bid="+bid;
	
});