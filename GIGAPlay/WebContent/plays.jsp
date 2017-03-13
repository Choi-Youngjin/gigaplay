<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>GiGAPlay - 정기 PLAY</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/normalize.css">
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/modal.css">
<link rel="stylesheet" href="../css/font-awesome.min.css">
<link rel="stylesheet" href="../css/owl.carousel.css">
<link rel="stylesheet" href="../css/responsive.css">
<link rel="stylesheet" href="../css/sima-style.css">
<link rel="stylesheet" href="../css/fullmotion-main2.css">
<link rel="stylesheet" href="../css/sign.css">
<link rel="stylesheet" href="../css/giga.css">
<link rel="stylesheet" href="../css/tab.css">
<link rel="stylesheet" href="../css/play.css">
<style>
#pager a {
				text-decoration: none;
				color: white;
			}
			
			#pager a:hover {
				color: orange;
			}
			
			#pager a.pageNo {
				margin-left: 5px;
				margin-right: 5px;
			}
			
			#pager a.pageNo.selected {
				color: aqua;
			}		
</style>
</head>
<body class="page-wrapper">
<%@ include file="header.jsp" %>

<!-- Play 공통 -->
<!-- 선택된 play가 뭔지 -->
<div id="gathering-plays">
	<c:if test="${param.plays == 'regular' }">
		<div class="gathering-border-playpage-on">
			<a onclick="location.href='getAllPlays?plays=regular'">정기 PLAY</a>
		</div>
	</c:if>
	<c:if test="${param.plays != 'regular' }">
		<div class="gathering-border-playpage">
			<a onclick="location.href='getAllPlays?plays=regular'">정기 PLAY</a>
		</div>
	</c:if>
	<c:if test="${param.plays == 'temp' }">
		<div class="gathering-border-playpage-on">
			<a onclick="location.href='getAllPlays?plays=temp'">번개 PLAY</a>
		</div>
	</c:if>
	<c:if test="${param.plays != 'temp' }">
		<div class="gathering-border-playpage">
			<a onclick="location.href='getAllPlays?plays=temp'">번개 PLAY</a>
		</div>
	</c:if>
	<c:if test="${param.plays == 'edu' }">
		<div class="gathering-border-playpage-on">
			<a onclick="location.href='getAllPlays?plays=edu'">멘토 PLAY</a>
		</div>
	</c:if>
	<c:if test="${param.plays != 'edu' }">
		<div class="gathering-border-playpage">
			<a onclick="location.href='getAllPlays?plays=edu'">멘토 PLAY</a>
		</div>
	</c:if>
</div>


<!-- tab.css 버튼 시작-->
<div style="width:100%; height:45px; background-color:lightgrey; text-align:center; margin-top:20px;"> 				 		
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

<div id="pager">
	<a href="plays.jsp?plays=${param.plays }&pageNo=1">[처음]</a>

	<c:if test="${groupNo>1}">
		<a href="plays.jsp?plays=${param.plays }&pageNo=${startPageNo-pagesPerGroup}">[이전]</a>
	</c:if>

	<c:forEach var="i" begin="${startPageNo}" end="${endPageNo}">
		<a class="pageNo <c:if test="${pageNo==i}">selected</c:if>"
			href="plays.jsp?plays=${param.plays }&pageNo=${i}">${i}</a>
	</c:forEach>

	<c:if test="${groupNo<totalGroupNo}">
		<a href="plays.jsp?plays=${param.plays }&pageNo=${endPageNo+1}">[다음]</a>
	</c:if>

	<a href="plays.jsp?plays=${param.plays }&pageNo=${totalPageNo}">[맨끝]</a>
</div>

	<!-- Footer -->
<footer id="footer">
	<div class="inner">
		<h2>kt group gathering forum</h2>
		<p>해당 웹사이트는 kt 그룹인을 위한 동호회 사이트입니다.</p>

	</div>
</footer>

<script src="../js/jquery.min.js"></script>
<script src="../js/jquery.scrolly.min.js"></script>
<script src="../js/jquery.poptrox.min.js"></script>
<script src="../js/skel.min.js"></script>
<script src="../js/fullmotion-main.js"></script>
<script src="../js/util.js"></script>
<script src="../js/modal.js"></script>
<script src="../js/sign.js" charset='utf-8'></script>
<script src="../js/plays.js"></script>
</body>
</html>