<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../header/header.jsp" %>
<%@include file="../header/headerModal.jsp" %>
<%@include file="../user/placeModal.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Submit User Data</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="${pageContext.request.contextPath}/resources/static/css/header/headerStyle.css" rel="stylesheet"
          type="text/css">
    <link href="${pageContext.request.contextPath}/resources/static/css/expert/modalStyle.css" rel="stylesheet"
          type="text/css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">


    <style>

        * {
            box-sizing: border-box;
        }

        body, html {
            overflow: auto;
            margin: auto;
            min-height: 100%;
        }

        .signup-toggleBtn-container {
            width: 100%;
            display: flex;
            justify-content: end;
            align-items: center;
            padding-bottom: 25px;
        }

        .toggleSwitch {
            width: 40px;
            height: 20px;
            display: block;
            position: relative;
            border-radius: 30px;
            background-color: #fff;
            box-shadow: 0 0 16px 3px rgba(0 0 0 / 15%);
            cursor: pointer;
        }

        /* 토글 버튼 */
        .toggleSwitch .toggleButton {
            /* 버튼은 토글보다 작아야함  */
            width: 15px;
            height: 15px;
            position: absolute;
            top: 50%;
            left: 4px;
            transform: translateY(-50%);
            border-radius: 50%;
            background: #1AA69D;
        }

        /* 체크박스가 체크되면 변경 이벤트 */
        #toggle:checked ~ .toggleSwitch {
            background: #1AA69D;
        }

        #toggle:checked ~ .toggleSwitch .toggleButton {
            left: calc(100% - 20px);
            background: #fff;
        }

        .toggleSwitch, .toggleButton {
            transition: all 0.2s ease-in;
        }

        main {
            padding-top: 100px;
            margin-bottom: 200px;
        }

        .signup-main-container {
            margin-top: 10px;
            width: 500px;
            height: 700px;
            border: 1px solid #888888;
            border-radius: 10px;
            padding: 50px 50px 200px 50px;
            display: flex;
            justify-content: start;
            flex-direction: column;
            align-items: start;
            transition: transform 0.3s ease, height 0.3s ease; /* 부드러운 애니메이션 */
            position: relative;
        }

        .signup-main-container.active {
            height: 1000px; /* active 클래스가 추가되면 높이를 줄입니다 */
            transform: translateY(150px); /* 위로 이동 */
        }

        .signup-keyword-container {
            width: 100%;
            height: 50px;
            display: flex;
            justify-content: start;
            align-items: center;
            padding-bottom: 30px;
        }

        .signup-keyword {
            font-size: 40px;
            color: #1AA69D;
            transition: opacity 0.5s ease-in-out; /* 부드러운 전환을 위한 CSS */
        }

        .fade-out {
            opacity: 0;
        }

        .fade-in {
            opacity: 1;
        }

        #userForm {
            width: 100%;
        }

        .userForm-items {
            padding-bottom: 5px;

        }

        .checkBtn-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .btn-outline-primary {
            border: 1px solid #1AA69D;
            color: #1AA69D;
        }

        .btn-outline-primary:hover {
            background-color: #1AA69D;
            color: white;
            border: 1px solid #1AA69D;
        }

        .signup-radio-container {
            display: flex;
            justify-content: start;
            align-items: center;
            gap: 50px;
        }

        .btn-primary {
            border: 1px solid #1AA69D;
            color: white;
            background-color: #1AA69D;
            width: 100%;
        }

        .btn-primary:hover {
            filter: brightness(0.8);

        }

        /* 비활성화 상태 스타일 */
        .btn-primary:disabled {
            border: 1px solid darkgray;
            color: white;
            background-color: darkgray;
            cursor: not-allowed;
        }

        .signup-gosu-hidden {
            display: none;
        }

        .select-sizing {
            overflow-y: auto;
        }

        .small-font-red {
            font-size: 8px;
            color: red;
            display: inline; /* 기본 span의 display 속성을 덮어씁니다 */
            text-align: left; /* 기본 span의 text-align 속성을 덮어씁니다 */
        }

        .place-modal-container {
            display: flex;
            justify-content: space-between;
        }

        .modal-icon-opener {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 20px;
            border-radius: 50px;
            background-color: white;
            border: 1px solid #1AA69D;
            color: #1AA69D;
        }

        .modal-icon-opener:hover {
            cursor: pointer;
            filter: brightness(0.8);

        }

        .place-modal-item {
            height: 50px;
            padding: 10px;
        }

        .place-modal-data span {
            padding-left: 30px;
        }

        .close-service-modal {
            padding-bottom: 20px;
        }

        .regexp-reward {
            display: flex;
            justify-content: start;
            align-self: start;
            padding-left: 3px;
            padding-bottom: 10px;
            font-size: 10px;
        }

        .regexp-reward-container {
            align-self: start;
            height: 10px;
        }

        .signup-gosu-item-container {
            padding-bottom: 20px;
        }

        .signup-radio-container {
            padding-bottom: 20px;
        }

    </style>

