<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: klarnuri
  Date: 2024-08-06
  Time: 오후 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>받은 견적서</title>
</head>
<body>
<h1>받은 견적서</h1>
<c:out value="${expert.regionName} ${expert.categoryName}의 고수 ${expert.expertName}님"/>
<hr>

<div>
    <c:forEach var="answeredList" items="${answered}">
        <table border="1">
            <c:if test="${not empty answeredList.id}">
                <tr>
                    <th>ID</th>
                    <td>${answeredList.id}</td>
                </tr>
            </c:if>
            <c:if test="${not empty answeredList.writer}">
                <tr>
                    <th>Writer</th>
                    <td>${answeredList.writer}</td>
                </tr>
            </c:if>
            <%--<c:if test="${not empty answeredList.replier}">
                <tr>
                    <th>Replier</th>
                    <td>${answeredList.replier}</td>
                </tr>
            </c:if>--%>
            <c:if test="${not empty answeredList.regDate}">
                <tr>
                    <th>Registration Date</th>
                    <td>${answeredList.regDate}</td>
                </tr>
            </c:if>
            <c:if test="${not empty answeredList.sort}">
                <tr>
                    <th>Sort</th>
                    <td>${answeredList.sort}</td>
                </tr>
            </c:if>
            <c:if test="${not empty answeredList.type}">
                <tr>
                    <th>Type</th>
                    <td>${answeredList.type}</td>
                </tr>
            </c:if>
            <c:if test="${not empty answeredList.sub}">
                <tr>
                    <th>Sub</th>
                    <td>${answeredList.sub}</td>
                </tr>
            </c:if>
            <c:if test="${not empty answeredList.file1}">
                <tr>
                    <th>File 1</th>
                    <td>${answeredList.file1}</td>
                </tr>
            </c:if>
            <c:if test="${not empty answeredList.file2}">
                <tr>
                    <th>File 2</th>
                    <td>${answeredList.file2}</td>
                </tr>
            </c:if>
            <c:if test="${answeredList.cr != null}">
                <tr>
                    <th>Commercial Use</th>
                    <td>${answeredList.cr}</td>
                </tr>
            </c:if>
            <c:if test="${not empty answeredList.amount}">
                <tr>
                    <th>Amount</th>
                    <td>${answeredList.amount}</td>
                </tr>
            </c:if>
            <c:if test="${not empty answeredList.addService}">
                <tr>
                    <th>Additional Service</th>
                    <td>${answeredList.addService}</td>
                </tr>
            </c:if>
            <c:if test="${not empty answeredList.delService}">
                <tr>
                    <th>Delete Service</th>
                    <td>${answeredList.delService}</td>
                </tr>
            </c:if>
            <c:if test="${not empty answeredList.result}">
                <tr>
                    <th>Result</th>
                    <td>${answeredList.result}</td>
                </tr>
            </c:if>
            <c:if test="${not empty answeredList.day}">
                <tr>
                    <th>Day</th>
                    <td>${answeredList.day}</td>
                </tr>
            </c:if>
            <c:if test="${not empty answeredList.time}">
                <tr>
                    <th>Time</th>
                    <td>${answeredList.time}</td>
                </tr>
            </c:if>
            <c:if test="${not empty answeredList.age}">
                <tr>
                    <th>Age</th>
                    <td>${answeredList.age}</td>
                </tr>
            </c:if>
            <c:if test="${not empty answeredList.sex}">
                <tr>
                    <th>Sex</th>
                    <td>${answeredList.sex}</td>
                </tr>
            </c:if>
            <c:if test="${not empty answeredList.fav}">
                <tr>
                    <th>Favorite</th>
                    <td>${answeredList.fav}</td>
                </tr>
            </c:if>
            <c:if test="${not empty answeredList.place}">
                <tr>
                    <th>Place</th>
                    <td>${answeredList.place}</td>
                </tr>
            </c:if>
            <c:if test="${not empty answeredList.date}">
                <tr>
                    <th>Date</th>
                    <td>${answeredList.date}</td>
                </tr>
            </c:if>
            <c:if test="${not empty answeredList.region}">
                <tr>
                    <th>Region</th>
                    <td>${answeredList.region}</td>
                </tr>
            </c:if>
            <c:if test="${not empty answeredList.ref}">
                <tr>
                    <th>Reference</th>
                    <td>${answeredList.ref}</td>
                </tr>
            </c:if>
        </table>
        <br>
        <c:if test="${gosu.id == receivedList.replier}">
            <div class="requestAnswer">
                <form action="/request/answer/${receivedList.id}" method="get">
                    <input type="hidden" name="gosuId" value="${gosu.id}"/>
                    <!-- 조건에 따라 비활성화 -->
                    <c:choose>
                        <c:when test="${gosu.id == receivedList.replier}">
                            <button type="submit" class="btn btn-primary" disabled>견적 답장하기</button>
                        </c:when>
                        <c:otherwise>
                            <button type="submit" class="btn btn-primary">견적 답장하기</button>
                        </c:otherwise>
                    </c:choose>
                </form>
                <form action="/request/delete/${receivedList.id}" method="post">
                    <button type="submit" class="btn btn-warning">견적 지우기</button>
                </form>
            </div>
        </c:if>
        <hr>
        <hr>
        <div class="answeredRequest">
            <button type="submit" class="btn btn-primary" disabled>이미 답장한 견적입니다</button>
            <form action="/request/delete/${answeredList.id}" method="post">
                <button type="submit" class="btn btn-warning">견적 지우기</button>
            </form>
        </div>
    </c:forEach>

    <c:forEach var="receivedList" items="${received}">
        <c:if test="${receivedList.replier != gosu.id}">
            <table border="1">
                <c:if test="${not empty receivedList.id}">
                    <tr>
                        <th>ID</th>
                        <td>${receivedList.id}</td>
                    </tr>
                </c:if>
                <c:if test="${not empty receivedList.writer}">
                    <tr>
                        <th>Writer</th>
                        <td>${receivedList.writer}</td>
                    </tr>
                </c:if>
                <%--<c:if test="${not empty receivedList.replier}">
                    <tr>
                        <th>Replier</th>
                        <td>${receivedList.replier}</td>
                    </tr>
                </c:if>--%>
                <c:if test="${not empty receivedList.regDate}">
                    <tr>
                        <th>Registration Date</th>
                        <td>${receivedList.regDate}</td>
                    </tr>
                </c:if>
                <c:if test="${not empty receivedList.sort}">
                    <tr>
                        <th>Sort</th>
                        <td>${receivedList.sort}</td>
                    </tr>
                </c:if>
                <c:if test="${not empty receivedList.type}">
                    <tr>
                        <th>Type</th>
                        <td>${receivedList.type}</td>
                    </tr>
                </c:if>
                <c:if test="${not empty receivedList.sub}">
                    <tr>
                        <th>Sub</th>
                        <td>${receivedList.sub}</td>
                    </tr>
                </c:if>
                <c:if test="${not empty receivedList.file1}">
                    <tr>
                        <th>File 1</th>
                        <td>${receivedList.file1}</td>
                    </tr>
                </c:if>
                <c:if test="${not empty receivedList.file2}">
                    <tr>
                        <th>File 2</th>
                        <td>${receivedList.file2}</td>
                    </tr>
                </c:if>
                <c:if test="${receivedList.cr != null}">
                    <tr>
                        <th>Commercial Use</th>
                        <td>${receivedList.cr}</td>
                    </tr>
                </c:if>
                <c:if test="${not empty receivedList.amount}">
                    <tr>
                        <th>Amount</th>
                        <td>${receivedList.amount}</td>
                    </tr>
                </c:if>
                <c:if test="${not empty receivedList.addService}">
                    <tr>
                        <th>Additional Service</th>
                        <td>${receivedList.addService}</td>
                    </tr>
                </c:if>
                <c:if test="${not empty receivedList.delService}">
                    <tr>
                        <th>Delete Service</th>
                        <td>${receivedList.delService}</td>
                    </tr>
                </c:if>
                <c:if test="${not empty receivedList.result}">
                    <tr>
                        <th>Result</th>
                        <td>${receivedList.result}</td>
                    </tr>
                </c:if>
                <c:if test="${not empty receivedList.day}">
                    <tr>
                        <th>Day</th>
                        <td>${receivedList.day}</td>
                    </tr>
                </c:if>
                <c:if test="${not empty receivedList.time}">
                    <tr>
                        <th>Time</th>
                        <td>${receivedList.time}</td>
                    </tr>
                </c:if>
                <c:if test="${not empty receivedList.age}">
                    <tr>
                        <th>Age</th>
                        <td>${receivedList.age}</td>
                    </tr>
                </c:if>
                <c:if test="${not empty receivedList.sex}">
                    <tr>
                        <th>Sex</th>
                        <td>${receivedList.sex}</td>
                    </tr>
                </c:if>
                <c:if test="${not empty receivedList.fav}">
                    <tr>
                        <th>Favorite</th>
                        <td>${receivedList.fav}</td>
                    </tr>
                </c:if>
                <c:if test="${not empty receivedList.place}">
                    <tr>
                        <th>Place</th>
                        <td>${receivedList.place}</td>
                    </tr>
                </c:if>
                <c:if test="${not empty receivedList.date}">
                    <tr>
                        <th>Date</th>
                        <td>${receivedList.date}</td>
                    </tr>
                </c:if>
                <c:if test="${not empty receivedList.region}">
                    <tr>
                        <th>Region</th>
                        <td>${receivedList.region}</td>
                    </tr>
                </c:if>
                <c:if test="${not empty receivedList.ref}">
                    <tr>
                        <th>Reference</th>
                        <td>${receivedList.ref}</td>
                    </tr>
                </c:if>
            </table>
            <br>
            <%--        <c:if test="${gosu.id != receivedList.replier}">--%>
            <div class="receivedRequest">
                <form action="/request/answer/${receivedList.id}" method="get">
                    <input type="hidden" name="gosuId" value="${gosu.id}"/>
                    <!-- 조건에 따라 비활성화 -->
                        <%--                    <c:choose>--%>
                        <%--                        <c:when test="${gosu.id == receivedList.replier}">--%>
                        <%--                            <button type="submit" class="btn btn-primary" disabled>견적 답장하기</button>--%>
                        <%--                        </c:when>--%>
                        <%--                        <c:otherwise>--%>
                    <button type="submit" class="btn btn-primary">견적 답장하기</button>
                        <%--                        </c:otherwise>--%>
                        <%--                    </c:choose>--%>
                </form>
                <form action="/request/delete/${receivedList.id}" method="post">
                    <button type="submit" class="btn btn-warning">견적 지우기</button>
                </form>
            </div>
            <%--        </c:if>--%>
            <hr>
            <hr>
        </c:if>
    </c:forEach>
</div>
</body>

</html>
