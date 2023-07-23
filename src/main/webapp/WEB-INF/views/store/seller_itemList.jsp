<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>현 재고 리스트</title>
    <style type="text/css">
        /* 전체적용 */
        @font-face {
            font-family: 'omyu_pretty';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }
        @font-face {
            font-family: 'LINESeedKR-Bd';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
            font-weight: 700;
            font-style: normal;
        }

        /* 전체 크기 */
        body{margin: 0; padding: 0; font-family:'LINESeedKR-Bd'; font-size: 16px; text-align: center; width: 100%; height: 100%}
        #goods_container{width: 375px; height:812px; margin: 0 auto;}

        /* 가게상호명,업주 */ /* 230723 승원 */
        #goods_store{height:100px; background-color:#46A973; color:#fff; text-align: right; display: flex; justify-content: end; align-items: center;}
        .snun_wrap{margin-right:20px}

        /* 230723 승원 */
        .goods_store_wrap{background-color:#eee; height:712px;}
        .top_title_wrap h1{text-align:center; margin:15px 18%;}

        #goods_title{padding:20px 0 0;}
        #goods_title a{color:#333; margin:10px 5px; margin-right: 0;}
        .top_title_wrap{ display: flex; align-items: center;}
        button.backbtn { display: flex; align-items: center; font-size: 20px; color: #999; margin: 0 0 0 10px; width: 30px; height: 30px; background-color: #fff; border-radius: 50%; border: 1px solid #999; cursor: pointer; justify-content: center;}
        button.backbtn:hover {background-color:#333; color:#fff;}

        /* ------------------------------------------ 공통적용css---------------------------------------------- */

        #goods_list{font-size: 14px; margin: auto;}
        /* 230723 승원 */
        #goods_list table{ border-radius: 5px; background-color:#fff; padding:20px 5px; margin:auto;}


        /* 230723 승원 */
        #goods_title > a > input{ background-color: #ffbf41; color: #333; font-weight:600; padding: 8px 8px; border:none; border-radius:5px; cursor:pointer;}
        #goods_title > a > input:hover {background-color:#333; color:#fff;}

        .goods_listTitle{color: #46A973; margin-bottom:15px;}
    </style>
</head>
<body>
<div id="goods_container">
    <div id="goods_store">
        <div class="snun_wrap">
            <div>${buStore.buStoreName}</div>
            <small>대표:${buUser.buUserName}</small>
        </div>
    </div>
    <div class="goods_store_wrap">
        <div id="goods_title">
            <div class="top_title_wrap">
                <button class="backbtn" onclick="window.history.go(-1)">&lt;</button>
                <h1>현 재고 목록</h1>
            </div>
            <a href="#"><input type="button" class-="delete_btn" value="선택품목 삭제"></a>
            <a href="/s2/${buUserId}"><input type="button" class="insert_btn" value="신규품목 등록"></a>
        </div>
        <br>
        <div id="goods_list">
            <table>
                <tr class="goods_listTitle">
                    <td></td>
                    <td>상품번호</td>
                    <td>상품명</td>
                    <td>상품수량</td>
    <%--                <td>원가</td>--%>
                    <td>판매가</td>
    <%--                <td>무게</td>--%>
    <%--                <td>원산지</td>--%>
                    <td>입고일</td>
    <%--                <td>상세정보</td>--%>
                    <td>카테고리</td>
                </tr>
                <c:forEach var="it" items="${items}">
                <tr>
                    <td><input type="checkbox" value="Goods"></td>
                    <td><a href="/seller_itemDetail/${it.itemId}">${it.itemId}</a></td>
                    <td>${it.itemName}</td>
                    <td>${it.itemCnt}</td>
    <%--                <td>${it.itemCost}</td>--%>
                    <td><span class="formatted-price">${it.itemPrice}</span></td>
    <%--                <td>${it.itemG}</td>--%>
    <%--                <td>${it.itemFrom}</td>--%>
                    <td>${it.itemRegDate}</td>
    <%--                <td>${it.itemInfo}</td>--%>
                    <td>${it.itemCategory}</td>
                </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
</body>
<script>
    function formatNumberWithCommas(number) {
        return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }

    //백단위로 ',' 찍히게 하기
    var priceElements = document.getElementsByClassName("formatted-price");
    for (var i = 0; i < priceElements.length; i++) {
        var price = parseInt(priceElements[i].textContent);
        var formattedPrice = formatNumberWithCommas(price);
        priceElements[i].textContent = formattedPrice;
    }
</script>