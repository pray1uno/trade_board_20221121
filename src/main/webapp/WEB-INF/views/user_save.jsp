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
                <input type="text" placeholder="ID" class="form-control" name="userId" id="saveId" onblur="id_check()">
                <span id="saveId_inner"></span>
            </div>

            <div class="container" id="passwordLabel">
                <label for="savePassword">비밀번호</label>
            </div>

            <div class="container">
                <input type="text" placeholder="PASSWORD" class="form-control" name="userPassword" id="savePassword">
            </div>

            <div class="container" id="mobileLabel">
                <label for="saveMobile">전화번호</label>
            </div>
            <div class="container">
                <input type="text" placeholder="MOBILE" class="form-control" name="userMobile" id="saveMobile">
            </div>

            <div class="container">
                <input type="button" value="회원가입" class="btn" onclick="userNewSave()" id="saveBT">
            </div>
        </form>
    </div>
</div>
</body>
<script>
    const userNewSave = () => {
        document.newSaveForm.submit();
    }

    const id_check = () => {
        const save_id = document.getElementById("saveId").value;
        const id_inner = document.getElementById("saveId_inner");

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
        } else {
            id_inner.innerHTML = "";
        }

    }
</script>
</html>
