<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="dao.MemberDAO, dto.BoardDTO" %>
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
</head>

<body class="page-wrapper">
	<%@ include file="header.jsp"%>

	<!-- Main -->
	<div id="main">
		<div id="main2"></div>
		<div id="boardRead" class="inner">
			
			<!-- 게시판 글보기 -->
			<div id="content" style="width:60%; margin: 0 auto; box-shadow:0 0 3px #bbb;">
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
					<div class="buttonimage buttonimage1" onclick="history.go(-1)">
					</div>
					<div class="buttonimage noimage"></div>
					<div class="buttonimage buttonimage3" onclick="location.href='boardDelete'">
					</div>
					<div class="buttonimage buttonimage2" onclick="location.href='boardUpdate.jsp'">
					</div>
						
				</div>
				
			</div><!-- content div --><!-- 게시판 글보기 끝 -->
			<div id="comment_column">
				<div id="comment_header">Comment ㅡ</div>
			</div>
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
</html>