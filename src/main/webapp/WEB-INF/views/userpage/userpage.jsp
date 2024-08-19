<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/header/header.jsp" %>
<!-- 페이지 내용 -->

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사용자 페이지</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/userpage/styles.css">
</head>
<body>

<div class="container">
    <main>
        <div class="userpage">
            <h1>마이페이지</h1>


            <div class="sub-container">
                <div class="profile-card">
                    <div class="profile-header">

                        <%--이미지 들어갈거
                         <img src="<c:url value='/images/profile-placeholder.png' />" alt="Profile Picture" class="profile-picture">
                         --%>
                    </div>
                    <div class="profile-details">
                        <p><strong>닉네임:</strong> ${userprofile.user_nickname}</p>
                        <p><strong>이메일:</strong> ${user.user_email}</p>


                    </div>
                    <a href="<c:url value='/userpage/account_info' />">프로필 수정</a>
                    <a href="/requestsent">견적 보기</a>
                    <a href="/logout">로그아웃</a>
                </div>
            </div>
        </div>
    </main>
</div>
</body>

</html>
