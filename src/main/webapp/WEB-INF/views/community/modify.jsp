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
    <title>커뮤니티 수정하기</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        @font-face {
            font-family: 'Pretendard-Regular';
            src: url('https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
            font-weight: 400;
            font-style: normal;
        }
        main {
            font-family: 'Pretendard-Regular';
            color: #ABA8A6;
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
    </style>
</head>
<body>
<%@include file="../header/header.jsp"%>
<main>
<div>
    <form action="/community/modify" method="post" enctype="multipart/form-data">
        <input type="hidden" name="cb_no" value="${board.cb_no}" />
        <div class="header-part">
            <div class="board_no">
                <select id="board_no" name="board_no">
                    <option value="1" <c:if test="${board.board_no == 1}">selected</c:if>>고수에게묻다</option>
                    <option value="2" <c:if test="${board.board_no == 2}">selected</c:if>>고수노하우</option>
                    <option value="3" <c:if test="${board.board_no == 3}">selected</c:if>>함께해요</option>
                    <option value="4" <c:if test="${board.board_no == 4}">selected</c:if>>고수소식</option>
                </select>
            </div>
            <div class="submit">
                <input type="submit" value="수정">
            </div>
        </div>
        <div class="content-div">

            <div class="custom-file-input">
                <input type="file" name="cb_file" accept="image/gif, image/jpeg, image/png, image/bmp" multiple="multiple" id="fileInput">
                <button type="button" class="button" id="uploadButton"><i class="bi bi-camera-fill"></i></button>
                <div class="file-name" id="fileName">사진첨부하기</div>
            </div>
            <div class="title">
                <input type="text" id="cb_title" name="cb_title" placeholder="제목을 입력해주세요." value="${board.cb_title}" required>
            </div>


            <div class="categoryNRegion">
                <div class="category" id="service-modal-open">
                    서비스
                    <%--                    <input type="hidden" id="categoryNum" name="categoryNum" value="${board.categoryNum}">--%>
                    <input type="hidden" id="categoryNum" name="categoryNum" value=${board.categoryNum}>
                    <i class="bi bi-chevron-down"></i>
                </div>
                <div class="region" id="place-modal-open">
                    지역
                    <%--                    <input type="hidden" id="cb_addr" name="cb_addr" value="${board.cb_addr}">--%>

                    <i class="bi bi-chevron-down"></i>
                </div>
                <input type="hidden" id="cb_addr" name="cb_addr" value=${board.cb_addr}>
            </div>
            <div class="content">
                <textarea id="cb_content" name="cb_content" placeholder="생활 속에서 궁금했던 모든 것을 물어보세요.">${board.cb_content}</textarea>
            </div>
        </div>

    </form>
</div>
</main>
<%@include file="communityRegisterModal.jsp" %>
</body>
</html>

