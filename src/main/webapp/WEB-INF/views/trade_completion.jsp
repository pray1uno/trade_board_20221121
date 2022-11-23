<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-23
  Time: 오전 8:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>trade_completion</title>
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
        <li class="tab-button" data-tab="tab-1" onclick="completion_to_search()">검색</li>
        <li class="tab-button" data-tab="tab-2" onclick="completion_to_price()">시세</li>
        <li class="tab-button" data-tab="tab-3" onclick="completion_to_wishList()">찜 목록</li>
        <li class="tab-button" data-tab="tab-4" onclick="completion_to_sales()">판매</li>
        <li class="tab-button current" data-tab="tab-5">완료</li>
    </ul>

    <section>
        <div id="tab-5" class="tab-content current">
            <div class="container">
                <table class="table">
                    <tr>
                        <th>카테고리</th>
                        <th>아이템 이름</th>
                        <th>가격</th>
                        <th>거래 결과</th>
                        <th>거래완료 시간</th>
                    </tr>
                    <tr>
                        <td>여기에 완료 갖다 박으면 됨</td>
                    </tr>
                </table>
            </div>
        </div>
    </section>
</div>
</body>
<script>
    const completion_to_search = () => {
        location.href = "/trade/main";
    }

    const completion_to_price = () => {
        location.href = "/trade/price";
    }

    const completion_to_wishList = () => {
        location.href = "/trade/wishList";
    }

    const completion_to_sales = () => {
        location.href = "/trade/sales";
    }
</script>
</html>
