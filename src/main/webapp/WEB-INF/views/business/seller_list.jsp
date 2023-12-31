<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ori_매출내역</title>
    <script src="../../js/common/jquery-3.6.4.js"></script>
    <script src="../../js/calculate/calculate.js"></script>
    <script src="https://kit.fontawesome.com/59f45736e5.js" crossorigin="anonymous" ></script>
    <link rel="stylesheet" href="../../css/calculate/calculate.css">
</head>
<body id="calculate_body">
    <header id="calculate_header">
        <div id="calculate_title">
            <%--왼쪽 화살표--%>
            <a href="/storenotice1"><i class="fas fa-solid fa-arrow-left" style="color: #fafafa;"></i></a>
            판매 목록
        </div>
        <%--정산 날짜 출력--%>
        <table id="calculate_date">
            <%--왼쪽 화살표--%>
            <tr>
                <td>
                    <a class="go-prev"><i class="fas fa-regular fa-angle-left" style="color: #f5f5f5;"></i></a>
                </td>
                <td>
                    <input type="hidden" name="calculate_date" id="calculate_date">
                    <%--해당 달 1달 후--%>
                    <input type="hidden" name="calculate_date_last" id="calculate_date_last">
                    <div id="calculate_search_date" style="color:#f5f5f5;"></div>
                </td>
            <%--오른쪽 화살표--%>
                <td>
                    <a class="go-next"><i id="calculate_search_rightArrow" class="fas fa-solid fa-angle-right" style="color: #f5f5f5;"></i></a>
                </td>
            </tr>
        </table>
    </header>
    <main>
        <table id="calculate_main_table">
            <tr id="calculate_main_table_tr_1">
                <td>날짜</td><td>수입</td><td>판매 물건</td><td>개수</td><td>총 가격</td>
            </tr>
            <tbody id="tableBody">
            <c:forEach items="${tableAllList}" var="datas">
                <tr>
                    <td class="calculate_main_table_td_1" style="text-align: center;">
                       <script>
                           var date = "${datas.date}";
                           var formattedDate = date.substr(0, 8);
                           document.write(formattedDate);
                       </script>
                    </td>
                    <td class="calculate_main_table_td_2" style="text-align:center;">
                       ${datas.amount}
                    </td>
                    <td class="calculate_main_table_td_2" style="text-align:center;">
                       ${datas.goodsName}
                    </td>
                    <td class="calculate_main_table_td_2" style="text-align:center;">
                       ${datas.totalPrice}
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </main>
</body>
</html>