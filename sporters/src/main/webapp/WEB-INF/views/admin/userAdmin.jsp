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
		fn_retireUser();
		
		// 문서객체
        var checkall = document.getElementById('check_all');
        var checkone = document.getElementsByClassName('check_one');

        // 전체선택 클릭 이벤트
        checkall.onclick = function(event) {
            for(let i = 0; i < checkone.length; i++) {
                checkone[i].checked = checkall.checked;
            }
        }
            
        // 개별선택 클릭 이벤트
        for(let i = 0; i < checkone.length; i++) {
            checkone[i].onclick = function(event) {
                let checkcount = 0;
                for(let j = 0; j < checkone.length; j++) {
                    checkcount += checkone[j].checked;
                }
                checkall.checked = (checkcount == checkone.length);
            }
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
			if(user.id != 'admin'){
				tr += '<td><input type="checkbox" name="userCheck" class="check_one" value="'+ user.userNo +'"></td>';
					}else{
							tr += '<td></td>';	
				}
			tr += '<td>' + user.userNo + '</td>';
			tr += '<td>' + user.id + '</td>';
			tr += '<td>' + user.nickname + '</td>';
			tr += '<td>' + user.name + '</td>';
			tr += '<td>' + (user.gender == 'M' ? '남자' : '여자') + '</td>';
			tr += '<td>' + user.email + '</td>';
			tr += '<td>' + user.mobile + '</td>';
			tr += '<td>' + user.joinDate + '</td>';
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
					if(user.id != 'admin'){
						tr += '<td><input type="checkbox" name="userCheck" class="check_one" value="'+ user.userNo +'"></td>';
						}else{
						tr += '<td></td>';	
						}
					tr += '<td>' + user.userNo + '</td>';
					tr += '<td>' + user.id + '</td>';
					tr += '<td>' + user.nickname + '</td>';
					tr += '<td>' + user.name + '</td>';
					tr += '<td>' + (user.gender == 'M' ? '남자' : '여자') + '</td>';
					tr += '<td>' + user.email + '</td>';
					tr += '<td>' + user.mobile + '</td>';
					tr += '<td>' + user.joinDate + '</td>';
					tr += '<td></td>';
					tr += '</tr>';
					$('#list').append(tr);
				})
			},
			error : function() {
				alert('실패');
			}
		})
	});
	
	function fn_retireUser(){
		$('#btn_deleteUser').click(function(event){
			
// 		if($('input:[name="userCheck"]:checked').val() == 1){
// 			console.log($('input[name="userCheck"]:checked').val());
// 			alert('관리자는 탈퇴할 수 없습니다.');
// 			event.preventDefault();
// 			return;
// 		}
			var userArray = [];
			$('input:checkbox[name="userCheck"]:checked').each(function(i){
				userArray.push($(this).val());
				console.log($(this).val());
				
			});
			
			console.log(userArray);
			alert(userArray);
			
			$.ajax({
				type:'post',
				url: '/retireUser',
				data:{"userNo" : userArray},
				dataType:'json',
				success:function(){
	 				alert('선택된 회원이 탈퇴 되었습니다.');
	 				fn_getUserList();
				}
			})
		
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
				<input type="button" id="btn_init" value="초기화">
				<input type="button" id="btn_deleteUser" value="회원 탈퇴"><br>
			<table border="1" width="70%" style="border-collapse:collapse; border:1px gray solid;">
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
					</tr>
				</thead>
				<tbody id="list">

				</tbody>
				<tfoot>
			
				</tfoot>
			</table>
			
		</form>
	</div>


</body>
</html>