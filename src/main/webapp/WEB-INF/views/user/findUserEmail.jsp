<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../header/header.jsp" %>
<%@include file="../header/headerModal.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <meta charset="UTF-8">
    <link href="${pageContext.request.contextPath}/resources/static/css/header/headerStyle.css" rel="stylesheet"
          type="text/css">
    <title>Email 찾기</title>
    <style>
        .find-userEmail-container {
            border: 1px solid #888888;
            border-radius: 15px;
            width: 500px;
            height: 500px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .find-userEmail-form {
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: start;
            align-items: center;
            flex-direction: column;
        }

        .find-userEmail-header {
            padding-top: 50px;
            padding-bottom: 50px;
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .find-userEmail-header-keyword {
            font-size: 40px;
        }

        .find-userEmail-items {
            width: 70%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 0 0 0;
        }

        .find-userEmail-btn {
            width: 70%;
            background-color: #1AA69D;
            border: 1px solid #1AA69D;
        }

        .find-userEmail-btn:hover {
            filter: brightness(0.8);
            background-color: #1AA69D;
            border: 1px solid #1AA69D;
            cursor: pointer;
        }

        .not-find-email-account {
            height: 30px;
            width: 70%;

        }

        .span-soomgo-font {
            color: #1AA69D;
        }

        .span-red-font {
            color: red;
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
            height: 30px;
            display: flex;
            justify-content: center;
            align-self: center;

        }

    </style>
</head>
<body>
<main>
    <div class="find-userEmail-container">
        <form class="find-userEmail-form" action="<c:url value='/user/findUserEmail'/>" method="post">
            <div class="find-userEmail-header">
                <span class=find-userEmail-header-keyword>이메일 찾기</span>
            </div>
            <div class="find-userEmail-items">
                <label for="user_name">이름</label>
                <input type="text" id="user_name" name="user_name" required>
            </div>
            <div class="regexp-reward-container">
                <span class="regexp-reward" id="name-regexp-reward"></span>
            </div>
            <div class="find-userEmail-items">
                <label for="user_phonenum">전화번호</label>
                <input type="text" id="user_phonenum" name="user_phonenum" required>
            </div>
            <div class="regexp-reward-container">
                <span class="regexp-reward" id="phone-regexp-reward">- 는 제외하고 입력해주세요.</span>
            </div>
            <div class="not-find-email-account">
                <c:if test="${not empty email}">
                    <span class="span-soomgo-font">사용자 Email: ${email}</span>
                </c:if>
                <c:if test="${not empty error}">
                    <span class="span-red-font">${error}</span>
                </c:if>
            </div>
            <button type="submit" class="btn btn-primary find-userEmail-btn">찾기</button>
        </form>

        <!-- 결과 표시 -->

    </div>
</main>
<script src="${pageContext.request.contextPath}/resources/static/js/headerJS.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/user/regex.js" type="text/javascript"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {

        document.getElementById("user_name").addEventListener('input', nameAndPwdValid);
        document.getElementById("user_phonenum").addEventListener('input', nameAndPwdValid);

        function nameAndPwdValid () {
            const name = document.getElementById("user_name").value;
            const phone = document.getElementById("user_phonenum").value;

            const validName = validateName(name);
            const validPhone = validatePhoneRegexp(phone);

            if (name === '') {
                document.getElementById("name-regexp-reward").textContent = "";
            } else if (validName) {
                document.getElementById("name-regexp-reward").textContent = "사용 가능한 이름입니다.";
                document.getElementById("name-regexp-reward").style.color = "#1AA69D";
            } else {
                document.getElementById("name-regexp-reward").textContent = "사용 불가능한 이름입니다.";
                document.getElementById("name-regexp-reward").style.color = "red";
            }

            if (phone === '') {
                document.getElementById("phone-regexp-reward").textContent = "- 는 제외하고 입력해주세요.";
                document.getElementById("phone-regexp-reward").style.color = "black";
            } else if (validPhone) {
                document.getElementById("phone-regexp-reward").textContent = "사용 가능한 휴대폰 번호입니다.";
                document.getElementById("phone-regexp-reward").style.color = "#1AA79D";
            } else {
                document.getElementById("phone-regexp-reward").textContent = "사용 불가능한 휴대폰 번호입니다.";
                document.getElementById("phone-regexp-reward").style.color = "red";
            }

        }

    });
</script>
</body>
</html>