</head>
<body>
<main>
    <div class="signup-main-container">

        <div class="signup-toggleBtn-container">
            <input type="checkbox" id="toggle" hidden>

            <label for="toggle" class="toggleSwitch">
                <span class="toggleButton"></span>
            </label>
        </div>

        <div class="signup-keyword-container">
            <span class="signup-keyword" id="signup-keyword">회원 가입</span>
        </div>


        <form id="userForm" onsubmit="event.preventDefault(); submitData();">
            <input type="hidden" id="user_type" name="user_type" value="CUSTOMER">
            <input type="hidden" id="email_check_yn" value="N"/>

            <div class="userForm-items email-item">
                <label for="user_email">이메일</label><span class="small-font-red">&nbsp;* 필수&nbsp;</span>
                <input type="email" id="user_email" name="user_email" class="form-control"
                       aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required/>
            </div>

            <div class="userForm-items checkBtn-item">
                <div class="regexp-reward-container">
                    <span class="regexp-reward" id="email-regexp-reward"></span>
                </div>
                <button class="btn btn-outline-primary" id="check_email" type="button">중복 확인</button>
            </div>

            <div class="userForm-items">
                <label for="user_password">비밀번호</label><span class="small-font-red">&nbsp;* 필수&nbsp;</span>
                <input type="password" id="user_password" name="user_password" class="form-control"
                       aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required/>
            </div>
            <span class="regexp-reward" id="pwd-regexp-reward">대문자 1개, 특수 문자 1개, 숫자 3개를 포함한 8 ~ 16글자</span>

            <div class="userForm-items">
                <label for="user_name">이름</label><span class="small-font-red">&nbsp;* 필수&nbsp;</span>
                <input type="text" id="user_name" name="user_name" class="form-control"
                       aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required/>
            </div>
            <span class="regexp-reward" id="name-regexp-reward"></span>

            <div class="userForm-items">
                <label for="user_phonenum">휴대폰 번호</label><span class="small-font-red">&nbsp;* 필수&nbsp;</span>
                <input type="text" id="user_phonenum" name="user_phonenum" class="form-control"
                       aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required/>
            </div>
            <span class="regexp-reward" id="phone-regexp-reward">- 는 제외하고 입력해주세요.</span>

            <label>성별</label><span class="small-font-red">&nbsp;* 필수&nbsp;</span>
            <div class="signup-radio-container">
                <div class="userForm-items form-check">
                    <input class="form-check-input" type="radio" name="성별" id="male" value="남성" checked>
                    <label class="form-check-label" for="male">
                        남성
                    </label>
                </div>
                <div class="userForm-items form-check">
                    <input class="form-check-input" type="radio" name="성별" id="female" value="여성">
                    <label class="form-check-label" for="female">
                        여성
                    </label>
                </div>
            </div>
            <div class="signup-gosu-hidden" id="signup-gosu-hidden">
                <div class="signup-gosu-item-container userForm-items">
                    <label>서비스</label><span class="small-font-red">&nbsp;* 필수&nbsp;</span>
                    <select class="form-select" name="category_num" id="category_num"
                            aria-label="Default select example">
                        <option selected>서비스를 반드시 선택해주세요.</option>
                        <c:forEach var="category" items="${category}">
                            <option value="${category.categoryNum}">${category.categoryName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="signup-gosu-item-container userForm-items">
                    <label>지역</label><span class="small-font-red">&nbsp;* 필수&nbsp;</span>
                    <div class="place-modal-container">
                       <span id="place-choice" class="place-choice">
                        선호 지역 선택
                       </span>

                        <button type="button" class="btn btn-primary modal-icon-opener">
                            <i class="bi bi-geo-alt alt-icon"></i>
                        </button>
                        <input type="hidden" name="region" value="" id="region">
                    </div>
                </div>
                <div class="signup-gosu-item-container userForm-items">
                    <label>경력</label><span class="small-font-red">&nbsp;* 필수&nbsp;</span>
                    <select id="experience_years" name="experience_years" class="form-select select-sizing"
                            aria-label="Default select example">
                    </select>
                </div>
            </div>

            <div class="userForm-items">
                <button class="btn btn-primary" type="submit" id="submit_btn" disabled>회원 가입</button>
            </div>
        </form>
    </div>
</main>
<script src="${pageContext.request.contextPath}/resources/static/js/headerJS.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/user/regex.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<!-- javascript를 쉽게 사용하는 jquery 라이브러리 추가 -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
    $(document).ready(function () {
        $('#submit_btn').prop('disabled', true);

        $('#user_email').change(function () {
            $('#email_check_yn').val('N');
            $('#submit_btn').prop('disabled', true);
        });


        <%--$('#check_email').on('click', function () {--%>

        <%--    $('#email-regexp-reward').text('');--%>


        <%--    if (validateEmailRegexp($('#email').val())) {--%>

        <%--        var param = {"email": $('#user_email').val()};--%>
        <%--        console.log('param: ' + param);--%>
        <%--        $.ajax({--%>
        <%--            url: '${pageContext.request.contextPath}/user/checkEmail',--%>
        <%--            method: 'get',--%>
        <%--            data: param,--%>
        <%--            dataType: 'json',--%>
        <%--            success: function (res) {--%>
        <%--                var result = res.result;--%>
        <%--                console.log('result: ' + result);--%>
        <%--                if (result === "success") {--%>
        <%--                    $('#email_check_yn').val('Y');--%>
        <%--                    $('#submit_btn').prop('disabled', false);--%>
        <%--                    $('#email-regexp-reward').text('사용 가능한 이메일입니다.');--%>
        <%--                } else {--%>
        <%--                    $('#email_check_yn').val('N');--%>
        <%--                    $('#submit_btn').prop('disabled', true);--%>
        <%--                    $('#email-regexp-reward').text('이미 등록된 이메일입니다.');--%>
        <%--                }--%>
        <%--            },--%>
        <%--            error: function (data, status, err) {--%>
        <%--                // 오류 처리--%>
        <%--            }--%>
        <%--        });--%>

        <%--    }--%>


        <%--});--%>
    });


    document.addEventListener('DOMContentLoaded', function () {
        function allValidRegexp() {

            const email = document.getElementById("user_email").value;
            const pwd = document.getElementById("user_password").value;
            const name = document.getElementById("user_name").value;
            const phone = document.getElementById("user_phonenum").value;
            const type = document.getElementById('user_type').value;
            const category = document.getElementById("category_num").value;
            const territory = document.getElementById("place-choice").innerText;
            const experience = document.getElementById("experience_years").value;

            var emailCheckYn = document.getElementById('email_check_yn');

            const validEmail = validateEmailRegexp(email);
            const validPwd = validatePwdRegexp(pwd);
            const validName = validateName(name);
            const validPhone = validatePhoneRegexp(phone);

            // #1AA69D

            if (pwd === '') {
                document.getElementById("pwd-regexp-reward").textContent = "대문자 1개, 특수 문자 1개, 숫자 3개를 포함한 8 ~ 16글자";
                document.getElementById("pwd-regexp-reward").style.color = "black";

            } else if (validPwd) {
                document.getElementById("pwd-regexp-reward").textContent = "사용 가능한 비밀번호입니다."
                document.getElementById("pwd-regexp-reward").style.color = "#1AA69D";
            } else {
                document.getElementById("pwd-regexp-reward").textContent = "사용 불가능한 비밀번호입니다."
                document.getElementById("pwd-regexp-reward").style.color = "red";
            }

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


                fetch(`/user/api/phone`, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({phone: phone})
                })
                    .then(response => {
                        if (response.ok) {
                            return response.json(); // 응답을 JSON으로 변환
                        } else {
                            throw new Error('Network response was not ok');
                        }
                    })
                    .then(data => {
                        console.log('Data:', data); // 서버에서 받은 데이터 처리
                        if (data) {
                            document.getElementById("phone-regexp-reward").textContent = "사용 가능한 휴대폰 번호입니다.";
                            document.getElementById("phone-regexp-reward").style.color = "#1AA79D";
                        } else if (!data) {
                            document.getElementById("phone-regexp-reward").textContent = "이미 사용중인 휴대폰 번호입니다.";
                            document.getElementById("phone-regexp-reward").style.color = "red";
                        }
                    })
                    .catch(error => {
                        console.error('Error:', error); // 에러 처리
                    });


            } else {
                document.getElementById("phone-regexp-reward").textContent = "사용 불가능한 휴대폰 번호입니다.";
                document.getElementById("phone-regexp-reward").style.color = "red";
            }


            let emailChk = false;
            let validCategory = false;
            let validTerritory = false;
            let validExperience = false;

            if (emailCheckYn.value === 'Y') {
                emailChk = true;
            }

            // category 검사
            if (category) {
                validCategory = true;
            }

            // territory 검사
            if (territory !== '선호 지역 선택') {
                validTerritory = true;
            }

            // experience 검사
            if (experience !== "경력을 반드시 선택해주세요") {
                validExperience = true;
            }

            // 버튼 활성화 상태 설정
            if (type === "CUSTOMER") {
                document.getElementById('submit_btn').disabled = !(validEmail && validPwd && validPhone && validName && emailChk);
            } else if (type === "EXPERT") {
                document.getElementById('submit_btn').disabled = !(validEmail && validPwd && validPhone && validName && emailChk && validCategory && validExperience && validTerritory);
            }


        }

        document.getElementById("user_email").addEventListener("input", allValidRegexp);
        document.getElementById("user_password").addEventListener("input", allValidRegexp);
        document.getElementById("user_name").addEventListener("input", allValidRegexp);
        document.getElementById("user_phonenum").addEventListener("input", allValidRegexp);
        document.getElementById("category_num").addEventListener("change", allValidRegexp);
        document.getElementById("place-choice").addEventListener("input", allValidRegexp);
        document.getElementById("experience_years").addEventListener("change", allValidRegexp);



        // 'submit_btn' 버튼을 비활성화
        document.getElementById('submit_btn').disabled = true;

        // 'user_email' 입력 필드의 'change' 이벤트 리스너 등록
        document.getElementById('user_email').addEventListener('input', function () {
            // 'email_check_yn' 값을 'N'으로 설정
            document.getElementById('email_check_yn').value = 'N';

            // 'submit_btn' 버튼을 비활성화
            document.getElementById('submit_btn').disabled = true;
        });


        console.log(getSelectedRadioValue('성별')); // 호출 및 출력

        // 모달 닫기
        document.getElementById('close-placeModal').addEventListener('click', function () {
            document.getElementById('place-modal-base-container').style.display = 'none';
        });

        // 모달 열기
        document.querySelector('.modal-icon-opener').addEventListener('click', function () {
            document.getElementById('place-modal-base-container').style.display = 'flex';
        });

        // 모달 내의 toggle 버튼 기능
        document.querySelectorAll('.place-modal-addDiv').forEach(function (div) {

            div.setAttribute('data-expanded', 'false');

            div.addEventListener('click', function (event) {


                const target = event.target;

                console.log(target)

                if (target.classList.contains('modal-toggle-btn')) {
                    const item = target.closest('.place-modal-item');
                    const isExpanded = item.getAttribute('data-expanded') === 'true';
                    const dataDiv = item.nextElementSibling;


                    if (isExpanded) {
                        dataDiv.style.display = 'none';
                        item.setAttribute('data-expanded', 'false');
                        target.innerHTML = '<i class="bi bi-caret-down"></i>';
                    } else {
                        const value = item.getAttribute('data-value');
                        const [no, id, state, district] = value.split("|"); // 배열 비구조화 할당
                        console.log('테스트용 value: ' + value);

                        fetch('${pageContext.request.contextPath}/expert/expertFind/place?id=' + id)
                            .then(response => response.json())
                            .then(data => {
                                dataDiv.innerText = '';

                                data.forEach(dataItem => {
                                    const setValues = dataItem.no + '|' + dataItem.id + '|' + dataItem.state + '|' + dataItem.district;
                                    console.log('setValues: ' + dataItem.no + '|' + dataItem.id + '|' + dataItem.state + '|' + dataItem.district);
                                    const newItem = document.createElement('span');
                                    newItem.classList.add('place-modal-item');
                                    newItem.setAttribute('data-value', setValues);
                                    newItem.textContent = dataItem.district;
                                    dataDiv.appendChild(newItem);
                                });

                                dataDiv.style.display = 'block';
                                item.setAttribute('data-expanded', 'true');
                                target.innerHTML = '<i class="bi bi-caret-up"></i>';
                            }).catch(error => console.error('Error fetching data: ' + error));
                    }
                } else if (target.classList.contains('place-modal-item')) {
                    console.log(target.getAttribute('data-value'));
                    const value = target.getAttribute('data-value');
                    const [no, id, state, district] = value.split("|"); // 배열 비구조화 할당
                    console.log('value: ' + value);
                    console.log('no: ' + no);
                    console.log('id: ' + id);
                    console.log('state: ' + state);
                    console.log('district: ' + district);

                    document.getElementById('region').value = no;

                    console.log(document.getElementById('region').value);

                    if (district === '') {
                        document.getElementById('place-choice').innerText = state;
                    } else {
                        document.getElementById('place-choice').innerText = district;
                    }

                    document.getElementById('place-choice').style.color = '#1AA69D';
                    document.getElementById('place-modal-base-container').style.display = 'none';

                }
            });
        });


        var submitBtn = document.getElementById('submit_btn');
        var userEmail = document.getElementById('user_email');
        var emailCheckYn = document.getElementById('email_check_yn');
        var checkEmailBtn = document.getElementById('check_email');
        var toggle = document.getElementById('toggle');
        var mainContainer = document.querySelector('.signup-main-container');

        submitBtn.disabled = true;

        userEmail.addEventListener('change', function () {
            emailCheckYn.value = 'N';
            submitBtn.disabled = true;
        });

        checkEmailBtn.addEventListener('click', function () {

            const emailValue = document.getElementById("user_email").value;

            const emailReward = document.getElementById("email-regexp-reward");

            if (validateEmailRegexp(emailValue)) {

                var email = userEmail.value;
                var xhr = new XMLHttpRequest();
                xhr.open('GET', '${pageContext.request.contextPath}/user/checkEmail?email=' + encodeURIComponent(email), true);
                xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === XMLHttpRequest.DONE) {
                        if (xhr.status === 200) {
                            var res = JSON.parse(xhr.responseText);
                            var result = res.result;
                            if (result === 'success') {
                                emailCheckYn.value = 'Y';
                                // submitBtn.disabled = false;
                                emailReward.innerText = "사용 가능한 이메일입니다."
                                emailReward.style.color = "#1AA69D";

                            } else {
                                emailCheckYn.value = 'N';
                                // submitBtn.disabled = true;
                                emailReward.innerText = "이미 등록된 이메일 입니다."
                                emailReward.style.color = "red";
                            }
                        } else {
                            // 오류 처리
                        }
                    }
                };
                xhr.send();
            } else if (!validateEmailRegexp(emailValue)) {
                emailReward.textContent = "이메일 양식에 맞춰 작성해주십시오."
                emailReward.style.color = "red";
            }


        });

        toggle.addEventListener('change', function () {
            mainContainer.classList.toggle('active'); // .active 클래스를 추가/제거


            // 숨겨진 input 값을 변경
            if (toggle.checked) {
                document.getElementById("user_type").value = 'EXPERT';
                changeText("고수 가입");
                document.getElementById("signup-gosu-hidden").style.display = 'block';
                document.querySelector('main').style.marginBottom = '500px';
                allValidRegexp();
            } else {
                document.getElementById("user_type").value = 'CUSTOMER';
                changeText("회원 가입");
                document.getElementById("signup-gosu-hidden").style.display = 'none';
                document.querySelector('main').style.marginBottom = '200px';
                allValidRegexp();
            }
        });


        const selectElement = document.getElementById('experience_years');

        // Placeholder option
        const placeholderOption = document.createElement('option');
        placeholderOption.textContent = '경력을 반드시 선택해주세요';
        placeholderOption.disabled = true;
        placeholderOption.selected = true;
        selectElement.appendChild(placeholderOption);

        // Create and add options
        for (var i = 1; i <= 40; i++) {
            var option = document.createElement('option');
            option.value = i;
            option.textContent = i + ' 년'; // Option text
            selectElement.appendChild(option);
        }
    });

    function changeText(newText) {
        const keyword = document.getElementById("signup-keyword");

        keyword.classList.add('fade-out');

        setTimeout(function () {
            keyword.textContent = newText;

            keyword.classList.remove('fade-out');
            keyword.classList.add('fade-in');

            setTimeout(function () {
                keyword.classList.remove('fade-in');
            }, 400);

        }, 400);

    }

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
        var userSex = getSelectedRadioValue();

        const UserData = {
            'user_email': userEmail,
            'user_password': userPassword,
            'user_name': userName,
            'user_phonenum': userPhoneNum,
            'user_type': userType,
            'user_sex': userSex
        };
        console.log(JSON.stringify(UserData, null, 2));

        const region = document.getElementById('region').value;
        console.log('region: ' + region);
        const experience_years = document.getElementById('experience_years').value;
        console.log('experience_years: ' + experience_years);
        const category_num = document.getElementById('category_num').value;
        console.log('category_num: ' + category_num);

        const ExpertData = {
            region: parseInt(document.getElementById('region').value, 10),
            experienceYears: parseInt(document.getElementById('experience_years').value, 10),
            categoryNum: parseInt(document.getElementById('category_num').value, 10)
        };

        console.log(JSON.stringify(ExpertData, null, 2)); // JSON 문자열로 변환

        const TotalData = {
            userDTO: UserData,
            expertDTO: ExpertData
        }
        console.log(JSON.stringify(TotalData, null, 2));


        if (userType === 'CUSTOMER') {

            var xhr = new XMLHttpRequest();
            xhr.open("POST", "${pageContext.request.contextPath}/user/signup", true);
            xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

            xhr.onreadystatechange = function () {
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

                        loginXhr.onreadystatechange = function () {
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

            xhr.send(JSON.stringify(UserData));

        } else if (userType === "EXPERT") {

            var xhr = new XMLHttpRequest();
            xhr.open("POST", "/user/signupExpert", true);
            xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

            xhr.onreadystatechange = function () {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        alert("회원 가입이 완료되었습니다.");

                        // 로그인 시도
                        var loginData = {
                            email: userEmail,
                            password: userPassword
                        };

                        console.log(JSON.stringify(loginData, null, 2));

                        var loginXhr = new XMLHttpRequest();
                        loginXhr.open("POST", "${pageContext.request.contextPath}/user/login", true);
                        loginXhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

                        loginXhr.onreadystatechange = function () {
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

            xhr.send(JSON.stringify(TotalData));
        }


    }


    function getSelectedRadioValue() {
        const selectedRadios = document.querySelectorAll('input[name=성별]:checked');
        console.log(selectedRadios); // NodeList 확인
        return selectedRadios.length > 0 ? selectedRadios[0].value : null;
    }
</script>
</body>
</html>
