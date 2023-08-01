<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Page Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <style>

        @font-face {
            font-family: 'LINESeedKR-Bd', sans-serif;
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
            font-weight: 700;
            font-style: normal;
        }

        *{
            margin: 0;
            padding: 0;
        }

        body {
            margin: 0 auto;
        }

        .line {
            border-top: 1px solid #c4c4c4;
            width: 330px;
            margin: 30px auto;
            position: relative;
            right: 8px;
        }

        .line:first-child{
            margin-top: 100px;
        }

        /* 메인 컨테이너 스타일 */

        .main-container {
            width: 375px;
            height: 812px;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background-color: #eee;
            overflow: auto; /* 스크롤 가능하도록 수정 */
            overflow-x: hidden; /* 가로 스크롤 금지 */
            font-family: 'LINESeedKR-Bd', sans-serif; /* 따옴표 추가 */
        }

        .main-container::-webkit-scrollbar {
            display: none;
        }

        .store_time_container {
            background-color: white;
            border-radius: 25px;
            margin: 10px;
            width: 355px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.5);
        }

        .store_time {
            margin: 20px;
        }

        .store_time h6 {
            margin-top: -5px;
            color: gray;
        }

        /*버튼*/
        .wrapper {
            width: 50px;
            height: 50px;
            text-align: center;
            position: relative;
            bottom: 45px;
            left: 265px;
        }

        #switch {
            position: absolute;
            /* hidden */
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
        }

        .switch_label {
            position: relative;
            cursor: pointer;
            display: inline-block;
            width: 48px;
            height: 18px;
            background: #fff;
            border: 2px solid #daa;
            border-radius: 20px;
            transition: 0.2s;
        }

        .switch_label:hover {
            background: #efefef;
        }

        .onf_btn {
            position: absolute;
            top: 4px;
            left: 3px;
            display: inline-block;
            width: 10px;
            height: 10px;
            border-radius: 20px;
            background: #daa;
            transition: 0.2s;
        }

        /* checking style */
        #switch:checked + .switch_label {
            background: #c44;
            border: 2px solid #c44;
        }

        #switch:checked + .switch_label:hover {
            background: #e55;
        }

        /* move */
        #switch:checked + .switch_label .onf_btn {
            left: 34px;
            background: #fff;
            box-shadow: 1px 2px 3px #00000020;
        }

        .total_menu_container {
            background-color: white;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.5);
            border-radius: 25px;
            margin: 10px;
            width: 355px;
        }

        .total_menu {
            margin: 20px;
        }

        .first_menu {
            margin-left: 10px;
            flex: 1;
            display: block;
            clear: both;
            flex-basis: calc(25% - 10px);
        }

        .first_menu img {
            width: 50px;
        }

        .first_menu h5 {
            margin-top: -2px;
        }

        .detail_total_menu {
            display: flex;
            flex-wrap: wrap;
            margin-left: 5px;
        }

        .storecare_container {
            background:transparent;
            border-radius: 25px;
            margin: 10px;
            width: 355px;
            position: relative; /* main-container 내에 위치하도록 설정 */
        }

        .storecare {
            margin: 20px;
        }

        .board {
            width: 270px;
            background-color: #f0f8ff;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-top: 5px;
        }




        .board .content {
            margin-top: 20px;
            background-color: #fff;
            padding: 10px;
        }

        .board .content img {
            max-width: 100%;
            height: auto;
            margin-bottom: 10px;
        }

        .board .content textarea {
            width: 100%;
            height: 100px;
            margin-bottom: 10px;
            resize: vertical;
        }

        .board .buttons {
            display: flex;
            justify-content: space-between;
        }

        .board .buttons button {
            padding: 10px 20px;
            background-color: #333;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .storecare_logo img{
            width: 80px;
        }

        /*탭메뉴관련*/

        .tabs {
            display: flex;
            flex-direction: column;
        }

        .input {
            display: none;
            position: absolute;
            opacity: 0;
            border-radius: 25px;
            margin-bottom: 50px;
        }

        .label {
            border-radius: 25px;
            width: 295px;
            padding: 20px 30px;
            background: white;
            cursor: pointer;
            font-weight: bold;
            font-size: 18px;
            color: #000000;
            transition: background 0.1s, color 0.1s;
            margin-bottom: 1px;

        }

        .label:active {

            box-shadow: inset -.3rem -.1rem 1.4rem  #FBFBFB, inset .3rem .4rem .8rem #BEC5D0;
            cursor: pointer;

        }


        .input:focus + .label {
            z-index: 1;
        }


        /*탭안에 내용들*/
        .panel {
            border-radius: 0 0 15px 15px;
            display: none;
            padding: 20px 30px 30px;
            background: #fff;
            width: 295px;
            margin-top: -22px;
        }


        .input:checked + .label + .panel {
            display: block;
        }

        .first_menu:hover {opacity: 0.7;}


        /*        .my_review_list{
                    margin-top: 10px;
                    margin: 20px;
                }*/



        /* 주소검색 css */
        .btn_container {
            display: flex;
            justify-content: center;
            margin-top: 10px;
        }

        .btn_round {
            border-radius: 20px;
            padding: 5px 10px;
            background-color: #ffbf41;
            color: white;
            border: none;
            font-size: 14px;
            cursor: pointer;
            font-family: 'omyu pretty', Arial, sans-serif;
        }
        button.backbtn {
            display: flex;
            align-items: center;
            font-size: 20px;
            color: #999;
            margin: 0 0 0 10px; width: 30px; height: 30px; background-color: #fff; border-radius: 50%; border: 1px solid #999; cursor: pointer; justify-content: center;}
        button.backbtn:hover {background-color:#333; color:#fff;}

    </style>

</head>
<body>

<div class="main-container">

    <div class="storecare_container">
        <div class="tabs">
            <input class="input" name="tabs-1" type="radio" id="tab-1"checked="checked" />
            <label class="label" for="tab-1">가게 관리</label>
            <div class="panel" >
                <div class="line"></div>
                <form action="/storeInfoDelete?buUserNumber=${storeInfo.businessUser.buUserNumber}" method="post" enctype="multipart/form-data">
                    <c:if test="${!empty storeInfo}">
                        <button class="backbtn" onclick="window.location.replace('a_buser')">&lt;</button>
                        <div class="line"></div>
                        <div class="storecare_logo">
                            <h3>로고</h3>
                            <div 0id="logo-preview">
                                <img src="../../img/store/${storeInfo.buStoreImageUrl}" style="max-width: 100%; height: auto;">
                            </div>
                            <div>
                                소속 시장 : ${storeInfo.market.marketName}
                            </div>
                            <div>
                                사업자번호 : ${storeInfo.businessUser.buUserNumber}
                            </div>
                            <div>
                                가게 이름 : ${storeInfo.buStoreName}
                            </div>
                            <div>
                                가게 번호 : ${storeInfo.buStorePhone}
                            </div>
                            <div>
                                가게 카테고리 : ${storeInfo.buStoreCategory}
                            </div>
                            <div>
                                가게 주소 : ${storeInfo.buStoreAddress} ${storeInfo.buStoreAddressDetail}
                            </div>
                            <div>
                                가게 오픈여부 : ${storeInfo.status}
                            </div>
                            <div>
                                가게 판매 리스트
                                <table>
                                    <c:forEach items="${storeInfo.items}" var="item">
                                        <tr><th>물건 이름</th><td>${item.itemName}</td></tr>
                                        <tr><th>물건 원가</th><td>${item.itemCost}</td></tr>
                                        <tr><th>물건 판매가격</th><td>${item.itemPrice}</td></tr>
                                        <tr><th>원산지</th><td>${item.itemFrom}</td></tr>
                                        <tr><th>물건 등록일</th><td>${item.itemRegDate}</td></tr>
                                        <tr><th>물건 카테고리</th><td>${item.itemCategory}</td></tr>
                                        <tr>
                                            <th>물건 이미지</th>
                                            <td> <img src="../../img/store/${item.itemImageUrl}" style="max-width: 100%; height: auto;"></td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
                        </div>
                    </c:if>
                    <div><input type="submit" value="삭제"></div>
                </form>
            </div>



        </div>

    </div>
</div>


<%--<script>--%>

<%--    //주소API--%>
<%--    function searchAddress() {--%>
<%--        new daum.Postcode({--%>
<%--            oncomplete: function (data) {--%>
<%--                document.getElementById("store-location-input").value = data.address;--%>

<%--                //주소 검색 후 선택하면 창이 닫히고 상세주소칸으로 포인트가 이동--%>
<%--                document.getElementById("buStoreAddressDetail").focus();--%>
<%--            }--%>
<%--        }).open();--%>
<%--    }--%>


<%--    function previewPicture(event) {--%>
<%--        const pictureInput = event.target;--%>
<%--        const picturePreview = document.getElementById('logo-preview');--%>

<%--        if (pictureInput.files && pictureInput.files[0]) {--%>
<%--            const reader = new FileReader();--%>

<%--            reader.onload = function (e) {--%>
<%--                const imgElement = document.createElement('img');--%>
<%--                imgElement.src = e.target.result;--%>
<%--                imgElement.style.maxWidth = '100%'; // 이미지 크기 조절 (선택사항)--%>
<%--                imgElement.style.height = "auto";--%>
<%--                picturePreview.innerHTML = ''; // 이미지 미리보기 업데이트--%>
<%--                picturePreview.appendChild(imgElement);--%>
<%--            };--%>

<%--            reader.readAsDataURL(pictureInput.files[0]);--%>
<%--        }--%>
<%--    }--%>



<%--    // 컨트롤러로 요청을 보내고 처리하는 함수--%>
<%--    function uploadPost() {--%>
<%--        // 입력된 데이터 가져오기--%>
<%--        var messageTitle = document.querySelector('input[name="messageTitle"]').value;--%>
<%--        var totalMessage = document.querySelector('textarea[name="totalMessage"]').value;--%>

<%--        // 요청 데이터 생성--%>
<%--        var requestData = {--%>
<%--            messageTitle: messageTitle,--%>
<%--            totalMessage: totalMessage--%>
<%--        };--%>

<%--        // AJAX 요청 생성--%>
<%--        var xhr = new XMLHttpRequest();--%>
<%--        xhr.open("POST", "/messageInsertMain", true);--%>
<%--        xhr.setRequestHeader("Content-Type", "application/json");--%>

<%--        // 요청 완료 처리--%>
<%--        xhr.onload = function() {--%>
<%--            if (xhr.status === 200) {--%>

<%--                console.log("요청이 성공적으로 처리되었습니다.");--%>
<%--                // 돌아온 응답을 처리하는 코드를 작성하세요.--%>

<%--            } else {--%>
<%--                // 요청이 실패했을 때의 동작을 여기에 작성하세요.--%>
<%--                console.error("요청 처리 중 오류가 발생했습니다.");--%>
<%--            }--%>
<%--        };--%>
<%--        // 요청 전송--%>

<%--        xhr.send(JSON.stringify(requestData));--%>
<%--        document.querySelector(".board .content textarea").value = "";--%>
<%--        document.querySelector(".board .content input").value = "";--%>
<%--    }--%>



<%--</script>--%>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>

</html>
