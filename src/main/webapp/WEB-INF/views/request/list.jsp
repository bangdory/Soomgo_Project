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
    <title>내가 보낸 견적서</title>
</head>
<body>
<h2>Request Details</h2>
<c:out value="${lists}"></c:out>
<c:forEach var="list" items="${lists}">
    <c:if test="${not empty list.replier}">
        <table border="1">
            <c:if test="${not empty list.id}">
                <tr>
                    <th>ID</th>
                    <td>${list.id}</td>
                </tr>
            </c:if>
            <c:if test="${not empty list.writer}">
                <tr>
                    <th>Writer</th>
                    <td>${list.writer}</td>
                </tr>
            </c:if>
                <%--<c:if test="${not empty list.replier}">
                    <tr>
                        <th>Replier</th>
                        <td>${list.replier}</td>
                    </tr>
                </c:if>--%>
            <c:if test="${not empty list.regDate}">
                <tr>
                    <th>Registration Date</th>
                    <td>${list.regDate}</td>
                </tr>
            </c:if>
            <c:if test="${not empty list.sort}">
                <tr>
                    <th>Sort</th>
                    <td>${list.sort}</td>
                </tr>
            </c:if>
            <c:if test="${not empty list.type}">
                <tr>
                    <th>Type</th>
                    <td>${list.type}</td>
                </tr>
            </c:if>
            <c:if test="${not empty list.sub}">
                <tr>
                    <th>Sub</th>
                    <td>${list.sub}</td>
                </tr>
            </c:if>
            <c:if test="${not empty list.file1}">
                <tr>
                    <th>File 1</th>
                    <td>${list.file1}</td>
                </tr>
            </c:if>
            <c:if test="${not empty list.file2}">
                <tr>
                    <th>File 2</th>
                    <td>${list.file2}</td>
                </tr>
            </c:if>
            <c:if test="${list.cr != null}">
                <tr>
                    <th>Commercial Use</th>
                    <td>${list.cr}</td>
                </tr>
            </c:if>
            <c:if test="${not empty list.amount}">
                <tr>
                    <th>Amount</th>
                    <td>${list.amount}</td>
                </tr>
            </c:if>
            <c:if test="${not empty list.addService}">
                <tr>
                    <th>Additional Service</th>
                    <td>${list.addService}</td>
                </tr>
            </c:if>
            <c:if test="${not empty list.delService}">
                <tr>
                    <th>Delete Service</th>
                    <td>${list.delService}</td>
                </tr>
            </c:if>
            <c:if test="${not empty list.result}">
                <tr>
                    <th>Result</th>
                    <td>${list.result}</td>
                </tr>
            </c:if>
            <c:if test="${not empty list.day}">
                <tr>
                    <th>Day</th>
                    <td>${list.day}</td>
                </tr>
            </c:if>
            <c:if test="${not empty list.time}">
                <tr>
                    <th>Time</th>
                    <td>${list.time}</td>
                </tr>
            </c:if>
            <c:if test="${not empty list.age}">
                <tr>
                    <th>Age</th>
                    <td>${list.age}</td>
                </tr>
            </c:if>
            <c:if test="${not empty list.sex}">
                <tr>
                    <th>Sex</th>
                    <td>${list.sex}</td>
                </tr>
            </c:if>
            <c:if test="${not empty list.fav}">
                <tr>
                    <th>Favorite</th>
                    <td>${list.fav}</td>
                </tr>
            </c:if>
            <c:if test="${not empty list.place}">
                <tr>
                    <th>Place</th>
                    <td>${list.place}</td>
                </tr>
            </c:if>
            <c:if test="${not empty list.date}">
                <tr>
                    <th>Date</th>
                    <td>${list.date}</td>
                </tr>
            </c:if>
            <c:if test="${not empty list.region}">
                <tr>
                    <th>Region</th>
                    <td>${list.region}</td>
                </tr>
            </c:if>
            <c:if test="${not empty list.ref}">
                <tr>
                    <th>Reference</th>
                    <td>${list.ref}</td>
                </tr>
            </c:if>
        </table>
        <br>
        <c:if test="${not empty list.replier}">
            <div class="requestAnswer">
                    <%--            <form action="/request/answer/${receivedList.id}" method="get">--%>
                <input type="hidden" name="gosuId" value="${gosu.id}"/>
                <!-- 조건에 따라 비활성화 -->
                <button type="submit" class="btn btn-primary">받은 견적 읽기</button>
                    <%--            </form>--%>
                <form action="/request/delete/${receivedList.id}" method="post">
                    <button type="submit" class="btn btn-warning">견적 지우기</button>
                </form>
            </div>
        </c:if>
    </c:if>
