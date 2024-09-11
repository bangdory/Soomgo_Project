<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../header/header.jsp" %>
<%@include file="../header/headerModal.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/header/headerStyle.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>
        main {
            padding-top: 10px;
        }

        .loginForm-container {
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .loginForm-sub-container {
            width: 500px;
            height: 500px;
            border-radius: 10px;
            border: 1px solid #aaaaaa;
            padding-top: 20px;
        }

        #loginForm {
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        .loginForm-title {
            padding-top: 1px;
            width: 100%;
            height: 100px;
            text-align: center;
        }

        .loginForm-title-img {
            width: 220px;
            height: auto;
        }

        .loginForm-input-first {
            width: 100%;
            display: flex;
            flex-direction: column;
        }

        .loginForm-input-item-email {
            width: 300px;
            height: 30px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-grow: 1; /* 자식 요소가 가능한 공간을 자동으로 채우도록 설정 */
        }

        .loginForm-input-item-password {
            width: 300px;
            height: 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 0 auto;
            flex-grow: 1; /* 자식 요소가 가능한 공간을 자동으로 채우도록 설정 */
        }

        #email, #password {
            width: 200px;
            height: 30px;
        }

        #loginForm {
            gap: 10px;
            display: flex;
            justify-content: start;
            align-items: center;
            padding-top: 70px;
        }

        .loginForm-Link_container {
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
        }

        .loginBtn {
            width: 180px;
            height: 35px;
            font-size: 15px;
            border: 1px solid #aaaaaa;
            background-color: #1AA69D;
            border-radius: 5px;
            color: white;
        }

        .loginBtn:hover {
            filter: brightness(0.8);
        }

        .loginForm-Link_container-items {
            padding-bottom: 5px;
            font-size: 14px;
            color: #888888;
        }

        .loginForm-Link_container-items:hover {
            filter: brightness(0.6);
        }

        .loginForm-input-style {
            border: 1px solid #888888;
            border-radius: 5px;
            background-color: #ffffff;
        }

        .login-google-btn-container,
        .login-kakao-btn-container {
            padding: 0;
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-google-btn {
            width: 180px;
            height: 35px;
            font-size: 15px;
            border: 1px solid #aaaaaa;
            background-color: #1AA69D;
            border-radius: 5px;
            color: white;
        }

        .login-kakao-btn {
            width: 180px;
            height: 35px;
            font-size: 15px;
            border: 1px solid #aaaaaa;
            background-color: #1AA69D;
            border-radius: 5px;
            color: white;
        }

        .gray-font {
            color: #888888;
        }

        .regexp-reward-container {
            width: 100%;
            height: 12px;
            display: flex;
            justify-content: center;
            align-self: center;
            padding-bottom: 10px;
        }

        .social-icon {
            padding-right: 2px;
        }

        .login-google-btn {
            background-color: white;
            border: 1px solid #bbbbbb;
            color: black;
        }

        .login-google-btn:hover {
            filter: brightness(0.8);
        }

        .login-kakao-btn {
            background-color: #FEE500;
            border: 1px solid #FEE500;
            color: black;
        }

        .login-kakao-btn:hover {
            filter: brightness(0.8);
        }

        .regexp-reward {
            font-size: 10px;
            color: #888888;
            padding-top: 3px;
        }

        .failed-message-container {
            width: 100%;
            display: flex;
            justify-content: center;
            align-self: center;
        }

        .failed-message {
            font-size: 12px;
            color: red;
        }

        .failed-message-container {
            width: 100%;
            height: 12px;
            display: flex;
            justify-content: center;
            align-self: center;
            padding-bottom: 10px;
        }

        #regexp-reward-email {
            padding-left: 30px;
        }



    </style>
