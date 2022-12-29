<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="layout/header.jsp">
	<jsp:param value="Spoters홈페이지" name="title" />
</jsp:include>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/sniper.css">
<style>

	.team_area{
		width:100%;
		/*
		height:400px;
		*/
		overflow: hidden;
		margin-bottom: 50px;
	}
	
	.team_area .swiper{
		width:100%;
		
	}
	.team_area .swiper-slide{
		background-size: cover;
		background-position: top;
		background-repeat: no-repeat;
	}
	.team_area img{
		width:100%; 
		opacity: 0;
	}

	.local_board_image_Area{
		width:100%;
		display: flex;
		justify-content: space-between;	
		
		margin-bottom: 70px;
		
	}
	
	
	
	
	.local_board_image_Area li{
	background-size: cover;
    width: 30%;
    height: 300px;
    background-position: top;
		
	
	}
	.local_board_image_Area li img{
	width:100%;
	}
	
	#preview{
		position: absolute;
		z-index: 10;
		
	}

    
</style>

<script>

$(function(){
         
        var xOffset = 10;
        var yOffset = 10;
		var yyOffset = -10;


        $(document).on("mouseover",".thumbnail",function(e){ //마우스 오버시
			
			$("body").append("<p id='preview'><img src='"+ $(this).attr("src") +"' width='500px' /></p>"); //보여줄 이미지를 선언						 
			$("#preview").css("top",(e.pageY - xOffset) + "px").css("left",(e.pageX - yOffset) + "px").fadeIn("fast"); //미리보기 화면 설정 셋팅
		});
		
		$(document).on("mousemove",".thumbnail",function(e){ //마우스 이동시
			$("#preview").css("top",(e.pageY - xOffset) + "px").css("left",(e.pageX + yOffset) + "px");
		});
		
		$(document).on("mouseout",".thumbnail",function(){ //마우스 아웃시
			$("#preview").remove();
		});
         
    });
</script>
<body>




<jsp:include page="layout/right_side.jsp">
	<jsp:param value="right_side" name="right_side" />
</jsp:include>




<section class="wrap"><!-- 기본틀 1 -->
	<section class="content_leyout_section"><!-- 기본틀 2 -->
	
		<div> <!-- 여기부터 각자 내용 넣기 시작 -->
			
			<h1 style="height:50px;line-height:40px;margin-bottom: 20px;"><span class="spinner-double-section-out"></span><a href="/chat/chatList">채팅하러가기</a></h1>
			
			
			
			<ul class="local_board_image_Area">
				<c:forEach items="${selectindexThumbNail}"  var="gallery" varStatus="vs">
					<!-- 	
					<li>
						${beginNo - vs.index}	
					</li>	
					 -->			
					<li style="background-image: url(/load/image/${gallery.localImagess.filesystem})" >
						<a id="moveDetail" href="/local/increase/hit?localBoardNo=${gallery.localBoardNo}">
						${gallery.title}
						<br>						
							<img  style="width:100%;height:100%;" src="/load/image/${gallery.localImagess.filesystem}"  class="thumbnail">								
						</a>	
					</li>								
				</c:forEach>		
			</ul>
			
			
			
			
			
		<!-- 메인 슬라이드 시작 -->
		<div class="team_area">    
	    <div class="swiper mySwiper">
	      <div class="swiper-wrapper">
	      <!--  -->
	        <div class="swiper-slide" style="background-image: url('https://cdn.barnimages.com/wp-content/uploads/2022/01/20210118-barnimages-4-740x490.jpg');">      
	         	<p><img src="https://cdn.barnimages.com/wp-content/uploads/2021/01/20210104-barnimages-4-740x493.jpg"> </p>	         	      
	        </div>
	        <div class="swiper-slide" style="background-image: url('https://cdn.barnimages.com/wp-content/uploads/2018/04/2017-03-27-roman-drits-barnimages-015-740x493.jpg');"> 
	                <p><img src="https://cdn.barnimages.com/wp-content/uploads/2018/04/2017-03-27-roman-drits-barnimages-015-740x493.jpg"></p>
	        </div>
	        <div class="swiper-slide" style="background-image: url('https://media.istockphoto.com/id/1162195279/photo/fit-happy-poeple-playing-tennis-together-sport-concept.jpg?b=1&s=170667a&w=0&k=20&c=gy8zXit5OesRkF5FW7I7WEK0aKT8XmmVYoXVv2EzgJs=');"> 
	           <p><img src="https://media.istockphoto.com/id/1162195279/photo/fit-happy-poeple-playing-tennis-together-sport-concept.jpg?b=1&s=170667a&w=0&k=20&c=gy8zXit5OesRkF5FW7I7WEK0aKT8XmmVYoXVv2EzgJs="></p>
	        </div>
	        <div class="swiper-slide" style="background-image: url('https://media.istockphoto.com/id/514260952/photo/climbing.jpg?b=1&s=170667a&w=0&k=20&c=VeHeBniExMc8azxV7XghGx7hQMjVUCLo5aLw3kYGkG0=');"> 
	              <p><img src="https://media.istockphoto.com/id/514260952/photo/climbing.jpg?b=1&s=170667a&w=0&k=20&c=VeHeBniExMc8azxV7XghGx7hQMjVUCLo5aLw3kYGkG0="></p>
	        </div>	      
	      </div>
	      <div class="swiper-pagination"></div>   
	    </div>    
		
		</div>
			
			
			
			
			
			
			
			
		</div><!-- 여기부터 각자 내용 넣기 끝 -->
		
	</section><!-- 기본틀 2 -->
	
</section><!-- 기본틀 1 -->


<script type="text/javascript">


var swiper = new Swiper(".mySwiper", {
	loop:true,
  spaceBetween: 30,
  effect: "fade",
  autoplay: {
      delay: 1500,
      disableOnInteraction: false,
    },
  navigation: {
    nextEl: ".swiper-button-next",
    prevEl: ".swiper-button-prev",
  },
  pagination: {
    el: ".swiper-pagination",
    clickable: true,
  },
});


</script>






<!-- 

<script type="text/javascript">

$(function(){
	 var right_side =  $('.content_leyout_section').offset().top;
	var my_right_side = $('.right_side_menu_area').width();
	var right_side_marginLeft = $('.content_leyout_section').width() + my_right_side*2 ;


	 $('.right_side_menu_area').offset({top:right_side});
	 $('.right_side_menu_area').css({marginLeft:right_side_marginLeft  });
	 
	 // content_leyout 현재 높이값을 구함. 
	 var left_side_top =  $('.content_leyout_section').offset().top;
	 var right_side_marginLeft = $('.content_leyout_section').offset().left;

	// 왼쪽 사이드 메뉴의 넓이값을 구함
	var my_left_side =right_side_marginLeft -  $('.left_side_gnd_area').width() - my_right_side;
	var left_side_marginLeft = $('.content_leyout_section').width();


	 $('.left_side_gnd_area').offset({top:left_side_top});	 
	 
	
}); 
</script>

 -->

</body>
</html>