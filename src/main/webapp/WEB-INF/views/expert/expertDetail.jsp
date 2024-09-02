<%--
  Created by IntelliJ IDEA.
  User: bemsu
  Date: 2024-08-20
  Time: 오후 4:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link href="${pageContext.request.contextPath}/resources/static/css/header/headerStyle.css" rel="stylesheet"
          type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="${pageContext.request.contextPath}/resources/static/js/headerJS.js"></script>
    <title>Title</title>
    <style>
        /*html {*/
        /*    scroll-behavior: smooth; !* 페이지 내 모든 스크롤을 부드럽게 처리 *!*/
        /*}*/

        main {
            width: 1920px;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }


        .expert-detail-main-container {
            /*max-width: 1080px;*/
            width: 100%;
            display: flex;
            justify-content: space-between;
            height: calc(100% - 120px);
            padding-top: 200px;
            position: relative; /* 자식 요소의 절대 위치를 설정하기 위해 필요 */
            gap: 10px;
            margin: 0 auto;
            z-index: 1;
        }

        .expert-background-container {
            padding-top: 100px;
            position: absolute;
            width: 100%;
            height: 400px;
            overflow: hidden; /* 블러 처리된 부분이 컨테이너를 넘어가지 않도록 설정 */
            z-index: 0;
        }

        .blurred-background {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%; /* 상위 컨테이너와 동일한 높이 */
            overflow: hidden; /* 블러 처리된 부분이 컨테이너를 넘어가지 않도록 설정 */
            display: flex;
            justify-content: center; /* 이미지 중앙 정렬 */
            align-items: center; /* 이미지 중앙 정렬 */
        }

        .background-image {
            position: absolute;
            top: 50%;
            left: 50%;
            width: 100%; /* 가로 길이는 유지 */
            height: auto; /* 세로 길이를 비율에 맞게 자동 조정 */
            max-height: 200px; /* 최대 세로 길이 설정 */
            transform: translate(-50%, -50%); /* 중앙 정렬 */
            filter: blur(5px); /* 블러 효과 적용 */
            object-fit: cover; /* 이미지의 비율을 유지하며 컨테이너에 맞게 조정 */
        }


        .expert-detail-item-container {
            width: 1080px;
            display: flex;
            flex-direction: column;
            padding-top: 20px;
        }

        .expert-detail-item-img-container {
            width: 100%;
            display: flex;
            justify-content: start;
            align-items: center;
        }

        .expert-detail-item-img {
            border: 1px solid #aaaaaa;
            border-radius: 25px;
            width: 120px;
            height: 120px;
        }

        .expert-detail-item {
            padding-top: 8px;
            text-align: center;
        }

        .expert-detail-right-container {
            height: 100%;
            width: 100%;
            max-width: 400px;
            display: flex;
            position: relative;
            justify-content: start;
            align-items: start;
        }


        .expert-detail-item-req-container {
            border: 1px solid #aaaaaa;
            border-radius: 15px;
            /*position: absolute; !* 화면에 고정 *!*/
            /*top: 629px; !* 페이지 상단에서 430px 떨어진 위치 *!*/
            /*right: 41px; !* 화면의 오른쪽에 위치 *!*/
            /*width: 280px; !* 필요에 따라 너비 조정 *!*/
            position: absolute; /* 화면에 고정 */
            top: 100px; /* 페이지 상단에서 430px 떨어진 위치 */
            left: 0;
            width: 280px; /* 필요에 따라 너비 조정 */
            height: 200px;
            z-index: 1000; /* 다른 요소들 위에 표시되도록 높은 z-index 값 설정 */
            background-color: white; /* 배경색 설정 */
            transition: transform 0s ease, top 0s ease; /* transform과 top 변화 시 부드러운 애니메이션 추가 */
            /* 추가 스타일링 */
            display: grid;
            justify-content: center;
            align-items: start;
            padding: 8px;
        }

        .container .row {
            padding-top: 20px;
        }


        @media (max-width: 1600px) {
            .expert-detail-right-container {
                display: none;
            }
        }

        /*.expert-request {*/
        /*    margin: 0 auto;*/
        /*    height: 40px;*/
        /*    width: 85%;*/
        /*    background: #00A18D;*/
        /*    border-radius: 5px;*/
        /*    text-align: center;*/
        /*}*/
        .expert-request {
            margin: 0 auto;
            height: 40px;
            width: 95%;
            background: #00C7AE;
            border-radius: 5px;
            text-align: center;
            display: flex; /* Flexbox 활성화 */
            align-items: center; /* 수직 중앙 정렬 */
            justify-content: center; /* 수평 중앙 정렬 */
            color: white; /* 텍스트 색상 설정 */
            text-decoration: none; /* 밑줄 제거 */
            cursor: default; /* 포인터 커서 제거 */
            font-size: 18px; /* 폰트 크기 설정 (필요에 따라 조정) */
            line-height: 40px; /* 수직 중앙 정렬을 보장하기 위한 line-height 설정 */
        }

        .expert-request:hover {
            color: white;
            background: #00A18D;
        }

        .right-item-min {
            color: #00C7AE;
        }


    </style>
</head>
<body>
<%@include file="../header/header.jsp" %>
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
