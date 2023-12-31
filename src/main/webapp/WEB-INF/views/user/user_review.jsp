<%@ page import="com.choongang.OriMarket.user.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>리뷰쓰기</title>
  <link rel="stylesheet" href="../../css/user/user_review.css">
</head>
<body>
<form action="/user_review" method="post" enctype="multipart/form-data">
  <div class="main-container">
    <div class="user_total_review">
        <c:forEach var="abcd" items="${abcde}" varStatus="status" >
          <c:if test="${status.index == 0}">
          <input type="hidden" name="orderNumber" value="${abcd.orderNumber}">
          <input type="hidden" name="newOrder.newOrderSeq" value="${abcd.newOrder.newOrderSeq}">
          <h3 style="text-align: center; margin-top: 5px;"><input type="hidden" name="buStoreName" value="${abcd.buStoreName}">
            ${abcd.buStoreName}
          </h3>
            <div class="line" style="margin-top: 10px;"></div>
            <p style="text-align: center; font-size: small; padding-top: 10px;">
            <c:forEach var="abcd1" items="${abcde}">
              <input type="hidden" name="itemName" value="${abcd1.itemName}">
              ${abcd1.itemName}
            </c:forEach>
            </p>
          </c:if>
        </c:forEach>
      <div class="line" style="margin-top: 10px; margin-bottom: 30px;"></div>
      <h4 style="text-align: center;">이 가게를 추천하시겠어요?</h4>
      <div class="stars">
        <input type="radio" id="star5" name="rating" value="5" />
        <label for="star5"></label>
        <input type="radio" id="star4" name="rating" value="4" />
        <label for="star4"></label>
        <input type="radio" id="star3" name="rating" value="3" />
        <label for="star3"></label>
        <input type="radio" id="star2" name="rating" value="2" />
        <label for="star2"></label>
        <input type="radio" id="star1" name="rating" value="1" />
        <label for="star1"></label>
      </div>
      <br><br>
    </div>
    <div class="line" style="margin-top: 30px; margin-bottom: 30px;"></div>
      <h5 style="text-align: center; color: #999999;">이 가게에 대한 상세한 평가를 해주세요</h5>
    <div class="store_review">
      <div class="taste_review">
        <h3>맛</h3>
      </div>

      <div class="stars">
        <input type="radio" id="star10" name="taste" value="5" />
        <label for="star10"></label>
        <input type="radio" id="star9" name="taste" value="4" />
        <label for="star9"></label>
        <input type="radio" id="star8" name="taste" value="3" />
        <label for="star8"></label>
        <input type="radio" id="star7" name="taste" value="2" />
        <label for="star7"></label>
        <input type="radio" id="star6" name="taste" value="1" />
        <label for="star6"></label>
      </div>
    </div>

    <br>

    <div class="store_review">
      <div class="delivery_review">
        <h3>양</h3>
      </div>

      <div class="stars">
        <input type="radio" id="star15" name="amount" value="5" />
        <label for="star15"></label>
        <input type="radio" id="star14" name="amount" value="4" />
        <label for="star14"></label>
        <input type="radio" id="star13" name="amount" value="3" />
        <label for="star13"></label>
        <input type="radio" id="star12" name="amount" value="2" />
        <label for="star12"></label>
        <input type="radio" id="star11" name="amount" value="1" />
        <label for="star11"></label>
      </div>
    </div>
    <br><br><br>
    <h5 style="text-align: center;">포토리뷰 작성시 <span style="color: #cc4444">100포인트</span> 지급!</h5>
    <textarea class="review_textbox" placeholder="사진과 함께 리뷰를 작성하시면 100포인트가 적립됩니다." name="content"
              oninput="checkMaxLength(this, 200); updateCharacterCount(this, 'charCount')"></textarea>
    <div id="charCount">0 / 200</div>

    <script>
      function checkMaxLength(textarea, maxLength) {
        if (textarea.value.length > maxLength) {
          textarea.value = textarea.value.slice(0, maxLength); // 글자 수를 제한
        }
      }

      function updateCharacterCount(textarea, countElementId) {
        const charCountElement = document.getElementById(countElementId);
        charCountElement.textContent = textarea.value.length + ' / 300';
      }
    </script>

    <ul class="image-preview" id="imagePreview">
      <li class="box"><span class="plus-icon">+</span></li>
      <li class="box"><span class="plus-icon">+</span></li>
      <li class="box"><span class="plus-icon">+</span></li>
    </ul>
    <input type="file" accept="image/*" name="pictureUrl1" id="logo-upload" onchange="previewPicture(event)" class="real-upload" required multiple>
    <button class="submit-button" type="submit">리뷰 작성하기</button>
