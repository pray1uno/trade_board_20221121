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
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        #loginUI {
            width: 800px;
            height: 800px;
            display: flex;
            border-radius: 40px;
            align-items: center;
            justify-content: center;
        }

        #loginControl {
            width: 100%;
            height: 800px;
            margin-top: 200px;
            background: aliceblue;
            border-radius: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            flex-direction: column;
        }

        #loginId, #loginPassword {
            width: 400px;
            height: 50px;
            border-radius: 20px;
            margin-top: 30px;
            padding: 0px 20px;
            border: 2px solid lightgray;
            outline: none;
        }

        #loginBT {
            width: 400px;
            height: 50px;
            border: 0;
            margin-top: 50px;
            margin-bottom: 20px;
            outline: none;
            background: linear-gradient(to left, deepskyblue, mediumblue);
            color: white;
        }

        #uiBT {
            width: 400px;
            height: 50px;
            border: 0;
            margin-bottom: 20px;
            outline: none;
            background: linear-gradient(to right, dodgerblue, skyblue);
            color: white;
        }

    </style>
</head>
<body>
<jsp:include page="layout/header.jsp"></jsp:include>
<div class="container" id="loginUI">
    <div class="container">
        <div class="container" id="loginControl">
            <form action="/user/login" method="post" name="loginForm">
                <input type="email" name="userId" id="loginId" placeholder="ID">
                <input type="password" name="userPassword" id="loginPassword" placeholder="PASSWORD">
            </form>
            <div class="container">
                <input type="button" value="로그인" class="btn" id="loginBT" onclick="userLogin()">
            </div>
            <div class="container">
                <button class="btn" onclick="userSave()" id="uiBT">회원가입</button>
            </div>
        </div>
    </div>
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
