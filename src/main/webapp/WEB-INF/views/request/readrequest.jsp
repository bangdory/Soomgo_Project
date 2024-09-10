<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: klarnuri
  Date: 2024-08-06
  Time: 오후 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>받은 견적서</title>
    <style>
        .btn-expired {
            background-color: gray;
            border: solid transparent;
            border-radius: 5px;
            width: auto;
            height: 20px;
            cursor: pointer;
            color: white;
        }

        .receivedAllRequests {
            padding-left: 15%;
        }

        .answeredRequestDetail {
            background-color: #ffffff; /* 배경 색상 (흰색) */
            border: 1px solid #cccccc; /* 테두리 색상 (회색) */
            border-radius: 5px; /* 테두리 둥글기 (5px) */
            padding: 10px; /* 모든 방향의 내부 여백을 10px로 설정 */
            box-sizing: border-box; /* 테두리와 여백을 포함한 박스 모델 사용 */
            height: auto; /* 고정 높이 설정 */
            flex: 1 1 calc(25% - 20px); /* 너비를 25%로 설정 (간격을 고려) */
            min-width: 250px;
            max-width: 300px;
            margin: 5px; /* 상하좌우 여백 추가 */
        }

        .subject {

        }

        .subjectName {
            /*display: inline-block;*/
            float: left;
            height: auto;
        }

        .subjectContent {
            display: inline-block;
            height: auto;
            margin-left: 70px;
            align-items: center;
        }

        .btn-warning {
            width: auto;
            height: auto;
            margin: 3px;
            padding-top: 5px;
            padding-right: 15px;
            background-color: lightpink;
            border: solid transparent;
            border-radius: 5px;
            cursor: pointer;
            color: black;
        }

        .readDetail, .btn-answer {
            width: auto;
            height: auto;
            margin: 3px;
            padding-top: 5px;
            padding-right: 15px;
            background-color: mediumturquoise;
            border: solid transparent;
            border-radius: 5px;
            cursor: pointer;
            color: black;
        }

        .btn-deleted {
            width: auto;
            height: auto;
            margin: 3px;
            padding-top: 5px;
            padding-right: 15px;
            background-color: darkgray;
            border: solid transparent;
            border-radius: 5px;
            cursor: pointer;
            color: black;
        }

    </style>
    <link href="${pageContext.request.contextPath}/resources/static/css/request/style.css" rel="stylesheet">
