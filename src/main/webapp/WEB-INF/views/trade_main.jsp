<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-21
  Time: 오후 3:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>trade_main</title>
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
        <li class="tab-button current" data-tab="tab-1">검색</li>
        <li class="tab-button" data-tab="tab-2" onclick="search_to_price()">시세</li>
        <li class="tab-button" data-tab="tab-3" onclick="search_to_wishList()">찜 목록</li>
        <li class="tab-button" data-tab="tab-4" onclick="search_to_sales()">판매</li>
        <li class="tab-button" data-tab="tab-5" onclick="search_to_completion()">완료</li>
    </ul>

    <section class="tab-section" id="tab-section-1">
        <div id="tab-1" class="tab-content current">
            <form action="/search/sale" role="search">
                <div class="input-group">
                    <select name="searchType" class="form-select">
                        <option name="itemName" value="itemName" selected>아이템 이름</option>
                        <option name="itemUnitPrice" value="itemUnitPrice">가격</option>
                        <option name="salesUserName" value="salesUserName">판매자</option>
                    </select>
                    <input type="search" name="q" class="form-control" placeholder="검색"
                           aria-label="Search">
                    <button class="btn btn-outline-primary">검색</button>
                </div>
            </form>

            <div class="container" id="searchResult">
                <table class="table">
                    <tr>
                        <th>카테고리</th>
                        <th>아이템 이름</th>
                        <th>가격</th>
                        <th>판매자</th>
                        <th>흥정여부</th>
                    </tr>
                    <c:forEach items="${itemList}" var="list">
                        <tr>
                            <td>${list.itemCategory}</td>
                            <td>${list.itemName}</td>
                            <td>${list.itemUnitPrice}</td>
                            <td>${list.salesUserName}</td>
                            <td>${list.itemBargain}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>

            <div class="container">
                <ul class="pagination justify-content-center">
                    <c:choose>
                        <c:when test="${paging.page == 1}">
                            <li class="page-item disabled">
                                <a class="page-link">＜</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item">
                                <a class="page-link" href="/item/mainPaging">＜</a>
                            </li>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${paging.page <= 1}">
                            <li class="page-item disabled">
                                <a class="page-link">이전</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item">
                                <a class="page-link" href="/item/mainPaging?page=${paging.page-1}">이전</a>
                            </li>
                        </c:otherwise>
                    </c:choose>

                    <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
                        <c:choose>
                            <c:when test="${i eq paging.page}">
                                <li class="active">
                                    <a class="page-link">${i}</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item">
                                    <a class="page-link" href="/item/mainPaging?page=${i}">${i}</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <c:choose>
                        <c:when test="${paging.page>=paging.maxPage}">
                            <li class="page-item disabled">
                                <a class="page-link">다음</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item">
                                <a class="page-link" href="/item/mainPaging?page=${paging.page+1}">다음</a>
                            </li>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${paging.page>=paging.maxPage}">
                            <li class="page-item disabled">
                                <a class="page-link"> ＞ </a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item">
                                <a class="page-link" href="/item/mainPaging?page=${paging.maxPage}"> ＞ </a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </section>
</div>
</body>
<script>
    const search_to_price = () => {
        location.href = "/trade/price";
    }

    const search_to_wishList = () => {
        location.href = "/trade/wishList";
    }

    const search_to_sales = () => {
        location.href = "/trade/sales";
    }

    const search_to_completion = () => {
        location.href = "/trade/completion";
    }

</script>
</html>
