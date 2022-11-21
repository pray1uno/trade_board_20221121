<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-21
  Time: 오후 2:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Index</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
</head>
<body>
<div class="container">
    <form action="/user/login" method="post" name="loginForm">
        <input type="text" placeholder="ID" class="form-control" name="userId" id="loginId">
        <input type="text" placeholder="PASSWORD" class="form-control" name="userPassword" id="loginPassword">
        <input type="button" value="Login" class="btn" onclick="userLogin()">
    </form>
</div>
<div class="container">
    <button class="btn" onclick="userSave()">회원가입</button>
</div>
</body>
<script>
    const userSave = () => {
        location.href = "/user/save";
    }

    const userLogin = () => {
        document.loginForm.submit();
    }
</script>
</html>
