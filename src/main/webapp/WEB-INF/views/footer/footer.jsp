<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="../../css/footer/footer.css">
</head>
<body>
<div class="footer">
    <div class="logo">
        <img src="../../img/footer/ori.png" alt="Logo">
        <span>Ori Market</span>
    </div>
    <div class="links-container">
        <div class="links">
            <a href="/" style="color:white">홈</a>
            <a href="/order" style="color:white">주문</a>
            <a href="#" style="color:white">상품</a>
        </div>
        <div class="links">
            <a href="#" style="color:white">고객센터</a>
            <a href="#" style="color:white">자주묻는 질문</a>
            <a href="#" style="color:white">1:1문의</a>
        </div>
        <div class="links">
            <c:if test="${empty sessionScope.userId}">
                <a href="/login" style="color:white">로그인</a>
            </c:if>
            <c:if test="${!empty sessionScope.userId}">
                <a href="/logout" style="color:white">로그아웃</a>
            </c:if>
            <a href="/join" style="color:white">회원가입</a>
            <a href="/mypage" style="color:white">마이페이지</a>
        </div>
        <div class="links">
            <a href="#"><img src="../../img/footer/footer_instagram_icon.png" alt="instagram"></a>
            <a href="#"><img src="../../img/footer/footer_kakao_icon.png" alt="kakaotalk"></a>
            <a href="#"><img src="../../img/footer/footer_call_icon.png" alt="call"></a>
        </div>
    </div>
    <div class="text">
        <a href="#" style="color:white; text-decoration:none; font-size:16px; margin-right:10px;">(주)오리마켓</a>
        <a href="#" style="color:white; text-decoration:none; font-size:16px; margin-right:10px;">이용약관</a>
        <a href="#" style="color:white; text-decoration:none; font-size:16px;">개인정보처리방침</a>
    </div>
</div>
</body>
</html>
