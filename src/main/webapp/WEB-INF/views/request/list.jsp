<%--
  Created by IntelliJ IDEA.
  User: klarnuri
  Date: 2024-08-07
  Time: 오전 1:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>견적서 리스트</title>
</head>
<body>
<h2>Request Details</h2>

<table border="1">
    <c:if test="${not empty dto.id}">
        <tr>
            <th>ID</th>
            <td>${dto.id}</td>
        </tr>
    </c:if>
    <c:if test="${not empty dto.writer}">
        <tr>
            <th>Writer</th>
            <td>${dto.writer}</td>
        </tr>
    </c:if>
    <c:if test="${not empty dto.regDate}">
        <tr>
            <th>Registration Date</th>
            <td>${dto.regDate}</td>
        </tr>
    </c:if>
    <c:if test="${not empty dto.sort}">
        <tr>
            <th>Sort</th>
            <td>${dto.sort}</td>
        </tr>
    </c:if>
    <c:if test="${not empty dto.type}">
        <tr>
            <th>Type</th>
            <td>${dto.type}</td>
        </tr>
    </c:if>
    <c:if test="${not empty dto.sub}">
        <tr>
            <th>Sub</th>
            <td>${dto.sub}</td>
        </tr>
    </c:if>
    <c:if test="${not empty dto.file1}">
        <tr>
            <th>File 1</th>
            <td>${dto.file1}</td>
        </tr>
    </c:if>
    <c:if test="${not empty dto.file2}">
        <tr>
            <th>File 2</th>
            <td>${dto.file2}</td>
        </tr>
    </c:if>
    <c:if test="${dto.cr != null}">
        <tr>
            <th>Commercial Use</th>
            <td>${dto.cr}</td>
        </tr>
    </c:if>
    <c:if test="${not empty dto.amount}">
        <tr>
            <th>Amount</th>
            <td>${dto.amount}</td>
        </tr>
    </c:if>
    <c:if test="${not empty dto.addService}">
        <tr>
            <th>Additional Service</th>
            <td>${dto.addService}</td>
        </tr>
    </c:if>
    <c:if test="${not empty dto.delService}">
        <tr>
            <th>Delete Service</th>
            <td>${dto.delService}</td>
        </tr>
    </c:if>
    <c:if test="${not empty dto.result}">
        <tr>
            <th>Result</th>
            <td>${dto.result}</td>
        </tr>
    </c:if>
    <c:if test="${not empty dto.day}">
        <tr>
            <th>Day</th>
            <td>${dto.day}</td>
        </tr>
    </c:if>
    <c:if test="${not empty dto.time}">
        <tr>
            <th>Time</th>
            <td>${dto.time}</td>
        </tr>
    </c:if>
    <c:if test="${not empty dto.age}">
        <tr>
            <th>Age</th>
            <td>${dto.age}</td>
        </tr>
    </c:if>
    <c:if test="${not empty dto.sex}">
        <tr>
            <th>Sex</th>
            <td>${dto.sex}</td>
        </tr>
    </c:if>
    <c:if test="${not empty dto.fav}">
        <tr>
            <th>Favorite</th>
            <td>${dto.fav}</td>
        </tr>
    </c:if>
    <c:if test="${not empty dto.place}">
        <tr>
            <th>Place</th>
            <td>${dto.place}</td>
        </tr>
    </c:if>
    <c:if test="${not empty dto.date}">
        <tr>
            <th>Date</th>
            <td>${dto.date}</td>
        </tr>
    </c:if>
    <c:if test="${not empty dto.region}">
        <tr>
            <th>Region</th>
            <td>${dto.region}</td>
        </tr>
    </c:if>
    <c:if test="${not empty dto.ref}">
        <tr>
            <th>Reference</th>
            <td>${dto.ref}</td>
        </tr>
    </c:if>
</table>
</body>
<script>
    <%--const id =--%>
    <%--${result}--%>
</script>
</html>
