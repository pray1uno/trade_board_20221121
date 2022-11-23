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
    <title>trade_search</title>
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
        <li class="tab-button" data-tab="tab-1" onclick="price_to_search()">검색</li>
        <li class="tab-button current" data-tab="tab-2">시세</li>
        <li class="tab-button" data-tab="tab-3" onclick="price_to_wishList()">찜 목록</li>
        <li class="tab-button" data-tab="tab-4" onclick="price_to_sales()">판매</li>
        <li class="tab-button" data-tab="tab-5" onclick="price_to_completion()">완료</li>
    </ul>

    <section class="tab-section" id="tab-section-2">
        <div id="tab-2" class="tab-content current">
            <form action="/search/soldOut" role="search">
                <div class="input-group">
                    <select name="searchType" class="form-select">
                        <option value="itemName" selected>아이템 이름</option>
                        <option value="itemUnitPrice">가격</option>
                        <option value="salesMemberName">판매자</option>
                    </select>
                    <input type="search" name="soldOut" class="form-control" placeholder="검색">
                    <button class="btn">검색</button>
                </div>
            </form>
            <div class="container">
                <table class="table">
                    <tr>
                        <th>카테고리</th>
                        <th>아이템 이름</th>
                        <th>가격</th>
                        <th>판매자</th>
                        <th>거래완료 시간</th>
                    </tr>
                    <tr>
                        <td>여기에 시세LIST 갖다 박으면 됨</td>
                    </tr>
                </table>
            </div>
        </div>
    </section>
</div>
</body>
<script>
    const price_to_search = () => {
        location.href = "/trade/main";
    }

    const price_to_wishList = () => {
        location.href = "/trade/wishList";
    }

    const price_to_sales = () => {
        location.href = "/trade/sales";
    }

    const price_to_completion = () => {
        location.href = "/trade/completion";
    }

</script>
</html>
