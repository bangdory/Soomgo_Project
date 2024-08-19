<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/header/header.jsp" %>

<!DOCTYPE html>
<html lang="ko">





<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/userpage/styles.css">
<div class="container">
    <main>
        <div class="requests">
            <h2>받은견적</h2>
            <div class="requestContainer">
                <c:forEach var="request" items="${requests}">
                    <div class="request-item">
                        <h3>${request.sort}</h3>
                        <p><span class="regDate" data-date="${request.regDate}">${request.regDate}</span></p>
                        <!-- 추가적인 요청 정보들을 여기에 표시 -->
                    </div>
                </c:forEach>
            </div>
            <a href="/userpage">되돌아가기</a>
        </div>
    </main>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const dateElements = document.querySelectorAll('.regDate');
        dateElements.forEach(function(element) {
            const dateString = element.getAttribute('data-date');
            const formattedDate = moment(dateString).format('YY.MM.DD.');
            // 마지막 `.` 제거
            const cleanedDate = formattedDate.replace(/\.$/, '');
            element.textContent = cleanedDate;
        });
    });
</script>

</body>
</html>