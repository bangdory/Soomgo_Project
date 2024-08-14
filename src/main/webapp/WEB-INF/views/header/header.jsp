<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<link href="${pageContext.request.contextPath}/resources/static/css/header/headerStyle.css" rel="stylesheet">
<header class="header-first-container">
    <div class="header-second-container">
        <div class="header-third-container-1">
            <%-- 로고 --%>
            <div class="header-div">
                <a href="${pageContext.request.contextPath}/index.jsp">
                    <img src="${pageContext.request.contextPath}/resources/static/img/SoomgoIcon.png" alt="Logo">
                </a>
            </div>
            <%-- 견적 요청 --%>
            <div>
                <a href="${pageContext.request.contextPath}/request/category">견적 요청</a>
            </div>
            <%-- 고수 찾기 --%>
            <div>
                <a href="${pageContext.request.contextPath}/gosu/gosuFind">고수 찾기</a>
            </div>
            <%-- 마켓 --%>
            <div>
                <a href="#">마켓</a>
            </div>
            <%-- 커뮤니티 --%>
            <div>
                <a href="community/listAll">커뮤니티</a>
            </div>
        </div>
        <div class="header-third-container-2">
            <div>
                <a href="#">로그인</a>
            </div>
            <div>
                <a href="#">회원가입</a>
            </div>
            <div>
                <a href="#">고수가입</a>
            </div>
        </div>
    </div>
</header>