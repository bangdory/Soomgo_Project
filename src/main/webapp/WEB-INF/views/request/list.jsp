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
    <style>
        .container {
            display: flex;
        }

        .left-column {
            padding: 10px;
            border: 1px solid #ccc;
            width: 30%;
            border-right: none;

        }

        .right-column {
            padding: 10px;
            border: 1px solid #ccc;
            width: 70%;
        }


        .requestAnswer {
            margin-top: 10px;
        }
    </style>
</head>
<body>
<h2>Request Details</h2>
<%--<c:out value="${lists}"></c:out>--%>
<div class="container">
    <div class="left-column">
        <h3>답장을 받은 요청서</h3>
        <c:if test="${empty lists}">
            <h5>받은 견적이 없습니다.</h5>
        </c:if>
        <c:forEach var="list" items="${lists}">
            <c:if test="${not empty list.replier}">
                <table border="1">
                    <c:if test="${not empty list.id}">
                        <tr>
                            <th>ID</th>
                            <td>${list.id}</td>
                        </tr>
                    </c:if>
                    <c:if test="${not empty list.type}">
                        <tr>
                            <th>Type</th>
                            <td>${list.type}</td>
                        </tr>
                    </c:if>
                </table>
                <br>
                    <div class="requestAnswer">
                        <button type="submit" class="btn btn-primary" data-id="${list.id}">받은 견적 읽기</button>
                        <form action="/request/delete/${receivedList.id}" method="post">
                            <button type="submit" class="btn btn-warning">견적 지우기</button>
                        </form>
                    </div>
            </c:if>
        </c:forEach>
        <hr>
        <h3>내가 보낸 요청서</h3>
        <c:forEach var="list" items="${lists}">
            <c:if test="${empty list.replier}">
                <table border="1">
                    <c:if test="${not empty list.id}">
                        <tr>
                            <th>ID</th>
                            <td>${list.id}</td>
                        </tr>
                    </c:if>
                    <c:if test="${not empty list.type}">
                        <tr>
                            <th>Type</th>
                            <td>${list.type}</td>
                        </tr>
                    </c:if>
                </table>
                <br>
                    <div class="requestAnswer">
                        <form action="/request/delete/${receivedList.id}" method="post">
                            <button type="submit" class="btn btn-warning">견적 지우기</button>
                        </form>
                    </div>
            </c:if>
        </c:forEach>
    </div>
    <div class="right-column hidden" id="answerDetails">
        <h3>선택된 요청서의 답변</h3>
<%--        <div id="AnswerDetail"></div>--%>
<%--        <button id="backButton" class="btn btn-secondary hidden">뒤로가기</button>--%>
    </div>
</div>
</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        // 모든 버튼에 대해 이벤트 핸들러를 한 번만 등록
        document.querySelectorAll(".btn-primary").forEach(button => {
            // 이벤트 핸들러를 직접 함수로 등록
            button.addEventListener('click', handleButtonClick);
        });

        function handleButtonClick(event) {
            event.preventDefault(); // 버튼의 기본 동작 방지

            const requestId = this.dataset.id; // 버튼에 설정된 데이터 속성에서 ID 가져오기
            // console.log('requestId 불러오기 : ', requestId);

            if (!requestId) {
                // console.error("Request ID is not found");
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

                        const h5 = document.createElement('h5');
                        h5.textContent = '서비스 금액: ' + answer.price;

                        const readButton = document.createElement('button');
                        readButton.textContent = '견적 읽기';
                        readButton.classList.add('btn', 'btn-info');
                        readButton.dataset.id = answer.no
                        readButton.addEventListener('click', function () {
                            console.log(answer)
                        })
                        const deleteButton = document.createElement('button');
                        deleteButton.textContent = '견적 지우기';
                        deleteButton.classList.add('btn', 'btn-danger');
                        deleteButton.dataset.id = answer.no
                        deleteButton.addEventListener('click', function () {
                            console.log(answer)
                        })

                        answerDetails.appendChild(h3);
                        answerDetails.appendChild(h4);
                        answerDetails.appendChild(h5);
                        answerDetails.appendChild(readButton);
                        answerDetails.appendChild(deleteButton);
                    });

                    document.querySelectorAll('.btn-info').forEach(button => {
                        // 이벤트 핸들러를 직접 함수로 등록
                        button.addEventListener('click', function () {
                            console.log('견적 읽기 버튼 클릭됨', this.dataset.id);
                        });
                    });

                    document.querySelectorAll('.btn-danger').forEach(button => {
                        button.addEventListener('click', function () {
                            console.log('견적 지우기 버튼 클릭됨', this.dataset.id);
                        });
                    });

                    /*function showDetail(event) {
                        event.preventDefault(); // 버튼의 기본 동작 방지

                        const requestId = this.dataset.id;
                        const h3 = document.createElement('h3');
                        h3.textContent = '선택된 요청서의 답변'

                        const h4 = document.createElement('h4');
                        h4.textContent = '고수 ID: ' + answer.gosuId;

                        const h5 = document.createElement('h5');
                        h5.textContent = '서비스 금액: ' + answer.price;

                        const h55 = document.createElement('h5');
                        h55.textContent = '서비스 내용: ' + answer.ref;
                        answerDetails.appendChild(h3);
                        answerDetails.appendChild(h4);
                        answerDetails.appendChild(h5);
                        answerDetails.appendChild(h55);*/
                })
                .catch(error => {
                    console.error("데이터를 가져오는 데 실패했습니다.", error);
                    document.getElementById('answerDetails').innerHTML = '<p>데이터를 가져오는 데 실패했습니다.</p>';
                });
        }
    });
