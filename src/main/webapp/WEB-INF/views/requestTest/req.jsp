<%--
  Created by IntelliJ IDEA.
  User: goott
  Date: 2024-08-05
  Time: 오후 3:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>고객 form 보내기 테스트</title>
</head>
<body>
<h1>고객 FORM 보내기 테스트</h1>
<form name="formSend" method="post" action="/soomgo/req">
    <div class="selectDate">
        <div>
            <input type="checkbox" id="monday" name="req_sub" value="monday"/>
            <label for="monday">월요일</label>
        </div>
        <div>
            <input type="checkbox" id="tuesday" name="req_sub" value="tuesday"/>
            <label for="tuesday">화요일</label>
        </div>
        <div>
            <input type="checkbox" id="wednesday" name="req_sub" value="wednesday"/>
            <label for="wednesday">수요일</label>
        </div>
        <div>
            <input type="checkbox" id="thursday" name="req_sub" value="thursday"/>
            <label for="thursday">목요일</label>
        </div>
        <div>
            <input type="checkbox" id="friday" name="req_sub" value="friday"/>
            <label for="friday">금요일</label>
        </div>
        <div>
            <input type="checkbox" id="saturday" name="req_sub" value="saturday"/>
            <label for="saturday">토요일</label>
        </div>
        <div>
            <input type="checkbox" id="sunday" name="req_sub" value="sunday"/>
            <label for="sunday">일요일</label>
        </div>
        <div>
            <input type="text" name="newbieId">
        </div>
    </div>
    <div><input type="submit"></div>
</form>
</body>
</html>
