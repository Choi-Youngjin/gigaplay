<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div
   style="margin:30px auto; width: 85%; height: 25px; border-bottom: 3px solid lightgray; text-align: center;">
    <span
      style="font-family: olleh; color: black; font-size: 30px; background-color: #FFFFFF; padding: 10px;">
         정기 PLAY </span>
</div>


<div class="no-touch" >
	<div class="regular">
		<ul class="grid cs-style-3">
			<c:forEach var="item" items="${requestScope.allPlays }">
				<li>
					<figure onclick="location.href='clubDetail?cid=${item.cid}'" style="cursor:pointer">
						<img src="../images/${item.picture }" alt="image">
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