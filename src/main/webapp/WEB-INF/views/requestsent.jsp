<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="header.jsp" %>
<!-- 페이지 내용 -->


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지 - 보낸 요청</title>
    <link rel="stylesheet" href="<c:url value='/css/styles.css' />">
</head>
<body>
<div class="container">
    <header class="header">
        <h1>내가 보낸 요청 목록</h1>
    </header>
    <div class="requests">
        <c:forEach var="request" items="${requests}">
            <div class="request-item">
                <p>요청 제목: ${request.sort}</p>
                <p>등록일: ${request.regDate}</p>
                <!-- 추가적인 요청 정보들을 여기에 표시 -->
            </div>
        </c:forEach>
        <a href="/userpage">되돌아가기</a>
    </div>
</div>
</body>
<%@ include file="footer.jsp" %>
</html>