</head>
<body>
<%@include file="../header/header.jsp" %>
<div class="requestContainer">
    <div class="receivedAllRequests">
        <h1>받은 견적서</h1>
        <%--        <c:out value="${expert}"/><br>--%>
        <%--<c:out value="answer -> ${answeredList}"/><br>--%>
        <%--        <c:out value="received ->${receivedList}"/><br>--%>
        <c:out value="${expert.categoryName}의 고수 ${expert.expertName}님"/>
        <hr>


        <c:forEach var="answered" items="${answeredList}">
            <c:if test="${answered.ignored != 1}">
                <div class="answeredRequestDetail">
                    <div>
                            ${answered.userName} 님의 ${answered.typeName} 요청서
                    </div>
                    <button class="readDetail" onclick="document.getElementById('readAnswered').showModal()">자세히 보기
                    </button>
                    <dialog id="readAnswered">
                        <div class="subject">
                            <div class="subjectName">요청서 번호</div>
                            <div class="subjectContent">${answered.requestId}</div>
                        </div>
                        <div class="subject">
                            <div class="subjectName">고객 이름</div>
                            <div class="subjectContent">${answered.userName}</div>
                        </div>
                        <div class="subject">
                            <div class="subjectName">답변한 날짜</div>
                            <div class="subjectContent">${answered.replyDate}</div>
                        </div>
                        <div class="subject">
                            <div class="subjectName">카테고리</div>
                            <div class="subjectContent">${answered.typeName}</div>
                        </div>
                        <c:if test="${not empty answered.subType}">
                            <div class="subject">
                                <div class="subjectName">Sub</div>
                                <div class="subjectContent">${answered.subType}</div>
                            </div>
                        </c:if>
                        <c:if test="${not empty answered.file1}">
                            <div class="subject">
                                <div class="subjectName">File 1</div>
                                <div class="subjectContent">${answered.file1}</div>
                            </div>
                        </c:if>
                        <c:if test="${not empty answered.file2}">
                            <div class="subject">
                                <div class="subjectName">File 2</div>
                                <div class="subjectContent">${answered.file2}</div>
                            </div>
                        </c:if>
                        <c:if test="${not empty answered.addService}">
                            <div class="subject">
                                <div class="subjectName">AddService</div>
                                <div class="subjectContent">${answered.addService}</div>
                            </div>
                        </c:if>
                            <%--            <c:if test="${answered.cr != null}">--%>
                            <%--                <tr>--%>
                            <%--                    <div>Commercial Use</div>--%>
                            <%--                    <div>${answered.cr}</div>--%>
                            <%--                </tr>--%>
                            <%--            </c:if>--%>
                        <c:if test="${not empty answered.amount}">
                            <div class="subject">
                                <div class="subjectName">Amount</div>
                                <div class="subjectContent">${answered.amount}</div>
                            </div>
                        </c:if>
                        <c:if test="${not empty answered.result}">
                            <div class="subject">
                                <div class="subjectName">result</div>
                                <div class="subjectContent">${answered.result}</div>
                            </div>
                        </c:if>
                        <c:if test="${not empty answered.day}">
                            <div class="subject">
                                <div class="subjectName">데드라인 / 마감기간</div>
                                <div class="subjectContent">${answered.day}</div>
                            </div>
                        </c:if>
                        <c:if test="${not empty answered.time}">
                            <div class="subject">
                                <div class="subjectName">원하는 시간대</div>
                                <div class="subjectContent">${answered.time}</div>
                            </div>
                        </c:if>
                        <c:if test="${not empty answered.age}">
                            <div class="subject">
                                <div class="subjectName">연령대 -> 향후에 int 에서 varchar 로 변경</div>
                                <div class="subjectContent">${answered.age}</div>
                            </div>
                        </c:if>
                        <c:if test="${not empty answered.sex}">
                            <div class="subject">
                                <div class="subjectName">성별</div>
                                <div class="subjectContent">${answered.sex}</div>
                            </div>
                        </c:if>
                        <c:if test="${not empty answered.fav}">
                            <div class="subject">
                                <div class="subjectName">선호하는 성별</div>
                                <div class="subjectContent">${answered.fav}</div>
                            </div>
                        </c:if>
                        <c:if test="${not empty answered.place}">
                            <div class="subject">
                                <div class="subjectName">서비스 장소</div>
                                <div class="subjectContent">${answered.place}</div>
                            </div>
                        </c:if>
                        <c:if test="${not empty answered.date}">
                            <div class="subject">
                                <div class="subjectName">희망 요일</div>
                                <div class="subjectContent">${answered.date}</div>
                            </div>
                        </c:if>
                        <div class="subject">
                            <div class="subjectName">서비스 지역</div>
                            <div class="subjectContent">${answered.regionName}</div>
                        </div>
                        <c:if test="${not empty answered.refFromClient}">
                            <div class="subject">
                                <div class="subjectName">고객의 기타사항</div>
                                <div class="subjectContent">${answered.refFromClient}</div>
                            </div>
                        </c:if>
                        <button class="btn-deleted" onclick="document.getElementById('readAnswered').close()">닫기
                        </button>
                        <form action="/request/ignoreAnswerRequest/${answered.id}" method="post">
                            <input type="hidden" name="idToIgnore" value="${answered.id}"/>
                                <%--                        <button type="submit" class="btn btn-warning">견적 지우기(구현전)</button>--%>
                            <button name="ignoreAnswer" type="submit" class="btn btn-warning">견적 지우기(구현전)</button>
                        </form>
                    </dialog>
                    <div class="answeredRequest">
                        <c:out value="${answer.id}"></c:out>
                        <button type="submit" class="btn btn-deleted disabled" style="cursor: no-drop">이미 답장한 견적입니다
                        </button>
                        <form action="/request/ignoreAnswerRequest/${answered.id}" method="post">
                            <input type="hidden" name="idToIgnore" value="${answered.id}"/>
                                <%--                        <button type="submit" class="btn btn-warning">견적 지우기(구현전)</button>--%>
                            <button name="ignoreAnswer" type="submit" class="btn btn-warning">견적 지우기(구현전)</button>
                        </form>
                    </div>
                </div>
            </c:if>
        </c:forEach>

        <%--                        <c:out value="${receivedList}"></c:out>--%>
        <c:forEach var="received" items="${receivedList}">
            <c:if test="${received.expertIsIncluded == 0 && received.ignoredExpertByThisExpert != 1}">
                <div class="answeredRequestDetail">
                    <div>
                            ${received.userName} 님의 ${received.typeName} 요청서
                    </div>
                    <button class="readDetail" onclick="document.getElementById('readDetailsFromClient').showModal()">
                        자세히 보기
                    </button>
                    <dialog id="readDetailsFromClient">
                            <%--                            <c:out value="${received}"></c:out>--%>
                        <div class="subject">
                            <div class="subjectName">고객이름</div>
                            <div class="subjectContent">${received.userName}</div>
                            <div class="subjectContent">${received.regDate}</div>
                                <%--                        <div class="subjectContent">${received.typeName}</div>--%>
                        </div>
                        <div class="subject">
                            <div class="subjectName">요청서 날짜</div>
                            <div class="subjectContent">${received.regDate}</div>
                        </div>
                        <div class="subject">
                            <div class="subjectName">카테고리</div>
                            <div class="subjectContent">${received.typeName}</div>
                        </div>
                        <c:if test="${not empty received.sub}">
                            <div class="subject">
                                <div class="subjectName">Sub</div>
                                <div class="subjectContent">${received.sub}</div>
                            </div>
                        </c:if>
                        <c:if test="${not empty received.file1}">
                            <div class="subject">
                                <div class="subjectName">File 1</div>
                                <div class="subjectContent">${received.file1}</div>
                            </div>
                        </c:if>
                        <c:if test="${not empty received.file2}">
                            <div class="subject">
                                <div class="subjectName">File 2</div>
                                <div class="subjectContent">${received.file2}</div>
                            </div>
                        </c:if>
                        <c:if test="${received.cr != null}">
                            <div class="subject">
                                <div class="subjectName">Commercial Use</div>
                                <div class="subjectContent">${received.cr}</div>
                            </div>
                        </c:if>
                        <c:if test="${not empty received.amount}">
                            <div class="subject">
                                <div class="subjectName">Amount</div>
                                <div class="subjectContent">${received.amount}</div>
                            </div>
                        </c:if>
                        <c:if test="${not empty received.addService}">
                            <div class="subject">
                                <div class="subjectName">Additional Service</div>
                                <div class="subjectContent">${received.addService}</div>
                            </div>
                        </c:if>
                        <c:if test="${not empty received.result}">
                            <div class="subject">
                                <div class="subjectName">Result</div>
                                <div class="subjectContent">${received.result}</div>
                            </div>
                        </c:if>
                        <c:if test="${not empty received.day}">
                            <div class="subject">
                                <div class="subjectName">Day</div>
                                <div class="subjectContent">${received.day}</div>
                            </div>
                        </c:if>
                        <c:if test="${not empty received.time}">
                            <div class="subject">
                                <div class="subjectName">원하는 시간대</div>
                                <div class="subjectContent">${received.time}</div>
                            </div>
                        </c:if>
                        <c:if test="${not empty received.age}">
                            <div class="subject">
                                <div class="subjectName">Age</div>
                                <div class="subjectContent">${received.age}</div>
                            </div>
                        </c:if>
                        <c:if test="${not empty received.sex}">
                            <div class="subject">
                                <div class="subjectName">고객 성별</div>
                                <div class="subjectContent">${received.sex}</div>
                            </div>
                        </c:if>
                        <c:if test="${not empty received.fav}">
                            <div class="subject">
                                <div class="subjectName">선호하는 고수 성별</div>
                                <div class="subjectContent">${received.fav}</div>
                            </div>
                        </c:if>
                        <c:if test="${not empty received.place}">
                            <div class="subject">
                                <div class="subjectName">Place</div>
                                <div class="subjectContent">${received.place}</div>
                            </div>
                        </c:if>
                        <c:if test="${not empty received.date}">
                            <div class="subject">
                                <div class="subjectName">Date</div>
                                <div class="subjectContent">${received.date}</div>
                            </div>
                        </c:if>
                        <div class="subject">
                            <div class="subjectName">지역</div>
                            <div class="subjectContent">${received.regionName}</div>
                        </div>
                        <c:if test="${not empty received.ref}">
                            <div class="subject">
                                <div class="subjectName">Reference</div>
                                <div class="subjectContent">${received.ref}</div>
                            </div>
                        </c:if>
                        <button class="btn-deleted" onclick="document.getElementById('readDetailsFromClient').close()">
                            닫기
                        </button>

                        <div class="receivedRequest">
                            <c:if test="${received.experts >= 10}">
                            <button type="submit" class="btn btn-expired" style="cursor: no-drop" disabled>만료된 견적입니다
                            </button>
                            </c:if>
                            <c:if test="${received.experts <10}">
                            <form action="/request/answer/${received.id}" method="post">
                                <input type="hidden" name="received" value="${received.id}"/>
                                <button type="submit" class="btn btn-answer">견적 답장하기</button>
                            </form>
                            <form action="/request/ignoreReceivedRequest/${received.id}" method="post">
                                <input type="hidden" name="idToIgnore" value="${received.id}"/>
                                <button name="ignoreReceived" type="submit" class="btn btn-warning">견적 지우기(구현전)</button>
                            </form>
                            </c:if>
                    </dialog>
                    <form action="/request/ignoreReceivedRequest/${received.id}" method="post">
                        <input type="hidden" name="idToIgnore" value="${received.id}"/>
                        <button name="ignoreReceived" type="submit" class="btn btn-warning">견적 지우기(구현전)</button>
                    </form>
                </div>
            </c:if>
        </c:forEach>
    </div>
</div>
</body>
</html>
