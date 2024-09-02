<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Submit User Data</title>
    <!-- javascript를 쉽게 사용하는 jquery 라이브러리 추가 -->
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script>
        $(document).ready(function(){
            $('#submit_btn').prop('disabled', true);

            $('#user_email').change(function () {
                $('#email_check_yn').val('N');
                $('#submit_btn').prop('disabled', true);
            });

            $('#check_email').on('click', function() {
                var param = {"email" : $('#user_email').val()};
                console.log('param: ' + param);
                $.ajax({
                    url: '${pageContext.request.contextPath}/user/checkEmail',
                    method: 'get',
                    data : param,
                    dataType : 'json',
                    success: function (res) {
                        var result = res.result;
                        console.log('result: ' + result);
                        if (result === "success") {
                            $('#email_check_yn').val('Y');
                            $('#submit_btn').prop('disabled', false);
                            alert('사용 가능한 이메일 입니다.');
                        } else {
                            $('#email_check_yn').val('N');
                            $('#submit_btn').prop('disabled', true);
                            alert('이미 등록된 이메일 입니다.');
                        }
                    },
                    error: function (data, status, err) {
                        // 오류 처리
                    }
                });
            });
        });

        function submitData() {
            var emailCheckYn = $('#email_check_yn').val();
            if (emailCheckYn !== 'Y') {
                alert("이메일 중복 체크를 먼저 해주세요.");
                return;
            }

            var userEmail = document.getElementById('user_email').value;
            var userPassword = document.getElementById('user_password').value;
            var userName = document.getElementById('user_name').value;
            var userPhoneNum = document.getElementById('user_phonenum').value;
            var userType = document.getElementById('user_type').value;
            var userSex = document.getElementById('user_sex').value;

            var data = {
                user_email: userEmail,
                user_password: userPassword,
                user_name: userName,
                user_phonenum: userPhoneNum,
                user_type: userType,``
                user_sex: userSex
            };

            var xhr = new XMLHttpRequest();
            xhr.open("POST", "${pageContext.request.contextPath}/user/signup", true);
            xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        alert("회원 가입이 완료되었습니다.");

                        // 로그인 시도
                        var loginData = {
                            email: userEmail,
                            password: userPassword
                        };

                        var loginXhr = new XMLHttpRequest();
                        loginXhr.open("POST", "${pageContext.request.contextPath}/user/login", true);
                        loginXhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

                        loginXhr.onreadystatechange = function() {
                            if (loginXhr.readyState === XMLHttpRequest.DONE) {
                                if (loginXhr.status === 200) {
                                    window.location.href = "<c:url value='/index.jsp' />";
                                } else {
                                    alert("로그인 실패: " + loginXhr.status);
                                }
                            }
                        };

                        loginXhr.send("email=" + encodeURIComponent(loginData.email) + "&password=" + encodeURIComponent(loginData.password));

                    } else {
                        alert("회원 가입 실패: " + xhr.status);
                    }
                }
            };

            xhr.send(JSON.stringify(data));
        }
    </script>
</head>
<body>
<h1>회원 가입</h1>
<form id="userForm" onsubmit="event.preventDefault(); submitData();">
    <input type="hidden" id="email_check_yn" value="N" />

    <label for="user_email">이메일:</label>
    <input type="email" id="user_email" name="user_email" required />
    <button id="check_email" type="button">Email 중복 확인</button><br/>

    <label for="user_password">비밀번호:</label>
    <input type="password" id="user_password" name="user_password" required /><br/>

    <label for="user_name">이름:</label>
    <input type="text" id="user_name" name="user_name" required /><br/>

    <label for="user_phonenum">휴대폰 번호:</label>
    <input type="text" id="user_phonenum" name="user_phonenum" required /><br/>

    <label for="user_type">회원 유형:</label>
    <select id="user_type" name="user_type" required>
        <option value="EXPERT">EXPERT</option>
        <option value="CUSTOMER">CUSTOMER</option>
    </select><br/>

    <label for="user_sex">성별:</label>
    <select id="user_sex" name="user_sex" required>
        <option value="남성">남성</option>
        <option value="여성">여성</option>
    </select><br/>

    <button type="submit" id="submit_btn" disabled>회원 가입</button>
</form>
</body>
</html>
