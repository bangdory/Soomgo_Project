<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="<c:url value='/css/styles.css' />">
</head>
<body>
<header>
    <h1>로그인 페이지</h1>
</header>
<div class="container">
    <main>
        <form action="<c:url value='/login' />" method="post">
            <label for="email">이메일:</label>
            <input type="email" id="email" name="email" required><br><br>
            <label for="password">비밀번호:</label>
            <input type="password" id="password" name="password" required><br><br>
            <button type="submit">로그인</button>
        </form>
    </main>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