</div>
  </form>


<script>
  let selectedBoxIndex; // 선택한 박스 인덱스 추적 변수
  function getImageFiles(e) {
    const uploadFiles = [];
    const files = e.currentTarget.files;

    const imagePreview = document.getElementById('imagePreview');
    const boxes = imagePreview.querySelectorAll('.box');

    if ([...files].length > 3) {
      alert('이미지는 최대 3장까지만 업로드 할 수 있습니다.');
      return;
    }

    // File type and count validation
    [...files].forEach((file, index) => {
      if (!file.type.match("image/.*")) {
        alert('이미지 파일만 업로드가 가능합니다.');
        return;
      }

      if (index < 3) {
        uploadFiles.push(file);
        const reader = new FileReader();
        reader.onload = (e) => {
          const preview = createElement(e, file);
          const selectedBox = boxes[selectedBoxIndex]; // 선택한 박스 가져오기
          if (selectedBox) {
            selectedBox.innerHTML = '';
            selectedBox.appendChild(preview);
            hidePlusIcon(selectedBox); // 선택한 박스의 플러스 아이콘 숨기기
            addDeleteIcon(selectedBox, file); // 선택한 박스에 삭제 아이콘 추가하기
          }
        };
        reader.readAsDataURL(file);
      }
    });
  }

  function createElement(e, file) {
    const img = document.createElement('img');
    img.setAttribute('src', e.target.result);
    img.setAttribute('data-file', file.name);
    return img;
  }

  function hidePlusIcon(box) {
    const plusIcon = box.querySelector('.plus-icon');
    if (plusIcon) {
      plusIcon.style.display = 'none';
    }
  }

  function addDeleteIcon(box, file) {
    const deleteIcon = document.createElement('span');
    deleteIcon.classList.add('delete-icon');
    deleteIcon.innerHTML = '&times;';
    deleteIcon.addEventListener('click', (e) => {
      e.stopPropagation(); // 이벤트 전파 방지
      const imagePreview = document.getElementById('imagePreview');
      const previewBox = deleteIcon.parentNode;
      const previewIndex = Array.from(previewBox.parentNode.children).indexOf(previewBox);

      // 삭제한 이미지 박스의 내용만 초기화
      previewBox.innerHTML = '<span class="plus-icon">+</span>';
      showPlusIcon(previewBox); // 삭제한 박스의 플러스 아이콘 표시

      // 이후 동작 처리
    });
    box.appendChild(deleteIcon);
  }

  function showPlusIcon(box) {
    const plusIcon = box.querySelector('.plus-icon');
    if (plusIcon) {
      plusIcon.style.display = 'block';
    }
  }

  const realUpload = document.querySelector('.real-upload');
  const boxes = document.querySelectorAll('.box');

  boxes.forEach((box, index) => {
    box.addEventListener('click', () => {
      selectedBoxIndex = index;
      realUpload.click();
    });
  });

  realUpload.addEventListener('change', getImageFiles);


  /*사진 첨부 없이 업로드하기*/
  const submitButton = document.querySelector('.submit-button');

  submitButton.addEventListener('click', (e) => {
    e.preventDefault(); // 기본 폼 제출 동작 막기
    // 리뷰 작성 처리 로직 추가
    // 예를 들어, 필수 입력 항목이 있는지 확인하고 서버로 데이터 전송 등을 수행할 수 있습니다.
    console.log('리뷰 작성하기 버튼이 클릭되었습니다.');
    document.querySelector('form').submit(); // 필요에 따라 폼 제출을 직접 호출할 수도 있습니다.
  });

  function previewPicture(event) {
    const pictureInput = event.target;
    const picturePreview = document.getElementById('logo-preview');

    if (pictureInput.files && pictureInput.files[0]) {
      const reader = new FileReader();

      reader.onload = function (e) {
        const imgElement = document.createElement('img');
        imgElement.src = e.target.result;
        imgElement.style.maxWidth = '100%'; // 이미지 크기 조절 (선택사항)
        imgElement.style.height = "auto";
        picturePreview.innerHTML = ''; // 이미지 미리보기 업데이트
        picturePreview.appendChild(imgElement);
      };
      reader.readAsDataURL(pictureInput.files[0]);
    }
  }
</script>
</body>

</html>
