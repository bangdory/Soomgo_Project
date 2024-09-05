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
<c:out value="${expert}"/><br>
<c:out value="${received}"/><br>
<c:out value="${expert.regionName} ${expert.categoryName}의 고수 ${expert.expertName}님"/>
<form action="/request/answerRequest" method="post">
    <input type="hidden" name="requestId" value="${received.id}">
    <input type="hidden" name="type" value="${received.categoryNum}">
    <input type="hidden" name="expertNum" value="${expert.expertName}"> <%--AnseredRequestDTO 의 이름 값 gosuId 에서 변경할 것 --%>
<%--    <input type="hidden" name="answerDTO" value="${}"--%>
    <table border="1">

    </table>
    <div>
        서비스 금액 :
        <input type="text" name="price" class="form-control" placeholder="금액을 입력하세요">
    </div>
    <div>
        서비스 설명 :
        <textarea rows="5" name="ref" class="form-control" placeholder="제공 서비스를 입력하세요"></textarea>
    </div>
    <div>
        파일 및 기타 사항 :
        <input type="text" name="file" class="form-control">
    </div>
    <button type="submit" value="견적 답변하기">견적 답변하기</button>
    <button type="reset" value="초기화">초기화</button>
</form>
</body>
</html>
