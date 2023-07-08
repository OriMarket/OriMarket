<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="width: 375px; margin: 0 auto;">
<head>
<meta charset= "UTF-8">
<title>Ori_Payment</title>
<script src="../../javascript/common/jquery-3.6.4.js"></script>
<script src="../../javascript/order/paymentPage.js"></script>
<script src="https://kit.fontawesome.com/59f45736e5.js" crossorigin="anonymous"></script>
<link rel= "stylesheet" href= "../../css/order/order_paymentpage.css">
</head>
<body>
	<div id= "paymentpage_main">
		<form action="" name="">
			<div id= "paymentpage_section_1">
				<div id= "paymentpage_address">주소 출력 위치</div>
				<div id= "paymentpage_btn_address_edit"><a>수정</a></div>
			</div>
			<hr>
			<div style="text-align: right;"><a class="order_paymentPage_btn_filter1"><i class="fa-solid fa-caret-up" style="color: #ee9820;"></i></a></div>
			<div id= "paymentpage_section_2">
				<table id= "paymentpage_table_1">
					<!-- 2023_07_02 같은 가게 물건이면?? 반복문 출력 고민 -->
					<!-- 반복문 출력 위치 -->
					<tr class= "paymentpage_tr_1">
						<th colspan= "3">생생 야채 가게</th>
					</tr>
					<tr class= "paymentpage_tr_2">
						<td class= "paymentpage_td_1">대파</td>
						<td style= "text-align: center;">3,000원</td>
						<td style= "text-align: right;">1개</td>
					</tr>
					<tr class= "paymentpage_tr_1">
						<th colspan= "3">가게이름</th>
					</tr>
					<tr class= "paymentpage_tr_2">
						<td class= "paymentpage_td_1">양파</td>
						<td style= "text-align: center;">1,500원</td>
						<td style= "text-align: right;">1개</td>
					</tr>
					<!-- 반복문 출력 끝 -->
					<tr align="center">
						<td colspan="3" class= "paymentpage_td_2">
							<a><img id="paymentpage_img_plus" src="../../img/order/paymentpage_img_plus_1.png"></a>
						</td>
					</tr>
				</table>
				<table id= "paymentpage_table_2">
					<tr class= "paymentpage_tr_3">
						<th colspan= "2">물건 금액</th>
						<td class= "paymentpage_td_3">4,500원</td>
					</tr>
					<tr class= "paymentpage_tr_3" >
						<th colspan= "2">배달비</th>
						<td class= "paymentpage_td_3">2,000원</td>
					</tr>
				</table>
				<table id= "paymentpage_table_3">
					<tr class= "paymentpage_tr_4">
						<th colspan= "2">총 결제 금액</th>
						<td class= "paymentpage_td_4">6,500원</td>
					</tr>
				</table>
			</div>
			<hr>
			<!-- 2023_07_02 나중에 스크립트로 slide-up, down 적용하고 화살표 변경되도록 적용 -->
			<div id="paymentpage_btn_section_3"><a class="order_paymentPage_btn_filter2"><i class="fa-solid fa-caret-up" style="color: #ee9820;"></i></a></div>
			<div id="paymentpage_section_4">
				<p>요청사항</p>
				<div><input class="payment_section_4_input" type="text" placeholder="요청 사항을 입력해주세요."></div>
				<p>배달 기사님께</p>
				<div><input class="payment_section_4_input" type="text" placeholder="배달 기사님께 전달할 메세지를 입력해주세요."></div>

			</div>
			<hr>
			<div style="text-align: right;"><a class="order_paymentPage_btn_filter3"><i class="fa-solid fa-caret-up" style="color: #ee9820;"></i></a></div>
			<div id="paymentpage_div_section_5">
				<h2 style="color:#46a973;">결제수단</h2>
				<!-- 2023_07_02 버튼 클릭 시 css변경 및  정보 전달 방법 구상 -->
				<table id="paymentpage_section_5">
					<tr>
						<td style="height: 40px;width: 50%">
							<input id="paymentpage_radio_1" class="paymentpage_btn_section_5" type="radio" name="payment" value="creditcard">
							<label for="paymentpage_radio_1">신용카드</label>
						</td>
						<td style="height: 40px;width: 50%">
							<input id="paymentpage_radio_2" class="paymentpage_btn_section_5" type="radio" name="payment" value="naverpay">
							<label for="paymentpage_radio_2">네이버페이 결제</label>
						</td>
					</tr>
					<tr>
						<td style="height: 40px;width: 50%">
							<input id="paymentpage_radio_3" class="paymentpage_btn_section_5" type="radio" name="payment" value="zeropay">
							<label for="paymentpage_radio_3">지역화폐</label>
						</td>
						<td style="height: 40px;width: 50%">
							<input id="paymentpage_radio_4" class="paymentpage_btn_section_5" type="radio" name="payment" value="kakaopay">
							<label for="paymentpage_radio_4">카카오페이 결제</label>
						</td>
					</tr>
				</table>
			</div>
			<div>
				<p>구매조건 확인 및 결제대행 서비스 동의</p>
				<div class="paymentpage_section_6_inner">
					오리 시장은 통신판매중개자로서 통신판매의 당사자가 아니며, 판매자가 등록한 상품 정보,
					상품의 품질 및 거래에 대해서 일체의 책임을 지지 않습니다. 회원은 주문 내용을 확인하였고,
					결제에 동의합니다.
				</div>
				<p>품질 취소 시 환불 안내</p>
				<div class="paymentpage_section_6_inner">
					주문하신 상품이 부득이하게 품절된 경우 결품 안내 드리고 있으며 결품 안내 후 답변 여부에 따라
					배송이 진행됩니다.
				</div>
			</div>
			<button id="paymentpage_btn_pay">총 6,500원 결제하기</button>
		</form>
	</div>
