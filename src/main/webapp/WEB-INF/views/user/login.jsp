<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <style>
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
            border-radius: 30px;
            border: 1px solid #aaaaaa;
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
            padding-top: 50px;
            width: calc(100% - 20px);
            text-align: center;
        }

        .loginForm-title-img {
            width: 200px;
            height: auto;
        }
        .loginForm-input-first {
            width: 100%;
            display: flex;
            flex-direction: column;
        }

        .loginForm-input-item-email {
            width: 300px;
            padding-bottom: 10px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-grow: 1; /* 자식 요소가 가능한 공간을 자동으로 채우도록 설정 */
        }

        .loginForm-input-item-password {
            width: 300px;
            padding-bottom: 10px;
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
            gap: 20px;
        }

        .loginForm-Link_container {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding-bottom: 10px;
        }


    </style>
</head>
<body>
<main>
    <div class="loginForm-container">
        <div class="loginForm-sub-container">
            <div class="loginForm-title">
        <span class="loginForm-title-img">
        <img src="${pageContext.request.contextPath}/resources/static/img/SoomgoIcon_2.png">
        </span>
            </div>
            <form id="loginForm" action="${pageContext.request.contextPath}/user/login" method="post">
                <div class="loginForm-input-first">
                    <div class="loginForm-input-item-email">
                        <label for="email">이메일</label>
                        <input type="email" id="email" name="email" required>
                    </div>
                    <div class="loginForm-input-item-password">
                        <label for="password">비밀번호</label>
                        <input type="password" id="password" name="password" required>
                    </div>
                </div>
                <button type="submit">로그인</button>
                <div class="loginForm-Link_container">
                    <a href="${pageContext.request.contextPath}/user/findUserEmail">ID 찾기</a>
                    <a href="${pageContext.request.contextPath}/user/reset-password">비밀번호 찾기</a>
                    <a href="${pageContext.request.contextPath}/user/signup">회원가입</a>
                </div>
            </form>
        </div>

    </div>
</main>

<!-- AJAX 로그인 처리 스크립트 -->
<script src="${pageContext.request.contextPath}/resources/static/js/headerJS.js" type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function () {
        $('#loginForm').submit(function (event) {
            event.preventDefault(); // 폼의 기본 제출을 막음

            var formData = $(this).serialize(); // 폼 데이터 직렬화

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
                    alert("로그인에 실패했습니다. 이메일 또는 비밀번호를 확인하세요.");
                }
            });
        });
    });
</script>
</body>
</html>