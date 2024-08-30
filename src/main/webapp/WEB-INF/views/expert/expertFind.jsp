<%--
  Created by IntelliJ IDEA.
  User: bemsu
  Date: 2024-08-08
  Time: 오전 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <link href="${pageContext.request.contextPath}/resources/static/css/header/headerStyle.css" rel="stylesheet"
          type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="${pageContext.request.contextPath}/resources/static/css/expert/modalStyle.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/static/css/expert/expertStyle.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.0/font/bootstrap-icons.min.css">
    <script src="${pageContext.request.contextPath}/resources/static/js/headerJS.js"></script>
    <script src="${pageContext.request.contextPath}/resources/static/js/expert/expert.js"></script>

    <title>Title</title>
</head>
<body>
<%@include file="../header/header.jsp" %>
<main>
    <div class="gosu-main-container">
        <div class="gosu-keyword">
            <h1>고수찾기</h1>
        </div>
        <div class="gosu-modal-tap">
            <div class="gosu-service-modal" id="gosu-service-modal">
                <div id="service-modal-open" class="service-modal-opener">
                    서비스 <i class="bi bi-chevron-down"></i>
                </div>
            </div>
            <div class="gosu-place-modal" id="gosu-place-modal">
                <div id="place-modal-open" class="place-modal-opener">
                    지역 <i class="bi bi-chevron-down"></i>
                </div>
            </div>

        </div>
        <%--    하부 섹션    --%>
        <div class="gosu-list-main-container">
            <%--     하부 서브 섹션       --%>
            <div class="gosu-list-sub-container">
                <%--       데이터 섹션 (modal - fetch 데이터 갱신)        --%>
                <div class="gosu-list-container" id="gosu-list">
                    <div class="gosu-list-sub-container">
<%--                        <c:forEach items="${ExpertList}" var="expertList">--%>
<%--                            <a href="#" class="gosu-list-item-link">--%>
<%--                                <div class="gosu-list-item-group" data-rating="${expertList.rating}">--%>
<%--                                    <div class="gosu-list-item gosu-img">--%>
<%--                                        <img src="${pageContext.request.contextPath}/resources/static/img/1.jpg">--%>
<%--                                    </div>--%>
<%--                                    <div class="gosu-item-contents">--%>
<%--                                        <div class="gosu-list-item gosu-name">고수 이름 예정</div>--%>
<%--                                        <div class="gosu-list-item gosu-experience">고수의 experienceYears: ${expertList.experienceYears}</div>--%>
<%--                                        <div class="gosu-list-item gosu-rating">--%>
<%--                                            <div class="rating">--%>
<%--                                                <i class="fa fa-star star"></i>--%>
<%--                                                <i class="fa fa-star star"></i>--%>
<%--                                                <i class="fa fa-star star"></i>--%>
<%--                                                <i class="fa fa-star star"></i>--%>
<%--                                                <i class="fa fa-star star"></i>--%>
<%--                                                <span class="gosu-rating">(${expertList.rating})</span>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div class="gosu-list-item gosu-content">고수 소개 내용 예정</div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </a>--%>
<%--                        </c:forEach>--%>

                        <c:forEach items="${ExpertList}" var="expertList">
                                <a class="gosu-list-item-group" data-rating="${expertList.rating}" href="/expert/expertDetail/${expertList.expertNum}">
                                    <div class="gosu-list-item gosu-img">
                                        <img src="${pageContext.request.contextPath}/resources/static/img/1.jpg">
                                    </div>
                                    <div class="gosu-item-contents">
                                        <div class="gosu-list-item gosu-name">고수 이름 예정</div>
                                        <div class="gosu-list-item gosu-experience">고수의 experienceYears
                                            : ${expertList.experienceYears}</div>
                                        <div class="gosu-list-item gosu-rating">
                                            <div class="rating">
                                                <i class="fa fa-star star"></i>
                                                <i class="fa fa-star star"></i>
                                                <i class="fa fa-star star"></i>
                                                <i class="fa fa-star star"></i>
                                                <i class="fa fa-star star"></i>
                                                <span class="gosu-rating">(${expertList.rating})</span>
                                            </div>
                                        </div>
                                        <div class="gosu-list-item gosu-content">고수 소개 내용 예정</div>
                                    </div>
                                </a>
                        </c:forEach>

                    </div>
                </div>
            </div>
        </div>
        <%--    페이징처리    --%>
        <div class="paging-container">
            <ul id="paging-list">
                <c:if test="${currentPage > 1}">
                    <li><a href="#" data-page="${currentPage - 1}">이전</a></li>
                </c:if>
                <c:forEach begin="1" end="${totalPages}" var="page">
                    <li>
                        <c:choose>
                            <c:when test="${page == currentPage}">
                                <strong>${page}</strong>
                            </c:when>
                            <c:otherwise>
                                <a href="#" data-page="${page}">${page}</a>
                            </c:otherwise>
                        </c:choose>
                    </li>
                </c:forEach>
                <c:if test="${currentPage < totalPages}">
                    <li><a href="#" data-page="${currentPage + 1}">다음</a></li>
                </c:if>
            </ul>
        </div>
        <%-- 페이징 처리 종료 --%>
    </div>
</main>
<%@include file="expertModal.jsp" %>
</body>
</html>