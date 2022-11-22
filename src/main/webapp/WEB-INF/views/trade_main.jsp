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
        <li class="tab-button" data-tab="tab-2">시세</li>
        <li class="tab-button" data-tab="tab-3">찜 목록</li>
        <li class="tab-button" data-tab="tab-4">판매</li>
        <li class="tab-button" data-tab="tab-5">완료</li>
    </ul>

    <section class="tab-section" id="tab-section-1">
        <div id="tab-1" class="tab-content current">
            <form action="/search/sale" role="search">
                <div class="input-group">
                    <select name="searchType" class="form-select">
                        <option value="itemName" selected>아이템 이름</option>
                        <option value="itemUnitPrice">가격</option>
                        <option value="salesMemberName">판매자</option>
                    </select>
                    <input type="search" name="q" class="form-control" placeholder="검색">
                    <button class="btn">검색</button>
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

    <section class="tab-section" id="tab-section-2">
        <div id="tab-2" class="tab-content">
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

    <section>
        <div id="tab-3" class="tab-content">
            찜목록 임시내용
        </div>
    </section>

    <section class="tab-section" id="tab-section-4">
        <div id="tab-4" class="tab-content">
            <div class="container">
                <form action="/item/upload" method="post" name="registration">
                    <table class="table">
                        <tr>
                        <tr>
                            <th>카테고리</th>
                            <td>
                                <select name="itemCategory" class="form-select">
                                    <option value="itemCategory" selected>무기</option>
                                    <option value="itemCategory">방어구</option>
                                    <option value="itemCategory">장신구</option>
                                    <option value="itemCategory">소비</option>
                                    <option value="itemCategory">기타</option>
                                </select>
                            </td>
                            <input type="button" class="btn btn-outline-primary"
                                   value="판매 등록" style="float: right">
                        </tr>
                        <th>아이템 이름</th>
                        <td><input type="text" name="itemName" class="form-control"></td>
                        <th>가격</th>
                        <td><input type="text" name="itemPrice" class="form-control" maxlength="14" id="price"></td>
                        <br>
                        <td>
                            <div class="form-check">
                                <input type="radio" class="form-check-input" name="itemBargain" id="itemBargain1">
                                <label for="itemBargain1" class="form-check-label">흥정 가능</label>
                            </div>
                            <div class="form-check">
                                <input type="radio" class="form-check-input" name="itemBargain" id="itemBargain2">
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
                        <th>가격</th>
                        <th>개당가격</th>
                        <th>흥정여부</th>
                        <th>등록시간</th>
                    </tr>
                    <tr>
                        <td>자동리스트_아이템네임</td>
                        <td>자동리스트_가격</td>
                        <td>자동리스트_개당가격</td>
                        <td>자동리스트를 어케하지</td>
                        <td>자동리스트_등록시간</td>
                    </tr>
                </table>
            </div>
        </div>
    </section>

    <section>
        <div id="tab-5" class="tab-content">
            완료 임시내용
        </div>
    </section>
</div>
</body>
<script>
    $(document).ready(function () {

        $('ul.tabs li').click(function () {
            const tab_id = $(this).attr('data-tab');

            $('ul.tabs li').removeClass('current');
            $('.tab-content').removeClass('current');

            $(this).addClass('current');
            $("#" + tab_id).addClass('current');
        })
    })

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
</script>
</html>
