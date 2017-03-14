<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="dto.BoardDTO, dao.MemberDAO" %>
<div id="content" style="width:90%; margin: 0 auto">
	<div class="sector">
		<div class="sector_content">
			<table class="type11">
				<thead>
					<tr>
						<th style="width: 20px">#</th>
						<th style="width: 50px">#</th>
						<th>제목</th>
						<th style="width: 65px">글쓴이</th>
						<th style="width: 180px">날짜</th>
						<th style="width: 50px">HIT</th>
					</tr>
				<tbody>
					<c:forEach items="${requestScope.boards }" var="item">
						<% BoardDTO mem = (BoardDTO)pageContext.getAttribute("item");
						String name = MemberDAO.getNameByMid(mem.getMember());
						%>
						<tr>
							<td class="boardId">${item.bid }</td>
							<td>${item.category }</td>							
							<td class="boardView"><a>${item.title }</a></td>
							<td><%=name %></td>
							<td class="date">${item.date}</td>
							<td>${item.hit }</td>
						</tr>
					</c:forEach>
					
				</tbody>
			</table>
		</div>
	</div>
	
	<div id="pager">
	<a href="clubDetail?tab=board&cid=${param.cid }&pageNo=1">[처음]&nbsp;</a>

	<c:if test="${param.pageNo>5}">
		<a href="clubDetail?tab=board&cid=${param.cid }&pageNo=${startPage - 1}">[이전]&nbsp;</a>
	</c:if>

	<c:forEach var="i" begin="${requestScope.startPage}" end="${requestScope.endPage}">
		<a class="pageNo <c:if test="${requestScope.nowPage==i}">selected</c:if>"
			href="clubDetail?tab=board&cid=${param.cid }&pageNo=${i}">&nbsp;${i}&nbsp;</a>
	</c:forEach>

	<c:if test="${((endPage-1)/5) < ((totalPage-1)/5)}">
		<a href="clubDetail?tab=board&cid=${param.cid }&pageNo=${endPage+1}">&nbsp;[다음]</a>
	</c:if>

	<a href="clubDetail?tab=board&cid=${param.cid }&pageNo=${requestScope.totalPage}">&nbsp;[맨끝]</a>
</div>
	<!-- 게시판 글쓰기 버튼 -->
	<a class="btn trigger-newBoard" href='#' style="border: 0"><font
		face="olleh" color="black">글쓰기</font></a>
</div>