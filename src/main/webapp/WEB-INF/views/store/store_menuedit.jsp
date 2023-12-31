<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<link rel="stylesheet" type="text/css" href="../../css/store/store.css">
<link rel="stylesheet" type="text/css" href="../../css/store/store_menuedit.css">
<body>
<div class="main-container">
    <div class="tabmenu out-tabmenu">

        <ul>
            <%--대표메뉴 버튼--%>
            <li id="tab1" class="btnCon">
                <input type="radio" checked name="tabmenu" id="tabmenu1">
                <label for="tabmenu1">대표 메뉴</label>
                <div class="tabCon">
                    <%--메뉴1--%>
                    <div class="menu">
                        <div class="menu-content">
                            <h2>칼국수</h2>
                            <h6 class="menu-description">인공 조미료를 쓰지 않고 순수 천연재료로 만들어 시원한 바다맛을 느낄 수 있는 착한 생 칼국수 대표 메뉴</h6>
                            <h5>3,800원</h5>
                        </div>
                        <div class="menu-image">
                            <img src="../../img/store/kal.jpg" alt="메뉴이미지">
                        </div>
                    </div>
                    <%--메뉴2--%>
                    <div class="menu">
                        <div class="menu-content">
                            <h2>칼국수</h2>
                            <h6 class="menu-description">인공 조미료를 쓰지 않고 순수 천연재료로 만들어 시원한 바다맛을 느낄 수 있는 착한 생 칼국수 대표 메뉴</h6>
                            <h5>3,800원</h5>
                        </div>
                        <div class="menu-image">
                            <img src="../../img/store/kal.jpg" alt="메뉴이미지">
                        </div>
                    </div>
                </div>
            </li>

            <%--여름메뉴 버튼--%>
            <li id="tab2" class="btnCon">
                <input type="radio" name="tabmenu" id="tabmenu2">
                <label for="tabmenu2">여름 메뉴</label>
                <div class="tabCon">
                    <%--메뉴1--%>
                    <div class="menu">
                        <div class="menu-content">
                            <h2>${ menu.menu_name }</h2>
                            <h6 class="menu-description">${ menu.menu_info }</h6>
                            <h5>${ menu.menu_price }</h5>
                        </div>
                        <div class="menu-image">
                            <img src="../../img/store/cold.jpg" alt="메뉴이미지">
                        </div>
                    </div>
                </div>
            </li>
            <li id="tab3" class="btnCon">
                <input type="radio" name="tabmenu" id="tabmenu3">
                <label for="tabmenu3">식사용</label>
                <div class="tabCon">
                    내용 적기
                </div>
            </li>
            <li id="tab4" class="btnCon">
                <input type="radio" name="tabmenu" id="tabmenu4">
                <label for="tabmenu4">사이드</label>
                <div class="tabCon"></div>
            </li>
            <li id="tab5" class="btnCon">
                <input type="radio" name="tabmenu" id="tabmenu5">
                <label for="tabmenu5">음료</label>
                <div class="tabCon"></div>
            </li>
        </ul>
    </div>
</div>
</body>
<script>
    const menuDescription = document.querySelector('.menu-description');
    const textLength = menuDescription.innerText.length;
    if (textLength > 22) {
        menuDescription.classList.add('multiline');
    }

    if (window.location.hash === '#seller_itemRegist') {
        alert('[[${message}]]'); // message 변수는 컨트롤러에서 전달한 Flash Attribute
    }
</script>
</html>
