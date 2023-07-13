<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="../../css/user/join.css">

  <script src="../../js/user/join.js"></script>
</head>


<body>
<div class="container">
  <div class="logo_container">
    <img src="../../img/user/ori.png" alt="logo">
    <img src="../../img/user/smoke.png" alt="smoke">

    <span class="logo-text">Ori Market</span>
  </div>


  <form action="/join" method="post">
    <div class="form_field">
      <label for="id">아이디</label>
      <div class="input_container">
        <input type="text" id="id" name="userId" required>
        <div class="btn_container">
          <button type="button" class="btn_round" onclick="checkDuplicate()"
                  style="border-radius: 20px;
            			padding: 5px 10px;
            			background-color: #ffbf41;
            			color: white; border: none;
            			font-size: 14px; cursor: pointer;
            			font-family: 'omyu pretty', Arial, sans-serif;">중복확인
          </button>
        </div>
      </div>
    </div>
    <div class="form_field">
      <label for="password">비밀번호</label>
      <input type="password" id="password" name="userPassword" required>
    </div>
    <div class="form_field">
      <label for="name">이름</label>
      <input type="text" id="name" name="userName" required>
    </div>
    <div class="form_field">
      <label for="name">닉네임</label>
      <input type="text" id="nickname" name="userNickname" required>
    </div>
    <div class="form_field">
      <label for="phone">휴대폰</label>
      <input type="tel" id="phone" name="userPhone" required>
    </div>
    <div class="form_field">
      <label for="email">이메일</label>
      <input type="email" id="email" name="userEmail" required>
    </div>


    <div class="form_field">
      <label for="address_kakao">주소</label>
      <div class="input_container">
        <input type="text" id="address_kakao" name="userAddress" readonly>
        <div class="btn_container">
          <button type="button" class="btn_round" onclick="searchAddress()"
                  style="border-radius: 20px; padding: 5px 10px; background-color: #ffbf41; color: white; border: none; font-size: 14px; cursor: pointer; font-family: 'omyu pretty', Arial, sans-serif;">주소검색
          </button>

        </div>
      </div>
    </div>

    <div class="form_field">
      <label for="address_detail"></label>
      <input type="text" id="address_detail" name="userAddressDetail" placeholder="상세주소를 입력해주세요" required>
    </div>


    <input type="submit" value="SIGN UP" class="submit_btn">
  </form>

</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!--
<script>
//중복확인
function check() {
  var id = document.getElementById("id").value;


  var ischeck = true;

  if (ischeck) {
    alert("이미 사용중인 ID입니다.");
  } else {
    alert("사용가능한 ID입니다");
  }
}


</script>


 -->
<script>
  function checkDuplicate() {
    var userId = document.getElementById("id").value;
    var url = "/userId/" + userId + "/exists"; // API 엔드포인트 URL
    var xhr = new XMLHttpRequest();

    xhr.onreadystatechange = function() {
      if (xhr.readyState === XMLHttpRequest.DONE) {
        if (xhr.status === 200) {
          var response = JSON.parse(xhr.responseText);
          if (response) {
            // 중복된 아이디 처리 로직
            alert("중복된 아이디입니다.");
          } else {
            // 중복되지 않은 아이디 처리 로직
            alert("사용 가능한 아이디입니다.");
          }
        } else {
          // 에러 처리
          alert("오류가 발생했습니다.");
        }
      }
    };

    xhr.open("GET", url);
    xhr.send();
  }
</script>
</body>


</html>
