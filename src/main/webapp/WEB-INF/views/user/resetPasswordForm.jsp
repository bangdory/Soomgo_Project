<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../header/header.jsp" %>
<%@include file="../header/headerModal.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reset Password</title>
    <link href="${pageContext.request.contextPath}/resources/static/css/header/headerStyle.css" rel="stylesheet" type="text/css">

</head>
<body>
<main>
<h1>비밀번호 재설정</h1>
<form id="resetPasswordForm">
    <input type="hidden" id="token" name="token" value="${param.token}" />
    <label for="new_password">새 비밀번호:</label>
    <input type="password" id="new_password" name="new_password" required />
    <button type="submit">비밀번호 재설정</button>
</form>
</main>
<script src="${pageContext.request.contextPath}/resources/static/js/headerJS.js" type="text/javascript"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
    $(document).ready(function() {
        $("#resetPasswordForm").submit(function(event) {
            event.preventDefault();
            var token = $("#token").val();
            var newPassword = $("#new_password").val();
            $.ajax({
                url: "${pageContext.request.contextPath}/api/reset-password-confirm",
                method: "POST",
                data: { token: token, new_password: newPassword },
                success: function(response) {
                    alert(response);
                    window.location.href = "${pageContext.request.contextPath}/user/login"; // 비밀번호 변경 후 로그인 페이지로 리디렉션
                },
                error: function(xhr, status, error) {
                    alert("Error resetting password: " + xhr.responseText);
                }
            });
        });
    });
</script>
</body>
</html>
