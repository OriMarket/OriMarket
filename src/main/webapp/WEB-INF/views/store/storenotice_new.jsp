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

        /* 메인 컨테이너 스타일 */

        .main-container {
            width: 375px;
            height: 812px;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            align-items: flex-start;
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
            flex-wrap: wrap;
            max-width: 700px;
            /* box-shadow: 0 48px 80px -32px rgba(0,0,0,0.3);*/
        }
        .input {
            position: absolute;
            opacity: 0;
            border-radius: 25px;
        }
        .label {
            border-radius: 25px;
            width: 100%;
            padding: 20px 30px;
            background: white;
            cursor: pointer;
            font-weight: bold;
            font-size: 18px;
            color: #000000;
            transition: background 0.1s, color 0.1s;
        }
        .label:hover {
            background: #d8d8d8;
        }
        .label:active {
            background: #ccc;
        }
        .input:focus + .label {
            z-index: 1;
        }

        @media (max-width: 755px), (min-width: 755px) {
            .label {
                width: 755px;
            }
        }
        .panel {
            border-radius: 15px;
            display: none;
            padding: 20px 30px 30px;
            background: #fff;
            width: 295px;
        }

        }
        .input:checked + .label + .panel {
            display: block;
        }




    </style>

</head>
<body>

<div class="main-container">

    <div class="store_time_container">
        <div class="store_time">
            <h3>영업 임시중지</h3>
            <h6>보유하신 가게에 적용됩니다.</h6>
            <div class="wrapper">
                <input type="checkbox" id="switch">
                <label for="switch" class="switch_label">
                    <span class="onf_btn"></span>
                </label>
            </div>
        </div>
    </div>

    <div class="total_menu_container">
        <div class="total_menu">
            <h3>전체 메뉴</h3>
            <div class="detail_total_menu">
                <div class="first_menu">
                    <img src="../../img/store/가게관리.png" alt="가게 관리"> <!-- alt 속성 추가 -->
                    <h5>가게 관리</h5>
                </div>

                <div class="first_menu">
                    <img src="../../img/store/게시판.png" alt="공지사항"> <!-- alt 속성 추가 -->
                    <h5>공지사항</h5>
                </div>

                <div class="first_menu">
                    <img src="../../img/store/리뷰.png" alt="리뷰 관리"> <!-- alt 속성 추가 -->
                    <h5>리뷰 관리</h5>
                </div>

                <div class="first_menu">
                    <img src="../../img/store/메뉴관리.png" alt="메뉴 관리"> <!-- alt 속성 추가 -->
                    <h5>메뉴 관리</h5>
                </div>

                <div class="first_menu">
                    <img src="../../img/store/주문내역.png" alt="주문 내역"> <!-- alt 속성 추가 -->
                    <h5>주문 내역</h5>
                </div>

                <div class="first_menu">
                    <img src="../../img/store/쿠폰.png" alt="쿠폰 관리"> <!-- alt 속성 추가 -->
                    <h5>쿠폰 관리</h5>
                </div>

                <div class="first_menu">
                    <img src="../../img/store/정산내역.png" alt="정산 내역"> <!-- alt 속성 추가 -->
                    <h5>정산 내역</h5>
                </div>

                <div class="first_menu">
                    <img src="../../img/store/확성기.png" alt="오리시장 공지사항"> <!-- alt 속성 추가 -->
                    <h5>오리시장<br>공지사항</h5>
                </div>
            </div>
        </div>
    </div>



    <div class="storecare_container">

        <div class="tabs">
            <input class="input" name="tabs-1" type="radio" id="tab-1" />
            <label class="label" for="tab-1">가게 관리</label>
            <div class="panel">
                <div class="line"></div>

                <div class="storecare_logo">
                    <h3>로고</h3>
                    <input type="file" accept="image/*" id="logo-upload" onchange="previewLogo(event)" />
                    <div id="logo-preview"></div>
                </div>

                <div class="line"></div>

                <form action="/storenotice1" method="post">
                    <div class="storecare_name">
                        <h3>가게 이름</h3>
                        <input type="hidden" name="buStoreNumber" value="${save.buStoreNumber}">
                        <c:if test="${empty save.buStoreName}">
                            <input type="text" id="store-name-input" name="buStoreName" placeholder="가게 이름">
                        </c:if>
                        <c:if test="${!empty save.buStoreName}">
                            <input type="text" id="store-name-input" name="buStoreName" value="${save.buStoreName}">
                        </c:if>

                        <h6>※변경이 필요한 경우 고객센터로 문의해주세요.</h6>
                    </div>

                    <div class="line"></div>

                    <div class="storecare_storenumber">
                        <h3>가게 번호</h3>
                        <c:if test="${empty save.buStorePhone}">
                        <input type="text" id="store-number-input" name="buStorePhone" placeholder="가게 번호"/>
                        </c:if>
                        <c:if test="${!empty save.buStorePhone}">
                            <input type="text" id="store-number-input" name="buStorePhone" value="${save.buStorePhone}"/>
                        </c:if>
                    </div>

                    <div class="line"></div>

                    <div class="storecare_category">
                        <h3>가게 카테고리</h3>
                        <c:if test="${empty save.buStoreCategory}">
                        <input type="text" id="store-category-input" name="buStoreCategory" placeholder="가게 카테고리"/>
                        </c:if>
                        <c:if test="${!empty save.buStoreCategory}">
                            <input type="text" id="store-category-input" name="buStoreCategory" value="${save.buStoreCategory}"/>
                        </c:if>
                    </div>

                    <div class="line"></div>

                    <div class="storecare_location">
                        <h3>가게 위치 등록</h3>
                        <c:if test="${empty save.buStoreAddress}">
                        <input type="text" id="store-location-input" name="buStoreAddress" placeholder="가게를 위치를 지정해주세요.">
                        </c:if>
                        <c:if test="${!empty save.buStoreAddress}">
                            <input type="text" id="store-location-input" name="buStoreAddress" value="${save.buStoreAddress}">
                        </c:if>
                        <c:if test="${empty save.buStoreAddressDetail}">
                        <input type="text" name="buStoreAddressDetail" placeholder="상세위치를 적어주세요.">
                        </c:if>
                        <c:if test="${!empty save.buStoreAddressDetail}">
                            <input type="text" name="buStoreAddressDetail" value="${save.buStoreAddressDetail}">
                        </c:if>
                    </div>
                    <!-- 수정 버튼으로 변경 -->
                    <div class="line"></div>
                    <button type="submit">입력</button>
                </form>
            </div>

            <br>

            <input class="input" name="tabs-2" type="radio" id="tab-2"/>
            <label class="label" for="tab-2">공지사항</label>
            <div class="panel">
                <div class="line"></div>
                <h4>사장님 공지사항</h4>
                <div class="board">
                    <div class="content">
                        <input type="file" accept="image/*" id="image-upload" onchange="previewImage(event)" />
                        <div id="image-preview"></div>
                        <textarea placeholder="게시글 내용"></textarea>
                    </div>
                    <div class="buttons">
                        <button onclick="uploadPost()">업로드</button>
                    </div>
                </div>
            </div>

            <br>


            <input class="input" name="tabs-3" type="radio" id="tab-3"/>
            <label class="label" for="tab-3">리뷰 관리</label>
            <div class="panel">
                ???
            </div>

            <br>


            <input class="input" name="tabs-4" type="radio" id="tab-4"/>
            <label class="label" for="tab-4">메뉴 관리</label>
            <div class="panel">
                <jsp:include page="seller_manageMenu.jsp" />
            </div>

            <br>


            <input class="input" name="tabs-5" type="radio" id="tab-5"/>
            <label class="label" for="tab-5">주문 내역</label>
            <div class="panel">
                ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ
            </div>

            <br>

            <input class="input" name="tabs-6" type="radio" id="tab-6"/>
            <label class="label" for="tab-6">쿠폰 관리</label>
            <div class="panel">
                ㄹㄹㅀㅀㅀㄹ
            </div>

            <br>

            <input class="input" name="tabs-7" type="radio" id="tab-7"/>
            <label class="label" for="tab-7">T정산 내역</label>
            <div class="panel">
                ㅇㅇㄹㅇㄹㅇㄹㅇㄹㅇㄹㅇ
            </div>

            <br>

            <input class="input" name="tabs-8" type="radio" id="tab-8"/>
            <label class="label" for="tab-8">고객센터</label>
            <div class="panel">


            </div>
        </div>



    </div>
