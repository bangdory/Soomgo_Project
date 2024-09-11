<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/header/header.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="${pageContext.request.contextPath}/resources/static/css/header/headerStyle.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/user/profile.css">
<!-- 페이지 내용 -->

<!DOCTYPE html>
<html lang="ko">
<body>



<div class="container">
    <main>
        <div class="profile">
            <div class="profile-img">
                <img src="${pageContext.request.contextPath}/resources/static${empty userprofile.profile_img ? '/img/default.png' : userprofile.profile_img}" alt="Profile Image">
                <button onclick="showModal()">이미지 수정</button>
            </div>
            <div class="profile-details"></div>
            <p id="nicknameDisplay"><strong>${userprofile.user_nickname}</strong></p>
            <p id="introDisplay">${expertIntro.introduce}</p>
            <button onclick="showModal2()">내소개편집</button>
            <p id="yearsDisplay" style="display: ${expertyears.experienceYears >= 1 ? 'none' : 'block'};">
                경력: ${expertIntro.experienceYears} 년
            </p>
            <button onclick="showModal3()">등록</button>
            <div id="portfolios">
                <c:forEach var="portfolio" items="${expertPortfolios}">
                    <div class="portfolio-item">
                        <h3>${portfolio.title}</h3>

                    </div>
                </c:forEach>
            </div>
            <button onclick="showModal4()">포트폴리오 보기</button>
        </div>
    </main>
</div>
</body>

<%-- 이미지 모달 --%>
<div id="imgModal" class="modal">
    <div class="modal-img">
        <span class="close" onclick="closeModal()">&times;</span>
        <h2>이미지 수정</h2>
        <form id="imgForm" enctype="multipart/form-data">
            <input type="file" id="user_img" name="user_img" accept="image/*" onchange="uploadImage()" required>
            <button type="button" onclick="setDefaultProfile()">기본 프로필로 변경</button>
        </form>
    </div>
</div>

<div id="Modal2" class="intro_modal">
    <div class="intro">
        <span class="close" onclick="closeModal2()">&times;</span>
        <form>
            <input type="text" id="newNickname" name="newNickname" value="${userprofile.user_nickname}" required>
            <input type="text" id="newIntro" name="newIntro" value="${expertIntro.introduce}" required>
            <input type="text" id="newCon_S" name="newCon_S" value="${expertIntro.contact_start}" required>
            <input type="text" id="newCon_E" name="newCon_E" value="${expertIntro.contact_end}" required>
            <input type="text" id="newEmpl" name="newEmpl" value="${expertIntro.employees}" required>
            <button type="button" onclick="saveIntro()">저장</button>
        </form>
    </div>
</div>

<div id="Modal3" class="years_modal">
    <div class="years">
        <span class="close" onclick="closeModal3()">&times;</span>
        <h2>경력</h2>
        <form>
            <select id="numberDropdown"></select>
            <button type="button" onclick="saveYears()">등록</button>
        </form>
    </div>
</div>

<!-- 포트폴리오 등록 모달 -->
<div id="Modal4" class="portfolio_modal">
    <div class="portfolio">
        <span class="close" onclick="closeModal4()">&times;</span>
        <h2>포트폴리오 등록</h2>
        <form id="createPortfolioForm" enctype="multipart/form-data">
            <input type="text" id="newTitle" name="newTitle" placeholder="제목" required>
            <input type="file" id="newThumbnail" name="newThumbnail" accept="image/*" onchange="previewThumbnail(event)" required>
            <img id="thumbnailPreview" src="#" alt="Thumbnail Preview" style="max-width: 200px; max-height: 200px; display:none;">
            <input type="file" id="newImg" name="newImg" accept="image/*" multiple onchange="addFiles(event)">
            <div id="imagePreviewContainer"></div>
            <input type="text" id="newTotal_price" name="newTotal_price" placeholder="총 가격" required>
            <input type="text" id="newWork_year" name="newWork_year" placeholder="근무 연수" required>
            <input type="text" id="newDuration" name="newDuration" placeholder="기간" required>
            <input type="text" id="newDuration_value" name="newDuration_value" placeholder="기간 값" required>
            <input type="text" id="newDescription" name="newDescription" placeholder="설명" required>
            <button type="button" onclick="createPortfolio()">등록</button>
        </form>
    </div>
