<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Password Reset</title>
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
                    data: { user_email: email },
                    success: function (response) {
                        alert(response);
                        $("#step2").show(); // 인증 코드 입력 단계 표시
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
                    data: { token: code },
                    success: function (response) {
                        if (response === "Verification successful!") {
                            alert("Verification successful!");
                            // 인증이 성공하면 /user/reset-password로 요청을 보내 비밀번호 재설정 링크 전송
                            $.ajax({
                                url: "${pageContext.request.contextPath}/user/reset-password",
                                method: "POST",
                                data: { user_email: email },
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
    </script>
</head>
<body>
<h1>비밀번호 초기화</h1>

<!-- Step 1: 이메일 입력 -->
<div id="step1">
    <form id="sendEmailForm">
        <label for="user_email">이메일:</label>
        <input type="email" id="user_email" name="user_email" required />
        <button type="submit">인증 코드 발송</button>
    </form>
</div>

<!-- Step 2: 인증 코드 입력 -->
<div id="step2" style="display:none;">
    <form id="verifyCodeForm">
        <label for="verification_code">인증 코드:</label>
        <input type="text" id="verification_code" name="verification_code" required />
        <button type="submit">코드 확인</button>
    </form>
</div>

</body>
</html>
