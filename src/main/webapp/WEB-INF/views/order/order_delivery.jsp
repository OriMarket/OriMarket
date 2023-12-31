<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--특정 위치마다 , 넣도록--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ori_Delivery</title>
<script src="https://kit.fontawesome.com/59f45736e5.js" crossorigin="anonymous"></script>
<link rel= "stylesheet" href= "../../css/order/order_delivery.css">
</head>
<body>
<%--	<FORM action="/accept" method="get">
		<INPUT TYPE="hidden" name="orderNumber" value="${orderNumber}">
		<input type="submit" value="주문수락">
	</FORM>--%>
	<main id="orderDelivery_main">
		<div id="orderDelivery_btn_cancel"><a href="/order_pastorder"><i class="fas fa-regular fa-xmark"></i></a></div>
		<h2>실시간 주문 내역</h2>
		<ul id="orderDelivery_ing">
			<!-- 배달표시 circle 아이콘 -->
			<!-- 2023-07-04 스크립트로 값 들어오면 아이콘 변경되게 추후 적용 -->
			<!-- 2023-07-07 if문으로 색상 변경: -->
			<!-- 픽업중 -->
			<c:if test="${newOrder.orderStatus eq null}">
				<li><i class="fa-sharp fa-regular fa-circle" style="color: #b8b8b8;"></i></li>
				<li class="orderDelivery_li_1">픽업중</li>
			</c:if>
			<c:if test="${newOrder.orderStatus eq '주문수락' or newOrder.orderStatus eq '배달시작' or newOrder.orderStatus eq '배달완료' or newOrder.orderStatus eq '픽업완료'}">
				<li><i class="fa-sharp fa-solid fa-circle" style="color: #46a973;"></i></li>
				<li class="orderDelivery_li_1" style="color: #46A973;">픽업중</li>
			</c:if>
			<!-- 배달중 -->
			<c:if test="${newOrder.orderStatus eq null or newOrder.orderStatus eq '주문수락' or newOrder.orderStatus eq '픽업완료'}">
				<li><i class="fa-sharp fa-regular fa-circle" style="color: #b8b8b8;"></i></li>
				<li class="orderDelivery_li_1">배달중</li>
			</c:if>
			<c:if test="${newOrder.orderStatus eq '배달시작' or newOrder.orderStatus eq '배달완료'}">
				<li><i class="fa-sharp fa-solid fa-circle" style="color: #46a973;"></i></li>
				<li class="orderDelivery_li_1" style="color: #46a973;">배달중</li>
			</c:if>
			<c:if test="${newOrder.orderStatus eq null or newOrder.orderStatus eq '배달시작' or newOrder.orderStatus eq '주문수락' or newOrder.orderStatus eq '픽업완료'}">
				<!-- 배달완료 -->
				<li><i class="fa-sharp fa-regular fa-circle" style="color: #b8b8b8;"></i></li>
				<li>배달 완료</li>
			</c:if>
			<c:if test="${newOrder.orderStatus eq '배달완료'}">
				<!-- 배달완료 -->
				<li><i class="fa-sharp fa-solid fa-circle" style="color: #46a973;"></i></li>
				<li style="color: #46a973;">배달 완료</li>
			</c:if>
		</ul>
		<div id="orderDelivery_orderInfo">
			<h3>${newOrder.orderMarketName}</h3>
			<table id="orderDelivery_table_1">
				<c:if test="${newOrder.orderStatus eq '주문거절'}">
					<!-- 배달완료 -->
					<tr style="color: red;"><td>가게 사정으로 주문이 거절되었습니다. 죄송합니다.</td></tr>
				</c:if>
				<tr class="orderDelivery_table_tr_1"><td>${newOrder.orderNumber}</td></tr>
				<tr class="orderDelivery_table_tr_2">
					<td>
						${fn:substring(newOrder.createdDate, 0, 4)}년
						${fn:substring(newOrder.createdDate, 4, 6)}월
						${fn:substring(newOrder.createdDate, 6, 8)}일
						${fn:substring(newOrder.createdDate, 8, 10)}시
						${fn:substring(newOrder.createdDate, 10, 12)}분
					</td>
				</tr>
				<tr class="orderDelivery_table_tr_1"><td>배달 주소</td></tr>
				<tr class="orderDelivery_table_tr_2"><td>${newOrder.orderAddress}</td></tr>
			</table>
			<hr>
			<table id="orderDelivery_table_2">
				<tr class="orderDelivery_table_tr_1"><td colspan="2">주문 내역</td></tr>
				<c:set var="prevBuStoreName" value="" />
				<c:forEach var="store" items="${newOrder.newOrderDetails}">
					<c:if test="${!store.buStoreName.equals(prevBuStoreName)}">
					<c:set var="prevBuStoreName" value="${store.buStoreName}" />
					<tr class="orderDelivery_table_tr_1"><td colspan="2">${store.buStoreName}</td></tr>
					</c:if>
					<tr class="orderDelivery_table_tr_2">
						<tr>
							<td>${store.itemName}&nbsp;&nbsp;&nbsp;
								<fmt:formatNumber value="${store.itemPrice}" pattern="#,###"/>원
								<small style="color: #818083;">&nbsp;&nbsp;&nbsp;x${store.itemCount}</small>
							</td>
						</tr>
					</tr>
				</c:forEach>
				<tr>
					<td>배달비</td><td><fmt:formatNumber value="${newOrder.orderDeliveryPrice}" pattern="#,###"/>원</td>
				</tr>
			</table>
			<hr>
			<table id="orderDelivery_table_3">
				<tr><td class="orderDelivery_table3_td_1">요청사항</td><td class="orderDelivery_table3_td_1">${newOrder.orderRequests}</td>
				<tr><td class="orderDelivery_table3_td_1">배달 기사님께</td><td class="orderDelivery_table3_td_1">${newOrder.forRider}</td></tr>
				<tr>
					<td id="orderDelivery_table3_total_td_1">총 금액</td><td id="orderDelivery_table3_total_td_2">
					<fmt:formatNumber value="${newOrder.orderTotalPrice}" pattern="#,###"/>원
					</td>
				</tr>
			</table>
			
		</div>
	</main>
</body>
</html>
