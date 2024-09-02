<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<header>
    <h1>로그인 페이지</h1>
</header>
<div class="container">
    <main>
        <form id="loginForm" action="${pageContext.request.contextPath}/user/login" method="post">
            <label for="email">이메일:</label>
            <input type="email" id="email" name="email" required><br><br>
            <label for="password">비밀번호:</label>
            <input type="password" id="password" name="password" required><br><br>
            <button type="submit">로그인</button> <br>
            <a href="${pageContext.request.contextPath}/user/findUserEmail">ID 찾기</a><br>
            <a href="${pageContext.request.contextPath}/user/reset-password">비밀번호 찾기</a><br>
            <a href="${pageContext.request.contextPath}/user/signup">회원가입</a><br>
        </form>
    </main>
</div>

<!-- AJAX 로그인 처리 스크립트 -->
<script>
    $(document).ready(function() {
        $('#loginForm').submit(function(event) {
            event.preventDefault(); // 폼의 기본 제출을 막음

            var formData = $(this).serialize(); // 폼 데이터 직렬화

            $.ajax({
                type: 'POST',
                url: $(this).attr('action'),
                data: formData,
                success: function(response) {
                    // 로그인 성공 시 userpage로 이동
                    window.location.href = '${pageContext.request.contextPath}/index.jsp';
                },
                error: function(xhr, status, error) {
                    // 로그인 실패 시 에러 메시지 표시
                    alert("로그인에 실패했습니다. 이메일 또는 비밀번호를 확인하세요.");
                }
            });
        });
    });
</script>

<%@ include file="footer.jsp" %>
</body>
</html>