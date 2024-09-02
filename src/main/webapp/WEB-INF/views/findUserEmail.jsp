<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Email 찾기</title>
    <link rel="stylesheet" href="<c:url value='/css/styles.css' />">
</head>
<body>
<header>
    <h1>Email 찾기</h1>
</header>
<div class="container">
    <main>
        <form action="<c:url value='/user/findUserEmail' />" method="post">
            <label for="name">이름 입력:</label>
            <input type="text" id="name" name="name" required><br><br>

            <label for="phoneNumber">전화번호 입력:</label>
            <input type="text" id="phoneNumber" name="phoneNumber" required><br><br>

            <button type="submit">찾기</button>
        </form>

        <!-- 결과 표시 -->
        <c:if test="${not empty email}">
            <p>사용자 Email: ${email}</p>
        </c:if>
        <c:if test="${not empty error}">
            <p style="color: red;">${error}</p>
        </c:if>
    </main>
</div>
</body>
</html>
