<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<header class="header-first-container">
    <div class="header-second-container">
        <div class="header-third-container-1">
            <%-- 일정 크기 이하로 내려가면 좌측 탭 생성 --%>
            <div class="header-categoryTap-div">
                <div id="header-modal-tap">
                    <i class="bi bi-list font-large"></i>
                </div>
            </div>
            <%-- 로고 --%>
            <div class="header-logo-div">
                <a href="${pageContext.request.contextPath}/index.jsp">
                    <img src="${pageContext.request.contextPath}/resources/static/img/SoomgoIcon_2.png" alt="Logo">
                </a>
            </div>
            <%-- 견적 요청 --%>
            <div class="header-link-div">
                <a href="${pageContext.request.contextPath}/request/category">견적 요청</a>
            </div>
            <%-- 고수 찾기 --%>
                <div class="header-link-div">
                <a href="${pageContext.request.contextPath}/expert/expertFind">고수 찾기</a>
            </div>
            <%-- 마켓 --%>
                <div class="header-link-div">
                <a href="#">마켓</a>
            </div>
            <%-- 커뮤니티 --%>
                <div class="header-link-div">
                <a href="#">커뮤니티</a>
            </div>
        </div>
        <div class="header-third-container-2">
            <div class="header-link-div">
                <a href="#">로그인</a>
            </div>
            <div class="header-link-div">
                <a href="#">회원가입</a>
            </div>
            <div class="header-link-div">
                <a href="#">고수가입</a>
            </div>
        </div>
    </div>
</header>