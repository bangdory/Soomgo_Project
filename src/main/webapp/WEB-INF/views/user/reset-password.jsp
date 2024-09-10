<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../header/header.jsp" %>
<%@include file="../header/headerModal.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Password Reset</title>
    <link href="${pageContext.request.contextPath}/resources/static/css/header/headerStyle.css" rel="stylesheet"
          type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        .reset-password-form-container {
            width: 500px;
            height: 500px;
            border: 1px solid #888888;
            border-radius: 15px;
            display: flex;
            justify-content: start;
            align-items: center;
            flex-direction: column;
        }

        .reset-password-form-header {
            width: 70%;
            padding: 50px 0 50px 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .reset-password-form-header-keyword {
            font-size: 40px;
            color: #1AA69D;
        }

        .send-Email-Form-item {
            width: 70%;
            display: flex;
            justify-content: space-between;
            align-items: center;

        }

        .sendEmailForm {
            width: 100%;
            height: 100px;
            margin: 0 auto;
            display: flex;
            align-items: center;
            flex-direction: column;
            justify-content: center;
        }

        .reset-password-btn-container {
            width: 70%;
            height: 100px;
            display: flex;
            justify-content: center;
            align-items: center;
            padding-top: 100px;
        }

        .reset-password-btn {
            width: 100%;
            background-color: #1AA69D;
            border: 1px solid #1AA69D;
            display: block;
        }

        .reset-password-btn:hover {
            background-color: #1AA69D;
            border: 1px solid #1AA69D;
            filter: brightness(0.8);
        }

        .verification-btn {
            bottom: 20px;
        }

        .display-hide {
            width: 100%;
            display: none;
        }

        .sendEmailForm-container {
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        .regexp-reward {
            font-size: 10px;
            padding-top: 5px;
        }
    </style>
</head>
<body>
<main>

    <!-- Step 1: 이메일 입력 -->
    <div id="step1" class="reset-password-form-container">


        <div class="reset-password-form-header">
            <span class="reset-password-form-header-keyword">비밀번호 초기화</span>
        </div>
        <form id="sendEmailForm" class="sendEmailForm">
            <div class="send-Email-Form-item">
                <label for="user_email">이메일</label>
                <input type="email" id="user_email" name="user_email" required/>
            </div>
            <span class="regexp-reward" id="email-regexp-reward">이메일을 입력해주세요.</span>
            <div class="reset-password-btn-container">
                <button id="send-verification-code-btn" type="submit"
                        class="btn btn-primary reset-password-btn verification-btn">인증 코드 발송
                </button>
            </div>
        </form>
        <!-- Step 2: 인증 코드 입력 -->
        <div class="display-hide" id="display-block">

            <div id="step2" class="sendEmailForm-container">
                <form id="verifyCodeForm" class="sendEmailForm verification-form">
                    <div class="send-Email-Form-item">
                        <label for="verification_code">인증 코드</label>
                        <input type="text" id="verification_code" name="verification_code" required/>
                    </div>
                    <div class="reset-password-btn-container">
                        <button type="submit" class="btn btn-primary reset-password-btn">코드 확인</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</main>
<script src="${pageContext.request.contextPath}/resources/static/js/headerJS.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/user/regex.js" type="text/javascript"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
    $(document).ready(function () {
        // 이메일 전송 폼 제출
        $("#sendEmailForm").submit(function (event) {
            event.preventDefault();
            var email = $("#user_email").val();
            $.ajax({
                url: "${pageContext.request.contextPath}/api/send-verification-email",
                method: "POST",
                data: {user_email: email},
                success: function (response) {
                    alert(response);
                    $("#display-block").show(); // 인증 코드 입력 단계 표시
                    $("#send-verification-code-btn").hide(); // 버튼 숨기기
                    $("#verification_code").focus(); // 인증 코드 필드에 포커스
                },
                error: function (xhr, status, error) {
                    alert("Error sending email: " + xhr.responseText);
                }
            });
        });

        // 인증 코드 확인 폼 제출
        $("#verifyCodeForm").submit(function (event) {
            event.preventDefault();
            var code = $("#verification_code").val();
            var email = $("#user_email").val(); // 이메일도 함께 보냄
            $.ajax({
                url: "${pageContext.request.contextPath}/api/verifyCode",
                method: "POST",
                data: {token: code},
                success: function (response) {
                    if (response === "Verification successful!") {
                        alert("Verification successful!");
                        // 인증이 성공하면 /user/reset-password로 요청을 보내 비밀번호 재설정 링크 전송
                        $.ajax({
                            url: "${pageContext.request.contextPath}/user/reset-password",
                            method: "POST",
                            data: {user_email: email},
                            success: function (response) {
                                alert("비밀번호 재설정 링크가 이메일로 전송되었습니다.");
                            },
                            error: function (xhr, status, error) {
                                alert("Error sending reset link: " + xhr.responseText);
                            }
                        });
                    } else {
                        alert(response);
                    }
                },
                error: function (xhr, status, error) {
                    alert("Error verifying code: " + xhr.responseText);
                }
            });
        });
    });
    document.addEventListener('DOMContentLoaded', function () {

        document.getElementById("user_email").addEventListener('input', function () {

            const email = document.getElementById("user_email").value;

            var validEmail = validateEmailRegexp(email);

            if (email === '') {
                document.getElementById('email-regexp-reward').textContent = "이메일을 입력해주세요.";
                document.getElementById('email-regexp-reward').style.color = "black";
            }else if (validEmail) {
                document.getElementById('email-regexp-reward').textContent = "적합한 이메일 양식입니다.";
                document.getElementById('email-regexp-reward').style.color = "#1AA79D";
            }else {
                document.getElementById('email-regexp-reward').textContent = "제대로 된 이메일 양식으로 작성해주세요.";
                document.getElementById('email-regexp-reward').style.color = "red";
            }

        });
    });
</script>
</body>
</html>
