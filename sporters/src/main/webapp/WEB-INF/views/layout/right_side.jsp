

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


</style>
<script>

function findLocation() {

    if (navigator.geolocation) { 

        navigator.geolocation.getCurrentPosition(showYourLocation); 

    } else { 

        loc.innerHTML = "이 문장은 사용자의 웹 브라우저가 Geolocation API를 지원하지 않을 때 나타납니다!"; 

    }

}
</script>


<nav class="right_side_menu_area">
		<div class="weather_area">
			weather_area
			
		</div>
		
		<div class="map_area">
			map_area
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