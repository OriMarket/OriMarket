<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Page Title</title>
    <link rel="stylesheet" type="text/css" href="../../css/store/storenotice.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
        <div class="storecare">
            <div class="storecare_title">
                <h3>가게 관리</h3>
            </div>

            <div class="line"></div>

            <div class="storecare_logo">
                <h3>로고</h3>
                <input type="file" accept="image/*" id="logo-upload" onchange="previewLogo(event)"/>
                <div id="logo-preview"></div>
            </div>

            <div class="line"></div>

            <form action="/storenotice1" method="post">
                <input type="hidden" name="businessUser" placeholder="가게 이름">
                <div class="storecare_name">
                    <h3>가게 이름</h3>
                    <input type="text" id="store-name-input" name="buStoreName" placeholder="가게 이름">
                    <h6>※변경이 필요한 경우 고객센터로 문의해주세요.</h6>
                </div>

                <div class="line"></div>

                <div class="storecare_storenumber">
                    <h3>가게 번호</h3>
                    <input type="text" id="store-number-input" name="buStorePhone" placeholder="가게 번호"/>
                </div>

                <div class="line"></div>

                <div class="storecare_category">
                    <h3>가게 카테고리</h3>
                    <input type="text" id="store-category-input" name="buStoreCategory" placeholder="가게 카테고리"/>
                </div>

                <div class="line"></div>

                <div class="storecare_location">
                    <h3>가게 위치 등록</h3>
                    <input type="text" id="store-location-input" name="buStoreAddress" placeholder="가게를 위치를 지정해주세요.">
                    <input type="text" name="buStoreAddressDetail" placeholder="상세위치를 적어주세요.">
                </div>
                <!-- 수정 버튼으로 변경 -->
                <div class="line"></div>
                <button type="submit">입력</button>
            </form>
        </div>
    </div>


    <div class="storecare_container">
        <div class="storecare">
            <h3>공지 사항</h3>
            <div class="line"></div>
            <h4>사장님 공지사항</h4>
            <div class="board">
                <div class="content">
                    <input type="file" accept="image/*" id="image-upload" onchange="previewImage(event)"/>
                    <div id="image-preview"></div>
                    <textarea placeholder="게시글 내용"></textarea>
                </div>
                <div class="buttons">
                    <button onclick="uploadPost()">업로드</button>
                </div>
            </div>
        </div>
    </div>

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


        function showInputData() {
            var logoUpload = document.getElementById("logo-upload");
            var storeNameInput = document.getElementById("store-name-input");
            var storeNumberInput = document.getElementById("store-number-input");
            var storeCategoryInput = document.getElementById("store-category-input");
            var storeLocationInput = document.getElementById("store-location-input");

            var logoPreview = document.getElementById("logo-preview");
            var storeName = storeNameInput.value;
            var storeNumber = storeNumberInput.value;
            var storeCategory = storeCategoryInput.value;
            var storeLocation = storeLocationInput.value;

            // 첨부한 로고 이미지만 표시하고, 텍스트 박스는 보이지 않게 함
            logoUpload.style.display = "none";
            storeNameInput.style.display = "none";
            storeNumberInput.style.display = "none";
            storeCategoryInput.style.display = "none";
            storeLocationInput.style.display = "none";

            logoPreview.style.display = "block";
            logoPreview.style.marginBottom = "10px";

            // 입력한 데이터만 표시
            logoPreview.innerText = ""; // 기존에 보여주던 로고 이미지 삭제
            if (logoPreview.firstChild) {
                logoPreview.removeChild(logoPreview.firstChild);
            }

            if (logoUpload.files.length > 0) {
                var img = document.createElement("img");
                img.src = URL.createObjectURL(logoUpload.files[0]);
                img.style.maxWidth = "100%";
                img.style.height = "auto";
                logoPreview.appendChild(img);
            }

            // 텍스트 박스의 값을 표시하기 위해 새로운 엘리먼트를 생성하여 추가
            var storeNameText = document.createElement("h4");
            storeNameText.innerText = storeName;
            storeNameInput.parentNode.appendChild(storeNameText);

            var storeNumberText = document.createElement("h4");
            storeNumberText.innerText = storeNumber;
            storeNumberInput.parentNode.appendChild(storeNumberText);

            var storeCategoryText = document.createElement("h4");
            storeCategoryText.innerText = storeCategory;
            storeCategoryInput.parentNode.appendChild(storeCategoryText);

            var storeLocationText = document.createElement("h4");
            storeLocationText.innerText = storeLocation;
            storeLocationInput.parentNode.appendChild(storeLocationText);

            // 텍스트 박스는 삭제
            storeNameInput.parentNode.removeChild(storeNameInput);
            storeNumberInput.parentNode.removeChild(storeNumberInput);
            storeCategoryInput.parentNode.removeChild(storeCategoryInput);
            storeLocationInput.parentNode.removeChild(storeLocationInput);

            // 수정 버튼으로 변경
            var editButton = document.querySelector(".storecare button");
            editButton.innerText = "수정";
        }


    </script>


    <div class="storecare_container">
        <div class="storecare">
            <h3>리뷰 관리</h3>


        </div>
    </div>


    <div class="storecare_container">
        <div class="storecare">
            <h3>메뉴 관리</h3>


        </div>
    </div>


    <div class="storecare_container">
        <div class="storecare">
            <h3>주문 내역</h3>


        </div>
    </div>


    <div class="storecare_container">
        <div class="storecare">
            <h3>쿠폰 관리</h3>


        </div>
    </div>


    <div class="storecare_container">
        <div class="storecare">
            <h3>정산 내역</h3>


        </div>
    </div>


    <div class="storecare_container">
        <div class="storecare">
            <h3>오리시장 공지사항</h3>


        </div>
    </div>


    <div class="storecare_container">
        <div class="storecare">
            <h3>공지 사항</h3>


        </div>
    </div>


    <div class="storecare_container">
        <div class="storecare">
            <h3>공지 사항</h3>


        </div>
    </div>


</div>

</body>
</html>

