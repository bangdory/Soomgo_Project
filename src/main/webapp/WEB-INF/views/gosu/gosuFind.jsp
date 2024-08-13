<%--
  Created by IntelliJ IDEA.
  User: bemsu
  Date: 2024-08-08
  Time: 오전 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<%@include file="../header/header.jsp"%>
<main>
<div>
    <h2>고수 찾기</h2>
</div>
    <div>
        <div id="service-modal-open">
            서비스
        </div>
        <div id="place-modal-open">
            지역
        </div>
    </div>
<br>
<div id="modalDataIn">서비스 데이터 여기에 넣기</div>
<br>
<div id="placeModalData">지역 데이터 여기에 넣기</div>
<br>
<div id="dataDisplay"> 모달 데이터 전송받을 위치</div>
<br>
</main>
<%@include file="gosuModal.jsp" %>
</body>
</html>
