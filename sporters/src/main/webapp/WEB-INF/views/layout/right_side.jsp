

<style>

.right_side_menu_area{
		position: fixed;
		/*
		right:0px;
		top:164px;
		*/
		border:1px solid #000;
	
	}
	
	.right_side_menu_area .weather_area{
		width: 200px;
		height:200px;
		border:1px solid #000;
	}
	.right_side_menu_area .map_area{
		width: 200px;
		height:200px;
		border:1px solid #000;
		margin-top:20px;
	}
	
	.right_side_menu_area .right_side_board_list{
		width:200px;
		height: 800px;
		border:1px solid #000;
		margin-top:20px;
	}

#map{
	width:100%; height:100%;
}


</style>
<script>
       
    </script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3436810b3f87959018036d9419f8c1b1"></script>

<nav class="right_side_menu_area">
		<div class="weather_area">
			weather_area
			
		</div>
		
		<div class="map_area">
			<div id="map" ></div>
			<script type="text/javascript">
			 function success({ coords, timestamp }) {
		            const latitude = coords.latitude;   // 위도
		            const longitude = coords.longitude; // 경도
		            
		         //   alert(`위도: ${latitude}, 경도: ${longitude}, 위치 반환 시간: ${timestamp}`);
		           // alert(longitude);
		            
		            
		            
		            var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
					var options = { //지도를 생성할 때 필요한 기본 옵션
						center: new kakao.maps.LatLng(latitude, longitude), //지도의 중심좌표.
						level: 3 //지도의 레벨(확대, 축소 정도)
					};
					
					var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
					
					
		            
		            
		            
		            
		        }

		        function getUserLocation() {
		            if (!navigator.geolocation) {
		                throw "위치 정보가 지원되지 않습니다.";
		            }
		            navigator.geolocation.watchPosition(success);
		        }

		        getUserLocation();
			
			
			
			
			
				
				
				
				
				
			</script>
		</div>
		
		<div class="right_side_board_list">
			<ul>
				<li>right_side_board_list</li>
				<li>right_side_board_list</li>
				<li>right_side_board_list</li>
				<li>right_side_board_list</li>
			</ul>
		</div>
		
	</nav>