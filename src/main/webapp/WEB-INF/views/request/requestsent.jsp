<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/header/header.jsp" %>

<!DOCTYPE html>
<html lang="ko">

<style>
    body {
        margin : 0;
        padding: 0;
        font-family: Arial, sans-serif;
    }
    .requestContainer {
        padding-top: 60px; /* 헤더 높이만큼 패딩을 주어 본문이 헤더 아래로 오도록 함 */
    }
    main {
        padding: 20px;
    }
    .requestContainer {
        display: flex;
        flex-wrap: wrap; /* 요소가 넘칠 때 줄 바꿈 */
        gap: 10px; /* 요소 간의 간격 */
        padding: 20px; /* 컨테이너 내부 여백 */
        box-sizing: border-box; /* 패딩과 테두리를 포함하여 크기 계산 */
    }
    .request-item {
        background-color: #ffffff; /* 배경 색상 (흰색) */
        border: 1px solid #cccccc; /* 테두리 색상 (회색) */
        border-radius: 5px; /* 테두리 둥글기 (5px) */
        padding: 10px; /* 모든 방향의 내부 여백을 10px로 설정 */
        box-sizing: border-box; /* 테두리와 여백을 포함한 박스 모델 사용 */
        height: 180px; /* 고정 높이 설정 */
        flex: 1 1 calc(25% - 20px); /* 너비를 25%로 설정 (간격을 고려) */
        min-width: 250px;
        margin: 5px; /* 상하좌우 여백 추가 */
    }
    /* 기본 너비값 설정 */
    /* 화면 크기가 1200px 이상일 때 */
    @media (min-width: 1260px) {
        .requestContainer {
            min-width: 30%;
            max-width: 100%;
        }
        .request-item {
            max-width: 30%;
        }
    }
    /* 화면 크기가 992px 이상 1199px 이하일 때 */
    @media (min-width: 875px) and (max-width: 1259px) {
        .requestContainer {
            width:100%
        }
        .request-item {
            max-width: 45%;
        }
    }
    /* 화면 크기가 768px 이상 991px 이하일 때 */
    /* 화면 크기가 768px 이하일 때 */
    @media (max-width: 874px) {
        .requestContainer {
            width: 100%;
        }
        .request-item {
            max-width: 90%;
        }
    }
    .request-item p {
        font-size: 13px;
        color: #888888;
        border: solid transparent;
    }
    .btn-primary {
        background-color: mediumturquoise;
        border: solid transparent;
        border-radius: 5px;
        width: 100%;
        height: 30%;
        cursor: pointer;
        color: white;
    }
    .sort-date h3 {
        margin: 0;
        padding-top: 10px;
        padding-left: 5px;
    }
    .sort-date p {
        margin: 0;
        padding-left: 3px;
        padding-bottom: 10px;
    }
    .read-con {
        padding-top: 5px;
    }
    .progress {
        height: 10px;
        width: 100%;
    }
    .progress-bar {
        height: 10px;
        width: 100%;
        background-color: mediumturquoise;
        border-radius: 5px;
    }
    .progress-tag {
        display: flex;
        justify-content: space-between; /* 요소들 사이의 공간을 균등하게 분배 */
        width: 100%; /* 부모 항목의 너비에 맞춤 */
        height: 10%; /* 부모 항목의 높이에 맞춤 */
        /* 요소 간의 균등한 간격 설정 */
        overflow: hidden; /* 넘치는 내용 숨김 */
        padding-bottom: 5px;
    }
    .progress-tag p {
        flex: 1; /* 각 p 요소가 남은 공간을 균등하게 채우도록 설정 */
        margin: 0; /* 기본 여백 제거 */
    }
    .progress-tag-center {
        text-align: center; /* 텍스트를 중앙 정렬 */
    }
    .progress-tag-left {
        text-align: left; /* 텍스트를 중앙 정렬 */
    }
    .progress-tag-right {
        text-align: right; /* 텍스트를 중앙 정렬 */
    }
</style>
<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<%--<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/request/style.css">--%>
<%--<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/request/style.css">--%>

<%-- 스타일 값--%>
<div class="container">
    <main>
        <div class="requests">
            <h2>받은견적</h2>
            <div class="requestContainer">
                <c:forEach var="request" items="${requests}"> <%--유저가 보낸견적들--%>
                    <div class="request-item">
                        <div class="sort-date">
                        <h3>${request.sort}</h3> <%-- 카테고리 예)IT --%>
                        <p><span class="regDate" data-date="${request.regDate}">${request.regDate}</span></p> <%--언제 보냈는지--%>
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