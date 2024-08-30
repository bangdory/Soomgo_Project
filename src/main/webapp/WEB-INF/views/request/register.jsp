<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: klarnuri
  Date: 2024-08-07
  Time: 오전 1:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>견적서 등록</title>
</head>
<body>
<c:out value="user = ${user}"></c:out><hr>
    <c:out value="${user.user_email}"></c:out><br>
    <c:out value="${user.user_name}"></c:out>
<form method="post" action="/request/register" onsubmit="updateFields()">
    <fieldset>
        <legend>견적 보내기</legend>

        <div>
            <table>견적 요청 항목 ===== <c:out value="${type}"/></table>
            <input type="hidden" name="sort" id="sort" value="${sort}">
            <input type="hidden" name="type" id="type" value="${type}">
            <input type="hidden" name="writer" id="writer" value="${user.user_num}">
        </div>

        <%--
        <div>
            <label for="name" class="form-label mt-4">이름을 입력하세요</label>
            <input type="text" name="writer" class="form-control" id="name">
        </div>

        <div>
            <label for="sort" class="form-label mt-4">견적 요청 분야를 선택하세요</label>
            <select name="sort" class="form-select" id="sort">
                <option>개발 외주</option>
                <option>디자인 외주</option>
                <option>데이터 외주</option>
                <option>컴퓨터 실무</option>
                <option>디자인 실무</option>
            </select>
        </div>
        <div>
            <label for="type" class="form-label mt-4">항목을 선택하세요</label>
            <select name="type" class="form-select" id="type">
                <c:forEach var="category" items="${c}">
                    <option>${category}</option>
                </c:forEach>
            </select>
        </div>
        --%>

        <div>
            <label for="sub" class="form-label mt-4">사업 분야</label>
            <select name="sub" class="form-select" id="sub">
                <option value="기술 / IT">기술 / IT</option>
                <option value="sub 2">sub 2</option>
                <option value="sub 3">sub 3</option>
                <option value="sub 4">sub 4</option>
                <option value="sub 5">sub 5</option>
            </select>
        </div>
        <div>
            <label for="date" class="form-label mt-4">요일</label>
            <div id="date">
                <label>
                    <input type="checkbox" name="date" value="월요일">
                    월요일</label>
                <label>
                    <input type="checkbox" name="date" value="화요일">
                    화요일</label>
                <label>
                    <input type="checkbox" name="date" value="수요일">
                    수요일</label>
                <label>
                    <input type="checkbox" name="date" value="목요일">
                    목요일</label>
                <label>
                    <input type="checkbox" name="date" value="금요일">
                    금요일</label>
                <label>
                    <input type="checkbox" name="date" value="토요일">
                    토요일</label>
                <label>
                    <input type="checkbox" name="date" value="일요일">
                    일요일</label>
            </div>
            <input type="hidden" id="dateField" name="date" value="">
        </div>
        <div>
            <label for="time" class="form-label mt-4">시간대</label>
            <div id="time">
                <label>
                    <input type="checkbox" name="time" value="오전 (09시~12시)">
                    오전</label>
                <label>
                    <input type="checkbox" name="time" value="오후 (12시 ~ 6시)">
                    오후</label>
                <label>
                    <input type="checkbox" name="time" value="저녁 (6시 이후)">
                    저녁</label>
            </div>
            <input type="hidden" id="timeField" name="time" value="">
        </div>
        <div>
            <label for="stateSelect">지역을 선택하세요 :</label>
            <select id="stateSelect">
                <option value="">시 / 도</option>
                <c:forEach var="state" items="${allStates}">
                    <option class="selectState" value="${state}">${state}</option>
                </c:forEach>
            </select>
        </div>
        <div>
            <label for="districtSelect">상세 지역을 선택하세요 :</label>
            <select name="region" id="districtSelect">
                <option id="district">시 / 군 / 구</option>
            </select>
        </div>


        <div>
            <label for="ref" class="form-label mt-4">기타 사항</label>
            <textarea name="ref" class="form-control" id="ref" rows="3" placeholder="서비스 설명을 적어주세요"></textarea>
        </div>
        <div>
            <button type="reset" class="btn btn-reset">다시 작성</button>
            <button type="submit" class="btn btn-primary">요청서 보내기</button>
        </div>
    </fieldset>
</form>
</body>
<script>
    function updateField(fieldName, hiddenFieldId) {
        // fieldName 이 input 태그의 name 속성인 것들 중 체크 된 요소를 hiddenFieldId 에 넣기
        var checkboxes = document.querySelectorAll(`input[name="${fieldName}"]:checked`);
        // 선택된 체크박스 요소
        var selectedValues = Array.from(checkboxes).map(cb => cb.value);
        // 선택된 체크박스의 값을 배열로 만들기
        document.getElementById(hiddenFieldId).value = selectedValues.join(',');
    }

    function updateFields() {
        updateField('date', 'dateField');
        updateField('time', 'timeField');
    }


    document.addEventListener('DOMContentLoaded', function () {
        // stateSelect 가 변경될 때마다 AJAX 요청을 보내는 코드
        document.getElementById('stateSelect').addEventListener('change', function (event) {
            // 선택된 state 값을 가져오기
            var state = this.value;
            console.log(state);

            // AJAX 요청
            fetch('/request/register/territories?state=' + state)
                // GetMapping 되어있는 주소 입력하고 GET 방식 모습대로 줄 것
                .then(response => response.json())
                .then(data => {
                    // districtSelect 업데이트
                    var district = document.getElementById('districtSelect');
                    district.innerHTML = ''; // 기존 내용을 지우기

                    // 새로운 데이터를 추가
                    data.forEach(item => {
                        console.log(item.state);
                        // <option> 요소 생성
                        var listItem = document.createElement('option');
                        // <option> 요소의 텍스트 설정
                        listItem.textContent = item.district;
                        listItem.value = item.district;

                        // <select> 요소에 <option> 요소 추가
                        district.appendChild(listItem);
                    });
                })
                .catch(error => console.error('Error:', error));
        });
    });
</script>
</html>
