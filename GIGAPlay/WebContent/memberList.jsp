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
					<th>직급</th>
				</tr>
				<!-- test용 게시판 리스트 -->
				<c:forEach items="${requestScope.member}" var="members" varStatus="status1">
					<tr>
						<td>${members.name }</td>
						<td>${members.groups }</td>
						<td>${members.phone }</td>
						<c:forEach items="${requestScope.memberGrade }" var="grades"  varStatus="status2">
							<c:if test="${status1.index eq status2.index }">
								<td>${grades }</td>
							</c:if>
						</c:forEach>
					</tr>
				</c:forEach>
					
				
				<!-- test용 게시판 리스트 끝 -->
			</table>
		</div>
	</div>
</div>
