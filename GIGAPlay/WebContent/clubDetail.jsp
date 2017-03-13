<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>clubDetail.jsp</title>
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
   height: 350px;
}

.clubContents {
   padding-bottom: 0.3em;
   border-bottom: solid 2px red;
   color: black;
   font-family: olleh;
}

#clubIntro {
   width: 100%;
   height: 100px;
   background-color: lightgray;
   font-family: olleh;
   color: #FFFFFF;
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
</style>
</head>

<body class="page-wrapper">
   <%@ include file="header.jsp"%>

   <div id="main">
      <div id="photoClub">
         <img src="images/ioi.jpg">
      </div>
      <!-- tab.css 버튼 시작-->
      <div
         style="width: 100%; height: 60px; text-align: center; margin-top: 20px;">
         <a onclick="location.href='clubDetail?tab=intro&cid=${requestScope.club.cid}'"
            class="code_view actionBtn7"> <span>동호회 소개</span></a> <a
            onclick="location.href='clubDetail?tab=board&cid=${requestScope.club.cid}'"
            class="code_view actionBtn7"> <span>게시판</span></a>
      </div>
      <!-- tab.css 버튼 끝 -->

      <c:if test="${param.tab == 'board' }">
         <!-- 동호회 게시판 -->
         <div id="content">
            <div class="sector">
               <div class="sector_content">
                  <table class="table table-striped">
                     <tr>
                        <th style="width: 60px">번호</th>
                        <th>제목</th>
                        <th style="width: 100px">글쓴이</th>
                        <th style="width: 80px">날짜</th>
                     </tr>
                     <!-- test용 게시판 리스트 -->
                     <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>글쓴이</td>
                        <td>날짜</td>
                     </tr>
                     <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>글쓴이</td>
                        <td>날짜</td>
                     </tr>
                     <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>글쓴이</td>
                        <td>날짜</td>
                     </tr>
                     <!-- test용 게시판 리스트 끝 -->

                     <%--                
                  <c:forEach var="board" items="${list}">
                     <tr>
                        <td>${board.bno}번호</td>
                        <td>${board.btitle}제목</td>
                        <td>${board.mid} 글쓴이</td>
                        <td>내용</td>
                     </tr>
                  </c:forEach> --%>

                  </table>
               </div>
            </div>

            <!-- 게시판 글쓰기 버튼 -->
            <a class="btn trigger-newBoard" href='#' style="border: 0"><font
               face="olleh" color="black">글쓰기</font></a>

           
         </div>
      </c:if>
      <!-- 동호회 게시판 끝 -->




      <!-- 동호회 소개 -->
      <c:if test="${param.tab == 'intro' || requestScope.tab == 'intro' && param.tab != 'board'}">
         <div id="content">
            <div class="clubContents">[${requestScope.club.category }] <font size="5">${requestScope.club.name }</font>
            	<div style="float:right; font-family:olleh">[회장] 회장이름db</div>
            </div>
            
            <br> <br>
            <div class="clubContents">[동호회 소개]</div>
            <div id="clubIntro">${requestScope.club.intro }</div>
            <br> <br>
            

            <br> <a class="btn trigger-clubSignup" style="border: 0"><font
               face="olleh" color="black">가입하기</font></a>

         </div>
         <!-- 동호회 소개 끝 -->
      </c:if>
   </div>


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
</body>

</html>