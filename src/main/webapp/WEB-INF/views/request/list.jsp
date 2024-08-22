<%--
  Created by IntelliJ IDEA.
  User: klarnuri
  Date: 2024-08-07
  Time: 오전 1:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>내가 보낸 요청서</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .left, .right {
            flex: 1; /* 두 개의 영역을 동일하게 나누기 위해 flex: 1 설정 */
            padding: 10px; /* 여백 추가 */
        }

        .hidden {
            display: none;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        .requestContainer {
            padding-top: 60px; /* 헤더 높이만큼 패딩을 주어 본문이 헤더 아래로 오도록 함 */
            display: flex;
        }

        main {
            padding: 20px;
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
            max-width: 300px;
            margin: 5px; /* 상하좌우 여백 추가 */
        }

        /* 기본 너비값 설정 */


        .request-item p {
            font-size: 13px;
            color: #888888;
            border: solid transparent;
        }

        .btn-primary {
            background-color: mediumturquoise;
            border: solid transparent;
            border-radius: 5px;
            width: 40%;
            height: 30px;
            cursor: pointer;
            color: white;
            margin: 3px;
            float: right;
        }

        .backButton {
            border: solid transparent;
            border-radius: 5px;
            width: 40%;
            height: 30px;
            cursor: pointer;
            margin: 3px;
            float: left;
        }

        .btn-detail {
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
            padding-bottom: 20px;

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

        .requestDetail {
            float: right;
        }
    </style>
</head>
<body>
<%@include file="../header/header.jsp" %>
<div class="container">

    <div class="requests">

        <%--<c:out value="${lists}"></c:out>--%>
        <div class="requestContainer">
            <div class="left">
                <h2>내 견적서</h2>
                <h3>답장을 받은 요청서</h3>
                <c:forEach var="list" items="${lists}">
                    <c:if test="${not empty list.replier}">
                        <div class="request-item">
                            <div class="sort-date">
                                <h3>${list.sort}</h3> <%-- 카테고리 예)IT --%>
                                <p><span class="regDate" data-date="${list.regDate}">${list.regDate}</span>
                                </p> <%--언제 보냈는지--%>
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
                                <button class="btn-detail" data-list='${list.id}'>자세히보기</button>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
                <h3>내가 보낸 요청서</h3>
                <c:forEach var="list" items="${lists}">
                    <c:if test="${empty list.replier}">
                        <div class="request-item">
                            <div class="sort-date">
                                <h3>${list.sort}</h3> <%-- 카테고리 예)IT --%>
                                <p><span class="regDate" data-date="${list.regDate}">${list.regDate}</span>
                                </p> <%--언제 보냈는지--%>
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
                                <button class="btn-detail">자세히보기</button>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
            <div class="right">
                <div class="hidden" id="answerDetails">
                </div>
                <div class="requestDetail" id="requestDetail">
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade hidden" id="detailModal" tabindex="-1" aria-labelledby="detailModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="detailModalLabel">상세 견적</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="modal-body">
                    ...
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn" data-bs-dismiss="modal">닫기</button>
                    <button type="button" class="btn">답장하기</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>


<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
        integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
        crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>

