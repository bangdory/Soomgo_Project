<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link href="${pageContext.request.contextPath}/resources/static/css/header/headerStyle.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/static/css/main/mainPage.css" rel="stylesheet" type="text/css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.0/font/bootstrap-icons.min.css">
    <script src="${pageContext.request.contextPath}/resources/static/js/headerJS.js"></script>

    <title>JSP - Hello World</title>
</head>
<body>
<%@include file="WEB-INF/views/header/header.jsp" %>
<main>
    <%@include file="WEB-INF/views/header/headerModal.jsp" %>
    <%-- 중앙 페이지 --%>
    <div class="main-center-page-container">
        <div class="main-center-page">
            <div class="main-center-keyword">
                <h1>1,000가지 생활 서비스를 단 한 곳에서</h1>
            </div>
            <div class="input-group mb-3 padding-item">
                <div class="centerRadiusDarkgray">
                    <span class="input-group-text input-soomgo-span" id="inputGroup-sizing-default"><i
                            class="bi bi-search"></i></span>
                    <input type="text" class="form-control input-soomgo" aria-label="Sizing example input"
                           aria-describedby="inputGroup-sizing-default" placeholder="어떤 서비스가 필요하세요?">
                </div>
            </div>
            <div class="padding-item">
                <ul class="right-align">
                    <li>
                        <a href="${pageContext.request.contextPath}/category/list">
                            <div class="icon-container">
                                <i class="bi bi-columns icon-size"></i>
                                <p>전체보기</p>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="icon-container">
                                <i class="bi bi-vector-pen icon-size"></i>
                                <p>디자인외주</p>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="icon-container">
                                <i class="bi bi-qr-code icon-size"></i>
                                <p>개발외주</p>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="icon-container">
                                <i class="bi bi-database-fill icon-size"></i>
                                <p>데이터외주</p>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="icon-container">
                                <i class="bi bi-pc-display icon-size"></i>
                                <p>컴퓨터실무</p>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="icon-container">
                                <i class="bi bi-palette icon-size"></i>
                                <p>디자인실무</p>
                            </div>
                        </a>
                    </li>
                </ul>
            </div>

            <div class="hidden-expert-container padding-item">
                <div class="hidden-expert-keyword">
                    <h2>숨은 고수를 발견했어요</h2>
                </div>
                <div class="hidden-expert-list padding-item">

                    <a class="expert-alink" href="#">

                        <div class="hidden-expert-list-expert">

                            <div class="expert-align-container">

                                <div class="expert-align">

                                    <img src="resources/static/img/1.jpg" class="expert-img">

                                    <div class="expert-profile">

                                        <div class="hidden-expert-name">대충 이름</div>

                                        <div class="hidden-expert-service">대충 서비스</div>

                                    </div>
                                </div>
                                <div class="expert-align-content">
                                    <div class="hidden-expert-list-content">테스트 용 내용</div>
                                </div>
                            </div>
                        </div>
                    </a>
                    <a class="expert-alink" href="#">
                        <div class="hidden-expert-list-expert">
                            <div class="expert-align-container">
                                <div class="expert-align">
                                    <img src="resources/static/img/1.jpg" class="expert-img">
                                    <div class="expert-profile">
                                        <div class="hidden-expert-name">대충 이름</div>
                                        <div class="hidden-expert-service">대충 서비스</div>
                                    </div>
                                </div>
                                <div class="expert-align-content">
                                    <div class="hidden-expert-list-content">테스트 용 내용</div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>

            <div class="community-container padding-item">
                <%-- 부제목 --%>
                <div class="community-keyword-section">
                    <div class="community-keyword">
                        <h2>숨고 커뮤니티에 물어보세요</h2>
                    </div>
                </div>
                <div class="community-sub-container">
                    <%-- 좌측 섹션 --%>
                    <div class="community-left-section">
                        <%-- 좌측섹션 _ 첫번째 단 --%>
                        <div class="community-left-item">
                            <a href="#">
                                <div>
                                    <div class="item-header">
                                        좌측 섹션 첫번째 단(커뮤니티 탭)
                                    </div>
                                </div>
                                <div>
                                    <div class="item-title">
                                        해당 커뮤니티의 제목
                                    </div>
                                    <div class="item-content">
                                        해당 커뮤니티의 내용
                                    </div>
                                </div>
                            </a>
                        </div>
                        <%-- 좌측섹션 _ 두번째 단 --%>
                        <div class="community-left-item">
                            <a href="#">
                                <div>
                                    <div class="item-header">
                                        좌측 세션 두번째 단(커뮤니티 탭)
                                    </div>
                                </div>
                                <div>
                                    <div class="item-title">
                                        해당 커뮤니티의 제목
                                    </div>
                                    <div class="item-content">
                                        해당 커뮤니티의 내용
                                    </div>
                                </div>
                            </a>
                        </div>
                        <%-- 좌측섹션 _ 세번째 단 --%>
                        <div class="community-left-item ">
                            <a href="#">
                                <div>
                                    <div class="item-header">
                                        좌측 섹션 세번쨰 단(커뮤니티 탭)
                                    </div>
                                </div>
                                <div>
                                    <div class="item-title">
                                        해당 커뮤니티의 제목
                                    </div>
                                    <div class="item-content">
                                        해당 커뮤니티의 내용
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <%-- 우측 섹션 --%>
                    <div class="community-right-section">
                        <!-- 우측섹션 _ 첫번째 단 -->
                        <div class="community-right-item">
                            <a href="#">
                                <div class="community-item-content">
                                    <img src="resources/static/img/1.jpg" class="community-img">
                                <div class="community-right-text">
                                    <div class="community-title">제목</div>
                                    <div class="community-content">내용</div>
                                    <div class="community-writer">작성자</div>
                                </div>
                                </div>
                            </a>
                        </div>
                        <!-- 우측섹션 _ 두번째 단 -->
                        <div class="community-right-item">
                            <a href="#">
                                <div class="community-item-content">
                                    <img src="resources/static/img/1.jpg" class="community-img">
                                    <div class="community-right-text">
                                        <div class="community-title">제목</div>
                                        <div class="community-content">내용</div>
                                        <div class="community-writer">작성자</div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</main>

<!-- JavaScript 파일을 페이지의 마지막에 포함 -->
</body>
</html>