</c:forEach>

<c:forEach var="list" items="${lists}">
    <c:if test="${empty list.replier}">
        <table border="1">
            <c:if test="${not empty list.id}">
                <tr>
                    <th>ID</th>
                    <td>${list.id}</td>
                </tr>
            </c:if>
            <c:if test="${not empty list.writer}">
                <tr>
                    <th>Writer</th>
                    <td>${list.writer}</td>
                </tr>
            </c:if>
                <%--<c:if test="${not empty list.replier}">
                    <tr>
                        <th>Replier</th>
                        <td>${list.replier}</td>
                    </tr>
                </c:if>--%>
            <c:if test="${not empty list.regDate}">
                <tr>
                    <th>Registration Date</th>
                    <td>${list.regDate}</td>
                </tr>
            </c:if>
            <c:if test="${not empty list.sort}">
                <tr>
                    <th>Sort</th>
                    <td>${list.sort}</td>
                </tr>
            </c:if>
            <c:if test="${not empty list.type}">
                <tr>
                    <th>Type</th>
                    <td>${list.type}</td>
                </tr>
            </c:if>
            <c:if test="${not empty list.sub}">
                <tr>
                    <th>Sub</th>
                    <td>${list.sub}</td>
                </tr>
            </c:if>
            <c:if test="${not empty list.file1}">
                <tr>
                    <th>File 1</th>
                    <td>${list.file1}</td>
                </tr>
            </c:if>
            <c:if test="${not empty list.file2}">
                <tr>
                    <th>File 2</th>
                    <td>${list.file2}</td>
                </tr>
            </c:if>
            <c:if test="${list.cr != null}">
                <tr>
                    <th>Commercial Use</th>
                    <td>${list.cr}</td>
                </tr>
            </c:if>
            <c:if test="${not empty list.amount}">
                <tr>
                    <th>Amount</th>
                    <td>${list.amount}</td>
                </tr>
            </c:if>
            <c:if test="${not empty list.addService}">
                <tr>
                    <th>Additional Service</th>
                    <td>${list.addService}</td>
                </tr>
            </c:if>
            <c:if test="${not empty list.delService}">
                <tr>
                    <th>Delete Service</th>
                    <td>${list.delService}</td>
                </tr>
            </c:if>
            <c:if test="${not empty list.result}">
                <tr>
                    <th>Result</th>
                    <td>${list.result}</td>
                </tr>
            </c:if>
            <c:if test="${not empty list.day}">
                <tr>
                    <th>Day</th>
                    <td>${list.day}</td>
                </tr>
            </c:if>
            <c:if test="${not empty list.time}">
                <tr>
                    <th>Time</th>
                    <td>${list.time}</td>
                </tr>
            </c:if>
            <c:if test="${not empty list.age}">
                <tr>
                    <th>Age</th>
                    <td>${list.age}</td>
                </tr>
            </c:if>
            <c:if test="${not empty list.sex}">
                <tr>
                    <th>Sex</th>
                    <td>${list.sex}</td>
                </tr>
            </c:if>
            <c:if test="${not empty list.fav}">
                <tr>
                    <th>Favorite</th>
                    <td>${list.fav}</td>
                </tr>
            </c:if>
            <c:if test="${not empty list.place}">
                <tr>
                    <th>Place</th>
                    <td>${list.place}</td>
                </tr>
            </c:if>
            <c:if test="${not empty list.date}">
                <tr>
                    <th>Date</th>
                    <td>${list.date}</td>
                </tr>
            </c:if>
            <c:if test="${not empty list.region}">
                <tr>
                    <th>Region</th>
                    <td>${list.region}</td>
                </tr>
            </c:if>
            <c:if test="${not empty list.ref}">
                <tr>
                    <th>Reference</th>
                    <td>${list.ref}</td>
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

</html>
