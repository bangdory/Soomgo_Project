<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: klarnuri
  Date: 2024-08-13
  Time: 오전 1:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>카테고리 선택</title>
    <link href="${pageContext.request.contextPath}/resources/static/css/request/style.css" rel="stylesheet">
    <style>
        .container {
            padding-top: 80px;
            display: flex;
        }
    </style>
</head>
<body>
<%@include file="../header/header.jsp" %>
<div class="container">
    <form id="categoryList" action="/request/category" method="post">
        <input type="hidden" id="categorySort" name="categorySort" value="">
        <input type="hidden" id="categoryType" name="categoryType" value="">
        <div>
            <label for="categorySelect">카테고리를 선택하세요 :</label>
            <select id="categorySelect" name="categorySelect">
                <option value="">카테고리</option>
                <c:forEach var="category" items="${list}">
                    <option class="selectCategory" value="${category}">${category}</option>
                </c:forEach>
            </select>
        </div>
        <div>
            <label for="categoryName">상세 서비스를 선택하세요 :</label>
            <select name="categoryName" id="categoryName">
                <option id="type">상세 서비스</option>
            </select>
        </div>
        <div>
            <button type="button" onclick="submitForm()">견적 작성</button>
        </div>
    </form>
</div>
</body>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        // categorySelect 가 변경될 때마다 AJAX 요청을 보내는 코드
        document.getElementById('categorySelect').addEventListener('change', function (event) {
            // 선택된 category 값을 가져오기
            var category = this.value;
            // console.log(category);

            // AJAX 요청
            fetch('/request/category/list?type=' + category)
                // GetMapping 되어있는 주소 입력하고 GET 방식 모습대로 줄 것
                .then(response => response.json())
                .then(data => {
                    // districtSelect 업데이트
                    var type = document.getElementById('categoryName');
                    type.innerHTML = ''; // 기존 내용을 지우기

                    // 새로운 데이터를 추가
                    data.forEach(item => {
                        // console.log(item.categoryName);
                        // <option> 요소 생성
                        var listItem = document.createElement('option');
                        // console.log('----------------------',listItem)
                        // <option> 요소의 텍스트 설정
                        listItem.textContent = item.categoryName;
                        listItem.value = item.categoryNum;

                        // <select> 요소에 <option> 요소 추가
                        type.appendChild(listItem);
                    });
                })
                .catch(error => console.error('Error:', error));
        });
    });

    function submitForm() {
        document.getElementById('categoryList').submit();


        // const name = document.getElementById('categoryName');
        // console.log(name)
    }
</script>
</html>
