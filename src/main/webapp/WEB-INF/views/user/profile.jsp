<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../header/header.jsp" %>
<%@include file="../header/headerModal.jsp" %>
<!-- 페이지 내용 -->
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/user/profile.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/header/headerStyle.css">
</head>
<body>

<div class="container">
    <main>
        <div class="profile">
            <div class="profile-img">

                <img src="${pageContext.request.contextPath}/resources/static${empty userprofile.profile_img ? '/img/default.png' : userprofile.profile_img}"
                     alt="Profile Image">


                <button onclick="showModal()">이미지 수정</button>
            </div>
            <div class="profile-details"></div>

            <p><strong>${userprofile.user_nickname}</strong></p>


        </div>
    </main>
</div>

<div id="imgModal" class="modal">
    <div class="modal-img">
        <span class="close" onclick="closeModal()">&times;</span>
        <h2>이미지 수정</h2>
        <form id="imgForm" enctype="multipart/form-data">
            <input type="file" id="user_img" name="user_img" accept="image/*" onchange="uploadImage()" required>
            <!-- 사진 등록 버튼 삭제 -->
            <button type="button" onclick="setDefaultProfile()">기본 프로필로 변경</button>
        </form>
    </div>
</div>
<script>
    function showModal() {
        document.getElementById('imgModal').classList.add('show');
    }

    function closeModal() {
        document.getElementById('imgModal').classList.remove('show');
    }

    // 모달을 보이게 하는 함수
    function showModal() {
        document.getElementById('imgModal').classList.add('show');
    }

    // 모달을 닫는 함수
    function closeModal() {
        document.getElementById('imgModal').classList.remove('show');
    }

    // 이미지 업로드 함수
    function uploadImage() {
        var formData = new FormData();
        var imageFile = document.getElementById('user_img').files[0];

        if (!imageFile) {
            showToast('이미지를 선택하세요.');
            return;
        }

        formData.append('user_img', imageFile);

        var xhr = new XMLHttpRequest();
        xhr.open('POST', '${pageContext.request.contextPath}/userpage/uploadProfileImage', true);

        xhr.onload = function () {
            if (xhr.status === 200) {

                closeModal();
                location.reload();
            } else {
                alert('이미지 업로드 실패: ' + xhr.responseText);
            }
        };

        xhr.onerror = function () {
            alert('서버와의 연결에 문제가 발생했습니다.');
        };

        xhr.send(formData);
    }

    // 기본 프로필 이미지로 변경하는 함수
    function setDefaultProfile() {
        var xhr = new XMLHttpRequest();
        xhr.open('POST', '${pageContext.request.contextPath}/userpage/setDefaultProfile', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onload = function () {
            if (xhr.status === 200) {

                closeModal();
                location.reload();
            } else {
                alert('기본 프로필 변경 실패: ' + xhr.responseText);
            }
        };

        xhr.onerror = function () {
            alert('서버와의 연결에 문제가 발생했습니다.');
        };

        xhr.send();
    }
</script>
<script src="${pageContext.request.contextPath}/resources/static/js/headerJS.js" type="text/javascript"></script>
</body>
</html>
