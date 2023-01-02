<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../layout/header.jsp">
	<jsp:param value="Spoters홈페이지" name="title" />
</jsp:include>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js" integrity="sha512-3j3VU6WC5rPQB4Ld1jnLV7Kd5xr+cq9avvhwqzbH/taCRNURoeEpoPBK9pDyeukwSxwRPJ8fDgvYXd6SkaZ2TA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<style>
	.wrap{
		position: static;
		position: unset !important;
		overflow: unset; 
		font-family: 'Noto Sans KR', sans-serif;
		}
	
	.label_one {
		text-align: left;
	}
	
	.label_all {
		
	}
	
	textarea {
		height: 130px;
	    border: 1px solid lightgray;
	    width: 100%;
	    text-align: justify;
	    text-justify: auto ;
	    overflow: auto;
	}
	
	.div_agree {
		margin: auto;
		width: 100%;
		padding-bottom: 15px;
	}
	
	.first_div{
		width: 80%;
	    margin: auto;
	    font-family: 'Noto Sans KR', sans-serif;
	}
	
	.div_span{
		padding-bottom: 30px;
	    font-size: 20px;
	    font-weight: bold;
	     text-align: center;
	}
	
	h2 {
	  position: relative;
	  padding: 0;
	  margin: 0;
	  font-family: "Raleway", sans-serif;
	  font-weight: 300;
	  font-size: 20px;
	  color: #080808;
	  -webkit-transition: all 0.4s ease 0s;
	  -o-transition: all 0.4s ease 0s;
	  transition: all 0.4s ease 0s;
	}
	
	.div_span h2 {
	text-align: center;
	    font-size:30px; font-weight:300; color:#222; letter-spacing:1px;
	    text-transform: uppercase;
	    display: grid;
	    grid-template-columns: 1fr max-content 1fr;
	    grid-template-rows: 27px 0;
	    grid-gap: 20px;
	    align-items: center;
	}
	
	.div_span h2:after,.div_span h2:before {
	    content: " ";
	    display: block;
/* 	    border-bottom: 1px solid #c8c8ff;
	    border-top: 1px solid #c8c8ff;
	    height: 1px;
	  background-color:#c8c8ff; */
	  border-top: 3px dotted #c8c8ff;
	}
	
	.div_label_all {
		padding-bottom: 30px;
		text-align: right;
	}
	
	.div_label_one {
		padding-bottom: 10px;
		text-align: right;
	}
	
	.div_btns{
		padding-top: 26px;
	    padding-bottom: 100px;
	    text-align: right;
	    display: flex;
    	justify-content: space-between;
	}
	
	.btn {
	position: relative;
	display: inline-block;
	text-align: center;
    height: 30px;
    border: none;
    font-size: 14px;
    color: white;
    background-color: #c8c8ff;
    border-radius: 4px;
    
	}
	.btn:active {
		  top: 4px; 
		}
		
	.btn .purple {box-shadow:0px 4px 0px #b6b6f3;}
	.btn .purple:active {box-shadow: 0 0 #c8c8ff; background-color: #c8c8ff;}
	
	.btn .purple, .btn-two.purple {background-color: #c8c8ff;}
	
	/* 헤더 */
		
	.mapage_div { 
		position: relative; 
		font-size: 32px; 
		font-weight: bold; 
		text-align: center; 
		margin-bottom: 40px;
	}
	
	.mapage_div:before,
	.mapage_div:after {
	  content: '[';
	  display: inline-block;
	  position: relative;
	  top: 1px;
	  height: 5%;
	  font-size: 1.25em;
	  color: #8282ff;
	  transition: all 0.5s ease;
	}
	
	.mapage_div:after { content: ']'; }
	
	.mapage_div:hover:before { 
	  transform: translateX(-5px);
	}
	
	.mapage_div:hover:after { 
	  transform: translateX(5px);
	}
	
	
</style>	

<script>
	
	$(function(){

		fn_emailCheck();
		fn_nicknameCheck();
		fn_checkAll();
		fn_checkOne();
		fn_toggleCheck();
		fn_join();
	});
	

	var emailPass = false;
	var nicknamePass = false;
	


	
	function fn_emailCheck(){
		$('#btn_check').click(function(){
			$.ajax({
				type: 'get',
				url: '/users/checkSameEmail',
				data: 'email=' + $('#email').val(),
				dataType: 'json',
				success: function(resData){
					if(resData.isUser){
						$('#msg_email').text('이미 사용중인 이메일입니다.');
						emailPass = false;
					} else {
						$('#msg_email').text('사용 가능한 이메일입니다.');
						emailPass = true;
					}
				}
			});
		});
	}

	function fn_nicknameCheck(){
		$('#nickname').keyup(function(){
			let nicknameValue = $(this).val();
			
			$.ajax({
				type: 'get',
				url: '/users/checkSameNickname',
				data: 'nickname=' + nicknameValue,
				dataType: 'json',
				success: function(resData){
					if(resData.isUser){
						$('#msg_nickname').text('이미 사용중인 닉네임입니다.');
						nicknamePass = false;
					} else {	
						$('#msg_nickname').text('사용 가능한 닉네임입니다.');
						nicknamePass = true;
					}
				}
			});
		});
	}
	
	
	function fn_checkAll(){
		$('#check_all').click(function(){
			$('.check_one').prop('checked', $(this).prop('checked'));
			// 전체 동의시
			if($(this).is(':checked')){
				$('.label_one').addClass('label_checked');
			} else {
				$('.label_one').removeClass('label_checked');
			}
		});
	}
	
	function fn_checkOne(){
		$('.check_one').click(function(){
			let checkCount = 0;
			for(let i = 0; i < $('.check_one').length; i++){
				checkCount += $($('.check_one')[i]).prop('checked');
			}
			$('#check_all').prop('checked', $('.check_one').length == checkCount);
			if($('#check_all').is(':checked')){
				$('.label_all').addClass('label_checked');
			} else {
				$('.label_all').removeClass('label_checked');
			}
		});
	}
	
	function fn_toggleCheck(){
		$('.label_all, .label_one').click(function(){
			$(this).toggleClass('label_checked');
		});
	}
	
	function fn_join(){
		$('#frm_join').submit(function(event){
			if(idPass == false){
				alert('가입할 수 없는 아이디입니다.');
				event.preventDefault();
				return;
			}
			else if(emailPass == false){
				alert('이메일을 확인하세요.');
			event.preventDefault();
			return;
			}
			else if($('#service').is(':checked') == false || $('#privacy').is(':checked') == false  || $('#location').is(':checked') == false){
				alert('필수 약관에 동의하세요.');
				event.preventDefault();
				return;
			}
		});
	}
	
</script>
<body>

<section class="wrap"><!-- 기본틀 1 -->
	<section class="content_leyout_section"><!-- 기본틀 2 -->
		<div>
			<div class="mapage_div"> 네이버 간편 가입 </div>
			<div> * 표시는 필수 입력사항입니다</div>
			<div> 초기설정 비밀번호는 생년월일 8자리 입니다 </div>
			
			<hr>
			<form id="frm_join" action="/users/naver/join" method="post">
	
				<input type="hidden"  name="id" id="id" value="${profile.id}">
				
				
				<div>
					<label for="nickname">닉네임 * </label>
					<input type="text" name="nickname" id="nickname">
					<span id="msg_nickname"></span>
				</div>
				<div>
					<label for="name">이름 * </label>
					<input type="text" name="name" id="name" value="${profile.name}">
				</div>
				
				<div>
					<span>성별 * </span>
					<input type="radio" name="gender" id="male" value="M">
					<label for="male">남자</label>
					<input type="radio" name="gender" id="female" value="F">
					<label for="female">여자</label>
					<script>
						$(':radio[name="gender"][value="${profile.gender}"]').prop('checked', true);
					</script>
				</div>
				<div>
					<label for="mobile">휴대전화 * </label>
					<input type="text" name="mobile" id="mobile" value="${profile.mobile}">
				</div>
				<div>
					<label for="birthyear">생년월일 * </label>
						<input type="text" name="birthyear" id="birthyear" value="${profile.birthyear}"></input>년 
						<input type="text" name="birthmonth" id="birthmonth" value="${profile.birthmonth}"></input>년 
						<input type="text" name="birthday" id="birthday" value="${profile.birthday}"></input>일
				</div>
				<div>
					<input type="text" onclick="fn_execDaumPostcode()" name="postcode" id="postcode" placeholder="우편번호" readonly>
					<input class="btn purple" type="button" onclick="fn_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" name="roadAddress" id="roadAddress" placeholder="도로명주소" readonly>
					<input type="text" name="jibunAddress" id="jibunAddress" placeholder="지번주소" readonly><br>
					<span id="guide" style="color:#999;display:none"></span>
					<input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소">
					<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
					<script>
					    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
					    function fn_execDaumPostcode() {
					        new daum.Postcode({
					            oncomplete: function(data) {
					                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
					
					                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
					                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					                var roadAddr = data.roadAddress; // 도로명 주소 변수
					                var extraRoadAddr = ''; // 참고 항목 변수
					
					                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
					                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
					                    extraRoadAddr += data.bname;
					                }
					                // 건물명이 있고, 공동주택일 경우 추가한다.
					                if(data.buildingName !== '' && data.apartment === 'Y'){
					                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					                }
					                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					                if(extraRoadAddr !== ''){
					                    extraRoadAddr = ' (' + extraRoadAddr + ')';
					                }
					
					                // 우편번호와 주소 정보를 해당 필드에 넣는다.
					                document.getElementById('postcode').value = data.zonecode;
					                document.getElementById("roadAddress").value = roadAddr;
					                document.getElementById("jibunAddress").value = data.jibunAddress;
					                
					                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
					                /* if(roadAddr !== ''){
					                    document.getElementById("extraAddress").value = extraRoadAddr;
					                } else {
					                    document.getElementById("extraAddress").value = '';
					                }
					 */
					                var guideTextBox = document.getElementById("guide");
					                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
					                if(data.autoRoadAddress) {
					                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
					                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
					                    guideTextBox.style.display = 'block';
					
					                } else if(data.autoJibunAddress) {
					                    var expJibunAddr = data.autoJibunAddress;
					                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
					                    guideTextBox.style.display = 'block';
					                } else {
					                    guideTextBox.innerHTML = '';
					                    guideTextBox.style.display = 'none';
					                }
					            }
					        }).open();
					    }
					</script>
				</div>
				<div>
					<label for="email">이메일 * </label>
					<input type="text" name="email" id="email" value="${profile.email}">
					<input class="btn purple" type="button" value="이메일중복체크" id="btn_check">
					<span id="msg_email"></span>
				</div>
				
				<hr>
				
				<div class="div_label_all">
					<label for="check_all" class="label_all">전체 동의</label>
					<input type="checkbox" id="check_all" class="blind">
				</div>
				
				<div class="div_agree">
					<div class="div_label_one">
					<label for="sevice" class="label_one">이용약관 동의(필수)</label>
					<input type="checkbox" id="service" class="check_one blind">
					</div>
					<div class="div_agree">
						<textarea>제 1 장 총칙

제 1 조 (목적)
본 약관은 통계청이 운영하는 나라통계시스템 운영홈페이지(이하 "당 사이트")에서 제공하는 모든 서비스(이하 "서비스")의 이용조건 및 절차, 이용자와 당 사이트의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.

제 2 조 (약관의 효력과 변경)
① 당 사이트는 이용자가 본 약관 내용에 동의하는 것을 조건으로 이용자에게 서비스를 제공하며, 당 사이트의 서비스 제공 행위 및 이용자의 서비스 사용 행위에는 본 약관을 우선적으로 적용하겠습니다.
② 당 사이트는 본 약관을 사전 고지 없이 변경할 수 있으며, 변경된 약관은 당 사이트 내에 공지함으로써 이용자가 직접 확인하도록 할 것입니다. 이용자가 변경된 약관에 동의하지 아니하는 경우 본인의 회원등록을 취소(회원탈퇴)할 수 있으며, 계속 사용할 경우에는 약관 변경에 대한 암묵적 동의로 간주됩니다. 변경된 약관은 공지와 동시에 그 효력을 발휘합니다.

제 3 조 (약관 외 준칙)
본 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 및 기타 관련 법령의 규정에 의합니다.

제 4 조 (용어의 정의)
① 본 약관에서 사용하는 용어의 정의는 다음과 같습니다.
 1. 이용자 : 본 약관에 따라 당 사이트가 제공하는 서비스를 받는 자
 2. 가 입 : 당 사이트가 제공하는 신청서 양식에 해당 정보를 기입하고, 본 약관에 동의하여 서비스 이용계약을 완료시키는 행위
 3. 회 원 : 당 사이트에 필요한 개인 정보를 제공하여 회원 등록을 한 자로서, 당 사이트의 정보 및 서비스를 이용할 수 있는 자
 4. 아이디 : 이용고객의 식별과 이용자가 서비스 이용을 위하여 이용자가 정한 문자와 숫자의 조합
 5. 비밀번호 : 아이디에 대한 본인 여부를 확인하기 위하여 사용되는 문자, 숫자, 특수문자 등의 조합
 6. 탈퇴 : 서비스 또는 회원이 이용계약을 종료하는 행위
② 본 약관에서 정의하지 않은 용어는 개별서비스에 대한 별도 약관 및 이용규정에서 정의합니다.

제 2 장 서비스 제공 및 이용

제 5 조 (이용 계약의 성립)
① 이용계약은 이용자가 온라인으로 당 사이트에서 제공하는 이용계약 신청서를 작성하여 가입을 완료하는 것으로 성립됩니다.
② 당 사이트는 다음 각 호에 해당하는 경우에 가입을 취소할 수 있습니다.
 1. 다른 사람의 명의를 사용하여 신청하였을 때
 2. 이용 계약 신청서의 내용을 허위로 기재하였거나 신청하였을 때
 3. 사회의 안녕 질서 혹은 미풍양속을 저해할 목적으로 신청하였을 때
 4. 다른 사람의 당 사이트 서비스 이용을 방해하거나 그 정보를 도용하는 등의 행위를 하였을 때
 5. 당 사이트를 이용하여 법령과 본 약관이 금지하는 행위를 하는 경우
 6. 기타 당 사이트가 정한 이용신청요건이 미비 되었을 때
③ 당 사이트는 다음 각 호에 해당하는 경우 그 사유가 소멸될 때까지 이용계약 성립을 유보할 수 있습니다.
 1. 서비스 관련 제반 용량이 부족한 경우
 2. 기술상 장애 사유가 있는 경우
④ 당 사이트가 제공하는 서비스는 자체 개발하거나 다른 기관과의 협의 등을 통해 제공하는 일체의 서비스를 말하는 것이며, 그 내용을 변경할 경우에는 이용자에게 공지한 후 변경하여 제공할 수 있습니다.

제 6 조 (회원정보 사용에 대한 동의)
① 회원의 개인정보는 공공기관의 개인정보보호법에 의해 보호되며 당 사이트의  개인정보처리방침이 적용됩니다.
② 당 사이트의 회원 정보는 다음과 같이 수집, 사용, 관리, 보호됩니다.
 1. 개인정보의 수집 : 당 사이트는 회원 가입시 회원이 제공하는 정보를 수집합니다.
 2. 개인정보의 사용 : 당 사이트는 서비스 제공과 관련해서 수집된 회원정보를 본인의 승낙 없이 제3자에게 누설, 배포하지 않습니다. 단, 전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우, 범죄에 대한 수사상의 목적이 있거나 방송통신심의위원회의 요청이 있는 경우 또는 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우, 회원이 당 사이트에 제공한 개인정보를 스스로 공개한 경우에는 그러하지 않습니다.
 3. 개인정보의 관리 : 회원은 개인정보의 보호 및 관리를 위하여 서비스의 개인정보관리에서 수시로 회원의 개인정보를 수정/삭제할 수 있습니다. 수신되는 정보 중 불필요하다고 생각되는 부분도 변경/조정할 수 있습니다. 개인정보의 이용기간은 이용자가 가입을 완료하고 개인정보관리에서 회원가입을 탈퇴하는 시점이며 보호기간도 동일합니다.
 4. 개인정보의 보호 : 회원의 개인정보는 오직 회원만이 열람/수정/삭제 할 수 있으며, 이는 전적으로 회원의 아이디와 비밀번호에 의해 관리되고 있습니다. 따라서 타인에게 본인의 아이디와 비밀번호를 알려주어서는 아니 되며, 작업 종료 시에는 반드시 로그아웃 해주시고, 웹 브라우저의 창을 닫아주시기 바랍니다(이는 타인과 컴퓨터를 공유하는 인터넷 카페나 도서관 같은 공공장소에서 컴퓨터를 사용하는 경우에 회원의 정보의 보호를 위하여 필요한 사항입니다.)

제 7 조 (회원의 정보 보안)
① 가입 신청자가 당 사이트 서비스 가입 절차를 완료하는 순간부터 회원은 입력한 정보의 비밀을 유지할 책임이 있으며, 회원의 아이디와 비밀번호를 타인에게 제공하여 발생하는 모든 결과에 대한 책임은 회원 본인에게 있습니다.
② 아이디와 비밀번호에 관한 모든 관리의 책임은 회원에게 있으며, 회원의 아이디나 비밀번호가 부정하게 사용되었다는 사실을 발견한 경우에는 즉시 당 사이트에 신고하여야 합니다. 신고를 하지 않음으로 인한 모든 책임은 회원 본인에게 있습니다.
③ 회원은 당 사이트 서비스의 사용 종료 시마다 정확히 접속을 종료하도록 해야 하며, 정확히 종료하지 아니함으로써 제3자가 이용자 또는 회원에 관한 정보를 이용하게 되는 등의 결과로 인해 발생하는 손해 및 손실에 대하여 당 사이트는 책임을 부담하지 아니합니다.

제 8 조 (서비스 이용시간)
① 서비스 이용시간은 당 사이트의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴, 1일 24시간을 원칙으로 합니다.
② 제1항의 이용시간은 정기점검 등의 필요로 인하여 당 사이트가 정한 날 또는 시간 및 예기치 않은 사건사고로 인한 시간은 예외로 합니다.

제 9 조 (서비스의 중지 및 정보의 저장과 사용)
① 당 사이트 서비스에 보관되거나 전송된 메시지 및 기타 통신 메시지 등의 내용이 국가의 비상사태, 정전, 당 사이트의 관리 범위 외의 서비스 설비 장애 및 기타 불가항력에 의하여 보관되지 못하였거나 삭제된 경우, 전송되지 못한 경우 및 기타 통신 데이터의 손실이 있을 경우에 당 사이트는 관련 책임을 부담하지 아니합니다.
② 당 사이트가 정상적인 서비스 제공의 어려움으로 인하여 일시적으로 서비스를 중지하여야 할 경우에는 서비스 중지 1주일 전의 고지 후 서비스를 중지할 수 있으며, 이 기간 동안 이용자가 고지내용을 인지하지 못한 데 대하여 당 사이트는 책임을 부담하지 아니합니다. 부득이한 사정이 있을 경우 위 사전 고지기간은 감축되거나 생략될 수 있습니다. 또한 위 서비스 중지에 의하여 본 서비스에 보관되거나 전송된 메시지 및 기타 통신 메시지 등의 내용이 보관되지 못하였거나 삭제․전송되지 못한 경우 및 기타 통신 데이터의 손실이 있을 경우에 대하여도 당 사이트는 책임을 부담하지 아니합니다.
③ 당 사이트의 사정으로 서비스를 영구적으로 중단하여야 할 경우 제2항에 의거합니다. 다만, 이 경우 사전 고지기간은 1개월로 합니다.
④ 당 사이트는 사전 고지 후 서비스를 일시적으로 수정, 변경 및 중단할 수 있으며, 이에 대하여 이용자 또는 제3자에게 어떠한 책임도 부담하지 아니합니다.
⑤ 당 사이트는 이용자가 본 약관의 내용에 위배되는 행동을 한 경우, 임의로 서비스 사용을 제한 및 중지할 수 있습니다. 이 경우 당 사이트는 위 이용자의 접속을 금지할 수 있습니다.
⑥ 장기간 휴면 회원인 경우 안내 메일 또는 공지사항 발표 후 1주일간의 통지 기간을 거쳐 서비스 사용을 중지할 수 있습니다.

제 10 조 (서비스의 변경 및 해지)
① 당 사이트는 이용자가 서비스를 이용하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않으며, 회원이 본 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관하여는 책임을 지지 않습니다.
② 당 사이트는 서비스 이용과 관련하여 가입자에게 발생한 손해 중 가입자의 고의, 과실에 의한 손해에 대하여 책임을 부담하지 아니합니다.
③ 회원을 탈퇴하고자 하는 경우에는 당 사이트 로그인 후 회원탈퇴 절차에 따라 해지할 수 있습니다.

제 11 조 (정보 제공 및 홍보물 게재)
① 당 사이트는 서비스를 운영함에 있어서 각종 정보를 서비스에 게재하는 방법 등으로 회원에게 제공할 수 있습니다.
② 당 사이트는 서비스에 적절하다고 판단되거나 활용 가능성 있는 홍보물을 게재할 수 있습니다.

제 12 조 (게시물의 저작권)
① 이용자가 게시한 게시물의 내용에 대한 권리는 이용자에게 있습니다.
② 당 사이트는 게시된 내용을 사전 통지 없이 편집, 이동할 수 있는 권리를 보유하며, 다음의 경우 사전 통지 없이 삭제할 수 있습니다.
 1. 본 이용약관에 위배되거나 상용 또는 불법, 음란, 저속하다고 판단되는 게시물을 게시한 경우
 2. 다른 이용자 또는 제 3자를 비방하거나 중상모략으로 명예를 손상시키는 내용인 경우
 3. 공공질서 및 미풍양속에 위반되는 내용인 경우
 4. 범죄적 행위에 결부된다고 인정되는 내용일 경우
 5. 제3자의 저작권 등 기타 권리를 침해하는 내용인 경우
 6. 기타 관계 법령에 위배되는 경우
③ 이용자의 게시물이 타인의 저작권을 침해함으로써 발생하는 민․형사상의 책임은 전적으로 이용자가 부담하여야 합니다.

제 13 조 (이용자의 행동규범 및 서비스 이용제한)
① 이용자가 제공하는 정보의 내용이 허위인 것으로 판명되거나, 그러하다고 의심할 만한 합리적인 사유가 발생할 경우 당 사이트는 이용자의 본 서비스 사용을 일부 또는 전부 중지할 수 있으며, 이로 인해 발생하는 불이익에 대해 책임을 부담하지 아니합니다.
② 이용자가 당 사이트 서비스를 통하여 게시, 전송, 입수하였거나 전자메일 기타 다른 수단에 의하여 게시, 전송 또는 입수한 모든 형태의 정보에 대하여는 이용자가 모든 책임을 부담하며 당 사이트는 어떠한 책임도 부담하지 아니합니다.
③ 당 사이트는 당 사이트가 제공한 서비스가 아닌 가입자 또는 기타 유관기관이 제공하는 서비스의 내용상의 정확성, 완전성 및 질에 대하여 보장하지 않습니다. 따라서 당 사이트는 이용자가 위 내용을 이용함으로 인하여 입게 된 모든 종류의 손실이나 손해에 대하여 책임을 부담하지 아니합니다.
④ 이용자는 본 서비스를 통하여 다음과 같은 행동을 하지 않는데 동의합니다.
 1. 타인의 아이디와 비밀번호를 도용하는 행위
 2. 저속, 음란, 모욕적, 위협적이거나 타인의 사생활을 침해할 수 있는 내용을 전송, 게시, 게재, 전자메일 또는 기타의 방법으로 전송하는 행위
 3. 서비스를 통하여 전송된 내용의 출처를 위장하는 행위
 4. 법률, 계약에 의하여 이용할 수 없는 내용을 게시, 게재, 전자메일 또는 기타의 방법으로 전송하는 행위
 5. 타인의 특허, 상표, 영업비밀, 저작권, 기타 지적재산권을 침해하는 내용을 게시, 게재, 전자메일 또는 기타의 방법으로 전송하는 행위
 6. 당 사이트의 승인을 받지 아니한 광고, 판촉물, 정크메일, 스팸, 행운의 편지, 피라미드 조직 기타 다른 형태의 권유를 게시, 게재, 전자메일 또는 기타의 방법으로 전송하는 행위
 7. 다른 이용자의 개인정보를 수집 또는 저장하는 행위
⑤ 당 사이트는 회원이 본 약관을 위배했다고 판단되면 서비스와 관련된 모든 정보를 이용자의 동의 없이 삭제할 수 있습니다.
⑥ 제1항의 규정에 의하여 서비스의 제한을 받게 된 이용자가 위 조치에 대한 이의가 
있을 경우에는 이의신청을 할 수 있으나 서비스 제한 시 삭제된 이용자의 데이터에 대해서는 책임지지 아니합니다. 
⑦ 당 사이트는 제6항의 규정에 의한 이의신청에 대하여 그 확인이 완료될 때까지 이용제한을 연기할 수 있습니다.

제 3 장 의무 및 책임

제 14 조 (당 사이트의 의무)
① 당 사이트는 법령과 본 약관이 금지하거나 미풍양속에 반하는 행위를 하지 않으며, 지속적이고 안정적으로 서비스를 제공하기 위해 노력할 의무가 있습니다.
② 당 사이트는 회원의 개인 신상 정보를 본인의 승낙 없이 타인에게 누설, 배포하지 않습니다. 다만, 전기통신관련법령 등 관계법령에 의하여 관계 국가기관 등의 요구가 있는 경우에는 그러하지 아니합니다.
③ 당 사이트는 이용자가 안전하게 당 사이트 서비스를 이용할 수 있도록 이용자의 개인정보 (신용정보 포함) 보호를 위한 보안시스템을 갖추어야 합니다.
④ 당 사이트는 이용자의 귀책사유로 인한 서비스 이용 장애에 대하여 책임을 지지 않습니다.

제 15 조 (회원의 의무)
① 회원 가입시에 요구되는 정보는 정확하게 기입하여야 합니다. 또한 이미 제공된 회원에 대한 정보가 정확한 정보가 되도록 유지, 갱신하여야 하며, 회원은 자신의 아이디 및 비밀번호를 제3자에게 이용하게 해서는 안 됩니다.
② 회원은 당 사이트의 사전 승낙 없이 서비스를 이용하여 어떠한 영리행위도 할 수 없습니다.
③ 회원은 당 사이트 서비스를 이용하여 얻은 정보를 당 사이트의 사전승낙 없이 복사, 복제, 변경, 번역, 출판·방송 기타의 방법으로 사용하거나 이를 타인에게 제공할 수 없습니다.
④ 이용자는 당 사이트 서비스 이용과 관련하여 다음 각 호의 행위를 하여서는 안 됩니다.
 1. 다른 회원의 아이디를 부정 사용하는 행위
 2. 범죄행위를 목적으로 하거나 기타 범죄행위와 관련된 행위
 3. 선량한 풍속, 기타 사회질서를 해하는 행위
 4. 타인의 명예를 훼손하거나 모욕하는 행위
 5. 타인의 지적재산권 등의 권리를 침해하는 행위
 6. 해킹행위 또는 컴퓨터바이러스의 유포행위
 7. 타인의 의사에 반하여 광고성 정보 등 일정한 내용을 지속적으로 전송하는 행위
 8. 서비스의 안전적인 운영에 지장을 주거나 줄 우려가 있는 일체의 행위
 9. 당 사이트에 게시된 정보의 변경

제 4 장 기 타

제 16 조 (당 사이트의 소유권)
① 당 사이트가 제공하는 서비스, 그에 필요한 소프트웨어, 이미지, 마크, 로고, 디자인, 서비스명칭, 정보 및 상표 등과 관련된 지적재산권 및 기타 권리는 당 사이트에 소유권이 있습니다.
② 이용자는 당 사이트가 명시적으로 승인한 경우를 제외하고는 전항의 소정의 각 재산에 대한 전부 또는 일부의 수정, 대여, 대출, 판매, 배포, 제작, 양도, 재라이센스, 담보권 설정 행위, 상업적 이용 행위를 할 수 없으며, 제3자로 하여금 이와 같은 행위를 하도록 허락할 수 없습니다.

제 17 조 (양도금지)
회원이 서비스의 이용권한, 기타 이용계약 상 지위를 타인에게 양도, 증여할 수 없으며, 이를 담보로 제공할 수 없습니다.

제 18 조 (손해배상)
당 사이트는 무료로 제공되는 서비스와 관련하여 회원에게 어떠한 손해가 발생하더라도 당 사이트가 고의로 행한 범죄행위를 제외하고 이에 대하여 책임을 부담하지 아니합니다.

제 19 조 (면책조항)
① 당 사이트는 서비스에 표출된 어떠한 의견이나 정보에 대해 확신이나 대표할 의무가 없으며 회원이나 제3자에 의해 표출된 의견을 승인하거나 반대하거나 수정하지 않습니다. 당 사이트는 어떠한 경우라도 회원이 서비스에 담긴 정보에 의존해 얻은 이득이나 입은 손해에 대해 책임이 없습니다.
② 당 사이트는 회원간 또는 회원과 제3자간에 서비스를 매개로 하여 물품거래 혹은 금전적 거래 등과 관련하여 어떠한 책임도 부담하지 아니하고, 회원이 서비스의 이용과 관련하여 기대하는 이익에 관하여 책임을 부담하지 않습니다.

제 20 조 (관할법원)
본 서비스 이용과 관련하여 발생한 분쟁에 대해 소송이 제기될 경우 대전지방법원을 전속적 관할 법원으로 합니다.

부 칙
(시행일) 본 약관은 2018년 8월 1일부터 시행됩니다. 개정된 약관의 적용일자 이전 이용자 또는 회원은 개정된 이용약관의 적용을 받습니다.
								</textarea>
					</div>
					</div>
					<div class="div_agree">
						<div class="div_label_one">
						<label for="privacy" class="label_one">개인정보수집 동의(필수)</label>
						<input type="checkbox" id="privacy" class="check_one blind">
						</div>
						<div class="div_agree">
							<textarea>1. 개인정보의 수집항목 및 수집방법 
	통계청 나라통계사이트에서는 기본적인 회원 서비스 제공을 위한 필수정보로 실명인증정보와 가입정보로 구분하여 다음의 정보를 수집하고 있습니다. 필수정보를 입력해주셔야 회원 서비스 이용이 가능합니다.
	
	  가. 수집하는 개인정보의 항목 
	    * 수집하는 필수항목
	      - 실명인증정보 : 이름, 휴대전화번호, 본인 인증 또는 I-PIN(개인식별번호), GPKI
	      - 가입정보 : 아이디, 비밀번호, 성명, 이메일, 전화번호, 휴대전화번호, 기관명
	    * 선택항목
	      - 주소, 기관의 부서명
		
	   [컴퓨터에 의해 자동으로 수집되는 정보]
	   인터넷 서비스 이용과정에서 아래 개인정보 항목이 자동으로 생성되어 수집될 수 있습니다. 
	    - IP주소, 서비스 이용기록, 방문기록 등
		
	  나. 개인정보 수집방법
	      홈페이지 회원가입을 통한 수집 
	
	2. 개인정보의 수집/이용 목적 및 보유/이용 기간
	통계청 나라통계사이트에서는 정보주체의 회원 가입일로부터 서비스를 제공하는 기간 동안에 한하여 통계청 나라통계사이트 서비스를 이용하기 위한 최소한의 개인정보를 보유 및 이용 하게 됩니다. 회원가입 등을 통해 개인정보의 수집·이용, 제공 등에 대해 동의하신 내용은 언제든지 철회하실 수 있습니다. 회원 탈퇴를 요청하거나 수집/이용목적을 달성하거나 보유/이용기간이 종료한 경우, 사업 폐지 등의 사유발생시 개인 정보를 지체 없이 파기합니다.
	
	  * 실명인증정보
	    - 개인정보 수집항목 : 이름, 휴대폰 본인 인증 또는 I-PIN(개인식별번호), GPKI
	    - 개인정보의 수집·이용목적   : 홈페이지 이용에 따른 본인 식별/인증절차에 이용
	    - 개인정보의 보유 및 이용기간 : I-PIN / GPKI는 별도로 저장하지 않으며 실명인증용으로만 이용
	
	  * 가입정보
	    - 개인정보 수집항목 : 아이디, 비밀번호, 성명, 이메일, 전화번호, 휴대전환번호, 기관명
	    - 개인정보의 수집·이용목적 : 홈페이지 서비스 이용 및 회원관리, 불량회원의 부정 이용방지, 민원신청 및 처리 등
	    - 개인정보의 보유 및 이용기간 : 2년 또는 회원탈퇴시
	
	정보주체는 개인정보의 수집·이용목적에 대한 동의를 거부할 수 있으며, 동의 거부시 통계청 나라통계사이트에 회원가입이 되지 않으며, 통계청 나라통계사이트에서 제공하는 서비스를 이용할 수 없습니다.
	
	3. 수집한 개인정보 제3자 제공
	통계청 나라통계사이트에서는 정보주체의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.
			
	4. 개인정보 처리업무 안내
	통계청 나라통계사이트에서는 개인정보의 취급위탁은 하지 않고 있으며, 원활한 서비스 제공을 위해 아래의 기관을 통한 실명인증 및 공공 I-PIN, GPKI 인증을 하고 있습니다. 
	
	  * 수탁업체
	    - SCI서울신용평가정보(주)
	      · 위탁업무 내용 : 실명확인
	      · 개인정보 보유 및 이용 기간 : 신용평가 기관에서는 이미 보유하고 있는 개인정보이기 때문에 별도로 저장하지 않음
	    - 행정자치부
	      · 위탁업무 내용 : 공공 I-PIN, GPKI 인증
	      · 개인정보 보유 및 이용 기간 : 행정자치부에서는 이미 보유하고 있는 개인정보이기 때문에 별도로 저장하지 않음
									</textarea>
						</div>
					</div>
					<div>
						<div class="div_label_one">
							<label for="location" class="label_one">위치정보수집 동의(필수)</label>
							<input type="checkbox" id="location" name="location" class="check_one blind">
						</div>
					<div class="div_agree">
						<textarea>제 3자 정보제공
	
	제1조 (위치기반서비스의 내용)
	회사는 위치정보사업자로부터 제공받은 위치정보수집대상의 위치정보를 이용하여 다음 각 호와 같은 내용의 위치기반서비스를 제공합니다.
	1. 현재 위치를 활용한 검색결과 제공: 개인위치정보주체의 현 위치를 기준으로 근거리 및 배달이 가능한 음식점 등의 검색결과를 제공합니다.
	제2조 (위치정보 수집방법)
	회사는 다음과 같은 방식으로 개인위치정보를 수집합니다.
	① 휴대폰 단말기를 이용한 기지국 기반(Cell ID방식)의 실시간 위치정보 수집
	② GPS칩이 내장된 전용 단말기를 통해 수집되는 GPS 정보를 통한 위치정보 수집
	③ Wi-Fi칩이 내장된 전용 단말기를 통해 수집되는 WPS 정보를 통한 위치정보 수집
	④ 기타 위치를 식별할 수 있는 장치를 통해 수집되는 위치정보 수집
	제3조 (위치기반서비스의 이용)
	① 위치기반서비스의 이용은 연중무휴 1일 24시간을 원칙으로 합니다. 다만, 회사의 업무상이나 기술상의 이유로 서비스가 일지 중지될 수 있고, 또한 운영상의 목적으로 회사가 정한 기간에는 서비스가 일시 중지될 수 있습니다. 이러한 경우 회사는 사전 또는 사후에 이를 공지합니다.
	② 회사는 위치기반서비스를 일정범위로 분할하여 각 범위 별로 이용 가능한 시간을 별도로 정할 수 있으며 이 경우 그 내용을 공지합니다.
	③ 회사는 전시·사변·천재지변 또는 이에 준하는 국가비상사태가 발생하거나 발생할 우려가 있는 경우와 전기통신사업법에 의한 기간통신사업자가 전기통신서비스를 중지하는 등 기타 부득이한 사유가 있는 경우에는 위치기반서비스의 전부 또는 일부를 제한하거나 정지할 수 있습니다.
	④ 제3항에 의한 장애로 인하여 위치기반서비스가 제한 또는 정지된 경우에 회사는 일체의 책임을 지지 않습니다.
	⑤ 회사는 제4항의 규정에 의하여 위치기반서비스의 이용을 제한하거나 정지한 때에는 그 사유 및 제한기간 등을 지체 없이 이용자에게 알리도록 노력해야 합니다.
	제4조 (서비스 이용요금)
	위치기반서비스의 이용요금은 무료입니다
	제5조 (개인위치정보의 이용 또는 제공)
	① 개인위치정보를 이용하는 회사는 아래와 같습니다.
	가. 상호 : 금호터미널
	나. 대표자: 김현철
	다. 주소 : 광주광역시 서구 무진대로 904
	라. 대표전화: 062-360-8401
	② 회사는 개인위치정보를 이용하여 서비스를 제공하고자 하는 경우에는 미리 이용약관에 명시한 후 개인위치정보주체의 동의를 얻어야 합니다.
	③ 이용자 및 법정대리인의 권리와 그 행사방법은 제소 당시의 이용자의 주소에 의하며, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할 법원에 제기합니다.
	④ 회사는 위치정보의 보호 및 이용 등에 관한 법률 제16조 제2항에 근거하여 개인위치정보주체에 대한 위치정보 수집/이용/제공사실 확인자료를 위치정보시스템에 자동으로 기록하며, 1년 이상 보관합니다.
	⑤ 회사는 개인위치정보를 이용자가 지정하는 제3자에게 제공하는 경우에는 개인위치정보를 수집한 당해 통신 단말장치로 매회 이용자에게 제공받는 자, 제공일시 및 제공목적을 즉시 통보합니다. 단, 다음 각 호의 어느 하나에 해당하는 경우에는 이용자가 미리 특정하여 지정한 통신 단말장치 또는 전자우편주소로 통보합니다.
	1. 개인위치정보를 수집한 당해 통신단말장치가 문자, 음성 또는 영상의 수신기능을 갖추지 아니한 경우
	2. 이용자가 온라인 게시 등의 방법으로 통보할 것을 미리 요청한 경우
	제6조 (개인위치정보주체의 권리)
	① 이용자는 회사에 대하여 언제든지 개인위치정보를 이용한 위치기반서비스 제공 및 개인위치 정보의 제3자 제공에 대한 동의의 전부 또는 일부를 철회할 수 있습니다. 이 경우 회사는 수집한 개인위치정보 및 위치정보 이용, 제공사실 확인자료를 파기합니다.
	② 이용자는 회사에 대하여 언제든지 개인위치정보의 수집, 이용 또는 제공의 일시적인 중지를 요구할 수 있으며, 회사는 이를 거절할 수 없고 이를 위한 기술적 수단을 갖추고 있습니다.
	③ 이용자는 회사에 대하여 아래 각 호의 자료에 대한 열람 또는 고지를 요구할 수 있고, 당해 자료에 오류가 있는 경우에는 그 정정을 요구할 수 있습니다. 이 경우 회사는 정당한 사유 없이 이용자의 요구를 거절할 수 없습니다.
	1. 본인에 대한 위치정보 수집, 이용, 제공사실 확인자료
	2. 본인의 개인위치 정보가 위치정보의 보호 및 이용 등에 관한 법률 또는 다른 법률 규정에 의하여 제 3자에게 제공된 이유 및 내용
	④ 이용자는 제1항 내지 제3항의 권리행사를 위해 회사의 소정의 절차를 통해 요구할 수 있습니다.
	제7조 (법정대리인의 권리)
	① 회사는 14세 미만의 이용자에 대해서는 개인위치정보를 이용한 위치기반서비스 제공 및 개인위치정보의 제 3자 제공에 대한 동의를 당해 이용자와 당해 이용자의 법정대리인으로부터 동의를 받아야 합니다. 이 경우 법정대리인은 제7조에 의한 이용자의 권리를 모두 가집니다.
	② 회사는 14세 미만의 아동의 개인위치정보 또는 위치정보 이용?제공사실 확인자료를 이용 약관에 명시 또는 고지한 범위를 넘어 이용하거나 제3자에게 제공하고자 하는 경우에는 14세미만의 아동과 그 법정대리인의 동의를 받아야 합니다. 단, 아래의 경우는 제외합니다.
	1. 위치정보 및 위치기반서비스 제공에 따른 요금정산을 위하여 위치정보 이용, 제공사실 확인자료가 필요한 경우
	2. 통계작성, 학술연구 또는 시장조사를 위하여 특정 개인을 알아볼 수 없는 형태로 가공하여 제공하는 경우
	제8조 (8세 이하의 아동 등의 보호의무자의 권리)
	① 회사는 아래의 경우에 해당하는 자(이하 "8세 이하의 아동 등"이라 한다)의 보호의무자가 8세 이하의 아동 등의 생명 또는 신체보호를 위하여 개인위치정보의 이용 또는 제공에 동의하는 경우에는 본인의 동의가 있는 것으로 봅니다.
	1. 8세 이하의 아동
	2. 금치산자
	3. 장애인복지법 제2조 제2항 제2호의 규정에 의한 정신적 장애를 가진 자로서 장애인고용촉진 및 직업재활법 제2조 제2호의 규정에 의한 중증장애인에 해당하는 자(장애인 복지법 제29조의 규정에 의하여 장애인 등록을 한 자에 한한다.)
	② 8세 이하의 아동 등의 생명 또는 신체의 보호를 위하여 개인위치정보의 이용 또는 제공에 동의를 하고자 하는 보호의무자는 서면동의서에 보호의무자임을 증명하는 서면을 첨부하여 회사에 제출하여야 합니다.
	③ 보호의무자는 8세 이하의 아동 등의 개인위치정보 이용 또는 제공에 동의하는 경우 개인위치정보주체 권리의 전부를 행사할 수 있습니다.
	제9조 (위치정보관리책임자의 지정)
	① 회사는 위치정보를 적절히 관리, 보호하고 개인위치정보주체의 불만을 원활히 처리할 수 있도록 실질적인 책임을 질 수 있는 지위에 있는 자를 위치정보관리 책임자로 지정해 운영합니다.
	② 위치정보관리책임자는 위치기반 서비스를 제공하는 부서의 부서장으로서 구체적인 사항은 본 약관의 부칙에 따릅니다.</textarea>
					</div>
					<div class="div_label_one">
					<label for="marketing" class="label_one">마케팅 동의(선택)</label>
					<input type="checkbox" id="marketing" name="marketing" class="check_one blind">
					</div>
					<div class="div_agree">
						<textarea>
	마케팅 정보 수신 동의
	SPORTERS는 개인정보보호법 및 정보통신망이용촉진 및 정보보호 등에 관한 법률 등 관계법령에 따라 광고성 정보를 전송하기 위해 이용자의 사전 수신 동의를 받고 있습니다. 본 내용은 SPORTERS 회원 서비스가 적용되는 개별서비스의 마케팅 수신동의를 포함하고 있으며, 마케팅 정보 수신 동의 시개별서비스의 마케팅 수신에 일괄 동의한 것으로 처리됩니다. 
	1. 전송방법
	마케팅 정보 전송 방법은 SPORTERS의 각 개별서비스에서 정한 방식에 따라 전송됩니다.
	2. 전송내용
	발송되는 마케팅 정보는 수신자에게 SPORTERS 및 개별서비스에서 제공하는 혜택(포인트, 쿠폰 등) 정보, 각종 이벤트, 신규 상품 관련 소식 등 광고성 정보로 관련 법의 규정을 준수하여 발송됩니다. 단, 광고성 정보 이외에 의무적으로 안내 되어야 하는 정보성 내용은 수신동의 여부와 무관하게 제공됩니다.
	3. 수집항목
	- 이메일, 이름, 전화번호, 회사 주소
	4. 이용목적
	- 소식지 서비스 제공, 신제품 및 이벤트 안내, 이벤트 경품/사은품 제공, 할인행사, 고객 맞춤 마케팅/판촉 등 관련 이메일 및 SMS 등 발송
	5. 철회안내
	- 수신동의 이후에라도 언제든지 동의를 철회할 수 있으며, 수신을 동의하지 않아도 회사가 제공하는 기본적인 서비스를 이용하실 수 있습니다. 다만 수신 거부할 경우 신규 서비스나 상품 관련 소식 등의 마케팅 정보를 제공받지 못할 수 있습니다.
	6. 수신동의 변경 및 보유기간
	- 보유 기간 : 마케팅 정보 수신 동의로부터 2년, 기간 초과 시 동의 절차 재진행 (미동의 시, 즉시 파기)   
	SPORTERS 정보수정 페이지에서 개별서비스의 마케팅 수신동의를 변경(동의/철회)할 수 있으며, 동의일로부터 회원 탈퇴 혹은 마케팅 수신 동의 해제 시까지 광고성 정보 전달을 위하여 보유ㆍ이용 됩니다.  
							</textarea>
					</div>

				</div>				

				<div style="height: 10px; border-top: 1px dotted #c8c8ff;"></div>

				<div style="text-align: right;display: flex; justify-content: space-between;">
					<input class="btn purple" type="button" value="가입취소" onclick="location.href='/'">
					<button class="btn purple">가입하기</button>
				</div>
			</form>		
		</div>
	</section><!-- 기본틀 2 -->
</section><!-- 기본틀 1 -->

</body>
</html>