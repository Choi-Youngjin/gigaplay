<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="no-touch" >
	<div class="regular">
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