<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="dto.ClubDTO, dao.ClubDAO, java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<title>GiGA Play</title>
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
<%
	String path = request.getContextPath() + "/";
%>

</head>
<body class="page-wrapper">
	<%@ include file="header.jsp"%>

	<!-- Banner -->
	<!--
	To use a video as your background, set data-video to the name of your video without
	its extension (eg. images/banner). Your video must be available in both .mp4 and .webm
	formats to work correctly.
-->
	<section id="banner" data-video="images/ktwiz" style="margin-top: 60px">
		<div class="inner">
			<header>
				<h1>
					<font face="olleh">OLLEH GIGA PLAY</font>
				</h1>
				<p>
					KT그룹 사내 동호회 토탈 웹사이트<br /> designed by 3x3 Dining Team
				</p>
			</header>
			<br>
			<font face="olleh">VIEW MORE</font><br>
			<br> <a href="#main" class="more"></a>
		</div>
	</section>

	<!-- Main -->
	<div id="main">
		<div id="main2"></div>
		<div class="inner">

			<!-- Boxes -->
			<div class="no-touch">
				<div
					style="width: 100%; height: 25px; border-bottom: 3px solid lightgray; text-align: center;">
					<a onclick="location.href='play/getAllPlays?plays=regular'"
						style="cursor: pointer"> <span
						style="font-family: olleh; color: black; font-size: 30px; background-color: #FFFFFF; padding: 10px;">
							정기 PLAY </span></a>
				</div>
				<div style="width: 100%; height: 50px;"></div>
				<div class="regular">
					<%
						ArrayList<ClubDTO> regularClubs = ClubDAO.getClub("정기", 3, 0);
					%>
					<ul class="grid cs-style-3" style="padding-bottom: 25px">
						<c:forEach var="item" items="<%=regularClubs %>">
							<li>
								<figure onclick="location.href='play/clubDetail?cid=${item.cid}'"
									style="cursor: pointer">
									<img src="<%=path %>images/pic03.jpg" alt="img06">
									<figcaption class="smaller">
										<h3>[${item.category}]&nbsp;${item.name}</h3>
										<span>${item.intro}</span>
									</figcaption>
								</figure>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div
					style="width: 100%; height: 25px; border-bottom: 3px solid lightgray; text-align: center;">
					<a onclick="location.href='play/getAllPlays?plays=temp'"
						style="cursor: pointer"> <span
						style="font-family: olleh; color: black; font-size: 30px; background-color: #FFFFFF; padding: 10px;">
							번개 PLAY </span></a>
				</div>
				<div style="width: 100%; height: 50px;"></div>
				<div class="temp">
					<%
						ArrayList<ClubDTO> tempClubs = ClubDAO.getClub("번개", 3, 0);
					%>
					<ul class="grid cs-style-3" style="padding-bottom: 25px">
						<c:forEach var="item" items="<%=tempClubs %>">
							<li>
								<figure onclick="location.href='play/clubDetail?cid=${item.cid}'"
									style="cursor: pointer">
									<img src="<%=path %>images/pic03.jpg" alt="img06">
									<figcaption>
										<h3>[${item.category}]&nbsp;${item.name}</h3>
										<span>${item.intro}</span>
									</figcaption>
								</figure>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div
					style="width: 100%; height: 25px; border-bottom: 3px solid lightgray; text-align: center;">
					<a onclick="location.href='play/getAllPlays?plays=edu'"
						style="cursor: pointer"> <span
						style="font-family: olleh; color: black; font-size: 30px; background-color: #FFFFFF; padding: 10px;">
							멘토 PLAY </span></a>
				</div>
				<div style="width: 100%; height: 50px;"></div>
				<div class="temp">
					<%
						ArrayList<ClubDTO> eduClubs = ClubDAO.getClub("멘토", 3, 0);
					%>
					<ul class="grid cs-style-3" style="padding-bottom: 25px">
						<c:forEach var="item" items="<%=eduClubs %>">
							<li>
								<figure onclick="location.href='play/clubDetail?cid=${item.cid}'"
									style="cursor: pointer">
									<img src="<%=path %>images/pic03.jpg" alt="img06">
									<figcaption>
										<h3>[${item.category}]&nbsp;${item.name}</h3>
										<span>${item.intro}</span>
									</figcaption>
								</figure>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>

		</div>
	</div>

	<!-- Footer -->
	<footer id="footer">
		<div class="inner">
			<h2>kt group gathering forum</h2>
			<p>해당 웹사이트는 kt 그룹인을 위한 동호회 사이트입니다.</p>

		</div>
	</footer>

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