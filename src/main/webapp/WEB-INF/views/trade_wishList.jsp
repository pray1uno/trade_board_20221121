<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-23
  Time: 오전 8:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>trade_wishList</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
    <style>
        .container {
            width: 800px;
            margin: 0 auto;
        }

        ul.tabs {
            margin: 0px;
            padding: 0px;
            list-style: none;
            text-align: center;

        }

        ul.tabs li {
            background: none;
            color: #222;
            display: inline-block;
            padding: 10px 15px;
            cursor: pointer;
        }

        ul.tabs li.current {
            background: #ededed;
            color: #222;
        }

        .tab-content {
            display: none;
            background: #ededed;
            padding: 15px;
        }

        .tab-content.current {
            display: inherit;
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
    <ul class="tabs nav-justified">
        <li class="tab-button" data-tab="tab-1" onclick="wishList_to_search()">검색</li>
        <li class="tab-button" data-tab="tab-2" onclick="wishList_to_price()">시세</li>
        <li class="tab-button current" data-tab="tab-3">찜 목록</li>
        <li class="tab-button" data-tab="tab-4" onclick="wishList_to_sales()">판매</li>
        <li class="tab-button" data-tab="tab-5" onclick="wishList_to_completion()">완료</li>
    </ul>

     <section>
        <div id="tab-3" class="tab-content current">
            <div class="container">
                <table class="table">
                    <tr>
                        <th>카테고리</th>
                        <th>아이템 이름</th>
                        <th>가격</th>
                        <th>판매자</th>
                        <th>등록시간</th>
                    </tr>
                    <tr>
                        <td>여기에 찜 목록 갖다 박으면 됨</td>
                    </tr>
                </table>
            </div>
        </div>
    </section>
</div>
</body>
<script>
    const wishList_to_search = () => {
        location.href = "/trade/main";
    }

    const wishList_to_price = () => {
        location.href = "/trade/price";
    }

    const wishList_to_sales = () => {
        location.href = "/trade/sales";
    }

    const wishList_to_completion = () => {
        location.href = "/trade/completion";
    }
</script>
</html>
