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
    <script src="/resources/js/jquery.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        #totalBox {
            width: 800px;
            height: 800px;
            display: flex;
            border-radius: 40px;
            align-items: center;
            justify-content: center;
        }

        #formBox {
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

        #saveId, #savePassword, #saveMobile {
            width: 400px;
            height: 50px;
            border-radius: 20px;
            margin-top: 10px;
            margin-bottom: 30px;
            padding: 0px 20px;
            border: 2px solid lightgray;
            outline: none;
        }


        #idLabel, #passwordLabel, #mobileLabel {
            width: 400px;
            text-align: left;
            margin-top: 50px;
        }

        #saveBT {
            margin-top: 30px;
            border: 1px solid lightyellow;
            border-radius: 30px;
            outline: none;
            background: dodgerblue;
            color: white;
        }
    </style>
</head>
<body>
<jsp:include page="layout/header.jsp"></jsp:include>
<div class="container" id="totalBox">
    <div class="container" id="formBox">
        <form action="/user/save" method="post" name="newSaveForm">
            <div class="container" id="idLabel">
                <label for="saveId">아이디</label>
            </div>
            <div class="container">
                <input type="email" placeholder="ID" class="form-control" name="userId" id="saveId" onblur="id_check()">
                <span id="saveId_inner"></span>
            </div>

            <div class="container" id="passwordLabel">
                <label for="savePassword">비밀번호</label>
            </div>

            <div class="container">
                <input type="password" placeholder="PASSWORD" class="form-control" name="userPassword" id="savePassword"
                       onblur="pw_check()">
                <span id="savePW_inner"></span>
            </div>

            <div class="container" id="mobileLabel">
                <label for="saveMobile">전화번호</label>
            </div>
            <div class="container">
                <input type="text" placeholder="MOBILE" class="form-control" name="userMobile" id="saveMobile"
                       onblur="mobile_check()">
                <span id="saveMob_inner"></span>
            </div>

            <div class="container">
                <input type="button" value="회원가입" class="btn" onclick="userNewSave()" id="saveBT">
            </div>
        </form>
    </div>
</div>
</body>
<script>
    const checkExpMobile = /^\d{3}-\d{4}-\d{4}$/;
    const checkExpPW = /^[a-zA-Z\d-_!#]{1,30}$/

    const id_inner = document.getElementById("saveId_inner");


    const userNewSave = () => {

        const test = id_inner.innerHTML == "이미 사용중인 아이디 입니다.";
        const pw_regular = document.getElementById("savePassword").value;
        const mob_regular = document.getElementById("saveMobile").value;

        if (pw_regular.match(checkExpPW) && mob_regular.match(checkExpMobile) && !test) {
            document.newSaveForm.submit();
        } else if (test) {
            alert("중복된 아이디는 가입할 수 없습니다.");
            return false;
        } else if (!pw_regular.match(checkExpPW) || !mob_regular.match(checkExpMobile)) {
            alert("가입 정보를 확인하세요.");
            return false;
        }

    }

    const id_check = () => {
        const save_id = document.getElementById("saveId").value;


        if (save_id.length > 0) {
            $.ajax({
                type: "post",
                url: "/user/duplicateCheck",
                dataType: "text",
                data: {
                    saveId: save_id
                },
                success: function (result) {
                    if (result == "OK" && save_id == "admin") {
                        id_inner.innerHTML = "해당 아이디는 사용할 수 없습니다.";
                        id_inner.style.color = "red";
                    } else if (result == "NO") {
                        id_inner.innerHTML = "이미 사용중인 아이디 입니다.";
                        id_inner.style.color = "red";
                    } else if (result == "OK") {
                        id_inner.innerHTML = "사용가능한 아이디 입니다!";
                        id_inner.style.color = "green";
                    }
                },
                error: function () {
                    console.log("힝")
                }
            });
        } else if (save_id.length == 0) {
            id_inner.innerHTML = "사용하실 아이디를 입력해 주세요.";
            id_inner.style.color = "red";
            return false;
        } else {
            id_inner.innerHTML = "";
        }

    }

    const pw_check = () => {
        const save_pw = document.getElementById("savePassword").value;
        const pw_inner = document.getElementById("savePW_inner");

        if (!save_pw.match(checkExpPW)) {
            pw_inner.innerHTML = "특수문자는 !, -, _, #만 사용 가능합니다.";
            pw_inner.style.color = "red";
            return false;
        } else if (save_pw.length == 0) {
            pw_inner.innerHTML = "";
        } else {
            pw_inner.innerHTML = "사용할 수 있는 비밀번호 입니다.";
            pw_inner.style.color = "green";
        }

    }

    const mobile_check = () => {
        const save_mobile = document.getElementById("saveMobile").value;
        const mobile_inner = document.getElementById("saveMob_inner");

        if (!save_mobile.match(checkExpMobile)) {
            mobile_inner.innerHTML = "'-' 까지 정확하게 입력해 주세요.";
            mobile_inner.style.color = "red";
            return false;
        } else if (save_mobile.length == 0) {
            mobile_inner.innerHTML = "";
        } else {
            mobile_inner.innerHTML = "";
        }

    }
</script>
</html>