</script>
<%-- <script>
    document.addEventListener('DOMContentLoaded', function () {
        // 모든 버튼에 대해 이벤트 핸들러를 한 번만 등록
        document.querySelectorAll(".btn-primary").forEach(button => {
            button.addEventListener('click', handleButtonClick);
        });

        function handleButtonClick(event) {
            event.preventDefault(); // 버튼의 기본 동작 방지

            const requestId = this.dataset.id; // 버튼에 설정된 데이터 속성에서 ID 가져오기

            if (!requestId) {
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
                        const h4 = document.createElement('h4');
                        h4.textContent = '고수 ID: ' + answer.gosuId;

                        const h5 = document.createElement('h5');
                        h5.textContent = '서비스 금액: ' + answer.price;

                        const readButton = document.createElement('button');
                        readButton.textContent = '견적 읽기';
                        readButton.classList.add('btn', 'btn-info');
                        readButton.dataset.id = answer.no;
                        readButton.addEventListener('click', function () {
                            showDetail(answer); // detail 함수 호출
                        });

                        const deleteButton = document.createElement('button');
                        deleteButton.textContent = '견적 지우기';
                        deleteButton.classList.add('btn', 'btn-danger');
                        deleteButton.dataset.id = answer.no;

                        answerDetails.appendChild(h4);
                        answerDetails.appendChild(h5);
                        answerDetails.appendChild(readButton);
                        answerDetails.appendChild(deleteButton);
                    });

                    // Show right-column and backButton
                    answerDetails.classList.remove('hidden');
                    document.getElementById('backButton').classList.remove('hidden');
                })
                .catch(error => {
                    console.error("데이터를 가져오는 데 실패했습니다.", error);
                    document.getElementById('answerDetails').innerHTML = '<p>데이터를 가져오는 데 실패했습니다.</p>';
                });
        }

        function showDetail(answer) {
            const answerDetails = document.getElementById('answerDetails');
            answerDetails.innerHTML = ''; // 기존 내용 삭제

            const h3 = document.createElement('h3');
            h3.textContent = '선택된 요청서의 답변';

            const h4 = document.createElement('h4');
            h4.textContent = '고수 ID: ' + answer.gosuId;

            const h5 = document.createElement('h5');
            h5.textContent = '서비스 금액: ' + answer.price;

            const h55 = document.createElement('h5');
            h55.textContent = '서비스 내용: ' + answer.ref;

            answerDetails.appendChild(h3);
            answerDetails.appendChild(h4);
            answerDetails.appendChild(h5);
            answerDetails.appendChild(h55);
        }

        document.getElementById('backButton').addEventListener('click', function () {
            const answerDetails = document.getElementById('answerDetails');
            answerDetails.innerHTML = '';
            answerDetails.classList.add('hidden');
            this.classList.add('hidden');
        });
    });
</script>--%>
<%--<script>
    document.addEventListener('DOMContentLoaded', function () {
        document.querySelectorAll(".btn-primary").forEach(button => {
            button.addEventListener('click', function (event) {
                event.preventDefault(); // 버튼의 기본 동작 방지

                this.setAttribute('data-processed', 'true')
                const requestId = this.dataset.id; // 버튼에 설정된 데이터 속성에서 ID 가져오기
                console.log('requestId 불러오기 : ', requestId)
                if (!requestId) {
                    console.error("Request ID is not found");
                    return; // ID가 없으면 요청을 보내지 않습니다.
                }

                fetch('/request/answer-list?requestId=' + requestId, {
                    method: 'GET',
                })
                    .then(response => {
                        if (!response.ok) {
                            throw new Error('Network response was not ok');
                        }
                        return response.json(); // 서버 응답을 JSON으로 변환
                        // console.log('response JSON 확인 : ', response)
                    })
                    .then(data => {
                        const answerDetails = document.getElementById('answerDetails');
                        data.forEach(answer => {
                            const h4 = document.createElement('h4');
                            h4.textContent = answer.gosuId;
                            const h5 = document.createElement('h5')
                            h5.textContent = answer.price + ', ' + answer.ref;

                            answerDetails.appendChild(h4);
                            answerDetails.appendChild(h5);

                            // 성공적으로 데이터를 받은 후, #answerDetails 영역에 내용을 추가
                            // var html = '';
                            //     html += '<div>'
                            //             + '<h4>답변 ID:' + answer.no +'</h4>'
                            //             + '<h4>고수 ID:' + answer.gosuId +'</h4>'
                            //             + '<h4>서비스 금액:' + answer.price +'</h4>'
                            //             + '<h4>서비스 설명:' + answer.ref +'</h4>'
                            //             + '<h4>파일:' + answer.file +'</h4>'+
                            //         '</div>';
                            // document.getElementById('answerDetails').innerHTML = html;*/
                        });
                    })
                    .catch(error => {
                        console.error("데이터를 가져오는 데 실패했습니다.", error);
                        document.getElementById('answerDetails').innerHTML = '<p>데이터를 가져오는 데 실패했습니다.</p>';
                    });
            }, {once: true});
        });
    });
</script>--%>

</html>
