<%--
  Created by IntelliJ IDEA.
  User: J.Y
  Date: 2024-08-12
  Time: 오후 8:06
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html>
<head>
    <title>커뮤니티</title>
</head>
<body>
<%@include file="../header/header.jsp"%>
<%@ include file="../header/headerModal.jsp"%>
<div>
    <h1>커뮤니티</h1>
    <table>
        <tr>
            <td><a href="/community/listAll">전체</a></td>
        </tr>
        <tr>
            <td><a href="/community/listAll?board_no=1">고수에게묻다</a></td>
        </tr>
        <tr>
            <td><a href="/community/listAll?board_no=2">고수노하우</a></td>
        </tr>
        <tr>
            <td><a href="/community/listAll?board_no=3">함께해요</a></td>
        </tr>
        <tr>
            <td><a href="/community/listAll?board_no=4">고수소식</a></td>
        </tr>
    </table>
</div>
<div>
    <table>
        <tr><a href="/community/register">글쓰기</a></tr>
        <tr>
            <td>서비스</td><td>지역</td>
        </tr>
        <c:forEach items="${boards}" var="board">
            <tr onclick="/community/read?cb_no=${board.cb_no}">
                <td>${board.cb_title}</td>
                <td>${board.cb_content}</td>
                <td>${board.cb_addr}</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
