<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/adminHeader.jsp">
	<jsp:param value="관리자페이지" name="title" />
</jsp:include>
<script type="text/javascript">
	$(document).ready(function(){
		fn_getUserList();
		fn_checkAll();
		fn_checkOne();
		
	// 전체선택
	function fn_checkAll(){
		$('#check_all').click(function(){
			$('.check_one').prop('checked', $('#check_all').prop('checked'));
		});
		
	// 개별 선택
	}
	function fn_checkOne(){
		$('.check_one').click(function(){
			var checkCount = 0;
			for(let i = 0; i < $('.checkOne').length; i++){
				checkCount += $($('.check_one')[i]).prop('checked');
			}
			$('#check_all').prop('checked', checkCount == $('.check_one').length);
		});
	}

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
			data : 'column=' + $('#column').val() + '&searchText=' + $('#searchText').val(),
			dataType:'json',
			success : function(resData){
				console.log(resData);
				console.log(resData.users);
				$('#list').empty();
				$.each(resData.users, function(i, user){
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
	})
	
	// 선택삭제
	function fn_removeList(){
		$('#frm_user_list').submit(function(event){
			if(confirm('선택된 회원을 삭제합니다.') == false){
				event.preventDefault();
				return;
			}
			if($('.check_one:checked').length == 0){
				alert('선택된 회원이 없습니다.');
				event.preventDefault();
				return;
			}
		});
	}
	});
</script>
<body>

	<div class="wrap">
		<h1>회원 관리</h1>

		<form id="frm_user_list" method="post">
			<select name="column" id="column">
				<option value="">회 원 분 류</option>
				<option value="ID">아이디</option>
				<option value="NAME">이름</option>
				<option value="USER_NO">회원번호</option>
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