</div>

<div id="toast" class="toast">닉네임이 성공적으로 변경되었습니다.</div>
<script>
    function showModal() {
        document.getElementById('imgModal').classList.add('show');
    }

    function closeModal() {
        document.getElementById('imgModal').classList.remove('show');
    }

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

    function showModal2() {
        document.getElementById('Modal2').classList.add('show');
    }

    function closeModal2() {
        document.getElementById('Modal2').classList.remove('show');
    }

    function saveIntro() {
        var xhr = new XMLHttpRequest();
        xhr.open('POST', '${pageContext.request.contextPath}/profile/updateIntro', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

        var newNickname = document.getElementById('newNickname').value;
        var newIntro = document.getElementById('newIntro').value;
        var newCon_S = document.getElementById('newCon_S').value;
        var newCon_E = document.getElementById('newCon_E').value;
        var newEmpl = document.getElementById('newEmpl').value;

        var params = 'newNickname=' + encodeURIComponent(newNickname) +
            '&newIntro=' + encodeURIComponent(newIntro) +
            '&newCon_S=' + encodeURIComponent(newCon_S) +
            '&newCon_E=' + encodeURIComponent(newCon_E) +
            '&newEmpl=' + encodeURIComponent(newEmpl);

        xhr.onload = function () {
            if (xhr.status === 200) {
                document.getElementById('nicknameDisplay').textContent = newNickname;
                document.getElementById('introDisplay').textContent = newIntro;

                showToast('성공적으로 변경되었습니다.');

                closeModal2();
            } else {
                alert('변경 실패: ' + xhr.responseText);
            }
        };

        xhr.onerror = function () {
            alert('서버와의 연결에 문제가 발생했습니다.');
        };

        xhr.send(params);
    }

    function showModal3() {
        const numbers = Array.from({length: 40}, (_, i) => i + 1);
        const dropdown = document.getElementById('numberDropdown');
        const noExperienceOption = document.createElement('option');
        noExperienceOption.value = null;
        noExperienceOption.textContent = '경력선택';
        dropdown.appendChild(noExperienceOption);

        numbers.forEach(number => {
            const option = document.createElement('option');
            option.value = number;
            option.textContent = number+'년';
            dropdown.appendChild(option);
        });
        document.getElementById('Modal3').classList.add('show');
    }

    function closeModal3() {
        document.getElementById('Modal3').classList.remove('show');
    }

    function showModal4() {
        document.getElementById('Modal4').classList.add('show');
    }

    function closeModal4() {
        document.getElementById('Modal4').classList.remove('show');
    }

    function saveYears() {
        var xhr = new XMLHttpRequest();
        xhr.open('POST', '${pageContext.request.contextPath}/profile/updateYears', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

        var newYears = document.getElementById('numberDropdown').value;
        if (newYears === null || newYears === 'null' || newYears === '') {
            newYears = 0; // null 값을 0으로 처리
        }

        xhr.onload = function () {
            if (xhr.status === 200) {
                var yearsDisplay = document.getElementById('yearsDisplay');
                if (yearsDisplay) { // yearsDisplay 요소가 존재할 때만 업데이트
                    if (newYears >= 1) {
                        yearsDisplay.textContent = '경력: ' + newYears + ' 년';
                        yearsDisplay.style.display = 'block';
                    } else {
                        yearsDisplay.style.display = 'none';
                    }
                }
                showToast('경력이 변경되었습니다.');
                closeModal3();
            } else {
                alert('변경 실패: ' + xhr.responseText);
            }
        };

        xhr.onerror = function () {
            showToast('서버와의 연결에 문제가 발생했습니다.');
        };
        console.log(newYears);
        xhr.send('newYears=' + newYears);
    }



    // 썸네일 파일 미리보기 (기존 코드 그대로 유지)
    function previewThumbnail(event) {
        var file = event.target.files[0];
        var reader = new FileReader();

        reader.onload = function(e) {
            var preview = document.getElementById('thumbnailPreview');
            preview.src = e.target.result;
            preview.style.display = 'block'; // 미리보기 이미지 보이기
        }

        if (file) {
            reader.readAsDataURL(file);
        }
    }

    // 미리보기 파일 저장 배열
    let previewFiles = [];

    // 파일을 추가할 때 실행되는 함수
    function addFiles(event) {
        var files = event.target.files;
        var previewContainer = document.getElementById('imagePreviewContainer');

        Array.from(files).forEach(file => {
            if (file.type.startsWith('image/')) {
                // 중복 파일 체크
                let isDuplicate = previewFiles.some(previewFile => previewFile.name === file.name && previewFile.size === file.size);

                if (!isDuplicate) {
                    previewFiles.push(file); // 파일을 배열에 추가

                    // 미리보기 이미지 추가
                    var reader = new FileReader();
                    reader.onload = function(e) {
                        var imgContainer = document.createElement('div');
                        imgContainer.style.margin = '10px';

                        var imgElement = document.createElement('img');
                        imgElement.src = e.target.result;
                        imgElement.style.maxWidth = '150px';
                        imgElement.style.maxHeight = '150px';
                        imgElement.style.display = 'block';

                        imgContainer.appendChild(imgElement);
                        previewContainer.appendChild(imgContainer);
                    };
                    reader.readAsDataURL(file);
                }
            }
        });

        // 파일 input 초기화 (같은 파일 다시 선택 가능하도록)
        event.target.value = '';
    }

    // 포트폴리오 생성 함수
    function createPortfolio() {
        var formData = new FormData(document.getElementById('createPortfolioForm'));

        // FormData 객체에 미리보기 파일들을 추가
        previewFiles.forEach(file => {
            formData.append('newImg', file);
        });

        var xhr = new XMLHttpRequest();
        xhr.open('POST', '${pageContext.request.contextPath}/profile/createPortfolio', true);

        xhr.onload = function () {
            if (xhr.status === 200) {
                alert('포트폴리오가 성공적으로 업데이트되었습니다.');
                closeModal4();
                location.reload(); // 페이지 새로고침
            } else {
                alert('업로드 실패: ' + xhr.responseText);
            }
        };

        xhr.onerror = function () {
            alert('서버와의 연결에 문제가 발생했습니다.');
        };

        xhr.send(formData);
    }

    // 포트폴리오 생성 함수
    function createPortfolio() {
        var formData = new FormData(document.getElementById('createPortfolioForm'));

        // FormData 객체에 미리보기 파일들을 추가
        previewFiles.forEach(file => {
            formData.append('newImg', file);
        });

        var xhr = new XMLHttpRequest();
        xhr.open('POST', '${pageContext.request.contextPath}/profile/createPortfolio', true);

        xhr.onload = function () {
            if (xhr.status === 200) {
                alert('포트폴리오가 성공적으로 업데이트되었습니다.');
                closeModal4();
                location.reload(); // 페이지 새로고침
            } else {
                alert('업로드 실패: ' + xhr.responseText);
            }
        };

        xhr.onerror = function () {
            alert('서버와의 연결에 문제가 발생했습니다.');
        };

        xhr.send(formData);
    }



    function showToast(message) {
        var toast = document.getElementById('toast');
        toast.textContent = message;
        toast.className = 'toast show';
        setTimeout(function () {
            toast.className = toast.className.replace('show', '');
        }, 3000); // 3초 후 토스트 사라짐
    }
</script>
</html>
