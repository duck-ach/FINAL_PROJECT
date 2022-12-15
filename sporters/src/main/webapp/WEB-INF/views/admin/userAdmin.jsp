<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/adminHeader.jsp">
	<jsp:param value="관리자페이지" name="title" />
</jsp:include>
<script type="text/javascript">
	$(window).on('load', function() {
		fn_getUserList();
	})
	
	
	// 유저리스트 불러오기
	function fn_getUserList() {
		$.ajax({
			type : 'get',
			url : '/searchAllUsers',
			dataType : 'json',
			success : function(resData) {
				console.log(resData);
				$('#list').empty();
				$.each(resData.userList, function(i, user) {
							var tr = '<tr>';
							tr += '<td><input type="checkbox" class="check_one" value="'+ user.userNo +'"></td>';
							tr += '<td>' + user.userNo + '</td>';
							tr += '<td>' + user.id + '</td>';
							tr += '<td>' + user.name + '</td>';
							tr += '<td>' + user.nickName + '</td>';
							tr += '<td>' + (user.gender == 'M' ? '남자' : '여자') + '</td>';
							tr += '<td>' + user.email + '</td>';
							tr += '<td>' + user.mobile + '</td>';
							tr += '<td>' + user.joinDate + '</td>';
							tr += '<td></td>';
							tr += '<td></td>';
							tr += '</tr>';
							$('#list').append(tr);
						})

			},
			error : function() {
				alert('실패');
			}
		})

	}
	
	$('#btn_search').click(function(){
		$.ajax({
			type:'get',
			url :'/searchUsers',
			data : 'column=' + $('column').val() + '&searchText=' + $('#searchText').val(),
			dataType:'json',
			success : function(resData){
				console.log(resData);
				$('#list').empty();
				$.each(resData, function(i, user){
					var tr = '<tr>';
					tr += '<td><input type="checkbox" class="check_one" value="'+ user.userNo +'"></td>';
					tr += '<td>' + user.userNo + '</td>';
					tr += '<td>' + user.id + '</td>';
					tr += '<td>' + user.name + '</td>';
					tr += '<td>' + user.nickName + '</td>';
					tr += '<td>' + (user.gender == 'M' ? '남자' : '여자') + '</td>';
					tr += '<td>' + user.email + '</td>';
					tr += '<td>' + user.mobile + '</td>';
					tr += '<td>' + user.joinDate + '</td>';
					tr += '<td></td>';
					tr += '<td></td>';
					tr += '</tr>';
					$('#list').append(tr);
				})
			}
		})
	})
	
	$('.btn_deleteUser').click(function(){
		if(confirm('탈퇴가 처리되면 회원정보가 영구적으로 삭제됩니다. 계속하시겠습니까?') == false){
			event.preventDefault();
			return;
		}else{
			$("frm_user_list").attr("action", "/admin/remove").submit();
		}
	})
</script>
<body>

	<div class="wrap">
		<h1>회원 관리</h1>

		<form id="frm_user_list" method="post">
			<select name="column" id="column">
				<option value="">회 원 분 류</option>
				<option value="id">아이디</option>
				<option value="name">이름</option>
				<option value="user_no">회원번호</option>
			</select> <input type="text" id="searchText" name="searchText">
				<input type="button" id="btn_search" value="검색"> 
				<input type="button" id="btn_init" value="초기화"><br>

			<table>
				<thead>
					<tr>
						<td><input type="checkbox" id="check_all"></td>
						<td>회원번호</td>
						<td>아이디</td>
						<td>닉네임</td>
						<td>이름</td>
						<td>성별</td>
						<td>이메일</td>
						<td>연락처</td>
						<td>가입일</td>
						<td><button class="btn_deleteUser">탈퇴처리</button></td>
						<td><select id="ban"><option>정지</option>
						</select>
						<button class="btn_banUser">정지</button></td>
					</tr>
				</thead>
				<tbody id="list">

				</tbody>
			</table>
		</form>
	</div>


</body>
</html>