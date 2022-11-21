<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-21
  Time: 오후 4:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>user_my_update</title>
</head>
<body>
<jsp:include page="layout/header.jsp"></jsp:include>
<div class="container">
    <form action="/user/myUpdate" method="post" name="myUpdate">
        <input type="hidden" name="id" id="id" value="${myPage.id}">

        <label for="inputUserId">아이디</label>
        <input type="text" name="userId" id="inputUserId" class="form-control-plaintext" value="${myPage.userId}"
               readonly> <br>

        <label for="changePassword2">비밀번호 수정</label>
        <input type="text" name="" id="nowPassword" class="form-control" placeholder="현재 비밀번호"> <br>
        <input type="text" name="" id="changePassword1" class="form-control" placeholder="새로운 비밀번호"> <br>
        <input type="text" name="userPassword" id="changePassword2" class="form-control" placeholder="새로운 비밀번호 확인"> <br>
        <br>

        <label for="inputUserName">닉네임 수정</label>
        <input type="text" name="userName" id="inputUserName" class="form-control" value="${myPage.userName}"> <br>

        <label for="inputUserMobile">전화번호 수정</label>
        <input type="text" name="userMobile" id="inputUserMobile" class="form-control" value="${myPage.userMobile}"> <br>

        <input type="button" value="수정 완료" onclick="userDataUpdate()" class="btn">
    </form>
</div>
</body>
<script>
    const userDataUpdate = () => {
        const passwordDB = '${myPage.userPassword}';
        const nowPW = document.getElementById("nowPassword").value;
        const changePW = document.getElementById("changePassword1").value;
        const confirmPW = document.getElementById("changePassword2").value;

        const check1 = passwordDB == nowPW;
        const check2 = changePW == confirmPW;

        if (check1 && check2) {
            document.myUpdate.submit();
        } else {
            alert("내용을 확인하세요.")
        }


    }
</script>
</html>
