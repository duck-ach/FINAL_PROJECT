<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/adminHeader.jsp">
	<jsp:param value="자유게시판_상세" name="title" />
</jsp:include>
<body>
	<h1>신고게시판</h1>
	<div>
		<button>신고글 작성하기</button>
	</div>
	<hr>
	<table>
		<thead>
			<tr>
				<th>카테고리</th>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자닉네임</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${galleryList}" var="singo" varStatus="vs">
				<tr>
					<td>${beginNo - vs.index}</td>
					<td><a id="moveDetail"
						href="/free/increase/hit?freeNo=${gallery.freeNo}">${gallery.title}</a></td>
					<td>${singo.users.id}</td>
					<td>${singo.users.nickname}</td>
					<td>${singo.users.gender}</td>
					<td>${singo.createDate}</td>
					<td>${singo.hit}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>