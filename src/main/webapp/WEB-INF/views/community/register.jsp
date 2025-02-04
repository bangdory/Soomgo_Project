<%--
  Created by IntelliJ IDEA.
  User: J.Y
  Date: 2024-08-11
  Time: 오전 6:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../header/header.jsp"%>
<%@ include file="../header/headerModal.jsp"%>
<%@include file="communityRegisterModal.jsp" %>

<html>
<head>
    <title>커뮤니티 글쓰기</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/header/headerStyle.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/expert/modalStyle.css">
    <link href="${pageContext.request.contextPath}/resources/static/css/expert/expertFindStyle.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resources/static/js/headerJS.js"></script>
    <style>
        @font-face {
            font-family: 'Pretendard-Regular';
            src: url('https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
            font-weight: 400;
            font-style: normal;
        }
        .communityRegisterBody {
            padding-top: 80px;
            font-family: 'Pretendard-Regular';
            color: #ABA8A6;
            width: 80%;
            margin: 0 auto;
        }
        select {
            border: none;
            background-color: transparent;
            font-size: 18px;
        }
        input, textarea {
            border: none;
            background-color: transparent;
            font-size: 18px;
            font-family: 'Pretendard-Regular';
        }
        textarea {
            margin-top: 10px;
            padding: 10px;
            height: 50%;
            width: 100%;
            resize: none;
        }
        .header-part {
            height: 60px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #F0F0F0 ;
        }

        .custom-file-input {
            display: flex;
            align-items: center;
            position: relative;
            height: 60px;
            width: 100%;
            border-bottom: 1px solid #F0F0F0 ;

        }
        .custom-file-input input[type="file"] {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            opacity: 0; /* 숨김 처리 */
            cursor: pointer;
        }
        .custom-file-input .button {
            display: inline-flex;
            align-items: center;
            padding: 8px 16px;
            background-color: transparent;
            color: black;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 0;
        }
        .custom-file-input .file-name {
            margin-top: 0;
            color: #333;
        }
        .title {
            height: 60px;
            width: 100%;
            border-bottom: 1px solid #F0F0F0 ;
            display: flex;
            align-items: center;
        }

        .categoryNRegion {
            display: flex;
            align-items: center;
            gap: 20px;
            border-bottom: 1px solid #F0F0F0 ;
        }
        .category, .region {
            width: 20%;
            height: 60px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .submit input {
            width: 80px;
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

        .submit input:hover {
            background-color: #00A18D;

        }
    </style>
</head>
<body>
<%--<main>--%>
<div class="communityRegisterBody">
    <form action="/community/register" method="post" enctype="multipart/form-data">
        <div class="header-part">
            <div class="board_no">
                <select id="board_no" name="board_no">
                    <option value="1" <c:if test="${board_no == 1}">selected</c:if>>고수에게묻다</option>
                    <option value="2" <c:if test="${board_no == 2}">selected</c:if>>고수노하우</option>
                    <option value="3" <c:if test="${board_no == 3}">selected</c:if>>함께해요</option>
                    <option value="4" <c:if test="${board_no == 4}">selected</c:if>>고수소식</option>
                </select>
            </div>
            <div class="submit">
                <input type="submit" value="등록">
            </div>
        </div>
        <div class="content-div">
<%--                <input type="file" name="cb_file" accept="image/gif, image/jpeg, image/png, image/bmp" multiple="multiple"/>--%>
                <div class="custom-file-input">
                    <input type="file" name="cb_file" accept="image/gif, image/jpeg, image/png, image/bmp" multiple="multiple" id="fileInput">
                    <button type="button" class="button" id="uploadButton"><i class="bi bi-camera-fill"></i></button>
                    <div class="file-name" id="fileName">사진첨부하기</div>
                </div>
                <div class="title">
                    <input type="text" id="cb_title" name="cb_title" placeholder="제목을 입력해주세요." required>
                </div>

<%--            <input type="hidden" id="user_num" name="user_num" value=1>    --%>

            <div class="categoryNRegion">
                <div class="category" id="service-modal-open">
                    서비스
                    <input type="hidden" id="categoryNum" name="categoryNum" value="${board.categoryNum}">
<%--                    <input type="hidden" id="categoryNum" name="categoryNum" value=1>--%>
                    <i class="bi bi-chevron-down"></i>
                </div>
                <div class="region" id="place-modal-open">
                    지역
                    <input type="hidden" id="cb_addr" name="cb_addr" value="${board.cb_addr}">
<%--                    <input type="hidden" id="cb_addr" name="cb_addr" value="서울시">--%>
                    <i class="bi bi-chevron-down"></i>
                </div>

            </div>
            <div class="content">
                <textarea id="cb_content" name="cb_content" placeholder="생활 속에서 궁금했던 모든 것을 물어보세요."></textarea>

            </div>
        </div>

    </form>
</div>
<%--</main>--%>
</body>
</html>
