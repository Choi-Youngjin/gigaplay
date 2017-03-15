<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="dao.MemberDAO, dto.BoardDTO, dto.CommentDTO" %>
<%
	String path = request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>boardView.jsp</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=path %>css/normalize.css">
<link rel="stylesheet" href="<%=path %>css/bootstrap.css">

<link rel="stylesheet" href="<%=path %>css/modal.css">

<link rel="stylesheet" href="<%=path %>css/font-awesome.min.css">
<link rel="stylesheet" href="<%=path %>css/owl.carousel.css">
<link rel="stylesheet" href="<%=path %>css/responsive.css">
<link rel="stylesheet" href="<%=path %>css/sima-style.css">
<link rel="stylesheet" href="<%=path %>css/fullmotion-main2.css">
<link rel="stylesheet" href="<%=path %>css/sign.css">
<link rel="stylesheet" href="<%=path %>css/giga.css">
<link rel="stylesheet" href="<%=path %>css/tab.css">
<link rel="stylesheet" href="<%=path %>css/board.css">
<link rel="stylesheet" href="<%=path %>css/mypage.css">
</head>

<body class="page-wrapper">
	<c:if test="${empty sessionScope.session_mid }">
		<script>location.href="clubDetail?cid="+${param.cid}</script>
	</c:if>
	<%@ include file="header.jsp"%>

	<!-- Main -->
	<div id="main">
		<div id="main2"></div>
		<div id="boardRead" class="inner">
			
			<!-- 게시판 글보기 -->
			<div id="content_view" style="width:60%; margin: 0 auto; box-shadow:0 0 3px #bbb;">
			<% 
				BoardDTO mem = (BoardDTO)request.getAttribute("board");
				String name = MemberDAO.getNameByMid(mem.getMember()); 
			%>
				<div id="header1">
					<div id="writeSubject">
						[${requestScope.board.category }]&nbsp;${requestScope.board.title }
					</div>
				</div>
				<div id="header2">
					<div id="view_nickname"><%=name %></div>
					<div id="view_hit">${requestScope.board.hit }</div>
					<div id="view_date">${requestScope.board.date }
						<div id="clear"></div>
					</div>
				</div>
				
				<div id="view_content">
					${requestScope.board.content }
				</div>
				<div id="buttonbox">
					<div class="buttonimage buttonimage1" onclick="location.href='clubDetail?tab=board&cid=${requestScope.board.cid}'">
					</div>
					<div class="buttonimage noimage"></div>
					<div class="buttonimage buttonimage3">
					</div>
					<div class="buttonimage buttonimage2" onclick="location.href='boardUpdate.jsp'">
					</div>
						
				</div>
				
			</div><!-- content div --><!-- 게시판 글보기 끝 -->
			<!-- 댓글 창 -->
			<div id="comment_column">
				<div id="comment_header">Comment ㅡ</div>
				<c:forEach items="${requestScope.comments }"  var="item">
				<% 
					CommentDTO comm = (CommentDTO)pageContext.getAttribute("item");
					String commName = MemberDAO.getNameByMid(comm.getMid()); 
					
				%>
					<c:if test="${item.mid == requestScope.board.member }">
						<div id="comment_container_writer">
							<input type="hidden" name="comment_id" value="${item.commid }">
							<c:if test="${item.mid == sessionScope.session_mid }">
								<span class="comment_delete_button"></span>
							</c:if>
							<div id="comment_title">
								<%=commName %>
							</div>
							<div id="comment_content">
								${item.content }
							</div>
						</div>
						<div id="comment_time_label_writer">${item.date }</div>
					</c:if>
					<c:if test="${item.mid != requestScope.board.member }">
						<div id="comment_container">
							<input type="hidden" name="comment_id" value="${item.commid }">
							<c:if test="${item.mid == sessionScope.session_mid }">
								<span class="comment_delete_button"></span>
							</c:if>
							<div id="comment_title">
								<%=commName %>
							</div>
							<div id="comment_content">
								${item.content }
							</div>
						</div>
						<div id="comment_time_label">${item.date }</div>
					</c:if>
					<div style="clear:both"></div>
				</c:forEach>
				
				<div id="comment_write">
					<span id="comment_write_submit"></span>
					<textarea id="comment_write_blank"></textarea>
					<input id="writer" type="hidden" name="login_mid" value="${sessionScope.session_mid }">	
				</div>
			</div>
			<!-- 댓글 종료 -->
		</div><!-- inner div -->
	</div><!-- main div -->
</body>

<footer id="footer">
<div class="inner">
	<h2>kt group gathering forum</h2>
	<p>해당 웹사이트는 kt 그룹인을 위한 동호회 사이트입니다.</p>
</div>
</footer>

<script src="<%=path %>js/jquery.min.js"></script>
<script src="<%=path %>js/jquery.scrolly.min.js"></script>
<script src="<%=path %>js/jquery.poptrox.min.js"></script>
<script src="<%=path %>js/skel.min.js"></script>
<script src="<%=path %>js/fullmotion-main.js"></script>
<script src="<%=path %>js/util.js"></script>
<script src="<%=path %>js/modal.js"></script>
<script src="<%=path %>js/sign.js" charset='utf-8'></script>
<script src="<%=path %>js/board.js"></script>
</html>