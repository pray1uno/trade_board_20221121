<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-21
  Time: 오후 3:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>admin_user_control</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
    <style>
        .container {
            width: 800px;
            margin: 0 auto;
        }

        .table, th, td {
            text-align: center;
            vertical-align: middle;
        }
    </style>
</head>
<body>
<jsp:include page="layout/header.jsp"></jsp:include>
<div class="container">
    <table class="table">
        <tr>
            <th>회원번호</th>
            <th>아이디</th>
            <th>비밀번호</th>
            <th>전화번호</th>
            <th>구분</th>
            <th>판매정지</th>
            <th>회원삭제</th>
        </tr>
        <c:forEach items="${userControl}" var="user">
            <tr>
                <td>${user.id}</td>
                <td>${user.userId}</td>
                <td>${user.userPassword}</td>
                <td>${user.userMobile}</td>
                <td>
                    <c:if test="${user.userRole == 1}">
                        <span>거래가능</span>
                    </c:if>
                    <c:if test="${user.userRole == 2}">
                        <span>판매정지</span>
                    </c:if>
                </td>
                <td>
                    <button class="btn btn-danger">정지</button>
                </td>
                <td>
                    <button class="btn btn-close" onclick="user_delete(${user.id})"></button>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
<script>
    const user_delete = (result) => {
        if (confirm("해당 회원을 삭제 하시겠습니까?")) {
            if (true) {
                location.href = "/admin/userDelete?id=" + result;
            }
            alert("삭제 되었습니다.")
        }

    }
</script>
</html>