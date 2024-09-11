<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/header/header.jsp" %>
<%@ include file="/WEB-INF/views/header/headerModal.jsp" %>
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
    <title>Title</title>
    <style>

        body, html, main {
            height: auto;
            overflow: auto;
        }

        .category-main-container {
            display: flex;
            justify-content: start;
            flex-direction: column;
            align-items: center;
            width: 100%;
        }

        .category-request-keyword {
            color: black;
            font-size: 40px;
        }

        .category-request-keyword-container {
            width: 100%;
            height: 60px;
            display: flex;
            align-self: start;
            justify-content: start;
            padding-bottom: 20px;
            border-bottom: 1px solid #888888;
        }

        .category-left {
            width: 200px;
            padding: 0 10px 0 0;
        }

        .category-right {
            width: 720px;
            padding-left: 30px;
            display: flex;
            flex-direction: column;
        }

        .category-section-keyword-container {
            width: 100%;
            display: flex;
            justify-content: start;
            align-items: start;
            height: 40px;
            padding-bottom: 50px;
        }

        .category-section-keyword {
            width: 500px;
            display: block;
            font-size: 30px;
            color: #333333;
        }

        .category-list-1 {
            height: 300px;
            display: flex;
            justify-content: start;
            flex-direction: column;
            align-items: start;
        }

        .category-list-1 li {
            font-size: 20px;
            align-self: center;
            width: 80%;
            padding-left: 20px;
        }

        .category-list-1 li a:hover {
            background-color: #ccc;
            cursor: pointer;
            border-color: #ccc;
            border-radius: 5px;
        }

        .category-container {
            margin-top: 60px;
        }

        .category-listAll {
            font-size: 24px;
            color: black;
        }

        .category-listAll-container {
            padding-bottom: 12px;
        }

        .category-right-section-keyword-container {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .category-list-2 {
            height: 500px;
            display: flex;
            justify-content: start;
            flex-direction: column;
            align-items: center;
        }

        .category-list-2 li {
            font-size: 20px;
            align-self: center;
            width: 80%;
            padding-bottom: 10px;
        }

        .category-list-2 li a:hover {
            background-color: #ccc;
            cursor: pointer;
            border-color: #ccc;
            border-radius: 5px;
        }

        .category-right-section-container {
            width: 720px;
            height: 720px;
            display: grid;
            grid-template-columns: repeat(3, 240px);
        }

        .category-right-section-sub-container {
            width: 240px;
            height: 240px;
            padding-bottom: 60px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-direction: column;
        }

        ul, li {
            margin: 0;
            padding: 0;
            list-style-type: none;
        }

        /* 추가 스타일 설정 */
        .category-list-2 {
            padding: 0;
            margin: 0;
        }

        .category-list-2 li {
            padding: 8px 12px;
        }

        .category-list-2 a {
            text-decoration: none;
            color: #333;
        }

        .category-list-2 a:hover {
            color: #007bff;
        }

        .category-list2-other {
            width: 100%;
            display: grid;
            grid-template-columns: repeat(6, 120px);
        }

        .category-list2-other-keyword-container {
            width: 720px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .category-list2-other-keyword {
            color: #1AA69D;
            font-size: 24px;
            padding-bottom: 20px;
        }

        .category-other-link {
            width: 120px;
            height: auto;
            padding: 0;

        }

        .category-name-word {
            color: #1AA69D;
            font-size: 24px;
            padding-bottom: 20px;
        }

        .category-list-2-sub-container {
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        .otherwise-control {
            width: 100%;
        }

        .otherwise-control li {
            display: flex;
            justify-content: start;
            padding-left: 100px;
            height: 40px;
            padding-bottom: 10px;
        }

        .otherwise-control li a {
            font-size: 30px;
        }

        .api-alink:hover {
            cursor: pointer;
            background-color: #888888;
            border-radius: 5px;
        }

        .clear-right {
            margin-bottom: 30px;
        }
        .other-category-container {
            width: 100%;
            display: flex;
            justify-content: end;
            align-items: end;
        }

        .category-for-ul  li{
            text-align: left;
            padding: 8px 4px 8px 4px;
        }

    </style>
</head>
<body>

<main>

    <div class="category-main-container">
        <div class="category-request-keyword-container">
            <span class="category-request-keyword">견적요청</span>

        </div>
        <div class="category-container">
            <div class="category-left">
                <div class="category-section-keyword-container">
                    <span class="category-section-keyword">대분류 카테고리</span>
                </div>
                <ul id="category-list-1" class="category-list-1">
                    <li class="category-listAll-container"><a href="#" id="listAll" class="category-listAll"
                                                              data-id="0">전체보기</a></li>
                    <c:forEach var="i1" items="${list}">
                        <li><a href="#" class="category-link" data-id="${i1.id}">${i1.categoryName}</a></li>
                    </c:forEach>
                </ul>
            </div>
            <div class="category-right">
                <div class="category-section-keyword-container category-right-section-keyword-container">
                    <span class="category-section-keyword">소분류 카테고리</span>
                </div>
                <div class="clear-right">
                    <%--        메인 섹션        --%>
                    <%--                    서브 섹션--%>
                    <c:choose>
                        <c:when test="${num == 0}">
                            <div class="category-right-section-container" id="category-right-section-container">
                            <c:forEach var="categoryPidTo0" items="${categoryPidTo0}">
                                <div class="category-right-section-sub-container">
                                    <div class="category-name-word">${categoryPidTo0.categoryName}</div>
                                    <ul id="category-list-2-main"
                                        class="category-list-2 category-listAll-ul category-for-ul">
                                        <c:forEach var="categoryId1To5" items="${categoryId1To5}">
                                            <c:if test="${categoryPidTo0.id == categoryId1To5.id}">
                                                <li><a href="#" class="category-link">${categoryId1To5.categoryName}</a>
                                                </li>
                                            </c:if>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div class="category-list-2-sub-container">
                                <ul id="category-list-2-sub" class="category-list-2 otherwise-control">
                                    <c:forEach var="item" items="${list2}">
                                        <!-- conditionA가 거짓일 때 처리할 내용 -->
                                        <li><a href="#" class="category-link api-alink">${item.categoryName}</a></li>
                                    </c:forEach>
                                </ul>
                            </div>
                            </div>
                        </c:otherwise>
                    </c:choose>

                </div>
            </div>
            <div></div>
            <div class="other-category-container">
                <div class="category-list2-other-container">
                    <div class="category-list2-other-keyword-container">
                        <span class="category-list2-other-keyword">기타 카테고리</span>
                    </div>
                    <ul id="category-list-2-other" class="category-list-2 category-listAll-ul category-list2-other">
                        <c:forEach var="categoryOther" items="${categoryOther}">
                            <li><a href="#" class="category-link category-other-link">${categoryOther.categoryName}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</main>
</body>
</html>
