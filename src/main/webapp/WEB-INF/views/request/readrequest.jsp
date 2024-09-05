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
<c:out value="${expert}"/>
<c:out value="${expert.regionName} ${expert.categoryName}의 고수 ${expert.expertName}님"/>
<hr>

<div>
    <%--    <c:out value="${answeredList}"/>--%>
    <c:forEach var="answered" items="${answeredList}">
        <table border="1">
            <c:if test="${not empty answered.id}">
                <tr>
                    <th>ID</th>
                    <td>${answered.id}</td>
                </tr>
            </c:if>
            <c:if test="${not empty answered.writer}">
                <tr>
                    <th>Writer</th>
                    <td>${answered.writer}</td>
                </tr>
            </c:if>
                <%--<c:if test="${not empty answered.replier}">
                    <tr>
                        <th>Replier</th>
                        <td>${answered.replier}</td>
                    </tr>
                </c:if>--%>
            <c:if test="${not empty answered.regDate}">
                <tr>
                    <th>Registration Date</th>
                    <td>${answered.regDate}</td>
                </tr>
            </c:if>
            <c:if test="${not empty answered.sort}">
                <tr>
                    <th>Sort</th>
                    <td>${answered.sort}</td>
                </tr>
            </c:if>
            <c:if test="${not empty answered.typeNum}">
                <tr>
                    <th>Type</th>
                    <td>${answered.typeNum}</td>
                </tr>
            </c:if>
            <c:if test="${not empty answered.sub}">
                <tr>
                    <th>Sub</th>
                    <td>${answered.sub}</td>
                </tr>
            </c:if>
            <c:if test="${not empty answered.file1}">
                <tr>
                    <th>File 1</th>
                    <td>${answered.file1}</td>
                </tr>
            </c:if>
            <c:if test="${not empty answered.file2}">
                <tr>
                    <th>File 2</th>
                    <td>${answered.file2}</td>
                </tr>
            </c:if>
            <c:if test="${answered.cr != null}">
                <tr>
                    <th>Commercial Use</th>
                    <td>${answered.cr}</td>
                </tr>
            </c:if>
            <c:if test="${not empty answered.amount}">
                <tr>
                    <th>Amount</th>
                    <td>${answered.amount}</td>
                </tr>
            </c:if>
            <c:if test="${not empty answered.addService}">
                <tr>
                    <th>Additional Service</th>
                    <td>${answered.addService}</td>
                </tr>
            </c:if>
            <c:if test="${not empty answered.delService}">
                <tr>
                    <th>Delete Service</th>
                    <td>${answered.delService}</td>
                </tr>
            </c:if>
            <c:if test="${not empty answered.result}">
                <tr>
                    <th>Result</th>
                    <td>${answered.result}</td>
                </tr>
            </c:if>
            <c:if test="${not empty answered.day}">
                <tr>
                    <th>Day</th>
                    <td>${answered.day}</td>
                </tr>
            </c:if>
            <c:if test="${not empty answered.time}">
                <tr>
                    <th>Time</th>
                    <td>${answered.time}</td>
                </tr>
            </c:if>
            <c:if test="${not empty answered.age}">
                <tr>
                    <th>Age</th>
                    <td>${answered.age}</td>
                </tr>
            </c:if>
            <c:if test="${not empty answered.sex}">
                <tr>
                    <th>Sex</th>
                    <td>${answered.sex}</td>
                </tr>
            </c:if>
            <c:if test="${not empty answered.fav}">
                <tr>
                    <th>Favorite</th>
                    <td>${answered.fav}</td>
                </tr>
            </c:if>
            <c:if test="${not empty answered.place}">
                <tr>
                    <th>Place</th>
                    <td>${answered.place}</td>
                </tr>
            </c:if>
            <c:if test="${not empty answered.date}">
                <tr>
                    <th>Date</th>
                    <td>${answered.date}</td>
                </tr>
            </c:if>
            <c:if test="${not empty answered.regionNum}">
                <tr>
                    <th>Region</th>
                    <td>${answered.regionNum}</td>
                </tr>
            </c:if>
            <c:if test="${not empty answered.ref}">
                <tr>
                    <th>Reference</th>
                    <td>${answered.ref}</td>
                </tr>
            </c:if>
        </table>
        <br>
        <%-- <c:if test="${expert.expertNum == received.replier}">
             <div class="requestAnswer">
                 <form action="/request/answer/${received.id}" method="get">
                     <input type="hidden" name="gosuId" value="${expert.expertNum}"/>
                     <!-- 조건에 따라 비활성화 -->
                     <c:choose>
                         <c:when test="${expert.ExpertNum == received.replier}">
                             <button type="submit" class="btn btn-primary" disabled>견적 답장하기</button>
                         </c:when>
                         <c:otherwise>
                             <button type="submit" class="btn btn-primary">견적 답장하기</button>
                         </c:otherwise>
                     </c:choose>
                 </form>
                 <form action="/request/delete/${received.id}" method="post">
                     <button type="submit" class="btn btn-warning">견적 지우기</button>
                 </form>
             </div>
         </c:if>--%>
        <hr>
        <hr>
        <div class="answeredRequest">
            <button type="submit" class="btn btn-primary" disabled>이미 답장한 견적입니다</button>
            <form action="/request/delete/${answered.id}" method="post">
                <button type="submit" class="btn btn-warning">견적 지우기</button>
            </form>
        </div>
    </c:forEach>

    <c:forEach var="received" items="${receivedList}">
        <c:if test="${received.expertNum != expert.expertNum}">
            <table border="1">
                <div><c:out value="객체 -> ${received}"/></div>
                <c:if test="${not empty received.id}">
                    <tr>
                        <th>ID</th>
                        <td>${received.id}</td>
                    </tr>
                </c:if>
                <c:if test="${not empty received.userNum}">
                    <tr>
                        <th>Writer</th>
                        <td>${received.userName}</td>
                    </tr>
                </c:if>
                    <%--<c:if test="${not empty received.replier}">
                        <tr>
                            <th>Replier</th>
                            <td>${received.replier}</td>
                        </tr>
                    </c:if>--%>
                <c:if test="${not empty received.regDate}">
                    <tr>
                        <th>Registration Date</th>
                        <td>${received.regDate}</td>
                    </tr>
                </c:if>
                    <%--<c:if test="${not empty received.categoryNum}">
                        <tr>
                            <th>Sort</th>
                            <td>${received.categoryNum}</td>
                        </tr>
                    </c:if>--%>
                <c:if test="${not empty received.typeNum}">
                    <tr>
                        <th>Type</th>
                        <td>${received.typeName}</td>
                    </tr>
                </c:if>
                <c:if test="${not empty received.sub}">
                    <tr>
                        <th>Sub</th>
                        <td>${received.sub}</td>
                    </tr>
                </c:if>
                <c:if test="${not empty received.file1}">
                    <tr>
                        <th>File 1</th>
                        <td>${received.file1}</td>
                    </tr>
                </c:if>
                <c:if test="${not empty received.file2}">
                    <tr>
                        <th>File 2</th>
                        <td>${received.file2}</td>
                    </tr>
                </c:if>
                <c:if test="${received.cr != null}">
                    <tr>
                        <th>Commercial Use</th>
                        <td>${received.cr}</td>
                    </tr>
                </c:if>
                <c:if test="${not empty received.amount}">
                    <tr>
                        <th>Amount</th>
                        <td>${received.amount}</td>
                    </tr>
                </c:if>
                <c:if test="${not empty received.addService}">
                    <tr>
                        <th>Additional Service</th>
                        <td>${received.addService}</td>
                    </tr>
                </c:if>
                <c:if test="${not empty received.delService}">
                    <tr>
                        <th>Delete Service</th>
                        <td>${received.delService}</td>
                    </tr>
                </c:if>
                <c:if test="${not empty received.result}">
                    <tr>
                        <th>Result</th>
                        <td>${received.result}</td>
                    </tr>
                </c:if>
                <c:if test="${not empty received.day}">
                    <tr>
                        <th>Day</th>
                        <td>${received.day}</td>
                    </tr>
                </c:if>
                <c:if test="${not empty received.time}">
                    <tr>
                        <th>Time</th>
                        <td>${received.time}</td>
                    </tr>
                </c:if>
                <c:if test="${not empty received.age}">
                    <tr>
                        <th>Age</th>
                        <td>${received.age}</td>
                    </tr>
                </c:if>
                <c:if test="${not empty received.sex}">
                    <tr>
                        <th>Sex</th>
                        <td>${received.sex}</td>
                    </tr>
                </c:if>
                <c:if test="${not empty received.fav}">
                    <tr>
                        <th>Favorite</th>
                        <td>${received.fav}</td>
                    </tr>
                </c:if>
                <c:if test="${not empty received.place}">
                    <tr>
                        <th>Place</th>
                        <td>${received.place}</td>
                    </tr>
                </c:if>
                <c:if test="${not empty received.date}">
                    <tr>
                        <th>Date</th>
                        <td>${received.date}</td>
                    </tr>
                </c:if>
                <c:if test="${not empty received.regionNum}">
                    <tr>
                        <th>Region</th>
                        <td>${received.regionName}</td>
                    </tr>
                </c:if>
                <c:if test="${not empty received.ref}">
                    <tr>
                        <th>Reference</th>
                        <td>${received.ref}</td>
                    </tr>
                </c:if>
            </table>
            <br>
            <%--        <c:if test="${gosu.id != received.replier}">--%>
            <div class="receivedRequest">
                    <%--<form action="/request/answer/${received.id}" method="get">
                        <input type="hidden" name="gosuId" value="${expert.expertNum}"/>
                        <!-- 조건에 따라 비활성화 -->
                            &lt;%&ndash;                    <c:choose>&ndash;%&gt;
                            &lt;%&ndash;                        <c:when test="${gosu.id == received.replier}">&ndash;%&gt;
                            &lt;%&ndash;                            <button type="submit" class="btn btn-primary" disabled>견적 답장하기</button>&ndash;%&gt;
                            &lt;%&ndash;                        </c:when>&ndash;%&gt;
                            &lt;%&ndash;                        <c:otherwise>&ndash;%&gt;
                        <button type="submit" class="btn btn-primary">견적 답장하기</button>
                            &lt;%&ndash;                        </c:otherwise>&ndash;%&gt;
                            &lt;%&ndash;                    </c:choose>&ndash;%&gt;
                    </form>
                    --%>
                <form action="/request/answer/${received.id}" method="post">
<%--                    <input type="hidden" name="expert" value="${expert}"/>--%>
                    <input type="hidden" name="received" value="${received.id}"/>
                    <button type="submit" class="btn btn-primary">견적 답장하기</button>
                </form>
                <form action="/request/delete/${received.id}" method="post">
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
