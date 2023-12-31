<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>주소로 장소 표시하기</title>
    <style>
        button.backbtn { display: flex; align-items: center; font-size: 26px; color: #fff; margin: 0 0 0 10px; width: 40px; height: 40px; background-color: #46A973; border-radius: 50%; border: 1px solid #eee; cursor: pointer; justify-content: center;}
        button.backbtn:hover {background-color:#333; color:#ffbf41;}
    </style>
</head>
<body>
<div id="map" style="width:375px; height:812px; margin: 0 auto;">
    <!-- 뒤로가기 -->
    <button class="backbtn" onclick="window.history.go(-1)" style="position:absolute; top:3%; left:3%; z-index:999;">&lt;</button>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=259217c849691d825026ea7a9f71af88&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    // 지도를 생성합니다
    var map = new kakao.maps.Map(mapContainer, mapOption);

    // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();

    // 주소로 좌표를 검색합니다
    geocoder.addressSearch('${userAddress1}}', function(result, status) {

        // 정상적으로 검색이 완료됐으면
        if (status === kakao.maps.services.Status.OK) {

            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

            // 결과값으로 받은 위치를 마커로 표시합니다
            var marker = new kakao.maps.Marker({
                map: map,
                position: coords
            });

            // 인포윈도우로 장소에 대한 설명을 표시합니다
            var infowindow = new kakao.maps.InfoWindow({
                content: '<div style="width:150px;text-align:center;padding:6px 0; border-radius: 10px">배달받을 위치</div>'
            });
            infowindow.open(map, marker);

            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            map.setCenter(coords);
        }
    });
</script>
</body>
</html>