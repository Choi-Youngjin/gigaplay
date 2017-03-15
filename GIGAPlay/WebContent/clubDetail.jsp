<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="dto.ClubDTO"%>
<%
	String path = request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>동호회 상세 페이지</title>
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
<link rel="stylesheet" href="<%=path %>css/play.css">
<link rel="stylesheet" href="<%=path %>css/mypage.css">
<style type="text/css">
@font-face {
	font-family: olleh;
	src: url(../etc/olleh.ttf);
}

#main2 {
	width: 100%;
	height: 30px;
	margin-top: 30px;
}

.regular {
	display: flex;
}

.temp {
	display: flex;
}

.gathering-border {
	font-family: olleh;
	font-size: 20px;
	src: url(etc/olleh.ttf);
	width: 100%;
	border: 3px red solid;
	text-align: center;
	color: black;
	padding: 10px;
	margin-bottom: 10px;
}

.page-wrapper {
	width: 100%;
}

#main {
	width: 60%;
	/* background-color: lightgray; */
	margin: 0 auto;
	margin-top: 50px;
}

img {
	width: 100%;
	height: 100%;
	margin: 0 0 0 0;
}

#photoClub {
	width: 100%;
	margin-top: 20px;
}

.clubContents {
	padding-bottom: 0.3em;
	border-bottom: solid 2px red;
	color: black;
	font-family: olleh;
}

#clubIntro {
	width: 100%;
	min-height: 200px;
	background-color: aquamarine;
	font-family: olleh;
	color: black;
	padding: 30px;
}

/*동호회 게시판 css*/
@CHARSET "UTF-8";
/*-------------------------------*/
table {
	width: 100%;
	text-align: center;
	color: black;
	font-family: olleh;
	border-top: 2px solid red !important;
	border-bottom: 2px solid red !important;
}

th {
	border-bottom: 2px solid red !important;
}

#toplays {
	float: right;
	height: 30px;
	background: black;
	color: white;
	font-family: olleh;
	'
}
</style>
</head>

<body class="page-wrapper">
	<%@ include file="header.jsp"%>
	<div id="main">
		<% 
   	  String plays = "regular";
   	  ClubDTO club = (ClubDTO)request.getAttribute("club");
   	  if(club.getCtype().equals("번개")) {
   		  plays = "temp";
   	  }
   	  else if((club.getCtype().equals("멘토"))) {
   		  plays = "edu";
   	  }
	%>
		<div class="clubContents">
			[${requestScope.club.category }] <font size="5">${requestScope.club.name }</font>
			<div style="float: right; font-family: olleh">
				<c:if test="${!empty requestScope.manager }">
					[회장]&nbsp;${requestScope.manager }
				</c:if>
			</div>
		</div>
		<c:if test="${param.tab eq 'intro' || param.tab eq null}">
			<div id="photoClub">
				<img src="<%=path %>images/${requestScope.club.picture}">
				</div>
		</c:if>
		<!-- tab.css 버튼 시작-->
		<div
			style="width: 100%; height: 60px; text-align: center; margin-top: 30px;">
			<a onclick="location.href='clubDetail?cid=${requestScope.club.cid}'"
				class="code_view actionBtn7"> <span>동호회 소개</span></a> 
			<c:if test="${!empty requestScope.isMember }">
				<a onclick="location.href='clubDetail?tab=board&cid=${requestScope.club.cid}'"
				class="code_view actionBtn7"> <span>게시판</span></a> 
			<a onclick="location.href='clubDetail?tab=list&cid=${requestScope.club.cid}'"
				class="code_view actionBtn7"> <span>회원 모두보기</span></a>
			</c:if>
			<c:if test="${empty requestScope.isMember && !empty sessionScope.session_mid }">
				<a id="applyClub" class="code_view actionBtn7"> <span>가입신청</span></a> 
				<input type="hidden" id="applyClubMid" value="${sessionScope.session_mid }">
				<input type="hidden" id="applyClubCid" value="${requestScope.club.cid }">
			</c:if>
			<c:if test="${!empty requestScope.manager }">
				<c:if test="${requestScope.manager_mid eq sessionScope.session_mid}">
					<a onclick="location.href='clubDetail?tab=appliedList&cid=${requestScope.club.cid}'" class="code_view actionBtn7"> <span>가입승인</span></a> 
				</c:if>
			</c:if>


		</div>
		<!-- tab.css 버튼 끝 -->

		<!-- 동호회 소개 -->
		<c:if
			test="${param.tab == 'intro' || requestScope.tab == 'intro' && param.tab != 'board' && param.tab != 'memberList'}">
			<div id="content">

				<div class="clubContents">[동호회 소개]</div>
				<div id="clubIntro">${requestScope.club.intro }</div>
				<br> <br> <br> 
				<a class="btn" style="float:right" onclick="location.href='getAllPlays?plays=<%=plays%>'">
				<font face="olleh" color="black">목록으로</font></a>
			</div>
			<!-- 동호회 소개 끝 -->
		</c:if>

		<c:if test="${param.tab == 'list' }">
			<c:if test="${!empty requestScope.isMember }">
			<%@ include file="memberList.jsp"%>
			</c:if>
		</c:if>
		<c:if test="${param.tab == 'appliedList' }">
			<c:if test="${!empty requestScope.isMember && requestScope.manager_mid eq sessionScope.session_mid }">
				<%@ include file="appliedMemberList.jsp"%>
			</c:if>
		</c:if>
		
	</div>
	<c:if test="${param.tab == 'board' }">
			<c:if test="${!empty requestScope.isMember }">
				<%@ include file="board.jsp"%>
			</c:if>
		</c:if>
		
		

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
	
</body>

</html>