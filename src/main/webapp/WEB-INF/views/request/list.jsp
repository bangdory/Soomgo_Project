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
    <title>내 요청서</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/static/css/request/style.css" rel="stylesheet">
</head>
<body>

<%@include file="../header/header.jsp" %>
<div class="container">

    <div class="requests">

        <%--<c:out value="${lists}"></c:out>--%>
        <div class="requestContainer">
            <div class="left">
                <h2>내 요청서</h2>
                <div class="wrapper">
                    <input type="checkbox" id="switch">
                    <label for="switch" class="switch_label">
                        <span class="onf_btn"></span>
                    </label>
                </div>
                <div id="requestsWithAnswer" class="requestsList hidden">
                        <h3>답장을 받은 요청서</h3>
                    <c:if test="${empty lists[0].replier}">
                        <h4>아직 견적이 달린 요청서가 없습니다</h4>
                    </c:if>
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
                                    <button id="btn-detail" class="btn-detail" data-list='${list.id}'>자세히보기</button>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div id="requestsWithoutAnswer" class="requestsList">
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
                                    <button id="requestDetailWithoutAnswer" class="btn-detail" data-list='${list.id}'>
                                        자세히보기
                                    </button>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
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
    function formatDateFromArray(dateArray) {
        // 배열의 요소를 각각의 변수로 추출
        const [year, month, day] = dateArray;

        // 원하는 형식으로 변환
        return year + `년 ` + month + `월 ` + day + `일`;
    }

    document.addEventListener('DOMContentLoaded', function () {
            const pagingSwitch = document.getElementById('switch');
            pagingSwitch.addEventListener('click', pagination)

            function pagination() {
                const page1 = document.getElementById('requestsWithoutAnswer');
                const page2 = document.getElementById('requestsWithAnswer');
                if (page1.classList.contains('hidden')) {
                    page1.classList.remove('hidden');
                    page2.classList.add('hidden');
                } else {
                    page1.classList.add('hidden');
                    page2.classList.remove('hidden');
                }
            }


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
                    answerDetailDiv.classList.add('hidden');
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
                        h4.textContent = '요청 타입: ' + data.type + '요청ID: ' + data.id;
                        h4.setAttribute('type', data.type);

                        const h5 = document.createElement('h5');
                        const beforeFormatDate = data.regDate;
                        const regDate = formatDateFromArray(beforeFormatDate);
                        // console.log(regDate);
                        h5.textContent = '작성일 : ' + regDate;
                        h5.setAttribute('reaDate', regDate);

                        const buttonDiv = document.createElement('div');
                        buttonDiv.classList.add('buttonDiv');

                        const backButton = document.createElement('button');
                        backButton.classList.add('backButton');
                        backButton.textContent = '뒤로가기'
                        backButton.addEventListener('click', backToLists)

                        const showAnswers = document.createElement('button');
                        showAnswers.id = 'showDetail'
                        showAnswers.classList.add('btn-primary');
                        const reqId = data.id;
                        if (data.replier) {
                            const replierArray = data.replier.split(',');
                            showAnswers.dataset.id = reqId;
                            showAnswers.textContent = replierArray.length + `개의 견적보기`;
                            showAnswers.addEventListener('click', handleButtonClick);
                            showAnswers.addEventListener('click', hideRequest);
                        } else {
                            showAnswers.id = 'requestWithoutAnswer'
                            showAnswers.dataset.id = reqId;
                            showAnswers.textContent = `아직 받은 견적이 없습니다`;
                            showAnswers.disabled = true;
                            showAnswers.style.cursor = 'no-drop';
                            // showAnswers.addEventListener('click', hideRequest);
                        }

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
                        buttonDiv.appendChild(backButton);
                        buttonDiv.appendChild(showAnswers);
                        requestDetail.appendChild(buttonDiv);

                    })

                function hideRequest() {
                    const requestDetail = document.getElementById('requestDetail');
                    const answerDetail = document.getElementById('answerDetails');

                    if (!requestDetail.classList.contains('hidden')) {
                        requestDetail.classList.add('hidden');
                    }
                    if (answerDetail.classList.contains('hidden')) {
                        answerDetail.classList.remove('hidden');
                    }

                    // 필요에 따라 추가적인 초기화 작업 수행
                    // requestDetail.innerHTML = '';
                }

                function backToLists() {
                    const requestDetail = document.getElementById('requestDetail');
                    const answerDetail = document.getElementById('answerDetails');

                    if (!requestDetail.classList.contains('hidden')) {
                        requestDetail.classList.add('hidden');
                    }
                    if (!answerDetail.classList.contains('hidden')) {
                        answerDetail.classList.add('hidden');
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
                // console.log(button);
                const requestId = button.getAttribute("data-id");
                // console.log('requestId 불러오기 : ', requestId);

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
                        const h3 = document.createElement('h3');
                        h3.textContent = '선택된 요청서의 답변'
                        answerDetails.appendChild(h3);

                        data.forEach(answer => {


                            const h4 = document.createElement('h4');
                            h4.textContent = '고수 ID: ' + answer.gosuId + '답변NO:' + answer.no + '요청서번호:' + answer.requestId;
                            h4.setAttribute('gosuId', answer.gosuId);

                            const h5 = document.createElement('h5');
                            h5.textContent = '서비스 금액: ' + answer.price;
                            h5.setAttribute('price', answer.price);

                            const readDetailButtonDiv = document.createElement('div');
                            readDetailButtonDiv.classList.add('readDetailButtonDiv');
                            const readButton = document.createElement('button');

                            // 버튼 속성 설정
                            // readButton.type = 'button'; // type 속성 추가
                            readButton.textContent = '상세 견적 보기';
                            // readButton.id = 'readModal';
                            readButton.classList.add('btn', 'readButton'); // class 속성 추가
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
                            const backToList = document.createElement('button');
                            backToList.classList.add('backButton')
                            backToList.textContent = '요청서돌아가기'
                            backToList.addEventListener('click', hideRequest)

                            const deleteButton = document.createElement('button');
                            deleteButton.textContent = '견적 지우기';
                            deleteButton.classList.add('btn', 'btn-secondary', 'deleteAnswer');
                            deleteButton.dataset.id = answer.no;

                            deleteButton.addEventListener('click', function (event) {
                                console.log(answer)
                            })

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


                            answerDetails.appendChild(h4);
                            answerDetails.appendChild(h5);
                            readDetailButtonDiv.appendChild(deleteButton);
                            readDetailButtonDiv.appendChild(backToList);
                            readDetailButtonDiv.appendChild(readButton);
                            answerDetails.appendChild(readDetailButtonDiv);
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
