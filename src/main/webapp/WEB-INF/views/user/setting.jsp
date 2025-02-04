<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/header/header.jsp" %>

<!-- 페이지 내용 -->

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>계정 정보</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/userpage/setting.css">
</head>
<body>

<div class="container">
    <main>
        <div class="setting">

            <h1>개인정보 관리</h1>

            <div class="setting-menu">
                <p>휴대전화 번호</p>
                <p> ${user.user_phonenum} </p>
            </div>
            <div class="setting-menu">
                <p>이메일</p>
                <p> ${user.user_email} </p>
            </div>

            <div class="setting-menu">
                <p>비밀번호</p>
                <p> ${user.user_password} </p>
            </div>


        </div>
    </main>
</div>
</body>

</html>