</body>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="width: 375px; margin: 0 auto;">
<head>
<meta charset= "UTF-8">
<title>Ori_Payment</title>
<script src="../../javascript/common/jquery-3.6.4.js"></script>
<script src="../../javascript/order/paymentPage.js"></script>
<script src="https://kit.fontawesome.com/59f45736e5.js" crossorigin="anonymous"></script>
<link rel= "stylesheet" href= "../../css/order/order_paymentpage.css">
</head>
<body>
	<div id= "paymentpage_main">
		<form action="" name="">
			<div id= "paymentpage_section_1">
				<div id= "paymentpage_address">주소 출력 위치</div>
				<div id= "paymentpage_btn_address_edit"><a>수정</a></div>
			</div>
			<hr>
			<div style="text-align: right;"><a class="order_paymentPage_btn_filter1"><i class="fa-solid fa-caret-up" style="color: #ee9820;"></i></a></div>
			<div id= "paymentpage_section_2">
				<table id= "paymentpage_table_1">
					<!-- 2023_07_02 같은 가게 물건이면?? 반복문 출력 고민 -->
					<!-- 반복문 출력 위치 -->
					<tr class= "paymentpage_tr_1">
						<th colspan= "3">생생 야채 가게</th>
					</tr>
					<tr class= "paymentpage_tr_2">
						<td class= "paymentpage_td_1">대파</td>
						<td style= "text-align: center;">3,000원</td>
						<td style= "text-align: right;">1개</td>
					</tr>
					<tr class= "paymentpage_tr_1">
						<th colspan= "3">가게이름</th>
					</tr>
					<tr class= "paymentpage_tr_2">
						<td class= "paymentpage_td_1">양파</td>
						<td style= "text-align: center;">1,500원</td>
						<td style= "text-align: right;">1개</td>
					</tr>
					<!-- 반복문 출력 끝 -->
					<tr align="center">
						<td colspan="3" class= "paymentpage_td_2">
							<a><img id="paymentpage_img_plus" src="../../img/order/paymentpage_img_plus_1.png"></a>
						</td>
					</tr>
				</table>
				<table id= "paymentpage_table_2">
					<tr class= "paymentpage_tr_3">
						<th colspan= "2">물건 금액</th>
						<td class= "paymentpage_td_3">4,500원</td>
					</tr>
					<tr class= "paymentpage_tr_3" >
						<th colspan= "2">배달비</th>
						<td class= "paymentpage_td_3">2,000원</td>
					</tr>
				</table>
				<table id= "paymentpage_table_3">
					<tr class= "paymentpage_tr_4">
						<th colspan= "2">총 결제 금액</th>
						<td class= "paymentpage_td_4">6,500원</td>
					</tr>
				</table>
			</div>
			<hr>
			<!-- 2023_07_02 나중에 스크립트로 slide-up, down 적용하고 화살표 변경되도록 적용 -->
			<div id="paymentpage_btn_section_3"><a class="order_paymentPage_btn_filter2"><i class="fa-solid fa-caret-up" style="color: #ee9820;"></i></a></div>
			<div id="paymentpage_section_4">
				<p>요청사항</p>
				<div id=""><input class="payment_section_4_input" type="text" placeholder="요청 사항을 입력해주세요."></div>
				<p>배달 기사님께</p>
				<div id=""><input class="payment_section_4_input" type="text" placeholder="배달 기사님께 전달할 메세지를 입력해주세요."></div>

			</div>
			<hr>
			<div style="text-align: right;"><a class="order_paymentPage_btn_filter3"><i class="fa-solid fa-caret-up" style="color: #ee9820;"></i></a></div>
			<div id="paymentpage_div_section_5">
				<h2 style="color:#46a973;">결제수단</h2>
				<!-- 2023_07_02 버튼 클릭 시 css변경 및  정보 전달 방법 구상 -->
				<table id="paymentpage_section_5">
					<tr>
						<td style="height: 40px;width: 50%">
							<input id="paymentpage_radio_1" class="paymentpage_btn_section_5" type="radio" name="payment" value="creditcard">
							<label for="paymentpage_radio_1">신용카드</label>
						</td>
						<td style="height: 40px;width: 50%">
							<input id="paymentpage_radio_2" class="paymentpage_btn_section_5" type="radio" name="payment" value="naverpay">
							<label for="paymentpage_radio_2">네이버페이 결제</label>
						</td>
					</tr>
					<tr>
						<td style="height: 40px;width: 50%">
							<input id="paymentpage_radio_3" class="paymentpage_btn_section_5" type="radio" name="payment" value="zeropay">
							<label for="paymentpage_radio_3">지역화폐</label>
						</td>
						<td style="height: 40px;width: 50%">
							<input id="paymentpage_radio_4" class="paymentpage_btn_section_5" type="radio" name="payment" value="kakaopay">
							<label for="paymentpage_radio_4">카카오페이 결제</label>
						</td>
					</tr>
				</table>
			</div>
			<div>
				<p>구매조건 확인 및 결제대행 서비스 동의</p>
				<div class="paymentpage_section_6_inner">
					오리 시장은 통신판매중개자로서 통신판매의 당사자가 아니며, 판매자가 등록한 상품 정보,
					상품의 품질 및 거래에 대해서 일체의 책임을 지지 않습니다. 회원은 주문 내용을 확인하였고,
					결제에 동의합니다.
				</div>
				<p>품질 취소 시 환불 안내</p>
				<div class="paymentpage_section_6_inner">
					주문하신 상품이 부득이하게 품절된 경우 결품 안내 드리고 있으며 결품 안내 후 답변 여부에 따라
					배송이 진행됩니다.
				</div>
			</div>
			<button id="paymentpage_btn_pay">총 6,500원 결제하기</button>
		</form>
	</div>
</body>
</html>