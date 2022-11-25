<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-21
  Time: 오후 4:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>user_myPage</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <style>
        #mpControl {
            display: flex;
        }

        #mpBT {
            width: 300px;
            height: 300px;
            margin-top: 100px;
            margin-left: 50px;
            padding: 20px 30px;
            font-size: xxx-large;
        }
    </style>
</head>
<body>
<jsp:include page="layout/header.jsp"></jsp:include>
<div class="container" id="mpControl">
    <button class="btn btn-outline-info" onclick="userMyUpdate()" id="mpBT">내 정보<br>수정</button>
</div>
</body>
<script>
    const userMyUpdate = () => {
        location.href = "/user/toUpdate";
    }

</script>
</html>
