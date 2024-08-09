<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: bemsu
  Date: 2024-08-07
  Time: 오전 11:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>expert/list</title>
</head>
<body>
<c:forEach var="expert" items="${expertList}">
    <p>expert_num : ${expert.expert_num}</p>
    <p>user_num : ${expert.user_num}</p>
    <p>category_num : ${expert.category_num}</p>
    <p>experience_years : ${expert.experience_years}</p>
    <p>education : ${expert.education}</p>
    <p>rating : ${expert.rating}</p>
    <br>
</c:forEach>
</body>
</html>
