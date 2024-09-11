<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/header/header.jsp" %>
<link href="${pageContext.request.contextPath}/resources/static/css/header/headerStyle.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/userpage/styles.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>

</head>
<body>

<div class="container">
    <main>
        <c:if test="${not empty errorMessage}">
            <div class="error-message">${errorMessage}</div>
        </c:if>
        <form action="<c:url value='/login' />" method="post">
            <label for="email">이메일:</label>
            <input type="email" id="email" name="email" required><br><br>
            <label for="password">비밀번호:</label>
            <input type="password" id="password" name="password" required><br><br>
            <button type="submit">로그인</button>
        </form>
    </main>
</div>

</body>
</html>
