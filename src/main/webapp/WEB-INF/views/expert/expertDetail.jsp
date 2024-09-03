<%--
  Created by IntelliJ IDEA.
  User: bemsu
  Date: 2024-08-20
  Time: 오후 4:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../header/header.jsp" %>
<%@include file="../header/headerModal.jsp" %>
<html>
<head>
    <link href="${pageContext.request.contextPath}/resources/static/css/expert/expertDetailStyle.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/static/css/header/headerStyle.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Title</title>
</head>
<body>
<div class="expert-background-container">
    <div class="blurred-background">
        <img src="${pageContext.request.contextPath}/resources/static/img/1.jpg" alt="Background Image"
             class="background-image">
    </div>
</div>
<main>
    <div class="expert-detail-main-container">
        <div class="expert-detail-item-container">
            <div class="expert-detail-item-img-container">
                <div class="expert-detail-item"><img src="${pageContext.request.contextPath}/resources/static/img/1.jpg"
                                                     class="expert-detail-item-img"></div>
            </div>
            <div class="expert-detail-profile container">
                <div class="row fs-2">대충 고수 닉네임</div>
                <div class="row">대충 고수 서비스</div>
                <div class="row">대충 고수 지역</div>
                <div class="row">대충 고수의 약식 소개</div>
            </div>
            <div>
                <div>대충 고수 리뷰</div>
                <div>대충 고수 경력</div>
            </div>
            <div class="expert-detail-contents">
                <div>대충 고수 정보</div>
                <div>대충 서비스 상세설명</div>
                <div>대충 고수 제공 서비스</div>
                <div>대충 고수 경력</div>
                <div>대충 고수 학력</div>
            </div>
            <div>
                <div>대충 고수 포트폴리오</div>
            </div>

            <div>
                <div>대충 사진 및 동영상</div>
            </div>

            <div>
                <div>대충 리뷰</div>
            </div>

            <div class="expert-detail-item">${expertDTO.expertNum}</div>
            <div class="expert-detail-item">${expertDTO.userNum}</div>
            <div class="expert-detail-item">${expertDTO.categoryNum}</div>
            <div class="expert-detail-item">${expertDTO.experienceYears}</div>
            <div class="expert-detail-item">${expertDTO.education}</div>
            <div class="expert-detail-item">${expertDTO.rating}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
            <div class="expert-detail-item">${expertDTO.region}</div>
        </div>
        <div class="expert-detail-right-container">
            <div class="expert-detail-item-req-container">
                <div>(고수이름)-(제공서비스) 고수에게 원하는 서비스의 견적을 받아보세요</div>
                <a class="expert-request">견적 요청</a>
                <div class="expert-detail-right-item-low">평균 <span class="right-item-min">(몇분)</span> 내로 응답하는 고수입니다.</div>
            </div>
        </div>
    </div>
</main>
</body>
</html>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const taps = document.querySelectorAll('.expert-detail-item-req-container');
        const initialTop = 100;

        document.addEventListener('scroll', function () {
            taps.forEach(tap => {
                if (window.scrollY > 200) {
                    tap.style.top = (window.scrollY - 150) + 'px';
                } else {
                    // tap.style.top = (initialTop + window.scrollY) + 'px';
                    tap.style.top = initialTop + 'px';
                }
            });
        });
    });

    // function adjustImage() {
    //     const img = document.getElementById('background-image');
    //     const container = img.parentElement;
    //
    //     // 이미지와 컨테이너의 크기 계산
    //     const containerRect = container.getBoundingClientRect();
    //     const imgRect = img.getBoundingClientRect();
    //
    //     // 이미지의 스케일 및 중앙 정렬
    //     const scale = 2;
    //     const scaledWidth = imgRect.width / scale;
    //     const scaledHeight = imgRect.height / scale;
    //
    //     // 이미지를 중심으로 고정
    //     img.style.left = ((containerRect.width - scaledWidth / 2)) + 'px';
    //     img.style.top = ((containerRect.height - scaledHeight) / 2) + 'px';
    // }
    //
    // // 페이지 로드 및 창 크기 조정 시 호출
    // window.addEventListener('load', adjustImage);
    // window.addEventListener('resize', adjustImage);
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/headerJS.js" type="text/javascript"></script>
