<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-21
  Time: 오후 3:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<header>
    <div class="container">
        <button onclick="returnToHome()" class="btn">메인</button>

        <c:if test="${sessionScope.userLogin != null}">
            <button class="btn" onclick="userMyPage()">마이페이지</button>
        </c:if>

        <c:if test="${sessionScope.adminLogin == 'admin'}">
            <button onclick="adminAccess()" class="btn">관리자</button>
        </c:if>

        <c:if test="${sessionScope.userLogin != null or sessionScope.adminLogin != null}">
            <button onclick="userLogout()" class="btn">로그아웃</button>
        </c:if>
    </div>
</header>
</body>
<script>
    const returnToHome = () => {
        <c:if test="${sessionScope.userLogin == null}">
        location.href = "/";
        </c:if>

        <c:if test="${sessionScope.userLogin != null or sessionScope.adminLogin != null}">
        location.href ="/trade/main";
        </c:if>
    }

    const userLogout = () => {
        location.href = "/user/logout";
    }

    const adminAccess = () => {
        location.href = "/user/admin";

    }

    const userMyPage = () => {
        location.href = "/user/myPage";

    }
</script>
</html>
