<%--
  Created by IntelliJ IDEA.
  User: J.Y
  Date: 2024-08-13
  Time: 오전 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html>
<head>
    <title>커뮤니티 게시글</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        @font-face {
            font-family: 'Pretendard-Regular';
            src: url('https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
            font-weight: 400;
            font-style: normal;
        }
        body {
            font-family: 'Pretendard-Regular';
        }
        a {
            color: inherit;
            text-decoration: none;
        }
        input, textarea {
            border: none;
            background-color: transparent;
            font-size: 18px;
            font-family: 'Pretendard-Regular';
        }
        input {
            width: 40px;
        }
        textarea {
            margin-top: 10px;
            padding: 10px;
            width: 100%;
            resize: none;
            overflow-y: hidden;
            box-sizing: border-box;
        }
        .community-read-body{
            width: 80%;
            margin: 0 auto;
        }
        .title-div{
            padding-top: 80px;
            margin-bottom: 40px;
        }
        .category {
            font-size: 15px;
            color: #ABA8A6;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .title {
            font-size: 25px;
            font-weight: bold;
            margin-top: 10px;
            margin-bottom: 10px;
        }
        .addr {
            margin-top: 20px;
            color: #ABA8A6;
        }
        .won{
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            padding-bottom: 20px;
            border-bottom: 1px solid #F0F0F0 ;

        }
        /* 컨텍스트 메뉴 스타일 */
        #context-menu, .context-menu-reply {
            display: none;
            position: absolute;
            background: white;
            border: 1px solid #ccc;
            box-shadow: 0 2px 10px rgba(0,0,0,0.2);
            z-index: 1000;
        }
        #context-menu ul, .context-menu-reply ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        #context-menu ul li, .context-menu-reply ul li {
            padding: 8px 12px;
            cursor: pointer;
        }
        #context-menu ul li:hover, .context-menu-reply ul li:hover {
            background: #eee;
        }

        #image-to-click {
            font-size: 24px;
            cursor: pointer;
            position: absolute;
        }
        .content{
            margin-top: 10px;
            padding-top: 20px;
            padding-bottom: 50px;
        }
        .wayforboard {
            color: #C7C3C1;
            margin-bottom: 40px;
        }
        .wayforboard a {
            color: #C7C3C1;
        }

        .wayforboard a:hover{
            cursor: pointer;
        }

        #like-icon:hover {
            cursor: pointer;
        }
        .likeNReply {
            border-bottom: 1px solid #F0F0F0 ;
            padding-top: 10px;
            padding-bottom: 10px;
        }
        .reply-item {
            display: flex;
            margin-bottom: 40px;
        }
        .reply-form-newContent {
            display: flex;
            align-items: center;
            gap: 20px;
            border-bottom: 1px solid #F0F0F0 ;
        }
        .community-reply-newContent, .community-reply-content-text {
            width: 80%;
        }
        .custom-file-input {
            position: relative;
            align-items: center;
            height: 60px;
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
        .file-preview-container{
            display: none;
            width: 50px;
            height: 50px;
            overflow: hidden;
            position: relative;
            border-radius: 5px;
        }
        .file-preview-container img {
            width: 100%;
            height: 100%;
            object-fit: fill;
            display: block;
        }
        .file-preview-container img:hover {
            cursor: pointer;
            opacity: 0.7;
            filter: grayscale(30%);

        }
        .reply-submit-button {
            display: flex;
            align-items: flex-end; /* 수직 정렬을 하단으로 설정 */
            justify-content: center; /* 중앙 정렬, 필요에 따라 조정 */
            height: 100px; /* 높이를 설정하여 input이 하단에 위치할 공간을 확보 */
        }
        .reply-submit-button input[type="submit"]{
            width: 45px;
            height: 30px;
            color: #00C7AE;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            text-align: center;
        }
        .community-reply-userPhoto {
            margin-right: 10px;
        }
        .community-reply-user {
            padding-bottom: 10px;
            font-weight: bold;
        }
        .community-reply-time {
            padding-top: 10px;
            align-items: center;
            font-size: 12px;
            color: #ABA8A6;
        }

    </style>
</head>
<body>
<%@include file="../header/header.jsp"%>
<%@ include file="../header/headerModal.jsp"%>
<%--<main>--%>
<div class="community-read-body">
<div class="title-div">
    <div class="wayforboard">
        <a href="${pageContext.request.contextPath}/community/listAll">커뮤니티</a> >
            <c:if test="${board.board_no == 1}">
                <a href="${pageContext.request.contextPath}/community/listAll?board_no=${board.board_no}">고수에게묻다</a>
            </c:if>
            <c:if test="${board.board_no == 2}">
                <a href="${pageContext.request.contextPath}/community/listAll?board_no=${board.board_no}">고수노하우</a>
                </c:if>
            <c:if test="${board.board_no == 3}">
                <a href="${pageContext.request.contextPath}/community/listAll?board_no=${board.board_no}">함께해요</a>
                </c:if>
            <c:if test="${board.board_no == 4}">
                <a href="${pageContext.request.contextPath}/community/listAll?board_no=${board.board_no}">고수소식</a>
            </c:if>
    </div>
    <input type="hidden" id="cb_no" name="cb_no" value=${board.cb_no}>
    <div class="category">
        <div>${board.categoryName}</div>
    </div>
    <div class="title">
        <div>${board.cb_title}</div>
    </div>
    <div class="addr">
        <div>${board.state} ${board.district}</div>
    </div>
</div>
<div class="won">
    <div>
        <div>${board.user_name}</div>
        <div class="regNView">${cb_regdate} · 조회 ${cb_view}</div>
    </div>
    <div class="icon">
        <i class="bi bi-three-dots-vertical" id="image-to-click"></i>
            <div id="context-menu">
                <ul>
                    <li id="update">수정하기</li>
                    <li id="delete">삭제하기</li>
                </ul>
            </div>
    </div>
</div>
<div class="content">
    <div>${board.cb_content}</div>
    <div class="content_img">
        <c:choose>
            <c:when test="${not empty board.cb_file}">
                <img src="${board.cb_file}" alt="${board.cb_title} img">
            </c:when>
        </c:choose>
    </div>
</div>
<div class="likeNReply">
    <div class="like" id="like-button">
        <i class="bi bi-heart${isLiked ? '-fill' : ''}" id="like-icon"></i>
        <span id="like-count">${board.cb_like}</span>
    </div>
</div>
    <div class="reply-form">
<%--        <form action="${pageContext.request.contextPath}/reply/register" method="post" enctype="multipart/form-data">--%>
        <form id="reply-form" class="reply-form-newContent">
            <input type="hidden" name="cb_no" value="${board.cb_no}">
            <input type="hidden" name="user_num" value="${sessionScope.sess_user_num}">
            <div class="custom-file-input">
                <input type="file" name="cr_file" accept="image/gif, image/jpeg, image/png, image/bmp" multiple="multiple" id="fileInput">
                <button type="button" class="button" id="uploadButton">
                    <i class="bi bi-camera-fill" id="file-icon"></i>
                </button>
            </div>
            <div class="community-reply-newContent">
                <textarea name="cr_content" required></textarea>
                <div class="file-preview-container">
                    <img id="filePreview" src="" alt="File Preview" style="display: none;"> <!-- 파일 미리보기 -->
                </div>
            </div>
            <div class="reply-submit-button">
                <input type="submit" value="등록">
            </div>
        </form>
    </div>
    <div class="community-reply-body" id="replies">
        <c:forEach var="reply" items="${replies}">
            <div class="reply-item" id="reply-${reply.cr_no}">
                <input type="hidden" name="cr_no" id="cr_no" value=${reply.cr_no}>
                <div class="community-reply-userPhoto">
                    <div>유저프사</div>
                </div>
                <div class="community-reply-content-text">
                    <div class="community-reply-user">
                       ${reply.user_name}
                    </div>
                    <div class="community-reply-content">
                        ${reply.cr_content}
                    </div>
                    <div class="community-reply-time">
                        ${reply.cr_regdate}
                    </div>
<%--                    <div class="community-reply-like">--%>
<%--                    ${reply.cr_like}--%>
                    <input type="hidden" value=${reply.user_num}>
<%--                    </div>--%>
                </div>
                <div class="icon">
                    <i class="bi bi-three-dots-vertical" id="image-to-click-reply"></i>
                    <div class="context-menu-reply" id="context-menu-reply">
                        <ul>
                            <li class="update-btn" id="update-reply" data-no=`${reply.cr_no}`>수정하기</li>
                            <li class="delete-btn" id="delete-reply" data-no='${reply.cr_no}'>삭제하기</li>
                        </ul>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

</body>
<%--</main>--%>
<script>

    // 수정.삭제 컨텍스트메뉴
    document.addEventListener('DOMContentLoaded', function (){
        function openContextMenu (icon, contextMenu) {
            if (icon && contextMenu) {
                icon.addEventListener('click', function (event){
                    event.preventDefault();
                    console.log('Icon clicked');

                    const iconRect = icon.getBoundingClientRect();

                    contextMenu.style.display = 'block';
                    contextMenu.style.left = `${iconRect.right}px`; // 아이콘의 오른쪽
                    contextMenu.style.top = `${iconRect.bottom}px`; // 아이콘의 아래쪽
                });
            } else {
                console.log ('Icon or contextMenu not fount');
            }
        }

        function closeContextMenuOnClickOutside(icon, contextMenu)  {
            document.addEventListener('click', function (event){
                if (event.target !== icon && !contextMenu.contains(event.target)){
                    contextMenu.style.display = 'none';
                }
            });
        }

        // 게시글 컨텍스트 메뉴
        const postIcon = document.getElementById('image-to-click');
        const postContextMenu = document.getElementById('context-menu');

        openContextMenu(postIcon, postContextMenu);
        closeContextMenuOnClickOutside(postIcon, postContextMenu);

        // 댓글 컨텍스트 메뉴
        document.querySelectorAll('.bi.bi-three-dots-vertical').forEach(icon => {
            const contextMenu = icon.nextElementSibling;
            openContextMenu(icon, contextMenu);
            closeContextMenuOnClickOutside(icon,contextMenu);

        });
    });
    document.addEventListener('DOMContentLoaded', function (){
        // 댓글수정
        document.querySelectorAll('.update-btn').forEach(button => {
            button.addEventListener('click', function(event) {

                // 클릭된 버튼을 가져옴
                const clickedButton = event.currentTarget;
                // data-no 속성 값을 가져옴
                const dataNo = clickedButton.getAttribute('data-no');

                // dataNo 값을 콘솔에 출력
                console.log('클릭된 버튼의 data-no:', dataNo);
                fetch('user/isLoggedIn')
                    .then(response => response.json())
                    .then(data => {
                        if (data.loggedIn) {
                            <%--console.log(boardNo);--%>
                            window.location.href = `/reply/modify?cr_no=${reply.cr_no}`;
                        } else {
                            alert('로그인이 필요합니다.');
                            window.location.href = '/user/login';
                        }
                    })
            });
        });

        // 댓글삭제
        document.querySelectorAll('.delete-btn').forEach(button => {
            button.addEventListener('click', function(event) {

                // 클릭된 버튼을 가져옴
                const clickedButton = event.currentTarget;
                // data-no 속성 값을 가져옴
                const dataNo = clickedButton.getAttribute('data-no');

                // dataNo 값을 콘솔에 출력
                console.log('클릭된 버튼의 data-no:', dataNo);

                fetch('user/isLoggedIn')
                    .then(response => response.json())
                    .then(data => {
                        if (data.loggedIn) {
                            if (confirm('게시글을 정말 삭제하시겠습니까?')) {
                                fetch(`/reply/delete?cr_no=`+dataNo, {
                                    method: 'POST'
                                }).then(response =>{
                                    if (response.ok) {
                                        window.location.href = `/community/read?cb_no=${board.cb_no}`;
                                    }
                                }).catch(error => console.error('Error', error));
                            }
                        } else {
                            alert('로그인이 필요합니다.');
                            window.location.href = '/user/login';
                        }
                    })

            });
        });
    });

    document.addEventListener('DOMContentLoaded', function (){
        document.getElementById('update').addEventListener('click', function (){
            fetch('user/isLoggedIn')
                .then(response => response.json())
                .then(data => {
                    if (data.loggedIn) {
                        <%--console.log(boardNo);--%>
                        window.location.href = `/community/modify?cb_no=${board.cb_no}`;
                    } else {
                        alert('로그인이 필요합니다.');
                        window.location.href = '/user/login';
                    }
                })
        });

        document.getElementById('delete').addEventListener('click', function (){
            fetch('user/isLoggedIn')
                .then(response => response.json())
                .then(data => {
                    if (data.loggedIn) {
                        if (confirm('게시글을 정말 삭제하시겠습니까?')) {
                            fetch(`/community/delete?cb_no=${board.cb_no}`, {
                                method: 'POST'
                            }).then(response =>{
                                if (response.ok) {
                                    window.location.href = `/community/listAll`;
                                }
                            }).catch(error => console.error('Error', error));
                        }
                    } else {
                        alert('로그인이 필요합니다.');
                        window.location.href = '/user/login';
                    }
                })

        });

    });


    document.addEventListener('DOMContentLoaded',function (){

        const likeButton = document.getElementById('like-button');
        const likeIcon = document.getElementById('like-icon');
        const likeCount = document.getElementById('like-count')
        const cb_no = document.getElementById('cb_no').value;
        let liked = likeIcon.classList.contains('bi-heart-fill'); // 사용자가 좋아요 눌렀는지 여부
        // fetch로 no값을 던져줬을 때 checkLike로 리턴을 받을 때 true or false


        likeButton.addEventListener('click',function () {
            // 로그인 상태 확인
            fetch('user/isLoggedIn')
                .then(response => response.json())
                .then(data => {
                    if (data.loggedIn) {
                        if (!liked) {
                            liked = true;
                            likeIcon.classList.remove('bi-heart');
                            likeIcon.classList.add('bi-heart-fill'); // 빈 하트 지우고 채운하트로 바꾸기

                            // 서버로 Ajax 요청 보내서 좋아요 숫자 증가
                            fetch(`/community/increaseLike?cb_no=${board.cb_no}`, {
                                method: 'POST'
                            })
                                .then(response => {
                                    if (!response.ok){
                                        return response.json().then(error => Promise.reject(error));
                                    }
                                    return response.json();
                                })
                                .then(data => {
                                    console.log('Server response:', data);
                                    likeCount.textContent = data.newLikeCount;
                                })
                                .catch(error => console.error('Error', error));
                        } else  {
                            liked = false;
                            likeIcon.classList.remove('bi-heart-fill');
                            likeIcon.classList.add('bi-heart'); // 채운하트 지우고 빈하트로 바꾸기

                            // 서버로 Ajax 요청 보내서 좋아요 숫자 감소
                            fetch(`/community/removeLike?cb_no=${board.cb_no}`, {
                                method: 'DELETE'
                            })
                                .then(response => {
                                    if (!response.ok){
                                        return response.json().then(error => Promise.reject(error));
                                    }
                                    return response.json();
                                })
                                .then(data => {
                                    console.log('Server response:', data);
                                    likeCount.textContent = data.newLikeCount;
                                })
                                .catch(error => console.error('Error', error));
                        }
                    } else {
                        // 로그인 상태가 아닌 경우
                        alert('로그인이 필요합니다.');
                        window.location.href = '/user/login';
                    }
                })
                .catch(error => console.error('Error', error));

        });
    });

    document.addEventListener('DOMContentLoaded', function () {
        const replyForm = document.getElementById('reply-form')

        replyForm.addEventListener('submit', function (event) {
            event.preventDefault();

            const formData = new FormData(replyForm);

            fetch('/reply/register', {
                method: 'POST',
                body: formData
            })
                .then(response => response.json())
                .then(data => {
                    if (data.status === 'error') {
                        alert(data.message);
                    } else {
                        const { cr_no, user_name, cr_content, cr_regdate, cr_like, user_num} = data;
                        //새 댓글 목록에 추가
                        const repliesContainer = document.getElementById('replies');
                        const newReplyHtml = `
                            <div class="reply-item" id="reply-`+ data.cr_no +`">
                                <input type="hidden" name="cr_no" id="cr_no" value="`+ data.cr_no +`">
                                <div class="community-reply-userPhoto">
                                    <div>유저프사</div>
                                </div>
                                <div class="community-reply-content-text">
                                    <div class="community-reply-user">
                                       `+data.user_name+`
                                    </div>
                                    <div class="community-reply-content">
                                        `+data.cr_content+`
                                    </div>
                                    <div class="community-reply-time">
                                        `+data.cr_regdate+`
                                    </div>
                                    <%--<div>--%>
                                    <%--${reply.cr_like}--%>
                                    <input type="hidden" value="`+data.user_num+`">
                                    <%--</div>--%>
                                </div>
                                <div class="icon">
                                    <i class="bi bi-three-dots-vertical" id="image-to-click-reply"></i>
                                    <div id="context-menu-reply">
                                        <ul>
                                            <li id="update-reply">수정하기</li>
                                            <li id="delete-reply">삭제하기</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        `;
                            repliesContainer.innerHTML += newReplyHtml;
                            console.log(repliesContainer);

                        // 댓글 작성 폼 초기화
                        replyForm.reset();
                    }
                })
                .catch(error => console.error('Error:', error));
        });
    });

    document.getElementById('uploadButton').addEventListener('click', function () {
        document.getElementById('fileInput').click();
    })

    document.addEventListener('DOMContentLoaded', function () {
        const fileInput = document.getElementById('fileInput');
        const filePreview = document.getElementById('filePreview');
        const filePreviewContainer = document.querySelector('.file-preview-container');

        document.getElementById('fileInput').addEventListener('change', function () {

            if(fileInput.files.length > 0) {
                const file = fileInput.files[0];
                const reader = new FileReader();

                reader.onload = function (e) {
                    filePreview.src = e.target.result;
                    filePreview.style.display = 'block';
                    filePreviewContainer.style.display = 'block';
                };

                reader.readAsDataURL(file);
            } else {
                filePreview.style.display = 'none';
                filePreviewContainer.style.display = 'none';
            }
        });
        filePreview.addEventListener('click', function () {
            fileInput.value = '';
            filePreview.style.display = 'none';
            filePreviewContainer.style.display = 'none';
        });
    });



</script>

</html>
