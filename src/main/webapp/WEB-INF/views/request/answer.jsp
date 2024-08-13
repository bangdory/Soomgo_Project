<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: klarnuri
  Date: 2024-08-14
  Time: 오전 12:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>견적 답변하기</title>
</head>
<body>
<c:out value="${gosu.region} ${gosu.type}의 고수 ${gosu.id}님"/>
<form action="/request/answer" method="post">
    <input type="hidden" name="gosuId" value="${gosu.id}">
    <input type="hidden" name="id" value="${request.id}">
    <table border="1">
        <c:if test="${not empty request.id}">
            <tr>
                <th>ID</th>
                <td>${request.id}</td>
            </tr>
        </c:if>
        <c:if test="${not empty request.writer}">
            <tr>
                <th>Writer</th>
                <td>${request.writer}</td>
            </tr>
        </c:if>
        <c:if test="${not empty request.regDate}">
            <tr>
                <th>Registration Date</th>
                <td>${request.regDate}</td>
            </tr>
        </c:if>
        <c:if test="${not empty request.sort}">
            <tr>
                <th>Sort</th>
                <td>${request.sort}</td>
            </tr>
        </c:if>
        <c:if test="${not empty request.type}">
            <tr>
                <th>Type</th>
                <td>${request.type}</td>
            </tr>
        </c:if>
        <c:if test="${not empty request.sub}">
            <tr>
                <th>Sub</th>
                <td>${request.sub}</td>
            </tr>
        </c:if>
        <c:if test="${not empty request.file1}">
            <tr>
                <th>File 1</th>
                <td>${request.file1}</td>
            </tr>
        </c:if>
        <c:if test="${not empty request.file2}">
            <tr>
                <th>File 2</th>
                <td>${request.file2}</td>
            </tr>
        </c:if>
        <c:if test="${request.cr != null}">
            <tr>
                <th>Commercial Use</th>
                <td>${request.cr}</td>
            </tr>
        </c:if>
        <c:if test="${not empty request.amount}">
            <tr>
                <th>Amount</th>
                <td>${request.amount}</td>
            </tr>
        </c:if>
        <c:if test="${not empty request.addService}">
            <tr>
                <th>Additional Service</th>
                <td>${request.addService}</td>
            </tr>
        </c:if>
        <c:if test="${not empty request.delService}">
            <tr>
                <th>Delete Service</th>
                <td>${request.delService}</td>
            </tr>
        </c:if>
        <c:if test="${not empty request.result}">
            <tr>
                <th>Result</th>
                <td>${request.result}</td>
            </tr>
        </c:if>
        <c:if test="${not empty request.day}">
            <tr>
                <th>Day</th>
                <td>${request.day}</td>
            </tr>
        </c:if>
        <c:if test="${not empty request.time}">
            <tr>
                <th>Time</th>
                <td>${request.time}</td>
            </tr>
        </c:if>
        <c:if test="${not empty request.age}">
            <tr>
                <th>Age</th>
                <td>${request.age}</td>
            </tr>
        </c:if>
        <c:if test="${not empty request.sex}">
            <tr>
                <th>Sex</th>
                <td>${request.sex}</td>
            </tr>
        </c:if>
        <c:if test="${not empty request.fav}">
            <tr>
                <th>Favorite</th>
                <td>${request.fav}</td>
            </tr>
        </c:if>
        <c:if test="${not empty request.place}">
            <tr>
                <th>Place</th>
                <td>${request.place}</td>
            </tr>
        </c:if>
        <c:if test="${not empty request.date}">
            <tr>
                <th>Date</th>
                <td>${request.date}</td>
            </tr>
        </c:if>
        <c:if test="${not empty request.region}">
            <tr>
                <th>Region</th>
                <td>${request.region}</td>
            </tr>
        </c:if>
        <c:if test="${not empty request.ref}">
            <tr>
                <th>Reference</th>
                <td>${request.ref}</td>
            </tr>
        </c:if>
    </table>
    <div>
        서비스 금액 :
        <input type="text" name="price" class="form-control" placeholder="금액을 입력하세요">
    </div>
    <div>
        서비스 설명 :
        <textarea rows="5" name="replyRef" class="form-control" placeholder="제공 서비스를 입력하세요"></textarea>
    </div>
    <div>
        파일 및 기타 사항 :
        <input type="text" name="replyFile" class="form-control">
    </div>
    <button type="submit" value="견적 답변하기">견적 답변하기</button>
    <button type="reset" value="초기화">초기화</button>
</form>
</body>
</html>
