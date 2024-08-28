<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/header/header.jsp" %>

<!DOCTYPE html>
<html lang="ko">


<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/userpage/styles.css">
/* 스타일 값*/
<div class="container">
    <main>
        <div class="requests">
            <h2>받은견적</h2>
            <div class="requestContainer">
                <c:forEach var="request" items="${requests}"> /*유저가 보낸견적들*/
                    <div class="request-item">
                        <div class="sort-date">
                        <h3>${request.sort}</h3> /* 카테고리 예)IT */
                        <p><span class="regDate" data-date="${request.regDate}">${request.regDate}</span></p> /*언제 보냈는지*/
                        </div>
                        <div class="progress">
                            <div class="progress-bar">
                            </div>
                        </div>
                        <div class="progress-tag">
                            <p class="progress-tag-left">견적요청</p>
                            <p class="progress-tag-center">상담진행</p>
                            <p class="progress-tag-right">거래완료</p>
                        </div>
                        <div class="read-con">
                            <button class="read-more">자세히보기</button>
                        </div>
                    </div>
                </c:forEach>
            </div>

        </div>
        <div>
            <h2>추천 서비스</h2>
        </div>
    </main>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const dateElements = document.querySelectorAll('.regDate');
        dateElements.forEach(function (element) {
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