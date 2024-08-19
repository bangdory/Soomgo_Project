<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="${pageContext.request.contextPath}/resources/static/css/header/headerStyle.css" rel="stylesheet">
<script>
    function toggleDropdown() {
        document.getElementById("myDropdown").classList.toggle("show");
    }

    // 클릭 시 드롭다운 외부를 클릭하면 닫히도록 설정
    window.onclick = function(event) {
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
            <%-- 로고 --%>
            <div class="header-div">
                <a href="${pageContext.request.contextPath}/index.jsp">
                    <img src="${pageContext.request.contextPath}/resources/static/img/SoomgoIcon.png" alt="Logo">
                </a>
            </div>
            <%-- 견적 요청 --%>
            <div>
                <a href="${pageContext.request.contextPath}/request/category">견적 요청</a>
            </div>
            <%-- 고수 찾기 --%>
            <div>
                <a href="${pageContext.request.contextPath}/gosu/gosuFind">고수 찾기</a>
            </div>
            <%-- 마켓 --%>
            <div>
                <a href="#">마켓</a>
            </div>
            <%-- 커뮤니티 --%>
            <div>
                <a href="#">커뮤니티</a>
            </div>
        </div>


        <c:choose>
            <c:when test="${empty user}">
                <div class="header-third-container-2">
                    <div>
                        <a href="/login">로그인</a>
                    </div>
                    <div>
                        <a href="#">회원가입</a>
                    </div>
                    <div>
                        <a href="#">고수가입</a>
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
                <h2>${userprofile.user_nickname}</h2>
                <a href="/userpage">마이페이지</a>
                <a href="#settings">설정</a>
                <a href="/logout">로그아웃</a>
            </div>
        </div>
        </div>



            </c:otherwise>
        </c:choose>



    </div>
</header>