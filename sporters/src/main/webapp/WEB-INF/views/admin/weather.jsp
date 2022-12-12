<%@page import="java.util.Optional"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	Optional<String> opt = Optional.ofNullable(request.getParameter("title"));
	String title = opt.orElse("Welcome To Admin!");
	pageContext.setAttribute("title", title);
	pageContext.setAttribute("contextPath", request.getContextPath());
%>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBAzIjreZTY1GgBIpml2xoPnEvFzVNe-ws"></script>


<script>

	var geocoder = new google.maps.Geocoder; 
	var latlng = {lat: parseFloat(position.coords.latitude), lng: parseFloat(position.coords.longitude)}; 
	
	alert(latlng);
	
    $(function() {        
        // Geolocation API에 액세스할 수 있는지를 확인
        if (navigator.geolocation) {
            //위치 정보를 얻기
            navigator.geolocation.getCurrentPosition (function(pos) {
                $('#latitude').html(pos.coords.latitude);     // 위도
                $('#longitude').html(pos.coords.longitude); // 경도
            });
        } else {
            alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
        }
    });
</script>
<title>Insert title here</title>
</head>
<body>
    <ul>
        <li>위도:<span id="latitude"></span></li>
        <li>경도:<span id="longitude"></span></li>
    </ul>
</body>
</html>