<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-21
  Time: 오후 3:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>admin_sales_item_control</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="layout/header.jsp"></jsp:include>
<div class="container">
    <table class="table">
        <tr>
            <th>아이템 번호</th>
            <th>카테고리</th>
            <th>아이템 이름</th>
            <th>가격</th>
            <th>판매자 닉네임</th>
            <th>흥정가능 여부</th>
            <th>판매 등록 시간</th>
        </tr>
    </table>
</div>
</body>
</html>
