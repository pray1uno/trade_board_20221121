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
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        #totalBox {
            width: 600px;
            height: 600px;
            display: flex;
            border-radius: 40px;
            align-items: center;
            justify-content: center;
        }

        #formBox {
            width: 100%;
            height: 600px;
            margin-top: 200px;
            background: aliceblue;
            border-radius: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            flex-direction: column;
        }

        #nowPassword {
            width: 400px;
            height: 50px;
            border-radius: 20px;
            /*margin-bottom: 30px;*/
            padding: 0px 20px;
            border: 2px solid lightgray;
            outline: none;
            justify-content: center;
            align-items: center;
            text-align: left;
        }

        #inputUserMobile {
            width: 400px;
            height: 50px;
            border-radius: 20px;
            margin-bottom: 30px;
            padding: 0px 20px;
            border: 2px solid lightgray;
            outline: none;
            justify-content: center;
            align-items: center;
            text-align: left;
        }

        #changePassword1 {
            width: 400px;
            height: 50px;
            border-radius: 20px;
            margin-top: 30px;
            margin-bottom: 10px;
            padding: 0px 20px;
            border: 2px solid lightgray;
            outline: none;
            justify-content: center;
            align-items: center;
            text-align: left;
        }

        #changePassword2 {
            width: 400px;
            height: 50px;
            border-radius: 20px;
            margin-bottom: 10px;
            padding: 0px 20px;
            border: 2px solid lightgray;
            outline: none;
            justify-content: center;
            align-items: center;
            text-align: left;
        }

        #inputUserMobile {
            margin-bottom: 100px;
        }


        #labelCon1, #labelCon2 {
            width: 400px;
            text-align: left;
            margin-top: 50px;
        }

        #inputUserId {
            text-align: center;
        }

        #changeBT {
            border: 1px solid lightyellow;
            border-radius: 30px;
            outline: none;
            background: dodgerblue;
            color: white;
        }

        #nowPW_inner, #newPW_inner {
            display: block;
        }

    </style>
</head>
<body>
<jsp:include page="layout/header.jsp"></jsp:include>
<div class="container" id="totalBox">
    <div class="container" id="formBox">
        <form action="/user/myUpdate" method="post" name="myUpdate">
            <input type="hidden" name="id" id="id" value="${myPage.id}">

            <input type="text" name="userId" id="inputUserId" class="form-control-plaintext"
                   value="${myPage.userId}"
                   readonly>

            <div class="container" id="labelCon1">
                <label for="changePassword2">비밀번호 수정</label>
            </div>

            <div class="container">
                <input type="password" name="" id="nowPassword" placeholder="현재 비밀번호" onblur="nowPW_check()">
                <span id="nowPW_inner"></span>
            </div>
            <div class="container">
                <input type="password" name="" id="changePassword1" placeholder="새로운 비밀번호" onblur="newPW_check()">
                <input type="password" name="userPassword" id="changePassword2" placeholder="새로운 비밀번호 확인"
                       onblur="newPW_check()">
                <span id="newPW_inner"></span>
            </div>

            <div class="container" id="labelCon2">
                <label for="inputUserMobile">전화번호 수정</label>
            </div>

            <div class="container">
                <input type="text" name="userMobile" id="inputUserMobile" value="${myPage.userMobile}">
            </div>

            <div class="container">
                <input type="button" value="수정 완료" id="changeBT" onclick="userDataUpdate()" class="btn">
            </div>
        </form>
    </div>
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

    const nowPW_check = () => {
        const nowDB_PW = '${myPage.userPassword}';
        const nowPW_one = document.getElementById("nowPassword").value;
        const nowPW_inner = document.getElementById("nowPW_inner");

        const success = nowDB_PW == nowPW_one;
        const blank = nowPW_one.length == 0;
        const missMatch = nowDB_PW != nowPW_one && nowPW_one.length != 0;

        if (success) {
            nowPW_inner.innerHTML = "";
            return false;
        }

        if (blank) {
            nowPW_inner.innerHTML = "";
        }

        if (missMatch) {
            nowPW_inner.innerHTML = "비밀번호가 일치하지 않습니다.";
            nowPW_inner.style.color = "red";
            return false;
        }

    }

    const newPW_check = () => {
        const checkDB_pw = '${myPage.userPassword}';
        const newPW_one = document.getElementById("changePassword1").value;
        const newPW_two = document.getElementById("changePassword2").value;
        const newPW_inner = document.getElementById("newPW_inner");

        const overlap = checkDB_pw == newPW_one || checkDB_pw== newPW_two;
        const missMatch = newPW_one != newPW_two;
        const blank = newPW_one.length == 0 || newPW_two.length == 0;

        if (overlap) {
            newPW_inner.innerHTML = "기존 비밀번호로는 변경할 수 없습니다."
            newPW_inner.style.color = "red";
            return false;
        } else {
            newPW_inner.innerHTML = "";
        }

        if (missMatch) {
            newPW_inner.innerHTML = "비밀번호가 일치하지 않습니다.";
            newPW_inner.style.color = "red";
            return false;
        } else {
            newPW_inner.innerHTML = "";
        }

        if (blank) {
            newPW_inner.innerHTML = "";
            return false;
        }

        if (overlap == false && missMatch == false && blank == false) {
            newPW_inner.innerHTML = "사용할 수 있는 비밀번호 입니다!";
            newPW_inner.style.color = "green";
            return false;
        } else {
            newPW_inner.innerHTML = "";
        }

    }
</script>
</html>
