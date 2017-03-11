<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>GiGAPlay - 정기 PLAY</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/normalize.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/modal.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/responsive.css">
<link rel="stylesheet" href="css/sima-style.css">
<link rel="stylesheet" href="css/fullmotion-main2.css">
<link rel="stylesheet" href="css/sign.css">
<link rel="stylesheet" href="css/giga.css">
<link rel="stylesheet" href="css/tab.css">
<link rel="stylesheet" href="css/play.css">
</head>
<body class="page-wrapper">
<%@ include file="header.jsp" %>

<!-- Play 공통 -->
<!-- 선택된 play가 뭔지 -->
<div id="gathering-plays">
	<div class="gathering-border-playpage">
		<a onclick="location.href='plays.jsp?plays=regular'">정기 PLAY</a>
	</div>
	<div class="gathering-border-playpage">
		<a onclick="location.href='plays.jsp?plays=temp'">번개 PLAY</a>
	</div>
	<div class="gathering-border-playpage">
		<a onclick="location.href='plays.jsp?plays=edu'">멘토 PLAY</a>
	</div>
</div>


<!-- tab.css 버튼 시작-->
<div style="width:100%; height:60px; text-align:center; margin-top:20px;"> 				 		
	<a href="javascript:;" class="code_view actionBtn7">
		 <span>스포츠</span>
	</a>
	<a href="javascript:;" class="code_view actionBtn7">
		 <span>문화/예술</span>
	</a>
	<a href="javascript:;" class="code_view actionBtn7">
			<span>요리/음식</span>
	</a>
	<a href="javascript:;" class="code_view actionBtn7">
			<span>봉사/나눔</span>
	</a>
	<a href="javascript:;" class="code_view actionBtn7">
			<span>게임/레저</span>
	</a>
</div>			
<!-- tab.css 버튼 끝 -->	

<% if(request.getParameter("plays").equals("regular")) {%> 
	<%@ include file="regularPlay.jsp" %>
<% }%>
<% if(request.getParameter("plays").equals("temp")) {%> 
	<%@ include file="temporaryPlay.jsp" %>
<% }%>
<% if(request.getParameter("plays").equals("edu")) {%> 
	<%@ include file="educationPlay.jsp" %>
<% }%>



<script src="js/jquery.min.js"></script>
<script src="js/jquery.scrolly.min.js"></script>
<script src="js/jquery.poptrox.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/fullmotion-main.js"></script>
<script src="js/util.js"></script>
<script src="js/modal.js"></script>
<script src="js/sign.js" charset='utf-8'></script>
<script src="js/plays.js"></script>
</body>
</html>