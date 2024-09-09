<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div id="modal-overlay">
    <div id="header-modal-main-container">
        <div id="header-modal-sub-container">

            <%-- 닫기 창 --%>

            <div>
                <button id="header-modal-close-btn">X</button>
            </div>

            <%-- 로그인 --%>
            <div id="header-modal-link-container">
                <div class="header-modal-line">로그인 해주세요</div>
                <div class="header-modal-line">
                    <a href="${pageContext.request.contextPath}/user/login">
                    로그인 >
                    </a>
                </div>
            </div>
            <%-- 고수가입 / 회원가입 --%>
            <div id="header-modal-link-container">
                <div class="header-modal-link-div header-modal-line"><a href="#">고수가입</a></div>
                <div class="header-modal-link-div header-modal-line"><a href="${pageContext.request.contextPath}/user/signup">회원가입</a></div>
            </div>
            <%-- 견적요청 / 고수찾기 / 마켓 / 커뮤니티 --%>
            <div id="header-modal-link-container">
                <div class="header-modal-link-div header-modal-line"><a href="${pageContext.request.contextPath}/request/category">견적요청</a></div>
                <div class="header-modal-link-div header-modal-line"><a href="${pageContext.request.contextPath}/expert/expertFind">고수찾기</a></div>
                <div class="header-modal-link-div header-modal-line"><a href="#">마켓</a></div>
                <div class="header-modal-link-div header-modal-line"><a href="${pageContext.request.contextPath}/community/listAll">커뮤니티</a></div>
            </div>
        </div>
    </div>
</div>