</div>


</body>
<script>
    var posts = []; // 게시글 정보를 저장할 배열

    function previewImage(event) {
        var imageUpload = event.target;
        var imageFile = imageUpload.files[0];
        var imagePreview = document.getElementById("image-preview");

        var reader = new FileReader();
        reader.onload = function (e) {
            var img = document.createElement("img");
            img.src = e.target.result;
            img.style.maxWidth = "100%";
            img.style.height = "auto";
            imagePreview.innerHTML = "";
            imagePreview.appendChild(img);
        };

        reader.readAsDataURL(imageFile);
    }

    function uploadPost() {
        var imageUpload = document.getElementById("image-upload");
        var imageFile = imageUpload.files[0];
        var postContent = document.querySelector(".board .content textarea").value;

        var post = {
            content: postContent,
            image: imageFile,
            date: new Date(),
            isNotice: true, // 최신 게시글은 공지로 표시
        };

        posts.unshift(post); // 배열의 맨 앞에 게시글 정보 추가

        // 게시글을 생성하여 화면에 표시
        var boardDiv = document.querySelector(".storecare .board");
        var newPostDiv = document.createElement("div");
        newPostDiv.className = "post";

        var titleDiv = document.createElement("div");
        titleDiv.className = "title";

        if (post.isNotice) {
            var noticeDiv = document.createElement("div");
            noticeDiv.className = "notice";
            noticeDiv.innerText = "공지";
            titleDiv.appendChild(noticeDiv);
        }

        var dateDiv = document.createElement("div");
        dateDiv.className = "date";
        dateDiv.style.float = "right";
        dateDiv.innerText = post.date.toLocaleString();
        titleDiv.appendChild(dateDiv);

        newPostDiv.appendChild(titleDiv);

        var contentDiv = document.createElement("div");
        contentDiv.className = "content";

        if (imageFile) {
            var img = document.createElement("img");
            img.src = URL.createObjectURL(imageFile);
            img.style.maxWidth = "100%";
            img.style.height = "auto";
            contentDiv.appendChild(img);
        }


        contentDiv.innerHTML += postContent;
        newPostDiv.appendChild(contentDiv);
        boardDiv.prepend(newPostDiv);

        // 게시글 업로드 후 입력 내용 초기화
        imageUpload.value = "";
        document.querySelector(".board .content textarea").value = "";
        document.getElementById("image-preview").innerHTML = "";

        // 이전 게시글에서 공지 표시 제거
        for (var i = 1; i < posts.length; i++) {
            var otherPostElement = document.querySelectorAll(".storecare .board .post")[i];
            var otherNoticeDiv = otherPostElement.querySelector(".notice");
            if (otherNoticeDiv) {
                otherNoticeDiv.remove();
            }
        }
    }


    /*탭*/
    const labels = document.querySelectorAll('.label');
    labels.forEach((label) => {
        label.addEventListener('click', () => {
            const panel = label.nextElementSibling;
            const isOpen = panel.style.display === 'block';

            if (isOpen) {
                panel.style.display = 'none';
            } else {
                panel.style.display = 'block';
            }
        });
    });
</script>

</html>
