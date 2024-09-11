<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../header/header.jsp" %>
<%@include file="../header/headerModal.jsp" %>
<link href="${pageContext.request.contextPath}/resources/static/css/header/headerStyle.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/userpage/userpage.css">

<!-- 페이지 내용 -->

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/user/userpage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/header/headerStyle.css">
</head>>
<body>

<main>
    <%@ include file="/WEB-INF/views/header/header.jsp" %>
    <div class="container">
        <div class="userpage">
            <h1>마이페이지</h1>


            <div class="user-card">
                <div class="user-img">
                    <img src="${pageContext.request.contextPath}/resources/static<c:out value='${userprofile.profile_img != null ? userprofile.profile_img : "default.png"}' />"
                         alt="Profile Image">

                </div>
                <div class="user-details">
                    <p><strong>${userprofile.user_nickname} 고객님</strong></p>
                    <p>${user.user_email}</p>
                </div>
                <div class="user-details2">
                    <a href="${pageContext.request.contextPath}/userpage/account_info"><p>프로필수정</p></a>
                </div>
            </div>
            <div class="user-menu">
                <p><strong>숨고페이</strong></p>
                <a href="/#">
                    <div class="sub-menu">숨고페이 거래내역</div>
                </a>
            </div>
            <div class="user-menu">
                <p><strong>고수찾기</strong></p>
                <a href="/#">
                    <div class="sub-menu">찜한고수</div>
                </a>
            </div>
            <div class="user-menu">
                <p class="menu-title">숨고 캐시</p>
                <a href="/#">
                    <div class="sub-menu">스토어</div>
                </a>
                <a href="/#">
                    <div class="sub-menu">충전/사용 내역</div>
                </a>
            </div>
            <div class="user-menu">
                <p class="menu-title">마켓</p>
                <a href="/#">
                    <div class="sub-menu">구매내역</div>
                </a>
                <a href="/#">
                    <div class="sub-menu">문의내역</div>
                </a>
            </div>
            <div class="user-menu">
                <p><strong>커뮤니티</strong></p>
                <a href="/#">
                    <div class="sub-menu">숨고생활 작성글/댓글</div>
                </a>
            </div>
            <div class="user-menu">
                <p><strong>설정</strong></p>
                <a href="/#">
                    <div class="sub-menu">알림</div>
                </a>
                <a href="/#">
                    <div class="sub-menu">공지사항</div>
                </a>
                <a href="/#">
                    <div class="sub-menu">숨고안내</div>
                </a>
            </div>
        </div>
    </main>
</div>
<script src="${pageContext.request.contextPath}/resources/static/js/headerJS.js" type="text/javascript"></script>
</body>

</html>