</head>
<body>
<main>
    <div class="loginForm-container">
        <div class="loginForm-sub-container">
            <div class="loginForm-title">
                <img class="loginForm-title-img"
                     src="${pageContext.request.contextPath}/resources/static/img/SoomgoIcon_2.png">
            </div>
            <form id="loginForm" action="${pageContext.request.contextPath}/user/login" method="post">
                <div class="loginForm-input-first">
                    <div class="loginForm-input-item-email">
                        <label for="email">이메일</label>
                        <input class="loginForm-input-style" type="text" id="email" name="email" placeholder="example@soomgo.com" required>
                    </div>
                    <div class="regexp-reward-container">
                    <span class="regexp-reward" id="regexp-reward-email"></span>
                    </div>
                    <div class="loginForm-input-item-password">
                        <label for="password">비밀번호</label>
                        <input class="loginForm-input-style" type="password" id="password" name="password" required>
                    </div>
                    <div class="regexp-reward-container">
                        <span class="regexp-reward" id="regexp-reward-password"></span>
                    </div>
                </div>
                <div class="failed-message-container">
                    <span class="failed-message"></span>
                </div>
                <button class="loginBtn" type="submit">로그인</button>
                <div class="loginForm-Link_container">
                    <a class="loginForm-Link_container-items"
                       href="${pageContext.request.contextPath}/user/signup">회원가입</a> <span class="gray-font">|</span>
                    <a class="loginForm-Link_container-items"
                       href="${pageContext.request.contextPath}/user/findUserEmail">ID 찾기</a><span
                        class="gray-font">|</span>
                    <a class="loginForm-Link_container-items"
                       href="${pageContext.request.contextPath}/user/reset-password">비밀번호 찾기</a>
                </div>
                <div class="login-google-btn-container">
                    <button class="login-google-btn">
                        <span class="social-icon">
                        <i class="bi bi-google"></i>
                        </span>
                        Google
                    </button>
                </div>
                <div class="login-kakao-btn-container">
                    <button class="login-kakao-btn">
                        <span class="social-icon">
             <i class="bi bi-chat-fill"></i>
                        </span>
                        Kakao
                    </button>
                </div>
            </form>
        </div>

    </div>
</main>

<!-- AJAX 로그인 처리 스크립트 -->
<script src="${pageContext.request.contextPath}/resources/static/js/headerJS.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/user/regex.js" type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function () {
        $('#loginForm').submit(function (event) {
            event.preventDefault(); // 폼의 기본 제출을 막음

            var formData = $(this).serialize(); // 폼 데이터 직렬화

            const isPwdValid = validatePwdRegexp($('#password').val());

            const isEmailValid = validateEmailRegexp($('#email').val());

            if (isEmailValid) {

                if (isPwdValid) {

                    $.ajax({
                        type: 'POST',
                        url: $(this).attr('action'),
                        data: formData,
                        success: function (response) {
                            // 로그인 성공 시 userpage로 이동
                            window.location.href = '${pageContext.request.contextPath}/index.jsp';
                        },
                        error: function (xhr, status, error) {
                            // 로그인 실패 시 에러 메시지 표시
                            $('.failed-message').text('로그인에 실패했습니다.')
                        }
                    });

                }
            }

        });
    });

    document.addEventListener('DOMContentLoaded', function () {
        document.getElementById("email").addEventListener('change', function () {
            const email = document.getElementById('email').value;

            var emailValid = validateEmailRegexp(email);

            if (email === '') {
                document.getElementById('email').style.borderColor = 'red';
                document.getElementById('regexp-reward-email').textContent = '이메일을 입력해주세요.';
                document.getElementById('regexp-reward-email').style.color = 'red'
            } else if (emailValid){
                document.getElementById('email').style.borderColor = '#aaaaaa';
                document.getElementById('regexp-reward-email').textContent = '';
            } else {
                document.getElementById('email').style.borderColor = 'red';
                document.getElementById('regexp-reward-email').textContent = '제대로 된 이메일을 입력해주세요.';
                document.getElementById('regexp-reward-email').style.color = 'red'
            }

        })
        document.getElementById("password").addEventListener('change', function () {

            const pwd = document.getElementById('password').value;

            var pawValid = validatePwdRegexp(pwd);

            if (pawValid) {
                document.getElementById('password').style.borderColor = '#aaaaaa';
                document.getElementById('regexp-reward-password').textContent = '';
            } else {
                document.getElementById('password').style.borderColor = 'red';
                document.getElementById('regexp-reward-password').textContent = '패스워드를 입력해주세요';
                document.getElementById('regexp-reward-password').style.color = 'red'
            }
        })

    });

</script>
</body>
</html>