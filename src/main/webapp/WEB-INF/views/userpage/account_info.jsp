<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/header/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>계정 정보</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/userpage/styles.css">
    <style>

        .popup {
            display: none;
            position: fixed;
            z-index: 9999;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            background-color: white;
            border: 2px solid #4CAF50;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
            padding: 20px;
            text-align: center;
            border-radius: 10px;
        }

        .popup.active {
            display: block;
        }

        .popup button {
            margin-top: 10px;
            padding: 8px 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .popup button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class="container">
    <main>
        <div class="profile-card">
            <div class="profile-details">
                <p><strong>${userprofile.user_nickname}</strong> </p>
                <p><strong>${user.user_email}</strong> </p>
            </div>
            <button onclick="showModal() ">닉네임 수정</button>
            <a href="/logout">로그아웃</a>
        </div>
    </main>
</div>

<!-- 성공 메시지를 위한 팝업 -->
<div id="successPopup" class="popup">
    <p>닉네임이 성공적으로 변경되었습니다.</p>
    <button onclick="closePopup()">확인</button>
</div>

<!-- 모달 창 -->
<div id="nicknameModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <h2>닉네임 수정</h2>
        <form id="nicknameForm">
            <label for="user_nickname">새 닉네임:</label>
            <input type="text" id="user_nickname" name="user_nickname" value="${userprofile.user_nickname}" required>
            <button type="submit">수정하기</button>
        </form>
    </div>
</div>

<script>
    function showModal() {
        document.getElementById('nicknameModal').style.display = 'block';
    }

    function closeModal() {
        document.getElementById('nicknameModal').style.display = 'none';
    }

    function showPopup() {
        document.getElementById('successPopup').classList.add('active');
    }

    function closePopup() {
        document.getElementById('successPopup').classList.remove('active');
        location.reload();
    }

    document.getElementById('nicknameForm').addEventListener('submit', function(e) {
        e.preventDefault(); // 폼 제출 방지

        const newNickname = document.getElementById('user_nickname').value;

        // Ajax를 사용하여 닉네임 업데이트 요청
        fetch('<c:url value="/userpage/update_nickname" />', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: 'user_nickname=' + encodeURIComponent(newNickname)
        })
            .then(response => response.text())
            .then(data => {
                // 성공 시 팝업 표시
                showPopup();
                // 모달 닫기
                closeModal();
                // 업데이트된 닉네임 표시
                document.querySelector('.profile-details p strong').textContent = newNickname;
            })
            .catch(error => console.error('Error:', error));
    });
</script>
</body>
</html>