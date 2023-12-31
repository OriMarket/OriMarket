<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

    <link rel="stylesheet" href="../../css/footer/nav_footer.css">

    <script>
        function toggleImage(element) {
            var homeImage = document.getElementById("nav_footer_home_img");
            var listImage = document.getElementById("nav_footer_list_img");
            var cartImage = document.getElementById("nav_footer_cart_img");
            var starImage = document.getElementById("nav_footer_star_img");
            var userImage = document.getElementById("nav_footer_user_img");

            // 처음 실행시 이미지
            homeImage.src = "../../img/footer/nav_footer_home1.png";
            listImage.src = "../../img/footer/nav_footer_list1.png";
            cartImage.src = "../../img/footer/nav_footer_cart1.png";
            starImage.src = "../../img/footer/nav_footer_star1.png";
            userImage.src = "../../img/footer/nav_footer_user1.png";


            if (element.classList.contains("clicked")) {
                element.classList.remove("clicked");

            } else {
                homeImage.classList.remove("clicked");
                listImage.classList.remove("clicked");
                cartImage.classList.remove("clicked");
                starImage.classList.remove("clicked");
                userImage.classList.remove("clicked");
                element.classList.add("clicked");

                // 해당 이미지만 원래 위치로 복원
                if (element.id === "nav_footer_home_img") {
                    homeImage.src = "../../img/footer/nav_footer_home2.png";
                } else if (element.id === "nav_footer_list_img") {
                    listImage.src = "../../img/footer/nav_footer_list2.png";
                } else if (element.id === "nav_footer_cart_img") {
                    cartImage.src = "../../img/footer/nav_footer_cart2.png";
                } else if (element.id === "nav_footer_star_img") {
                    starImage.src = "../../img/footer/nav_footer_star2.png";
                } else if (element.id === "nav_footer_user_img") {
                    userImage.src = "../../img/footer/nav_footer_user2.png";
                }
            }
        }
    </script>
</head>
<body>
<div class="nav_footer_wrap">
    <div class="nav_footer">
        <div onclick="location.href='/'" style="margin-left:15px;">
            <img id="nav_footer_home_img" src="../../img/footer/nav_footer_home1.png" alt="main Icon"
                 onclick="toggleImage(this)">
            <span>홈</span>
        </div>
        <div onclick="location.href='/order_pastorder'" style="margin-left:15px;">
            <img id="nav_footer_list_img" src="../../img/footer/nav_footer_list1.png" alt="list Icon"
                 onclick="toggleImage(this)">
            <span>주문내역</span>
        </div>
        <a href="/${userId}/cart" style="width: 35px;margin-left:20px;margin-right: 10px;">
            <img id="nav_footer_cart_img" src="../../img/footer/nav_footer_cart1.png" alt="cart Icon"
                 onclick="toggleImage(this)">
            <span>장바구니</span>
        </a>
        <div onclick="location.href='/favList'" style="margin-left:10px;">
            <img id="nav_footer_star_img" src="../../img/footer/nav_footer_star1.png" alt="favorite Icon"
                 onclick="toggleImage(this)">
            <span>단골가게</span>
        </div>
        <div onclick="location.href='/mypage'" style="margin-left:10px;">
            <img id="nav_footer_user_img" src="../../img/footer/nav_footer_user1.png" alt="user Icon"
                 onclick="toggleImage(this)">
            <span><a href="/mypage">마이페이지</a></span>
        </div>
    </div>
</div>
</body>
</html>
