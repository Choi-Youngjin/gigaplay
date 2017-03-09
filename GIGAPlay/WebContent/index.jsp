<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>GiGA Play</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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

<style type="text/css">
	@font-face {
		font-family: olleh;
		src: url(etc/olleh.ttf);
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
		margin-bottom:10px;
	}
</style>

</head>
<body class="page-wrapper">
<header class="main_menu_sec navbar navbar-default navbar-fixed-top">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-md-2 col-sm-12">
				<div class="lft_hd">
					<a href="index.html">
						<img src="images/ktlogo.png" alt=""/>
						<font face="olleh" color="black" size="15pt">GIGA PLAY</font>
					</a>
				</div>
			</div>			
			<div class="col-lg-8 col-md-8 col-sm-12">
				<div class="rgt_hd">					
					<div class="main_menu">
						<nav id="nav_menu">
							<button aria-controls="navbar" aria-expanded="false" data-target="#navbar" data-toggle="collapse" class="navbar-toggle collapsed" type="button">
							</button>	
							<div id="navbar">
								<ul>
									<li><a class="page-scroll" href="index.html"><font face="olleh" color="black">Home</font></a></li> 
									<li><a class="btn trigger-login" href="#" style="border:0"><font face="olleh" color="black">로그인</font></a></li>
									<li><a class="btn trigger-signup"  href="#" style="border:0"><font face="olleh" color="black">회원가입</font></a></li>
								</ul>
								<!-- Modal -->
								<div class="modal-wrapper">
									<div class="modal">
								    	<div class="head">
								      		<a class="btn-close trigger-signup" href="#">X</a>
								    	</div>
								    	<div class="content">
								         	<h1 style="text-align:center">GIGA PLAY 회원가입</h1>
								         	<form action="play/signup" method="post"><br>
									         	<p><font face="olleh" size="4" color="black">사번 *</font>
									         	<input id="signup-mid" type="text" name="mid" 
									         		style="color:red; width:80%; float:right; height:1.6em; margin-top:3px">
									         	<br><span id="mid_errormsg" class="errormsg">사번을 입력해주세요.</span>
									         	</p>
									         	<p><font face="olleh" size="4" color="black">비밀번호 *</font>
									         	<input id="signup-pw" type="password" name="pw" style="color:red; width:80%; float:right; height:1.6em; margin-top:3px">
									         	<br><span id="pw_errormsg" class="errormsg">비밀번호을 입력해주세요.</span>
									         	</p>
									         	<p><font face="olleh" size="4" color="black">이름 *</font>
									         	<input id="signup-name" type="text" name="name" style="color:red; width:80%; float:right; height:1.6em; margin-top:3px">
									         	<br><span id="name_errormsg" class="errormsg">비밀번호을 입력해주세요.</span>
									         	</p>
									         	<p><font face="olleh" size="4" color="black">생년월일</font>
									         	<input id="signup-birth" type="text" name="birth" style="color:red; width:80%; float:right; height:1.6em; margin-top:3px">
									         	</p>
									         	<p><font face="olleh" size="4" color="black">그룹 *</font>
									         	<select name="groups" id="signup-groups" style="color:red; width:80%; float:right; height:1.6em; margin-top:3px">
									         		<option value="kt">kt</option><option value="ktds">kt ds</option><option value="ktms">kt m&s</option>
									         		<option value="kttelecop">kt telecop</option><option value="kth">kth</option><option value="ktmhows">kt mhows</option>
									         		<option value="nasmedia">nasmedia</option><option value="ktiscs">kt is/cs</option><option value="ktsat">kt sat</option>
									         		<option value="vp">vp</option><option value="kt">kt</option><option value="bccard">bc card</option>
									         		<option value="ktskylife">kt skylife</option><option value="ktestate">kt estate</option><option value="ktservice">kt service</option>
									         	</select>
									         	</p><p><font face="olleh" size="4" color="black">PHONE</font>
									         	<input id="signup-phone" type="text" name="phone" pattern="\d{3}\-\d{3}\-\d{3}"  title="010-xxx-xxxx 형식으로 입력해주세요" style="color:red; width:80%; float:right; height:1.6em; margin-top:3px">
									         	</p><p><font face="olleh" size="4" color="black">EMAIL *</font>
									         	<input id="signup-email" type="email" name="email" style="color:red; width:80%; float:right; height:1.6em; margin-top:3px">
									         	</p>
									         	<br><p style="width:70px; margin:0 auto"><input id="signup-btn" type="button" value="가입" ></p>
								         	</form>
								        </div>
								    </div>
  								</div>
  								<div class="modal-wrapper-login">
									<div class="modal">
								    	<div class="head">
								      		<a class="btn-close trigger-login" href="#">X</a>
								    	</div>
								    	<div class="content">
								         	<h1 style="text-align:center">GIGA PLAY 로그인</h1>
								         	<form name="login" method="post">
									         	<br><p><font face="olleh" size="4" color="black">사번 *</font>
									         	<input type="text" name="mid" style="color:red; width:80%; float:right; height:1.6em; margin-top:3px">
									         	</p><p><font face="olleh" size="4" color="black">비밀번호 *</font>
									         	<input type="password" name="mid" style="color:red; width:80%; float:right; height:1.6em; margin-top:3px">
									         	</p>
									         	<br><p style="width:70px; margin:0 auto"><input type="submit" value="로그인" ></p>
								         	</form>
								        </div>
								    </div>
  								</div>	
  								<!-- Modal End -->	
							</div>		
						</nav>			
					</div>					
				</div>
			</div>	
		</div>	
	</div>	
</header>

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
			<div class="gathering-border">정기 PLAY</div>
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
			<div class="gathering-border">번개 PLAY</div>
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
			<div class="gathering-border">멘토 PLAY</div>
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