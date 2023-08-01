<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="for" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>title</title>
    <style>
        #b_table{border: 1px solid black;}

    </style>
</head>
<body>
    <% if (request.getAttribute("deleteMessage") != null) { %>
        window.onload = function() {
        alert("<%= request.getAttribute("deleteMessage") %>");
      };
    <% } %>
    <h1>사업자등록현황</h1>
    <form action="/searchBuser" method="get">
        <table>
            <tr>
                <td>
                    <select name="selectType">
                        <option value="buUserName">사업자명</option>
                        <option value="buUserNumber">사업자번호</option>
                    </select>
                </td>
                <td><input type="text" name="keyword"></td>
                <td><input type="submit" value="검색"></td>
            </tr>
        </table>
    </form>
    <form action="" method="">
        <table id="b_table">
            <tr>
                <th>시장</th>
                <th>사업자번호</th>
                <th>가게상호명</th>
                <th>사업자명</th>
                <th>주소</th>
                <th>아이디</th>
                <th>연락처</th>
                <th>이메일</th>
                <th>관리</th>
            </tr>
            <%--반복문시작--%>
            <c:forEach var="buser" items="${busers}">
            <tr>
                <td>${buser.market.marketName}</td>
                <td><a href="/storeInfo?buUserNumber=${buser.buUserNumber}">${buser.buUserNumber}</a></td>
                <td>${buser.businessStores.get(0).buStoreName}</td>
                <td>${buser.buUserName}</td>
                <td>${buser.buUserAddress}</td>
                <td>${buser.buUserId}</td>
                <td>${buser.buUserPhone}</td>
                <td>${buser.buUserEmail}</td>
                <td>
                    <button><a href="/delete_buser/${buser.buUserNumber}">삭제</a></button>
                </td>
            </tr>
            </c:forEach>
        </table>
    </form>
</body>
</html>

