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
</head>
<body>
<jsp:include page="layout/header.jsp"></jsp:include>
<c:if test="${sessionScope.adminLogin == 'admin'}">
    <div class="container">
        <button onclick="userControl()" class="btn">회원관리</button>
    </div>
    <div class="container">
        <button onclick="tradeListControl()" class="btn">거래 내역</button>
    </div>
    <div class="container">
        <button onclick="salesItemControl()" class="btn">현재 판매 현황</button>
    </div>

</c:if>
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
