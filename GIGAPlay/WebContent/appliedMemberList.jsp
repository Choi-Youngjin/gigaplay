<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="content">
	<div class="sector">
		<div class="sector_content">
			<table class="table table-striped">
				<tr>
					<th style="width: 150px">이름</th>
					<th style="width: 200px">소속</th>
					<th>전화번호</th>
					<th style="width: 100px">처리</th>
				</tr>
				<!-- test용 게시판 리스트 -->
				<c:forEach items="${requestScope.appliedMember}" var="members" varStatus="status1">
					<input type="hidden" id="appliedMid" value="${members.mid }">
					<tr>
						<td>${members.name }</td>
						<td>${members.groups }</td>
						<td>${members.phone }</td>
						<td>
							<span id="applyok"></span>
							<span id="applyno"></span>
						</td>
					</tr>
				</c:forEach>
					
				
				<!-- test용 게시판 리스트 끝 -->
			</table>
		</div>
	</div>
</div>
