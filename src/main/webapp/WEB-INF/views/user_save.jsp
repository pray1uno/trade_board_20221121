<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-21
  Time: 오후 3:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>user_save</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <form action="/user/save" method="post" name="newSaveForm">
        <label for="saveId">아이디</label>
        <input type="text" placeholder="ID" class="form-control" name="userId" id="saveId">
        <label for="savePassword">비밀번호</label>
        <input type="text" placeholder="PASSWORD" class="form-control" name="userPassword" id="savePassword">
        <label for="saveMobile">전화번호</label>
        <input type="text" placeholder="MOBILE" class="form-control" name="userMobile" id="saveMobile">
        <div class="container">
            <input type="button" value="회원가입" class="btn" onclick="userNewSave()">
        </div>
    </form>
</div>
</body>
<script>
    const userNewSave = () => {
        document.newSaveForm.submit();
    }
</script>
</html>
