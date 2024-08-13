<%--
  Created by IntelliJ IDEA.
  User: goott
  Date: 2024-08-06
  Time: 오후 3:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>결과</title>
</head>
<body>
<h1>Request List</h1>
<table border="1">
    <thead>
    <tr>
        <th>Request ID</th>
        <th>Newbie ID</th>
        <th>Registration Date</th>
        <th>Subject</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="request" items="${requestList}">
        <tr>
            <td>${request.getReq_id}</td>
            <td>${request.getReq_newbie}</td>
            <td>${request.getReq_regDate}</td>
            <td>${request.getReq_sub}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
