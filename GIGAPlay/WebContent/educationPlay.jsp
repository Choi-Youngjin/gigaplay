<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${!empty sessionScope.session_mid }">
	<div class="temp-play-add-view trigger-eduplay">
		<p> 새로운 강좌 등록 </p>
	</div>
</c:if>
<c:if test="${empty sessionScope.session_mid }">
	<div class="temp-play-add-view trigger-error-nologin">
		<p> 새로운 강좌 등록 </p>
	</div>
</c:if>	
<div class="no-touch" >
	<div class="temp">
		<ul class="grid cs-style-3">
			<c:forEach var="item" items="${requestScope.allPlays }">
				<li>
					<figure onclick="location.href='clubDetail?cid=${item.cid}'" style="cursor:pointer">
						<img src="../images/pic03.jpg" alt="img06">
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