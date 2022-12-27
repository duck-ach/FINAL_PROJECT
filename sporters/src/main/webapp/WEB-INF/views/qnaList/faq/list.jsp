<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../../layout/header.jsp">
	<jsp:param value="Spoters홈페이지" name="title" />
</jsp:include>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js" integrity="sha512-3j3VU6WC5rPQB4Ld1jnLV7Kd5xr+cq9avvhwqzbH/taCRNURoeEpoPBK9pDyeukwSxwRPJ8fDgvYXd6SkaZ2TA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
	$(document).ready(function(){
		$('#btn_write').click(function(){
			location.href = '/faq/write';
		});
	});
	
</script>
<style>
	.blind{
		display: none;
	}
</style>
<body>

<section class="wrap"><!-- 기본틀 1 -->
	<section class="content_leyout_section"><!-- 기본틀 2 -->
		<div>
			<div style="font-size: 32px;"> FAQ </div>
			<div>
				<c:if test="${loginUser.id == 'admin'}">
					<div>
						<input type="button" id="btn_write" value="작성">
					</div>
				</c:if>
				<table border="1">
					<thead>				
						<tr>
							<td>번호</td>
							<td>제목</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${faqList}" var="faq" varStatus="vs">
							<c:if test="${faq.state == 1}">
								<tr>
									<td>${beginNo - vs.index}</td>
									<td class="title_td">${faq.faqTitle}
										<script>
											$('.title_td').click(function(){
												$('.reply_tr').addClass('blind');
												$(this).parent().next().removeClass("blind");
											});
										</script>
									</td>
								</tr>
								<tr class="reply_tr blind">
									<td colspan="2">
										<c:if test="${faq.depth > 0}">
											${faq.faqContent}
										</c:if>
									</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2">검색</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</section><!-- 기본틀 2 -->
</section><!-- 기본틀 1 -->

</body>
</html>