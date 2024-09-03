<%--
  Created by IntelliJ IDEA.
  User: J.Y
  Date: 2024-08-12
  Time: 오후 8:06
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link href="${pageContext.request.contextPath}/resources/static/css/header/headerStyle.css" rel="stylesheet"
          type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="${pageContext.request.contextPath}/resources/static/css/expert/modalStyle.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/static/css/expert/expertStyle.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.0/font/bootstrap-icons.min.css">
    <script src="${pageContext.request.contextPath}/resources/static/js/headerJS.js"></script>
    <script src="${pageContext.request.contextPath}/resources/static/js/community/community.js"></script>

    <style>
        @font-face {
            font-family: 'Pretendard-Regular';
            src: url('https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
            font-weight: 400;
            font-style: normal;
        }
        .communityList {
            border: rgb(0,0,0,0%);
            cursor: pointer;
            text-align: center;
            border-bottom: 1px solid #F0F0F0 ;
            padding: 20px;
            width: 100%;
            font-size: 14px;
        }

        ul {
            list-style-type: none;
        }

        .container {
            display: flex;
            justify-content: space-between;
            grid-template-columns: 1fr 4fr;
            gap: 20px;
        }

        .header-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
            grid-template-columns: 1fr 4fr;
        }

        .header-left {
            text-align: left;
        }

        .header-right {
            text-align: right;
        }

        .register {
            width: 120px;
            height: 45px;
            color: white;
            font-size: 16.5px;
            font-weight: bold;
            background-color: #00C7AE;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            text-align: center;
        }

        .register:hover {
            background-color: #00A18D;
        }

        .communityList-container {
            width: calc(75% - 20px);
        }
        .board-list {
            width: calc(25% - 20px);
        }


        .community-filter {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
            padding-bottom: 30px;
        }
        .board1234{
            cursor: pointer;
            padding-left: 10px;
            height: 60px;
            display: flex;
            align-items: center;
            font-family: 'Pretendard-Regular';
        }
        .board1234:hover{
            background-color: #F0F0F0;
        }
    </style>
</head>
<body>
<%@ include file="../header/header.jsp" %>
<main style="font-family: 'Pretendard-Regular'">
<%--    <%@include file="../header/headerModal.jsp" %>--%>
    <div>
    <div class="header-container">
        <div class="header-left">
            <h1>커뮤니티</h1>
        </div>
        <div class="header-right">
            <p>
                <button type="button" class="register" onclick="location.href='/community/register'">글쓰기 <i
                        class="bi bi-pencil-square"></i></button>
            </p>
        </div>
    </div>
    <div class="container">
        <div class="board-list">
            <ul>
                <li><div class="board1234" onclick="location.href='/community/listAll'">전체</div></li>
                <li><div class="board1234" onclick="location.href='/community/listAll?board_no=1'" >고수에게묻다</div></li>
                <li><div class="board1234" onclick="location.href='/community/listAll?board_no=2'">고수노하우</div></li>
                <li><div class="board1234" onclick="location.href='/community/listAll?board_no=3'">함께해요</div></li>
                <li><div class="board1234" onclick="location.href='/community/listAll?board_no=4'">고수소식</div></li>
            </ul>
        </div>
        <div class="communityList-container">
            <div class="community-list">
                <div class="community-filter">
                    <div id="service-modal-open" class="service-modal-opener">
                        서비스 <i class="bi bi-chevron-down"></i>
                    </div>
                    <div id="place-modal-open" class="place-modal-opener">
                        지역 <i class="bi bi-chevron-down"></i>
                    </div>
                </div>
                <c:forEach items="${boards}" var="board">
                    <div class="communityList" onclick="location.href='/community/read?cb_no=${board.cb_no}'">
                        <div style="font-weight: bold">${board.cb_title}</div>
                        <div>${board.cb_content}</div>
                        <div>${board.state} ${board.district}</div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    </div>
</main>
<%@include file="communityListModal.jsp" %>
<%--<%@ include file="footer.jsp" %>--%>
</body>
</html>
