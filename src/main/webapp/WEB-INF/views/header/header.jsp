<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="${pageContext.request.contextPath}/resources/static/css/header/headerStyle.css" rel="stylesheet" type="text/css">
<script>
    function toggleDropdown() {
        document.getElementById("myDropdown").classList.toggle("show");
    }

    // 클릭 시 드롭다운 외부를 클릭하면 닫히도록 설정
    window.onclick = function (event) {
        if (!event.target.matches('.dropbtn')) {
            var dropdowns = document.getElementsByClassName("dropdown-content");
            for (var i = 0; i < dropdowns.length; i++) {
                var openDropdown = dropdowns[i];
                if (openDropdown.classList.contains('show')) {
                    openDropdown.classList.remove('show');
                }
            }
        }
    }
</script>

<header class="header-first-container">
    <div class="header-second-container">
        <div class="header-third-container-1">
            <%-- 일정 크기 이하로 내려가면 좌측 탭 생성 --%>
            <div class="header-categoryTap-div">
                <div id="header-modal-tap">
                    <i class="bi bi-list font-large"></i>
                </div>
            </div>
            <%-- 로고 --%>
            <div class="header-logo-div">
                <a href="${pageContext.request.contextPath}/index.jsp">
                    <img src="${pageContext.request.contextPath}/resources/static/img/SoomgoIcon_2.png" alt="Logo">
                </a>
            </div>
            <%-- 견적 요청 --%>
            <div class="header-link-div">
                <a href="${pageContext.request.contextPath}/request/category">견적 요청</a>
            </div>
            <%-- 고수 찾기 --%>
            <div class="header-link-div">
                <a href="${pageContext.request.contextPath}/expert/expertFind">고수 찾기</a>
            </div>
            <%-- 마켓 --%>
            <div class="header-link-div">
                <a href="#">마켓</a>
            </div>
            <%-- 커뮤니티 --%>
            <div class="header-link-div">
                <a href="#">커뮤니티</a>
            </div>
        </div>


        <c:choose>
            <c:when test="${empty user}">
                <div class="header-third-container-2">
                    <div>
                        <a href="user/login">로그인</a>
                    </div>
                    <div>
                        <a href="user/signup">회원가입</a>
                    </div>
                    <div>
                        <a href="user/signup">고수가입</a>
                    </div>
                </div>

            </c:when>

            <c:when test="${usertype eq 'EXPERT'}">
                <div class="header-third-container-2">
                    <div>
                        <a href="/request/sent">보낸견적</a>
                    </div>
                    <div>
                        <a href="/profile">프로필</a>
                    </div>
                    <div>
                        <a href="chat">채팅</a>
                    </div>

                    <div class="dropdown">
                        <button onclick="toggleDropdown()" class="dropbtn">내 프로필</button>
                        <div id="myDropdown" class="dropdown-content">
                            <h2 id="headerNickname">${userprofile.user_nickname}</h2>
                            <a href="/request/sent">보낸견적</a>
                            <a href="${pageContext.request.contextPath}/userpage">마이페이지</a>
                            <a href="/logout">로그아웃</a>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="header-third-container-2">
                    <div>
                        <a href="/requestsent">받은견적</a>
                    </div>
                    <div>
                        <a href="chat">채팅</a>
                    </div>

                    <div class="dropdown">
                        <button onclick="toggleDropdown()" class="dropbtn">내 프로필</button>
                        <div id="myDropdown" class="dropdown-content">
                            <h2 id="headerNickname">${userprofile.user_nickname}</h2>
                            <a href="/requestsent">받은 견적</a>
                            <a href="${pageContext.request.contextPath}/userpage">마이페이지</a>
                            <a href="/logout">로그아웃</a>
                        </div>
                    </div>
                </div>


            </c:otherwise>
        </c:choose>


    </div>
</header>

<script src="${pageContext.request.contextPath}/resources/static/js/headerJS.js"></script>