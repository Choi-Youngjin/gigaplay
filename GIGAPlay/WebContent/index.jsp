<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

</head>
<body class="page-wrapper">
<%@ include file="header.jsp" %>

<!-- Banner -->
<!--
	To use a video as your background, set data-video to the name of your video without
	its extension (eg. images/banner). Your video must be available in both .mp4 and .webm
	formats to work correctly.
-->
<section id="banner" data-video="images/ktwiz" style="margin-top: 60px">
	<div class="inner">
		<header>
			<h1><font face="olleh">OLLEH GIGA PLAY</font></h1>
				<p>KT그룹 사내 동호회 토탈 웹사이트<br />
				designed by 3x3 Dining Team</p>
		</header>
		<br><font face="olleh">VIEW MORE</font><br><br>
		<a href="#main" class="more"></a>
	</div>
</section>

<!-- Main -->
<div id="main">
	<div id="main2"></div>
	<div class="inner">

	<!-- Boxes -->
		<div class="thumbnails">
			<div class="gathering-border"><a onclick="location.href='plays.jsp?plays=regular'">정기 PLAY</a></div>
			<div class="regular">
				<div class="box">
					<a href="https://youtu.be/s6zR2T9vn2c" class="image fit"><img src="images/pic03.jpg" alt="" /></a>
					<div class="inner">
						<h3>동호회1</h3>
						<p>설명설명설명설명</p>
					</div>
				</div>
	
				<div class="box">
					<a href="https://youtu.be/s6zR2T9vn2c" class="image fit"><img src="images/pic03.jpg" alt="" /></a>
					<div class="inner">
						<h3>kt 축구 동호회</h3>
						<p>발로차 싸커</p>
					</div>
				</div>
	
				<div class="box">
					<a href="https://youtu.be/s6zR2T9vn2c" class="image fit"><img src="images/pic03.jpg" alt="" /></a>
					<div class="inner">
						<h3>Nascetur nunc varius commodo</h3>
						<p>Interdum amet accumsan placerat commodo ut amet aliquam blandit nunc tempor lobortis nunc non. Mi accumsan.</p>
					</div>
				</div>
			</div>
			<div class="gathering-border"><a onclick="location.href='plays.jsp?plays=temp'">번개 PLAY</a></div>
			<div class="temp">
				<div class="box">
					<a href="https://youtu.be/s6zR2T9vn2c" class="image fit"><img src="images/pic04.jpg" alt="" /></a>
					<div class="inner">
						<h3>Nascetur nunc varius commodo</h3>
						<p>Interdum amet accumsan placerat commodo ut amet aliquam blandit nunc tempor lobortis nunc non. Mi accumsan.</p>
					</div>
				</div>
	
				<div class="box">
					<a href="https://youtu.be/s6zR2T9vn2c" class="image fit"><img src="images/pic04.jpg" alt="" /></a>
					<div class="inner">
						<h3>Nascetur nunc varius commodo</h3>
						<p>Interdum amet accumsan placerat commodo ut amet aliquam blandit nunc tempor lobortis nunc non. Mi accumsan.</p>
					</div>
				</div>
	
				<div class="box">
					<a href="https://youtu.be/s6zR2T9vn2c" class="image fit"><img src="images/pic04.jpg" alt="" /></a>
					<div class="inner">
						<h3>Nascetur nunc varius commodo</h3>
						<p>Interdum amet accumsan placerat commodo ut amet aliquam blandit nunc tempor lobortis nunc non. Mi accumsan.</p>
					</div>
				</div>
			</div>
			<div class="gathering-border"><a onclick="location.href='plays.jsp?plays=edu'">멘토 PLAY</a></div>
			<div class="temp">
				<div class="box">
					<a href="https://youtu.be/s6zR2T9vn2c" class="image fit"><img src="images/pic04.jpg" alt="" /></a>
					<div class="inner">
						<h3>Nascetur nunc varius commodo</h3>
						<p>Interdum amet accumsan placerat commodo ut amet aliquam blandit nunc tempor lobortis nunc non. Mi accumsan.</p>
					</div>
				</div>
	
				<div class="box">
					<a href="https://youtu.be/s6zR2T9vn2c" class="image fit"><img src="images/pic04.jpg" alt="" /></a>
					<div class="inner">
						<h3>Nascetur nunc varius commodo</h3>
						<p>Interdum amet accumsan placerat commodo ut amet aliquam blandit nunc tempor lobortis nunc non. Mi accumsan.</p>
					</div>
				</div>
	
				<div class="box">
					<a href="https://youtu.be/s6zR2T9vn2c" class="image fit"><img src="images/pic04.jpg" alt="" /></a>
					<div class="inner">
						<h3>Nascetur nunc varius commodo</h3>
						<p>Interdum amet accumsan placerat commodo ut amet aliquam blandit nunc tempor lobortis nunc non. Mi accumsan.</p>
					</div>
				</div>
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
	
</body>
</html>