<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/header/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>계정 정보</title>
    <link href="${pageContext.request.contextPath}/resources/static/css/header/headerStyle.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/userpage/account_info.css">
</head>
<body>
<div class="container">
    <main>
        <div class="account-info">
            <h1>계정설정</h1>
            <div class="profile-card">
                <div class="profile-img">

                    <img src="${pageContext.request.contextPath}/resources/static${empty userprofile.profile_img ? '/img/default.png' : userprofile.profile_img}"
                         alt="Profile Image">


                    <button onclick="showModal()">이미지 수정</button>
                </div>
                <div class="profile-nickname">
                    <div>
                        <p class="profile-details-title">숨고 활동명</p>
                    </div>
                    <button onclick="editNickname()">수정</button>
                </div>
                <div class="nicknameform">

                    <div class="breakline" id="breakline">
                        <p id="nicknameDisplay">${userprofile.user_nickname}</p>
                    </div>
                    <div id="nicknameEdit" class="profile-nickname-edit" style="display: none;">
                        <form id="nicknameForm">
                            <div class="breakline">
                                <input type="text" id="newNickname" name="newNickname"
                                       value="${userprofile.user_nickname}"
                                       oninput="updateCharacterCount()" required>
                            </div>
                            <div class="char-counter"><span id="charCount">0/10자</span></div> <!-- 글자 수 표시 -->
                            <button type="button" onclick="saveNickname()">저장</button>
                            <button type="button" onclick="cancelEdit()">취소</button>
                        </form>
                    </div>
                </div>
                <div class="profile-info">
                    <a href="/userpage/account_info/setting">개인정보관리</a>
                </div>
            </div>
            <div>
                <a href="/logout">로그아웃</a>
                <a href="/탈퇴">회원탈퇴</a>
            </div>
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

<!-- 토스트 알림 -->
<div id="toast" class="toast">닉네임이 성공적으로 변경되었습니다.</div>

<script>
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

    // 닉네임 글자 수 업데이트 함수
    function updateCharacterCount() {
        var newNickname = document.getElementById('newNickname').value;
        var charCount = newNickname.length;
        var charCountDisplay = document.getElementById('charCount');

        // 글자 수 표시 업데이트
        charCountDisplay.textContent = charCount + '/10자';

        // 글자 수에 따라 텍스트 색상 변경 (선택 사항)
        if (charCount > 10) {
            charCountDisplay.style.color = 'red';
        } else {
            charCountDisplay.style.color = 'black';
        }
    }

    // 닉네임 수정 폼 보이게 하기
    function editNickname() {
        document.getElementById('nicknameEdit').style.display = 'block';
        document.getElementById('nicknameDisplay').style.display = 'none';
        updateCharacterCount(); // 폼 열릴 때 글자 수 업데이트
        document.getElementById('breakline').style.borderBottom = 'none';
        var input = document.getElementById('newNickname');
        input.focus();
        input.setSelectionRange(input.value.length, input.value.length)

    }

    // 닉네임 수정 취소
    function cancelEdit() {
        document.getElementById('nicknameEdit').style.display = 'none';
        document.getElementById('nicknameDisplay').style.display = 'block';
        document.getElementById('breakline').style.borderBottom = '1px solid #cccccc';
    }

    // 닉네임 저장
    function saveNickname() {
        var newNickname = document.getElementById('newNickname').value;

        // 정규표현식: 한글, 영문, 숫자 허용, 최대 10자
        var nicknameRegex = /^[가-힣a-zA-Z0-9]{1,10}$/;

        if (!newNickname) {
            showToast('닉네임을 입력하세요.');
            return;
        }

        if (!nicknameRegex.test(newNickname)) {
            showToast('닉네임은 한글, 영문, 숫자만 가능하며 최대 10자까지 입력할 수 있습니다.');
            return;
        }

        var xhr = new XMLHttpRequest();
        xhr.open('POST', '${pageContext.request.contextPath}/userpage/updateNickname', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onload = function () {
            if (xhr.status === 200) {
                // 닉네임 업데이트
                document.getElementById('nicknameDisplay').textContent = newNickname;
                document.getElementById('headerNickname').textContent = newNickname; // 헤더의 닉네임 업데이트
                // 토스트 알림 표시
                showToast('닉네임이 성공적으로 변경되었습니다.');
                // 닉네임 수정 폼 숨기기

                cancelEdit();
            } else {
                alert('닉네임 변경 실패: ' + xhr.responseText);
            }
        };

        xhr.onerror = function () {
            alert('서버와의 연결에 문제가 발생했습니다.');
        };

        xhr.send('newNickname=' + encodeURIComponent(newNickname));

        document.getElementById('breakline').style.borderBottom = '1px solid #cccccc';
    }

    // 토스트 알림을 표시하는 함수
    function showToast(message) {
        var toast = document.getElementById('toast');
        toast.textContent = message;
        toast.className = 'toast show';
        setTimeout(function () {
            toast.className = toast.className.replace('show', '');
        }, 3000); // 3초 후 토스트 사라짐
    }
</script>

</body>
</html>
