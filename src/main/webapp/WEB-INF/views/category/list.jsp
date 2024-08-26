<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--
  Created by IntelliJ IDEA.
  User: bemsu
  Date: 2024-08-07
  Time: 오후 2:25
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <link href="${pageContext.request.contextPath}/resources/static/css/header/headerStyle.css" rel="stylesheet"
          type="text/css">
    <link href="${pageContext.request.contextPath}/resources/static/css/category/category.css" rel="stylesheet"
          type="text/css">
    <script src="${pageContext.request.contextPath}/resources/static/js/headerJS.js"></script>
    <script src="${pageContext.request.contextPath}/resources/static/js/category/category.js"></script>

    <script src="list.jsp"></script>
    <title>Title</title>
    <style>

    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/header/header.jsp" %>
<main>

    <div class="container">
        <h1>견적요청</h1>
        <div class="category-container">
            <div class="category-left">
                <h2>대분류 카테고리</h2>
                <ul id="category-list-1">
                    <c:forEach var="i1" items="${list}">
                        <li><a href="#" class="category-link" data-id="${i1.id}">${i1.categoryName}</a></li>
                    </c:forEach>
                </ul>
            </div>
            <div class="category-right">
                <h2>소분류 카테고리</h2>
                <ul id="category-list-2">
                    <c:forEach var="i2" items="${list2}">
                        <li><a href="#">${i2.categoryName}</a></li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
    <%--    <div>--%>
    <%--        <h1>견적요청</h1>--%>
    <%--    </div>--%>

    <%--    <div>--%>
    <%--        <div class="categoryContainer">--%>
    <%--            <div class="categoryLeft">--%>
    <%--                <h2>대분류 카테고리</h2>--%>
    <%--                <br>--%>
    <%--                <ul id="category-list-1">--%>
    <%--                    <c:forEach var="i1" items="${list}">--%>
    <%--                        <li><a href="#" class="category-link" data-id="${i1.id}">${i1.categoryName}</a></li>--%>
    <%--                    </c:forEach>--%>
    <%--                </ul>--%>
    <%--            </div>--%>


    <%--            <br>--%>
    <%--            <div class="categoryRight" id="category-list2">--%>
    <%--                <h2>소분류 카테고리</h2>--%>
    <%--                <br>--%>
    <%--                <ul id="category-list-2">--%>
    <%--                    <c:forEach var="i2" items="${list2}">--%>
    <%--                        <li><a href="#">${i2.categoryName}</a></li>--%>
    <%--                    </c:forEach>--%>
    <%--                </ul>--%>
    <%--            </div>--%>
    <%--        </div>--%>
    <%--    </div>--%>
</main>

</body>
</html>
