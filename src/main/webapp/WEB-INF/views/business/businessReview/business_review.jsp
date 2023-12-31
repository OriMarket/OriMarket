<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Orimarket_BusinessReview</title>
    <script>
        function editReply() {
            document.getElementById('businessReplyText').style.display = 'none';
            document.getElementById('businessReplyInput_txt').style.display = 'inline';
            document.getElementById('reviewSubmitButton').style.display = 'inline';
            document.getElementById('reviewEditButton').style.display = 'none';
            document.getElementById('business_review_btn_2').style.display = 'inline';
        }
    </script>
    <link rel="stylesheet" href="../../css/business/business_review.css">
</head>
<body id="business_review_body">
<header id="business_review_header">
    <c:if test="${reviewcount eq 1}">
    <h3>내 가게 리뷰 <small>&lt; 총: ${aveRating}점 &gt;</small></h3>
    <h3 style="margin-top: -20px;" class="rating" data-rating="${aveRating}"></h3>
    </c:if>

    <c:if test="${reviewcount ne 1}">
        <h3>내 가게 리뷰 <small>&lt; 총: ${aveRating}점 &gt;</small></h3>
        <h3 style="margin-top: -20px;" class="rating" data-rating="${Math.round(aveRating * 2) / 2}"></h3>
    </c:if>

</header>
<main>
    <c:if test="${empty reviewList}">
        <h2>아직 등록된 리뷰가 없어요&#128546;</h2>
    </c:if>
    <c:if test="${not empty reviewList}">
        <c:forEach var="list" items="${reviewList}" varStatus="status">
            ${status.index + 1}
            <table class="review_table" border="1" style="border-collapse: collapse;">
                <form action="/ReplyInsert" method="post">
                    <input type="hidden" name="review_id" value="${list.review_id}">
                    <tr>
                        <td class="review_table_td_1">닉네임</td><td> ${list.user.userNickname}</td>
                    </tr>
                    <tr class="business_review_title">
                        <td class="review_table_td_1">메뉴</td>
                        <td style="text-align: left;"> ${list.item.itemName}</td>
                    </tr>
                    <tr>
                        <td class="review_table_td_1">별점</td>
                        <td><h4 class="rating" data-rating="${list.rating}"></h4></td>
                    </tr>
                    <tr>
                        <td class="my_review_photo" colspan="2">
                            <img src="../../../img/review/${list.pictureUrl}" style="max-width:100%;">
                        </td>
                    </tr>
                    <tr>
                        <td class="my_review_photo" colspan="2">
                            <p>${list.content}</p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left;" class="review_table_td_1">작성 날짜</td>
                        <td class="rate_and_date">
                            <h6 class="date">${list.getFormattedCreatedDate()}</h6>
                        </td>
                    </tr>
                    <c:if test="${empty list.businessReplyMessage}">
                        <tr><td colspan="2" class="review_table_td_1">답변 쓰기</td></tr>
                        <tr>
                            <td id="business_review_messageArea" colspan="2">
                                <textarea style="width: 98%; margin-left: 0.5px;" type="textarea"  name="businessReplyMessage" maxlength="500" placeholder="500자 이내 작성"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: center;"><input type="submit" value="완료"></td>
                        </tr>
                    </c:if>
                    <c:if test="${!empty list.businessReplyMessage}">
                        <tr>
                            <td class="review_table_td_1">리뷰 답댓글</td>
                            <td>
                                <span id="businessReplyText">${list.businessReplyMessage}</span>
                            </td>
                        </tr>
                        <tr id="businessReplyInput_txt" style="display: none">
                            <td colspan="2" style="width: 100%;">
                                <textarea name="businessReplyMessage" style="width: 98%; margin-left: 0.5px;" rows="5" maxlength="500" placeholder="댓글을 수정하시려면 여기를 클릭하고 수정하기를 눌러주세요"></textarea>
                            </td>
                        </tr>
                        <tr id="business_review_btn_1">
                            <td colspan="2" class="review_table_td_1">
                                <button type="button" id="reviewEditButton" onclick="editReply()">수정</button>
                            </td>
                        </tr>
                        <tr id="business_review_btn_2" style="display: none;">
                            <td colspan="2" class="review_table_td_1">
                                <button type="submit" id="reviewSubmitButton" style="display: none;">저장</button>
                            </td>
                        </tr>
                    </c:if>
                </form>
            </table>
            <br>
            <br>
        </c:forEach>
    </c:if>
</main>
</body>
</html>
