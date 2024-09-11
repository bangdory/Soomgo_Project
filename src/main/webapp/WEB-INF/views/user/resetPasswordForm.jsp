<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../header/header.jsp" %>
<%@include file="../header/headerModal.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reset Password</title>
    <link href="${pageContext.request.contextPath}/resources/static/css/header/headerStyle.css" rel="stylesheet"
          type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        .reset-password-form-container {
            border: 1px solid #888888;
            border-radius: 15px;
            width: 500px;
            height: 300px;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        .reset-password-form {
            width: 100%;
            height: 300px;
            display: flex;
            justify-content: start;
            align-items: center;
            flex-direction: column;
        }

        .btn-primary {
            border: 1px solid #1AA69D;
            color: white;
            background-color: #1AA69D;
            width: 70%;
        }

        .btn-primary:hover {
            background-color: #1AA69D;
            border: 1px solid #1AA69D;
            filter: brightness(0.8);
        }
        .reset-password-form-keyword-container {
            width: 100%;
            height: 100px;
            padding: 50px 0 50px 0;
            display: flex;
            justify-content: center;
            align-self: center;
        }

        .reset-password-form-keyword {
            font-size: 40px;
            color: #1AA69D;
        }

        .reset-password-item {
            width: 65%;
            display: flex;
            justify-content: space-between;
            align-self: center;
            padding: 50px 0 0 0;

        }

        .regexp-reward {
            display: flex;
            justify-content: start;
            align-self: start;
            padding-left: 30px;
            padding-bottom: 10px;
            font-size: 10px;
        }
        .regexp-reward-container {
            width: 100%;
            display: flex;
            justify-content: center;
            align-self: start;
            padding-bottom: 50px;
            padding-top: 5px;

        }
    </style>
</head>
<body>
<main>
    <div class="reset-password-form-container">
        <div class="reset-password-form-keyword-container">
        <span class="reset-password-form-keyword">비밀번호 재설정</span>
        </div>
        <form id="resetPasswordForm" class="reset-password-form">
            <input type="hidden" id="token" name="token" value="${param.token}"/>
            <div class="reset-password-item">
                <label for="new_password">새 비밀번호</label>
                <input type="password" id="new_password" name="new_password" required/>
            </div>
            <div class="regexp-reward-container">
            <span class="regexp-reward" id="pwd-regexp-reward">대문자 1개, 특수 문자 1개, 숫자 3개를 포함한 8 ~ 16글자</span>
            </div>
            <button type="submit" class="btn btn-primary">비밀번호 재설정</button>
        </form>
    </div>
</main>
<script src="${pageContext.request.contextPath}/resources/static/js/headerJS.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/user/regex.js" type="text/javascript"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
    $(document).ready(function () {
        $("#resetPasswordForm").submit(function (event) {
            event.preventDefault();
            var token = $("#token").val();
            var newPassword = $("#new_password").val();
            $.ajax({
                url: "${pageContext.request.contextPath}/api/reset-password-confirm",
                method: "POST",
                data: {token: token, new_password: newPassword},
                success: function (response) {
                    alert(response);
                    window.location.href = "${pageContext.request.contextPath}/user/login"; // 비밀번호 변경 후 로그인 페이지로 리디렉션
                },
                error: function (xhr, status, error) {
                    alert("Error resetting password: " + xhr.responseText);
                }
            });
        });
    });

    document.addEventListener('DOMContentLoaded', function () {

        document.getElementById('new_password').addEventListener('input', function () {

            const pwd = document.getElementById('new_password').value;

            var validPwd = validatePwdRegexp(pwd);

            if (pwd === '') {
                document.getElementById('pwd-regexp-reward').textContent = '대문자 1개, 특수 문자 1개, 숫자 3개를 포함한 8 ~ 16글자';
                document.getElementById('pwd-regexp-reward').style.color = 'black';
            }else if (validPwd) {
                document.getElementById('pwd-regexp-reward').textContent = '적합한 비밀번호입니다.';
                document.getElementById('pwd-regexp-reward').style.color = '#1AA79D';
            } else {
                document.getElementById('pwd-regexp-reward').textContent = '적합하지 않은 비밀번호입니다.';
                document.getElementById('pwd-regexp-reward').style.color = 'red';
            }

        });

    });
</script>
</body>
</html>
