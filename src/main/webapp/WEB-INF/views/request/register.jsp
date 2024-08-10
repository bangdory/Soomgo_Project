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
<%--
<form method="post" action="/request/register">
    <input type="text" name="ref" value="견적요구사항">
<button>견적 보내기</button>
</form>
--%>
<form method="post" action="/request/register" onsubmit="updateFields()">
    <fieldset>
        <legend>견적 보내기</legend>
        <div>
            <label for="sort" class="form-label mt-4">이름을 입력하세요</label>
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
            <div>
                <label>
                    <input type="checkbox" name="date" value="monday">
                    월요일</label>
                <label>
                    <input type="checkbox" name="date" value="tuesday">
                    화요일</label>
                <label>
                    <input type="checkbox" name="date" value="wednesday">
                    수요일</label>
                <label>
                    <input type="checkbox" name="date" value="thursday">
                    목요일</label>
                <label>
                    <input type="checkbox" name="date" value="friday">
                    금요일</label>
                <label>
                    <input type="checkbox" name="date" value="saturday">
                    토요일</label>
                <label>
                    <input type="checkbox" name="date" value="sunday">
                    일요일</label>
            </div>
        </div>
        <div>
            <label for="time" class="form-label mt-4">시간대</label>
            <div>
                <label>
                    <input type="checkbox" name="time" value="morning">
                    오전</label>
                <label>
                    <input type="checkbox" name="time" value="afternoon">
                    오후</label>
                <label>
                    <input type="checkbox" name="time" value="evening">
                    저녁</label>
            </div>
            <input type="hidden" id="timeField" name="time" value="">
        </div>
        <div>
            <label for="ref" class="form-label mt-4">기타 사항</label>
            <textarea name="ref" class="form-control" id="ref" rows="3" placeholder="서비스 설명을 적어주세요"></textarea>
        </div>
        <div>
            <button type="submit" class="btn btn-primary">견적 보내기</button>
        </div>
    </fieldset>
</form>
</body>
<script>
    function updateField(fieldName, hiddenFieldId) {
        var checkboxes = document.querySelectorAll(`input[name="${fieldName}"]:checked`);
        var selectedValues = Array.from(checkboxes).map(cb => cb.value);
        document.getElementById(hiddenFieldId).value = selectedValues.join(',');
    }

    function updateFields() {
        updateField('date', 'dateField');
        updateField('time', 'timeField');
    }
</script>

</html>


--------------
<html>
<head>
    <title>Title</title>
    <style>

    </style>
</head>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        // .category-link 요소에 클릭 이벤트 리스너 추가
        document.querySelectorAll('#category-list-1 a').forEach(function (link) {
            link.addEventListener('click', function (event) {
                event.preventDefault(); // 기본 링크 동작 방지

                // 클릭된 링크의 data-id 값 가져오기
                var id = this.getAttribute('data-id');

                // AJAX 요청
                fetch('/category/list/ajax?id=' + id)
                    .then(response => response.json())
                    .then(data => {
                        // list2를 업데이트
                        var list2 = document.getElementById('category-list-2');
                        list2.innerHTML = ''; // 기존 내용을 지우기

                        // 새로운 데이터를 추가
                        data.forEach(item => {
                            // <li> 요소 생성
                            var listItem = document.createElement('li');
                            // <a> 요소 생성
                            var link = document.createElement('a');
                            // <a> 요소의 href 값 기본값 지정
                            link.href = '#'; // 링크 기본 URL 설정
                            link.textContent = item.categoryName; // 링크 텍스트 설정

                            // <li> 요소에 <a> 요소 추가
                            listItem.appendChild(link);

                            // <ul> 요소에 <li> 요소 추가
                            list2.appendChild(listItem);
                        });
                    })
                    .catch(error => console.error('Error:', error));
            });
        });
    });
</script>
<%--

<body>
<div>
    <div class="territoryContainer">

        <div class="categoryleft">
            <p><h2>시 / 도</h2></p>
            <ul id="category-list-1">
                <c:forEach var="i1" items="${list}">
                    <li><a href="#" class="category-link" data-id="${i1.id}">${i1.categoryName}</a></li>
                </c:forEach>
            </ul>
        </div>



        <br>
        <div class="categoryright" id="category-list2">
            <p><h2>소분류 카테고리</h2></p>
            <ul id="category-list-2">
                <c:forEach var="i2" items="${list2}">
                    <li><a href="#">${i2.categoryName}</a></li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>
</body>
--%>

</html>
