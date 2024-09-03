<%--
  Created by IntelliJ IDEA.
  User: J.Y
  Date: 2024-08-13
  Time: 오전 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        main {
            font-family: 'Pretendard-Regular';
        }
        a {
            color: inherit;
            text-decoration: none;
        }
        .title-div{
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
            width: 90%;
            margin-bottom: 10px;
            padding-bottom: 20px;
            border-bottom: 1px solid #F0F0F0 ;

        }
        /* 컨텍스트 메뉴 스타일 */
        #context-menu {
            display: none;
            position: absolute;
            background: white;
            border: 1px solid #ccc;
            box-shadow: 0 2px 10px rgba(0,0,0,0.2);
            z-index: 1000;
        }
        #context-menu ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        #context-menu ul li {
            padding: 8px 12px;
            cursor: pointer;
        }
        #context-menu ul li:hover {
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
            border-bottom: 1px solid #F0F0F0 ;
        }
        .wayforboard {
            color: #C7C3C1;
            margin-bottom: 40px;
        }

        #like-icon:hover {
            cursor: pointer;
        }

    </style>
</head>
<body>
<%@include file="../header/header.jsp"%>
<main>
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
<%--<%@ include file="footer.jsp" %>--%>

</body>
</main>
<script>
    document.addEventListener('DOMContentLoaded', function (){
    const icon = document.getElementById('image-to-click');
    const contextMenu = document.getElementById('context-menu');

    if (icon){
        icon.addEventListener('click', function (event){
            event.preventDefault();
            console.log('Icon clicked');

            const iconRect = icon.getBoundingClientRect();
            const menuRect = contextMenu.getBoundingClientRect();

            contextMenu.style.display = 'block';
            contextMenu.style.left = `${iconRect.right}px`; // 아이콘의 오른쪽
            contextMenu.style.top = `${iconRect.bottom}px`; // 아이콘의 아래쪽
        });
    }  else {
        console.log('Icon not found'); // 디버깅용 로그
    }

        document.addEventListener('click', function (event){
            if (event.target !== icon && !contextMenu.contains(event.target)){
            contextMenu.style.display = 'none';
            }
        });

        document.getElementById('update').addEventListener('click', function (){
            <%--console.log(boardNo);--%>
            window.location.href = `/community/modify?cb_no=${board.cb_no}`;
        });

        document.getElementById('delete').addEventListener('click', function (){
            if (confirm('게시글을 정말 삭제하시겠습니까?')) {
                fetch(`/community/delete?cb_no=${board.cb_no}`, {
                    method: 'POST'
                }).then(response =>{
                    if (response.ok) {
                        window.location.href = `/community/listAll`;
                    }
                }).catch(error => console.error('Error', error));
            }
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
        });
    });

<%--
    document.getElementById('like-button').addEventListener('click', function () {
        const cb_no = ${board.cb_no}; // 게시글 번호
        const xhr = new XMLHttpRequest();  // 사용자의 번호 (세션에서 가져옴)
        const user_num = ${board.user_num};

        console.log("cb_no", cb_no);
        console.log("user_num", user_num);

        const url = '/community/checkLike?cb_no='+ cb_no +'&user_num='+user_num;

        fetch(url)
            .then(response => response.json())
            .then(data => {
                if (data.isLiked) {
                    // 이미 좋아요를 눌렀으므로 좋아요 취소
                    fetch(`/community/removeLike?cb_no=${board.cb_no}&user_num=${user_num}`, {
                        method: 'POST'
                    })
                        .then(response => response.json())
                        .then(data => {
                            // 업데이트된 좋아요 수 반영
                            document.getElementById('like-count').textContent = data.newLikeCount
                            // 아이콘 업데이트
                            document.getElementById('like-icon').classList.remove('bi-heart-fill');
                            document.getElementById('like-icon').classList.add('bi-heart');
                        })
                } else {
                    // 좋아요를 누르지 않았으므로 좋아요 추가
                    fetch(`/community/increaseLike?cb_no=${board.cb_no}&user_num=${user_num}`, {
                        method: 'POST'
                    })
                        .then(response => response.json())
                        .then(data => {
                            // 업데이트된 좋아요 수 반영
                            document.getElementById('like-count').textContent = data.newLikeCount;
                            // 아이콘 업데이트
                            document.getElementById('like-icon').classList.remove('bi-heart');
                            document.getElementById('like-icon').classList.add('bi-heart-fill');
                        })
                }
            });
    });
--%>
</script>

</html>
