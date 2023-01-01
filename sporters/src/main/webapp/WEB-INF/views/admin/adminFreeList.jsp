<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/adminHeader.jsp">
	<jsp:param value="관리자페이지" name="title" />
</jsp:include>
<jsp:include page="adminLeftSide.jsp">
	<jsp:param value="left_side" name="left_side" />
</jsp:include>
<style>

ul{list-style:none;}
.tabmenu{ 
  max-width:600px; 
  margin: 0 auto; 
  position:relative; 
}
.tabmenu ul{
  position: relative;
}
.tabmenu ul li{
  display:  inline-block;
  width:69px; 
  float:left;  
  text-align:center; 
  background :#f9f9f9;
  line-height:15px;
}
.tabmenu label{
  display:block;
  width:30px; 
  height:40px;
  line-height:40px;
}
.tabmenu input{display:none;}
.tabCon{
  display:none; 
  width: 100%;
  text-align:left; 
  padding: 20px;
 position: absolute;
    left: 0px;
    top: 75px;
  box-sizing: border-box; 
  border : 5px solid #f9f9f9;
}
.tabmenu input:checked ~ label{
  background:#ccc;
}
.tabmenu input:checked ~ .tabCon{
  display:block;
}
.tbl{
width: 90%
}

.button{
border: 0;
width: 30px;
padding: 7px;
margin-top: 10px;
margin-left:90%;
background-color: #D5C2EE;
border-radius: 2px;
}
.button:hover{
background-color:  rgba(213, 194, 238, 0.69);
border-radius: 2px;
}
.selectBoard{
width: 100%
}
</style>
<script>

	$(document).ready(function(){
		
		// 함수 호출
		fn_checkAll();
		fn_checkOne();
		fn_removeList();

		
		// 전체선택
		function fn_checkAll(){
			$('#check_all').click(function(){
				$('.check_one').prop('checked', $('#check_all').prop('checked'));
			});
		}
		
		// 개별선택
		function fn_checkOne(){
			$('.check_one').click(function(){
				var checkCount = 0;
				for(let i = 0; i < $('.check_one').length; i++){
					checkCount += $($('.check_one')[i]).prop('checked');				
				}
				$('#check_all').prop('checked', checkCount == $('.check_one').length);
			});
		}
		
		// 선택삭제
		function fn_removeList(){
			$('#frm_search').submit(function(event){
				if(confirm('선택한 모든 게시글을 삭제할까요?') == false){
					event.preventDefault();
					return;
				}
				if($('.check_one:checked').length == 0){
					alert('선택된 게시글이 없습니다.');
					event.preventDefault();
					return;
				}
			});
		}
		
		
	});
	
</script>

<body>

<div class="body_wrap">
	<div class="code_wrap">
	<div class="in_wrap">
<div class="selectBoard">
<div class="tabmenu out-tabmenu">
  <ul>
    <li id="tab1" class="btnCon"> 
      <input type="radio" checked name="tabmenu" id="tabmenu1">
      <label for="tabmenu1">menu1</label>
      <div class="tabCon" >
        
        		<div><a href="/free/write">글쓰러가기</a>  </div>		
			<form id="frm_search"  action="/admin/removeFreeList" method="post">										
				<br><hr><br>
				<button>선택삭제</button>
				<table border="1" class="tbl">
					<thead>
						<tr>	
							<td>
							<label for="check_all" id="lbl_check_all"></label>
							<input type="checkbox" id="check_all" class="blind">
							</td>
							<td>글 제목</td>	
							<td>회원 아이디</td>						
							<td>회원 이름</td>
							<td>회원 성별</td>						
							<td>회원 핸드폰번호</td>												
							<td>회원 포인트</td>	 						 
							<td>작성 글 수</td>
								
						</tr>
					</thead>
					<tbody id="list">						
						<c:forEach items="${galleryList}" var="gallery" varStatus="vs">
							<tr>
								<td><input type="checkbox" name="galleryList" value="${gallery.freeNo}" class="check_one"></td>
								<td>${beginNo - vs.index}</td>						
								<td><a id="moveDetail" href="/free/increase/hit?freeNo=${gallery.freeNo}">${gallery.title}</a></td>									
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
      
    </li>
    <li id="tab2" class="btnCon"><input type="radio" name="tabmenu" id="tabmenu2">
      <label for="tabmenu2">menu2</label>
      <div class="tabCon" >It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</div>
      
    </li>    
    <li id="tab3" class="btnCon"><input type="radio" name="tabmenu" id="tabmenu3">
      <label for="tabmenu3">menu3</label>
      <div class="tabCon" >There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</div>
      
    </li>
  </ul>
</div>
			
		</div>여기부터 각자 내용 넣기 끝
		
	</div>
</div>
</div>

</body>
</html>