<script>
    /*function hideDetail() {
        const answerDetailDiv = document.getElementById('answerDetails');
        answerDetailDiv.classList.add('hidden');
        const requestDetailDiv = document.getElementById('requestDetail');
        if (requestDetailDiv.classList.contains('hidden')) {
            requestDetailDiv.classList.remove('hidden');
        }

        // 필요에 따라 추가적인 초기화 작업 수행
        const requestDetail = document.getElementById('requestDetail');
        requestDetail.innerHTML = ''; // 상세 정보 영역의 내용을 초기화
    }

    function hideRequest() {
        const requestDetailDiv = document.getElementById('requestDetail');
        requestDetailDiv.classList.add('hidden')
        const answerDetailDiv = document.getElementById('answerDetails');
        if (answerDetailDiv.classList.contains('hidden')) {
            answerDetailDiv.classList.remove('hidden');
        }
    }*/

    function formatDateFromArray(dateArray) {
        // 배열의 요소를 각각의 변수로 추출
        const [year, month, day] = dateArray;

        // 원하는 형식으로 변환
        return year + `년 ` + month + `월 ` + day + `일`;
    }

    document.addEventListener('DOMContentLoaded', function () {
            const dateElements = document.querySelectorAll('.regDate');
            dateElements.forEach(function (element) {
                const dateString = element.getAttribute('data-date');
                const formattedDate = moment(dateString).format('YY.MM.DD.');
                // 마지막 `.` 제거
                const cleanedDate = formattedDate.replace(/\.$/, '');
                element.textContent = cleanedDate;
            });
            document.querySelectorAll('.deleteRequest').forEach(button => {
                button.addEventListener('click', function () {
                    console.log('견적 지우기 버튼 클릭됨', this.id);
                });
            });

            // 모든 버튼에 대해 이벤트 핸들러를 한 번만 등록
            const detailButton = document.querySelectorAll(".btn-detail");
            detailButton.forEach(button => {
                button.addEventListener('click', function () {
                    const answerDetailDiv = document.getElementById('answerDetails');
                    answerDetailDiv.classList.remove('hidden');
                    const requestDetail = document.getElementById('requestDetail');
                    requestDetail.classList.remove('hidden')

                    const listData = button.getAttribute('data-list');

                    // console.log(listData);
                });
                button.addEventListener('click', showDetail);
            });

            function showDetail(event) {
                event.preventDefault(); // 버튼의 기본 동작 방지

                const requestId = event.currentTarget.getAttribute('data-list'); // 버튼에 설정된 데이터 속성에서 ID 가져오기
                // console.log('requestId 불러오기 : ', requestId);

                if (!requestId) {
                    console.error("Request ID is not found");
                    return; // ID가 없으면 요청을 보내지 않습니다.
                }

                fetch('/request/request-detail?requestId=' + encodeURIComponent(requestId), {
                    method: 'GET',
                    headers: {
                        'Accept': 'application/json' // 응답을 JSON으로 처리하겠다는 요청
                    }
                })
                    .then(response => {
                        if (!response.ok) {
                            throw new Error('Network response was not ok');
                        }
                        return response.json(); // 서버 응답을 JSON으로 변환
                    })
                    .then(data => {
                        // console.log(data.id)
                        const requestDetail = document.getElementById('requestDetail');
                        requestDetail.innerHTML = ''; // 기존 내용 삭제
                        // data.forEach(answer => {
                        // console.log(data);

                        const h3 = document.createElement('h3');
                        h3.textContent = '요청서 상세보기'

                        const h4 = document.createElement('h4');
                        h4.textContent = '고수 ID: ' + data.type;
                        h4.setAttribute('type', data.type);

                        const h5 = document.createElement('h5');
                        const beforeFormatDate = data.regDate;
                        const regDate = formatDateFromArray(beforeFormatDate);
                        // console.log(regDate);
                        h5.textContent = '작성일 : ' + regDate;
                        h5.setAttribute('reaDate', regDate);

                        const backButton = document.createElement('button');
                        backButton.classList.add('backButton');
                        backButton.textContent = '뒤로가기'

                        const showAnswers = document.createElement('button');
                        showAnswers.classList.add('btn-primary');
                        const reqId = data.id;
                        console.log(reqId)
                        showAnswers.dataset.id = reqId;
                        showAnswers.textContent = '견적보기'
                        showAnswers.addEventListener('click', handleButtonClick);
                        showAnswers.addEventListener('click', hideRequest)

                        // 기존 btn-primary 버튼 삭제
                        document.querySelectorAll('.btn-primary').forEach(btn => {
                            const closestDiv = btn.closest('div');
                            if (closestDiv) {
                                closestDiv.innerHTML = ''
                            }
                        });


                        requestDetail.appendChild(h3);
                        requestDetail.appendChild(h4);
                        requestDetail.appendChild(h5);
                        requestDetail.appendChild(backButton);
                        requestDetail.appendChild(showAnswers);

                    })

                function hideRequest() {
                    const requestDetail = document.getElementById('requestDetail');
                    const answerDetail = document.getElementById('answerDetails');

                    if (!requestDetail.classList.contains('hidden')) {
                        requestDetail.classList.add('hidden');
                    }
                    if (answerDetail.classList.contains('hidden')) {
                        requestDetail.classList.remove('hidden');
                    }

                    // 필요에 따라 추가적인 초기화 작업 수행
                    // requestDetail.innerHTML = '';
                }

                function formatDateFromArray(dateArray) {
                    // 배열의 요소를 각각의 변수로 추출
                    const [year, month, day] = dateArray;

                    // 원하는 형식으로 변환
                    return year + `년 ` + month + `월 ` + day + `일`;
                }
            }

            function addButtons() {
                const buttons = document.querySelectorAll(".btn-primary");
                buttons.forEach(button => {
                    button.addEventListener('click', handleButtonClick);
                });
            }

/*
            document.querySelectorAll(".btn-primary").forEach(button => {
                // 이벤트 핸들러를 직접 함수로 등록
                button.addEventListener('click', handleButtonClick);
            });
*/

            function handleButtonClick(event) {
                event.preventDefault(); // 버튼의 기본 동작 방지

                const button = event.currentTarget; // 버튼에 설정된 데이터 속성에서 ID 가져오기
                console.log(button);
                const requestId = button.getAttribute("data-id");
                console.log('requestId 불러오기 : ', requestId);

                if (!requestId) {
                    console.error("Request ID is not found");
                    return; // ID가 없으면 요청을 보내지 않습니다.
                }

                fetch('/request/answer-list?requestId=' + encodeURIComponent(requestId), {
                    method: 'GET',
                    headers: {
                        'Accept': 'application/json' // 응답을 JSON으로 처리하겠다는 요청
                    }
                })
                    .then(response => {
                        if (!response.ok) {
                            throw new Error('Network response was not ok');
                        }
                        return response.json(); // 서버 응답을 JSON으로 변환
                    })
                    .then(data => {
                        const answerDetails = document.getElementById('answerDetails');
                        answerDetails.innerHTML = ''; // 기존 내용 삭제
                        data.forEach(answer => {

                            const h3 = document.createElement('h3');
                            h3.textContent = '선택된 요청서의 답변'

                            const h4 = document.createElement('h4');
                            h4.textContent = '고수 ID: ' + answer.gosuId;
                            h4.setAttribute('gosuId', answer.gosuId);

                            const h5 = document.createElement('h5');
                            h5.textContent = '서비스 금액: ' + answer.price;
                            h5.setAttribute('price', answer.price);

                            const readButton = document.createElement('button');

                            // 버튼 속성 설정
                            readButton.type = 'button'; // type 속성 추가
                            readButton.textContent = '상세 견적 보기';
                            // readButton.id = 'readModal';
                            readButton.classList.add('btn', 'btn-primary', 'readButton'); // class 속성 추가
                            readButton.setAttribute('data-bs-toggle', 'modal'); // data-bs-toggle 속성 추가
                            readButton.setAttribute('data-bs-target', '#detailModal'); // data-bs-target 속성 추가
                            readButton.dataset.id = answer.no + '|' + answer.gosuId + '|' + answer.price + '|' + answer.ref + '|' + answer.file;
                            readButton.addEventListener('click', function (event) {

                                const dataIdValue = getDataValue(event);

                                const modalDiv = document.getElementById('modal-body');

                                const [no, gosuId, price, ref, file] = dataIdValue.split('|');
                                console.log('no: ' + no);
                                console.log('gosuId: ' + gosuId);
                                console.log('price: ' + price);
                                console.log('ref: ' + ref);
                                console.log('file: ' + file);
                                // answer.no + '|' + answer.gosuId + '|' + answer.price + '|' + answer.ref + '|' + answer.file;

                                const dataDiv = document.createElement('div');
                                modalDiv.innerHTML = '';
                                dataDiv.innerHTML = `
        <div>답변한 고수 : ` + gosuId + `</div>
        <div>견적 금액 : ` + price + `</div>
        <div>서비스 내용 : ` + ref + `</div>
        <div>기타 사항 : ` + file + `</div>
    `;

                                modalDiv.appendChild(dataDiv);
                                console.log(answer)

                            })
                            const deleteButton = document.createElement('button');
                            deleteButton.textContent = '견적 지우기';
                            deleteButton.classList.add('btn', 'btn-secondary', 'deleteAnswer');
                            deleteButton.dataset.id = answer.no;
                            deleteButton.addEventListener('click', function (event) {
                                console.log(answer)
                            })

                            const backToList = document.createElement('button');
                            backToList.textContent = '견적으로 돌아가기'
                            backToList.addEventListener('click', hideRequest)

                            function hideRequest() {
                                const answerDetail = document.getElementById('answerDetails');
                                if (answerDetail.classList.contains('hidden')) {
                                    answerDetail.classList.remove('hidden');
                                }
                                // 필요에 따라 추가적인 초기화 작업 수행
                                answerDetail.innerHTML = '';

                                const requestDetail = document.getElementById('requestDetail');
                                if (requestDetail.classList.contains('hidden')) {
                                    requestDetail.classList.remove('hidden');
                                }
                            }


                            answerDetails.appendChild(h3);
                            answerDetails.appendChild(h4);
                            answerDetails.appendChild(h5);
                            answerDetails.appendChild(readButton);
                            answerDetails.appendChild(backToList)
                            answerDetails.appendChild(deleteButton);
                        });

                        addButtons()

                        document.querySelectorAll('.btn-info').forEach(button => {
                            // 이벤트 핸들러를 직접 함수로 등록
                            button.addEventListener('click', function () {
                                console.log('견적 읽기 버튼 클릭됨', this.dataset.id);
                            });
                        });

                        document.querySelectorAll('.deleteAnswer').forEach(button => {
                            button.addEventListener('click', function () {
                                console.log('견적 지우기 버튼 클릭됨', this.dataset.id);
                            });
                        });
                    })
                    .catch(error => {
                        console.error("데이터를 가져오는 데 실패했습니다.", error);
                        document.getElementById('answerDetails').innerHTML = '<p>데이터를 가져오는 데 실패했습니다.</p>';
                    });
            }
        }
    )
    ;

    // data-id 값을 가져오는 함수
    function getDataValue(event) {
        // 클릭된 버튼 요소를 가져오기
        const button = event.target;
        // data-id 속성 값 가져오기
        return button.dataset.id;
    }
</script>
</html>
