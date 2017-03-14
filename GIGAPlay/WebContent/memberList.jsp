<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="content">
	<div class="sector">
		<div class="sector_content">
			<table class="table table-striped">
				<tr>
					<th style="width: 250px">이름</th>
					<th style="width: 200px">소속</th>
					<th>전화번호</th>
				</tr>
				<!-- test용 게시판 리스트 -->
				<c:forEach var="item" items="${requestScope.member}">
					<tr>
						<td>${item.name }</td>
						<td>${item.groups }</td>
						<td>${item.phone }</td>
					</tr>
				</c:forEach>
				<!-- test용 게시판 리스트 끝 -->
			</table>
		</div>
	</div>
</div>
