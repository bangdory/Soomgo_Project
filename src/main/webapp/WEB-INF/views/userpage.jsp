<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <link rel="stylesheet" href="<c:url value='/css/styles.css' />">
</head>
<body>
<div class="container">
    <header class="header">

    </header>
    <div class="profile">
        <p>이름 : ${user.user_name} </p>
        <p>이메일: ${user.user_email}</p>
        <p>회원 유형: ${user.user_type}</p>
    </div>
</div>
</body>
</html>
