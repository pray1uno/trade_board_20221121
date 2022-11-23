<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-23
  Time: 오전 8:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>trade_sales</title>
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
        <li class="tab-button" data-tab="tab-1" onclick="sales_to_search()">검색</li>
        <li class="tab-button" data-tab="tab-2" onclick="sales_to_price()">시세</li>
        <li class="tab-button" data-tab="tab-3" onclick="sales_to_wishList()">찜 목록</li>
        <li class="tab-button current" data-tab="tab-4">판매</li>
        <li class="tab-button" data-tab="tab-5" onclick="sales_to_completion()">완료</li>
    </ul>

    <section class="tab-section" id="tab-section-4">
        <div id="tab-4" class="tab-content current">
            <div class="container">
                <form action="/item/upload" method="post" name="salesItemUpload">
                    <table class="table">
                        <tr>
                        <tr>
                            <input type="hidden" value="${sessionScope.userLogin}" name="salesUserName">
                            <th>카테고리</th>
                            <td>
                                <select name="itemCategory" class="form-select">
                                    <option value="무기" selected>무기</option>
                                    <option value="방어구">방어구</option>
                                    <option value="장신구">장신구</option>
                                    <option value="소비">소비</option>
                                    <option value="기타">기타</option>
                                </select>
                            </td>
                            <th>아이템 이름</th>
                            <td><input type="text" name="itemName" class="form-control"></td>
                            <input type="button" class="btn btn-outline-primary" onclick="upload()"
                                   value="판매 등록" style="float: right">
                        </tr>
                        <th>수량</th>
                        <td><input type="text" name="itemCount" class="form-control" id="count"></td>
                        <th>가격</th>
                        <td><input type="text" name="itemUnitPrice" class="form-control" maxlength="14"
                                   id="price"></td>
                        <br>
                        <td>
                            <div class="form-check">
                                <input type="radio" class="form-check-input" name="itemBargain" id="itemBargain1"
                                       value="Y">
                                <label for="itemBargain1" class="form-check-label">흥정 가능</label>
                            </div>
                            <div class="form-check">
                                <input type="radio" class="form-check-input" name="itemBargain" id="itemBargain2"
                                       value="N">
                                <label for="itemBargain2" class="form-check-label">흥정 안 함</label>
                            </div>
                        </td>
                        </tr>
                    </table>
                </form>
            </div>

            <div>
                <table class="table">
                    <tr>
                        <span>|판매중인 아이템</span>
                    </tr>
                    <tr>
                        <th>아이템 이름</th>
                        <th>수량</th>
                        <th>가격</th>
                        <th>흥정여부</th>
                        <th>등록시간</th>
                        <th>판매취소</th>
                    </tr>
                    <c:forEach items="${mySalesList}" var="sales">
                        <tr>
                            <td>${sales.itemName}</td>
                            <td>${sales.itemCount}</td>
                            <td>${sales.itemUnitPrice}</td>
                            <td>${sales.itemBargain}</td>
                            <td><fmt:formatDate value="${sales.salesCreatedDate}"
                                                pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                            <td>
                                <button class="btn btn-close" onclick="sales_cancel(${sales.id})"></button>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>

            <div class="container">
                <ul class="pagination justify-content-center">
                    <c:choose>
                        <c:when test="${salePage.page == 1}">
                            <li class="page-item disabled">
                                <a class="page-link">＜</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item">
                                <a class="page-link" href="/trade/sales">＜</a>
                            </li>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${salePage.page <= 1}">
                            <li class="page-item disabled">
                                <a class="page-link">이전</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item">
                                <a class="page-link" href="/trade/sales?page=${salePage.page-1}">이전</a>
                            </li>
                        </c:otherwise>
                    </c:choose>

                    <c:forEach begin="${salePage.startPage}" end="${salePage.endPage}" var="i" step="1">
                        <c:choose>
                            <c:when test="${i eq salePage.page}">
                                <li class="active">
                                    <a class="page-link">${i}</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item">
                                    <a class="page-link" href="/trade/sales?page=${i}">${i}</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <c:choose>
                        <c:when test="${salePage.page>=salePage.maxPage}">
                            <li class="page-item disabled">
                                <a class="page-link">다음</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item">
                                <a class="page-link" href="/trade/sales?page=${paging.page+1}">다음</a>
                            </li>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${salePage.page>=salePage.maxPage}">
                            <li class="page-item disabled">
                                <a class="page-link"> ＞ </a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item">
                                <a class="page-link" href="/trade/sales?page=${paging.maxPage}"> ＞ </a>
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
    const price = document.querySelector('#price');
    price.addEventListener('keyup', function (e) {
        let value = e.target.value;
        value = Number(value.replaceAll(',', ''));

        if (isNaN(value)) {
            price.value = "";
        } else {
            const formatValue = value.toLocaleString('ko-KR');
            price.value = formatValue;
        }
    })

    const upload = () => {
        document.salesItemUpload.submit();

    }

    const sales_to_search = () => {
        location.href = "/trade/main";
    }

    const sales_to_price = () => {
        location.href = "/trade/price";
    }

    const sales_to_wishList = () => {
        location.href = "/trade/wishList";
    }

    const sales_to_completion = () => {
        location.href = "/trade/completion";
    }

    const sales_cancel = (result) => {
        if (confirm("해당 아이템의 등록을 취소 하시겠습니까?")) {
            if (true) {
                location.href = "/trade/cancel?id=" + result;
            }
            alert("등록취소 되었습니다.")
        }
    }

</script>
</html>
