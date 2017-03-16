<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="dto.ClubDTO, dto.MemberDTO, dto.BoardDTO"%>
<%@ page import="dao.MemberDAO, dao.ClubDAO, dao.BoardDAO, java.util.ArrayList"%>

<%
	String pathSet = request.getContextPath() + "/";
%>
<head>
<style type="text/css">
.iconText{
margin-top: -13px;
}

.page-scroll{
border-radius: 3px;
}
</style>

</head>
<input type="hidden" id="getSessionMid" value="${sessionScope.session_mid }">
<header class="main_menu_sec navbar navbar-default navbar-fixed-top" style="height:100px;">
	
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-md-2 col-sm-12">
				<div class="lft_hd">
					<a href="<%=pathSet%>index.jsp"> <img
						src="<%=pathSet%>images/ktlogo.png" alt="" /> <font face="olleh"
						color="black" size="15pt">GIGA PLAY</font>
					</a>
				</div>
			</div>
			<div class="col-lg-8 col-md-8 col-sm-12">
				<div class="rgt_hd">
					<div class="main_menu">
						<nav id="nav_menu">
							<button aria-controls="navbar" aria-expanded="false"
								data-target="#navbar" data-toggle="collapse"
								class="navbar-toggle collapsed" type="button"></button>
							<div id="navbar">
								<ul>
									<li><a class="page-scroll" href="<%=pathSet%>index.jsp"
										style="display: list-item; "> <img
											src="<%=pathSet%>images/home.png" alt=""  style="width:40px; height: 40px"/>
											<div class="iconText">Home</div>
									</a></li>
									
									<c:if test="${!empty sessionScope.session_mid }">
									<li style="float:right; position:fixed; right:40%; top:40px" class="bt-menu-trigger"><font face="olleh" color="black">${sessionScope.session_name }님
												환영합니다.</font>
										</li>
										<li><a class="btn trigger-logout" href="#"
											style="border: 0"><img
												src="<%=pathSet%>images/logout.png" alt="" style="width:40px; height: 40px" />
                                       <div class="iconText">Log-out</div>
                           </a></li>
									</c:if>
                           <c:if
										test="${empty sessionScope.session_mid }">
                              <li><a class="btn trigger-login "
											href="#" style="border: 0"><img
												src="<%=pathSet%>images/login.png" alt="" style="width:40px; height: 40px"/>
                                       <div class="iconText">Log-in</div>
                                       </a></li>
                              <li><a class="btn trigger-signup"
											href="#" style="border: 0"><img
												src="<%=pathSet%>images/signup.png" alt="" style="width:40px; height: 40px">
                                       <div class="iconText">Sign-up</div>
                                       </a></li>
                           </c:if>

                        </ul>
							<!-- ********************* Modal *********************** -->
											<!--  1번 모달 / 회원가입 -->
								<div class="modal-wrapper">
									<div class="modal">
										<div class="head">
											<a class="btn-close trigger-signup" href="#">X</a>
										</div>
										<div class="content">
											<h1 style="text-align: center">GIGA PLAY 회원가입</h1>
											<form action="play/signup" method="post">
												<br>
												<p>
													<font face="olleh" size="4" color="black">사번 *</font> <input
																	id="signup-mid" type="text" name="mid" maxlength="10"
																	style="color: red; width: 80%; float: right; height: 1.6em; margin-top: 3px">
													<br> <span id="mid_errormsg_null" class="errormsg">사번을
														입력해주세요.</span> <span id="mid_errormsg_redun" class="errormsg">이미
														가입된 회원입니다.</span>
												</p>
												<p>
													<font face="olleh" size="4" color="black">비밀번호 *</font> <input
																	id="signup-pw" type="password" name="pw" maxlength="20"
																	style="color: red; width: 80%; float: right; height: 1.6em; margin-top: 3px">
													<br> <span id="pw_errormsg" class="errormsg">비밀번호을
														입력해주세요.</span>
												</p>
												<p>
													<font face="olleh" size="4" color="black">이름 *</font> <input
																	id="signup-name" type="text" name="name" maxlength="5"
																	style="color: black; width: 80%; float: right; height: 1.6em; margin-top: 3px">
													<br> <span id="name_errormsg" class="errormsg">이름을
														입력해주세요.</span>
												</p>
												<p>
													<font face="olleh" size="4" color="black">생년월일</font> <input
																	id="signup-birth" class="input-class" type="text"
																	name="birth" placeholder="yyyy-mm-dd 형식으로 입력해주세요."
																	pattern="(?:19|20)[0-9]{2}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31))"
																	title="제대로 된 형식이 아닙니다. yyyy-dd-mm"
																	style="color: red; width: 80%; float: right; height: 1.6em; margin-top: 3px">
												</p>
												<p>
													<font face="olleh" size="4" color="black">그룹 *</font> <select
																	name="groups" id="signup-groups"
																	style="color: red; width: 80%; float: right; height: 1.6em; margin-top: 3px">
														<option value="kt">kt</option>
														<option value="ktds">kt ds</option>
														<option value="ktms">kt m&s</option>
														<option value="kttelecop">kt telecop</option>
														<option value="kth">kth</option>
														<option value="ktmhows">kt mhows</option>
														<option value="nasmedia">nasmedia</option>
														<option value="ktiscs">kt is/cs</option>
														<option value="ktsat">kt sat</option>
														<option value="vp">vp</option>
														<option value="bccard">bc card</option>
														<option value="ktskylife">kt skylife</option>
														<option value="ktestate">kt estate</option>
														<option value="ktservice">kt service</option>
													</select>
												</p>
												<p>
													<font face="olleh" size="4" color="black">PHONE</font> <input
																	id="signup-phone" type="text" name="phone"
																	pattern="0\d{1,2}\-\d{3,4}\-\d{4}"
																	title="010-xxx-xxxx 형식으로 입력해주세요"
																	style="color: red; width: 80%; float: right; height: 1.6em; margin-top: 3px">
												</p>
												<p>
													<font face="olleh" size="4" color="black">EMAIL *</font> <input
																	id="signup-email" type="email" name="email"
																	placeholder="ex) dayer@kt.com" maxlength="30"
																	style="color: red; width: 80%; float: right; height: 1.6em; margin-top: 3px">
													<br> <span id="email_errormsg" class="errormsg">이메일을
														입력해주세요.</span>
												</p>
												<br>
												<p style="width: 70px; margin: 0 auto">
													<input id="signup-btn" type="button" value="가입">
												</p>
											</form>
										</div>
									</div>
								</div>
								<!--  2번 모달 / 로그인 -->
								<div class="modal-wrapper-login">
									<div class="modal">
										<div class="head">
											<a class="btn-close trigger-login" href="#">X</a>
										</div>
										<div class="content">
											<h1 style="text-align: center">GIGA PLAY 로그인</h1>
											<form name="login" method="post">
												<br>
												<p>
													<font face="olleh" size="4" color="black">사번 *</font> <input
																	id="login-mid" type="text" name="mid"
																	style="color: red; width: 80%; float: right; height: 1.6em; margin-top: 3px">
													<br> <span id="login_errormid" class="errormsg">사번을
														입력해주세요.</span> <span id="login_nomid" class="errormsg">존재하지
														않는 사번입니다.</span>
												</p>
												<p>
													<font face="olleh" size="4" color="black">비밀번호 *</font> <input
																	id="login-pw" type="password" name="mid"
																	style="color: red; width: 80%; float: right; height: 1.6em; margin-top: 3px">
													<br> <span id="login_errorpw" class="errormsg">비밀번호를
														입력해주세요.</span> <span id="login_fail" class="errormsg">사번과
														비밀번호가 일치하지 않습니다.</span>
												</p>
												<br>
												<p style="width: 70px; margin: 0 auto">
													<input id="login-btn" type="button" value="로그인">
												</p>
											</form>
										</div>
									</div>
								</div>
								<!-- Modal End -->
								<!-- 3번 모달 / 번개 등록 창 -->
								<div class="modal-wrapper-tempplay">
									<div class="modal">
										<div class="head">
											<a class="btn-close trigger-tempplay" href="#">X</a>
										</div>
										<div class="content">
											<h1 style="text-align: center">GIGA PLAY 번개 등록</h1>
											<form name="tempplay" method="post">
												<br>
												<p>
													<font face="olleh" size="4" color="black">PLAY명&nbsp;</font>
													<input id="play-temp-name" type="text" name="mid"
																	style="color: red; width: 50%; display: inline; height: 1.6em; margin-top: 3px">
													<br> <span id="tempplay_name_errormsg"
																	class="errormsg">PLAY명을 입력해주세요.</span>
												</p>
												<p>
													<font face="olleh" size="4" color="black">분야1&nbsp;&nbsp;</font>
													<<select name="category" id="play-temp-category1"
																	style="color: red; width: 20%; display: inline; height: 1.6em; margin-top: 3px; margin-right: 10px;">
														<option value="sports">스포츠</option>
														<option value="art">문화/예술</option>
														<option value="food">요리/음식</option>
														<option value="volunteer">봉사/나눔</option>
														<option value="game">게임/레저</option>
													</select> <font face="olleh" size="4" color="black">분야2&nbsp;&nbsp;</font>
													<input id="play-temp-category2" type="text" name="mid"
																	style="color: red; width: 20%; display: inline; height: 1.6em; margin-top: 3px;">
												</p>
												<p>
													<font face="olleh" size="4" color="black">가격&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>
													<input id="play-temp-price" type="text" name="mid"
																	style="color: red; width: 10%; display: inline; height: 1.6em; margin-top: 3px">
													<font face="olleh" size="4" color="black">원</font> <font
																	face="olleh" size="4" color="black">&nbsp;&nbsp;/&nbsp;그룹&nbsp;&nbsp;</font>
													<<select name="group" id="play-temp-groups"
																	style="color: red; width: 20%; display: inline; height: 1.6em; margin-top: 3px; margin-right: 10px;">
														<option value="kt">kt</option>
														<option value="ktds">kt ds</option>
														<option value="ktms">kt m&s</option>
														<option value="kttelecop">kt telecop</option>
														<option value="kth">kth</option>
														<option value="ktmhows">kt mhows</option>
														<option value="nasmedia">nasmedia</option>
														<option value="ktiscs">kt is/cs</option>
														<option value="ktsat">kt sat</option>
														<option value="vp">vp</option>
														<option value="bccard">bc card</option>
														<option value="ktskylife">kt skylife</option>
														<option value="ktestate">kt estate</option>
														<option value="ktservice">kt service</option>
													</select>
												</p>
												<p>
													<font face="olleh" size="4" color="black">설명</font>
													<textarea id="play-temp-intro" class="textarea-br" rows="6" cols="100"
																	name="mid"
																	style="color: red; display: inline; margin-top: 20px;">
									        	</textarea>
												</p>

												<br>
												<p style="width: 70px; margin: 0 auto; margin-top: -20px;">
													<input id="tempplay-submit-btn" type="button" value="등록">
												</p>
											</form>
										</div>
									</div>
								</div>
								<!-- 3번 모달-2 / 강좌 등록 창 -->
								<div class="modal-wrapper-eduplay">
									<div class="modal">
										<div class="head">
											<a class="btn-close trigger-eduplay" href="#">X</a>
										</div>
										<div class="content">
											<h1 style="text-align: center">GIGA PLAY 강좌 등록</h1>
											<form name="eduplay" method="post">
												<br>
												<p>
													<font face="olleh" size="4" color="black">PLAY명&nbsp;</font>
													<input id="play-edu-name" type="text" name="mid"
																	style="color: red; width: 50%; display: inline; height: 1.6em; margin-top: 3px">
													<br> <span id="eduplay_name_errormsg" class="errormsg">PLAY명을 입력해주세요.</span>
												</p>
												<p>
													<font face="olleh" size="4" color="black">분야1&nbsp;&nbsp;</font>
													<<select name="category" id="play-edu-category1"
																	style="color: red; width: 20%; display: inline; height: 1.6em; margin-top: 3px; margin-right: 10px;">
														<option value="sports">스포츠</option>
														<option value="art">문화/예술</option>
														<option value="food">요리/음식</option>
														<option value="volunteer">봉사/나눔</option>
														<option value="game">게임/레저</option>
													</select> <font face="olleh" size="4" color="black">분야2&nbsp;&nbsp;</font>
													<input id="play-edu-category2" type="text" name="mid"
																	style="color: red; width: 20%; display: inline; height: 1.6em; margin-top: 3px;">
												</p>
												<p>
													<font face="olleh" size="4" color="black">가격&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>
													<input id="play-edu-price" type="text" name="mid"
																	style="color: red; width: 10%; display: inline; height: 1.6em; margin-top: 3px">
													<font face="olleh" size="4" color="black">원</font> <font
																	face="olleh" size="4" color="black">&nbsp;&nbsp;/&nbsp;그룹&nbsp;&nbsp;</font>
													<<select name="group" id="play-edu-groups"
																	style="color: red; width: 20%; display: inline; height: 1.6em; margin-top: 3px; margin-right: 10px;">
														<option value="kt">kt</option>
														<option value="ktds">kt ds</option>
														<option value="ktms">kt m&s</option>
														<option value="kttelecop">kt telecop</option>
														<option value="kth">kth</option>
														<option value="ktmhows">kt mhows</option>
														<option value="nasmedia">nasmedia</option>
														<option value="ktiscs">kt is/cs</option>
														<option value="ktsat">kt sat</option>
														<option value="vp">vp</option>
														<option value="bccard">bc card</option>
														<option value="ktskylife">kt skylife</option>
														<option value="ktestate">kt estate</option>
														<option value="ktservice">kt service</option>
													</select>
												</p>
												<p>
													<font face="olleh" size="4" color="black">설명</font>
													<textarea id="play-edu-intro" class="textarea-br" rows="6" cols="100"
																	name="mid"
																	style="color: red; display: inline; margin-top: 20px;">
									        	</textarea>
												</p>

												<br>
												<p style="width: 70px; margin: 0 auto; margin-top: -20px;">
													<input id="eduplay-submit-btn" type="button" value="등록">
												</p>
											</form>
										</div>
									</div>
								</div>
								<!-- 4번 모달 / 오류 모달 1 / 로그인 하라 -->
								<div class="modal-wrapper-error-nologin">
									<div class="modal">
										<div class="head">
											<a class="btn-close trigger-error-nologin" href="#">X</a>
										</div>
										<div class="content">
											<h1 style="text-align: center">로그인을 해야 이용할 수 있습니다.</h1>
											<br>
											<p style="width: 70px; margin: 0 auto; margin-top: 15px">
												<input id="error-btn" type="button" value="닫기">
											</p>
										</div>
									</div>
								</div>

								<!-- 5번 모달 / 게시글 등록 -->
								<!-- 글쓰기 Modal 시작-->
								<div class="modal-wrapper-newBoard">
									<div class="modal">
										<div class="head">
											<a class="btn-close trigger-newBoard" href="#">X</a>
										</div>
										<div class="content">
											<h1 style="text-align: center">게시글 작성하기</h1>
											<form action="newBoard" method="post">
												<br>
												<p>
													<font face="olleh" size="4" color="black">말머리 *</font> <select
																	name="category" id="newBoard-category"
																	style="color: red; width: 80%; float: right; height: 1.6em; margin-top: 3px">
														<option value="선택">(선택하세요)</option>
														<option value="공지">공지</option>
														<option value="건의">건의</option>
														<option value="질문">질문</option>
														<option value="잡담">잡담</option>
													</select>
													<!-- 에러메세지 출력 말머리를 선택해주세요 -->
													<span id="board_category_errormsg_null" class="errormsg">말머리를 선택해주세요.</span>
												</p>
												<p>
													<font face="olleh" size="4" color="black">제목 *</font> <input
																	id="newBoard-title" type="text" name="title"
																	maxlength="10"
																	style="color: red; width: 80%; float: right; height: 1.6em; margin-top: 3px">
													<br>
													<!-- 에러메세지 출력 말머리를 선택해주세요 -->
													<span id="board_title_errormsg_null" class="errormsg">제목을 입력해주세요.</span> 
												</p>
												<p>
													<font face="olleh" size="4" color="black">내용 *</font>
													<textarea name="content" id="newBoard-content" class="textarea-br"
																	form="content" cols="40" rows="10" autofocus required
																	wrap="hard" style="overflow: auto"> </textarea>
													<br>
													<!-- 에러메세지 내용을 작성해주세요 -->
													<span id="board_content_errormsg_null" class="errormsg">내용을 작성해주세요.</span>
												</p>
												<p style="width: 100px; margin: 0 auto; margin-top: 15px">
													<input id="newBoard-btn" type="button" value="등록하기">
												</p>
												<input type="hidden" id="newBoard-cid" name="cid"
																value="${param.cid}" />
												<input type="hidden" id="newBoard-member" name="member"
																value="${sessionScope.session_mid}" />
											</form>
										</div>
									</div>
								</div>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</div>
		<!-- 1. 로그인 정보 세션으로 MemberDTO 얻어오기
			  2. 로그인 정보 세션으로 memberclub 테이블에서 
			     가입한 동호회 cid를 얻어 join으로 동호회 이름 가져오기
			     (cid는 링크거는데 이용) - Scroll 달기
			  3. mid와 cid를 이용해 [동호회 이름] 게시글 이름 얻어오기
		 -->
		<%
			String mGroups = null;
			String mEmail = null;
			String mPhone = null;
			ArrayList<ClubDTO> mClubs = null;
			ArrayList<BoardDTO> mBoards = null;
			if(request.getSession().getAttribute("session_mid") != null) {
				MemberDTO member = MemberDAO.getMembers((String)request.getSession().getAttribute("session_mid"));
				mGroups = member.getGroups();
				mEmail = member.getEmail();
				mPhone = member.getPhone();
				mClubs = new ArrayList<ClubDTO>();
				mBoards = new ArrayList<BoardDTO>();
				mClubs = ClubDAO.getClubName((String)request.getSession().getAttribute("session_mid"));
				mBoards = BoardDAO.getBoardsByMid((String)request.getSession().getAttribute("session_mid"));
			}
			
		%>
		
		<div id="bt-menu" class="bt-menu">
			<div id="bt-myinfo" class="bt-div">
				<div id="bt-myinfo-name">${sessionScope.session_name }
					<div id="bt-myinfo-group"><%=mGroups %> </div>
				</div>
				<br><br><br>
				<div id="bt-myinfo-mid">
					<div id="bt-myinfo-mid-image"></div>
					&nbsp;&nbsp;${sessionScope.session_mid }
				</div>
				
				<div id="bt-myinfo-email">
					<div id="bt-myinfo-email-image"></div>
					&nbsp;&nbsp;<%=mEmail %>
				</div>
				<div id="bt-myinfo-tel">
					<div id="bt-myinfo-tel-image"></div>	
					&nbsp;&nbsp;<%=mPhone %>
				</div>
			</div>
			<div id="bt-myclub" class="bt-div">
				<div id="bt-myclub-header">나의 플레이</div>
				<div id="bt-myclub-container">
					<ul>
					<c:forEach items="<%=mClubs %>" var="clubs">
						<li class="bt-myclub-clubs"><a onclick="location.href='<%=pathSet%>play/clubDetail?cid=${clubs.cid}'">[${clubs.ctype}]&nbsp;&nbsp;${clubs.name }</a></li>
					</c:forEach>
					</ul>
				</div>
			</div>
			<div id="bt-myboard" class="bt-div">
				<div id="bt-myboard-header">나의 최근 게시글 TOP 5</div>
				<div id="bt-myboard-container">
					<ul>
					<c:forEach items="<%=mBoards %>" var="boards">
						<li class="bt-myclub-clubs"><a onclick="location.href='<%=pathSet%>play/boardView?cid=${boards.cid}&bid=${boards.bid }'">${boards.title }</a></li>
					</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
</header>

<script src="<%=pathSet %>js/classie.js"></script>
<script src="<%=pathSet %>js/borderMenu.js"></script>