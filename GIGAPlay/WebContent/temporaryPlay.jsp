<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${!empty sessionScope.session_mid }">
	<div class="temp-play-add-view trigger-tempplay">
		<p> 새로운 번개 추가 </p>
	</div>
</c:if>
<c:if test="${empty sessionScope.session_mid }">
	<div class="temp-play-add-view trigger-error-nologin">
		<p> 새로운 번개 추가 </p>
	</div>
</c:if>	
<div class="thumbnails">
	<div class="temp">
		<c:forEach var="item" items="${requestScope.allPlays }">
			<div class="box">
				<a href="https://youtu.be/s6zR2T9vn2c" class="image fit"><img
					src="../images/pic03.jpg" alt="" /></a>
				<div class="inner">
					<h3>[${item.category}]&nbsp;${item.name}</h3>
					<p>${item.intro}</p>
				</div>
			</div>
		</c:forEach>
	</div>
</div>