<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="../../layout/header.jsp">
	<jsp:param value="운동후기게시판" name="title" />
</jsp:include>

<body>
	
	
	
	
<section class="wrap"><!-- 기본틀 1 -->
	<section class="content_leyout_section"><!-- 기본틀 2 -->
		
		
		
		<div> <!-- 여기부터 각자 내용 넣기 시작 -->
			<div class="my_porters_area">
			<c:if test="${loginUser.id == null}" >						
				<h2>SPORTERS 멤버들의 활동 후기입니다. 우리와 함께해요!</h2>						
			</c:if>	
			
			<c:if test="${loginUser.id != null}" >		
			
				<form id="frm_searchs" method="post">										
						<br>
						
						
							
						<h2> 작성 가능한 후기 </h2>
						<table border="1">
							<thead>
								<tr>	
												
									<td>글 제목</td>	
									<td>회원 아이디</td>						
									<td>회원 이름</td>
									<td>회원 성별</td>						
									<td>회원 핸드폰번호</td>												
									<td>회원 포인트</td>	
								<!--  
									<td>작성 글 수</td>
								-->				
								</tr>
							</thead>
							<tbody id="list">	
								
								<c:if test="${totalCount eq 0}">	
									<tr>
										<td colspan="6" >활동하신 내역이 없습니다. 주저말고 모임에 참여해보세요!</td>
									</tr>
								</c:if>	
								
								<c:forEach items="${LocalgalleryList}" var="gallery" varStatus="vs">
									<c:if test="${loginUser.userNo eq gallery.userNo}" >	
										<tr>
											<td>${beginNo - vs.index}</td>						
											<td><a id="moveDetail"
												href="/spo_review/increase/hit?localBoardNo=${gallery.localBoardNo}">${gallery.title}</a></td>									
										
											<td>${gallery.users.id}</td>
											<td>${gallery.users.nickname}</td>
											<td>${gallery.users.gender}</td>
										
											<td>${gallery.createDate}</td>
											<td>${gallery.hit}</td>
										</tr>	
									</c:if>		
								</c:forEach>
								
								
							</tbody>
							
						</table>
						
					</form>
				
					<div class="div_paging">
						${paging}
					</div>	
				</c:if>			
			</div>
			
			
			<hr><br>
			<div class="spo_review_area">
				<h2>SPORTERS 활동후기</h2>
				<form id="frm_search" method="post">										
					<br>
					
					<table border="1">
						<thead>
							<tr>	
											
								<td>글 제목</td>	
								<td>회원 아이디</td>						
								<td>회원 이름</td>
								<td>회원 성별</td>						
								<td>회원 핸드폰번호</td>												
								<td>회원 포인트</td>	
							<!--  
								<td>작성 글 수</td>
							-->				
							</tr>
						</thead>
						<tbody id="list">						
							<c:forEach items="${SpoReviewgalleryList}" var="gallery" varStatus="vs">
								<tr>
									<td>${beginNo - vs.index}</td>						
									<td><a id="moveDetail"
										href="/latterSpo_review/increase/hit?spoReviewNo=${gallery.spoReviewNo}">${gallery.title}</a></td>									
									<td>${gallery.users.id}</td>
									<td>${gallery.users.nickname}</td>
									<td>${gallery.users.gender}</td>
									<td>${gallery.createDate}</td>
									<td>${gallery.hit}</td>
								</tr>
							</c:forEach>
						</tbody>
						
					</table>
					
				</form>
			
				<div class="div_paging">
					${paging}
				</div>
			</div>
		</div><!-- 여기부터 각자 내용 넣기 끝 -->
		
	</section><!-- 기본틀 2 -->	
</section><!-- 기본틀 1 -->
</body>
</html>