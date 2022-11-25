<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-21
  Time: 오후 3:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>admin</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <style>
        #allBox {
            display: flex;
        }

        #userConBT, #listConBT, #itemConBT {
            width: 300px;
            height: 300px;
            margin-top: 100px;
            margin-left: 50px;
            padding: 10px 20px;
            font-size: xxx-large;
        }
    </style>
</head>
<body>
<jsp:include page="layout/header.jsp"></jsp:include>
<div class="container" id="allBox">
    <div class="container" id="userCon">
        <button onclick="userControl()" class="btn btn-outline-primary" id="userConBT">회원관리</button>
    </div>
    <div class="container" id="listCon">
        <button onclick="tradeListControl()" class="btn btn-outline-primary" id="listConBT">거래내역</button>
    </div>
    <div class="container" id="itemCon">
        <button onclick="salesItemControl()" class="btn btn-outline-primary" id="itemConBT">현재 판매 현황</button>
    </div>
</div>
</body>
<script>
    const userControl = () => {
        location.href = "/admin/userControl";
    }

    const tradeListControl = () => {
        location.href = "/admin/tradeListControl";

    }

    const salesItemControl = () => {
        location.href = "/admin/salesItemControl";
    }


</script>
</html>
