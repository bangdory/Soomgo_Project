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
    <title>내가 보낸 요청서</title>
</head>
<body>
<h2>Request Details</h2>
<%--<c:out value="${lists}"></c:out>--%>
<h3>답장을 받은 요청서</h3>
<c:if test="${empty lists}">
    <h5>받은 견적이 없습니다.</h5>
</c:if>
<c:forEach var="list" items="${lists}">
    <c:if test="${not empty list.replier}">
        <table border="1">
            <c:if test="${not empty list.type}">
                <tr>
                    <th>Type</th>
                    <td>${list.type}</td>
                </tr>
            </c:if>
        </table>
        <br>
        <c:if test="${not empty list.replier}">
            <div class="requestAnswer">
                <button type="submit" class="btn btn-primary" data-id="${list.id}">받은 견적 읽기</button>
                <form action="/request/delete/${receivedList.id}" method="post">
                    <button type="submit" class="btn btn-warning">견적 지우기</button>
                </form>
            </div>
        </c:if>
    </c:if>
</c:forEach>
<div id="answerDetails"></div>

<hr>
<h3>내가 보낸 요청서</h3>
<c:forEach var="list" items="${lists}">
    <c:if test="${empty list.replier}">
        <table border="1">
            <c:if test="${not empty list.type}">
                <tr>
                    <th>Type</th>
                    <td>${list.type}</td>
                </tr>
            </c:if>
        </table>
        <br>
        <c:if test="${!list.replier}">
            <div class="requestAnswer">
                <form action="/request/delete/${receivedList.id}" method="post">
                    <button type="submit" class="btn btn-warning">견적 지우기</button>
                </form>
            </div>
        </c:if>
    </c:if>
</c:forEach>
</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        document.querySelectorAll(".btn-primary").forEach(button => {
            button.addEventListener('click', function (event) {
                event.preventDefault(); // 버튼의 기본 동작 방지

                var requestId = this.dataset.id; // 버튼에 설정된 데이터 속성에서 ID 가져오기
                // console.log('requestId 불러오기', requestId)
                if (!requestId) {
                    console.error("Request ID is not found");
                    return; // ID가 없으면 요청을 보내지 않습니다.
                }

                fetch(`/request/answer-list?requestId=${requestId}`, {
                    method: 'GET',
                })
                    .then(response => {
                        if (!response.ok) {
                            throw new Error('Network response was not ok');
                        }
                        return response.json(); // 서버 응답을 JSON으로 변환
                    })
                    .then(data => {
                        // 성공적으로 데이터를 받은 후, #answerDetails 영역에 내용을 추가
                        var html = '';
                        data.forEach(answer => {
                            html += `<div>
                                    <h4>답변 ID: ${answer.no}</h4>
                                    <p>서비스 금액: ${answer.price}</p>
                                    <p>서비스 설명: ${answer.ref}</p>
                                    <p>파일: ${answer.file}</p>
                                </div>`;
                        });
                        document.getElementById('answerDetails').innerHTML = html;
                    })
                    .catch(error => {
                        console.error("데이터를 가져오는 데 실패했습니다.", error);
                        document.getElementById('answerDetails').innerHTML = '<p>데이터를 가져오는 데 실패했습니다.</p>';
                    });
            });
        });
    });
</script>

</html>
