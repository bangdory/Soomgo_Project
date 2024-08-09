<%--
  Created by IntelliJ IDEA.
  User: bemsu
  Date: 2024-08-08
  Time: 오후 2:32
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<style>
    /* 모달 배경 */
    #service-modal-base-container,
    #place-modal-base-container {
        display: none; /* 기본적으로 숨김 */
        position: fixed; /* 화면에 고정 */
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.5); /* 반투명 배경 */
        z-index: 1000; /* 다른 요소 위에 표시 */
        overflow: auto; /* 모달 내용이 넘칠 경우 스크롤 */
    }

    /* 모달 내용 */
    .modal-content {
        background: #fff; /* 흰색 배경 */
        margin: 15% auto; /* 중앙 정렬, 상단 여백 */
        padding: 20px;
        border-radius: 5px; /* 둥근 모서리 */
        width: 80%; /* 너비 조절 */
        max-width: 500px; /* 최대 너비 */
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2); /* 그림자 효과 */
    }

    /* 모달 항목 */
    .service-modal-item,
    .place-modal-item {
        padding: 10px;
        margin: 5px 0;
        background: #f8f9fa; /* 항목 배경색 */
        border: 1px solid #ddd; /* 항목 테두리 */
        border-radius: 3px; /* 항목 모서리 둥글게 */
        cursor: pointer; /* 클릭 가능한 아이콘 */
        transition: background 0.3s ease; /* 배경색 전환 효과 */
    }

    .service-modal-item:hover,
    .place-modal-item:hover {
        background: #e9ecef; /* 마우스 오버 시 배경색 변경 */
    }

    .seoul-lower {
        display: none;
    }
</style>

<%--<style>--%>
<%--    /* 모달 배경 */--%>
<%--    #modal-base-container{--%>
<%--        /*display: none; !* 기본적으로 숨김 *!*/--%>
<%--        position: fixed; /* 화면에 고정 */--%>
<%--        top: 0;--%>
<%--        left: 0;--%>
<%--        width: 100%;--%>
<%--        height: 100%;--%>
<%--        background: rgba(0, 0, 0, 0.5); /* 반투명 배경 */--%>
<%--        z-index: 1000; /* 다른 요소 위에 표시 */--%>
<%--        overflow: auto; /* 모달 내용이 넘칠 경우 스크롤 */--%>
<%--    }--%>

<%--    /* 모달 내용 */--%>
<%--    .modal-content {--%>
<%--        background: #fff; /* 흰색 배경 */--%>
<%--        margin: 15% auto; /* 중앙 정렬, 상단 여백 */--%>
<%--        padding: 20px;--%>
<%--        border-radius: 5px; /* 둥근 모서리 */--%>
<%--        width: 80%; /* 너비 조절 */--%>
<%--        max-width: 500px; /* 최대 너비 */--%>
<%--        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2); /* 그림자 효과 */--%>
<%--    }--%>

<%--    /* 모달 항목 */--%>
<%--    .service-modal-item,--%>
<%--    .place-modal-item {--%>
<%--        padding: 10px;--%>
<%--        margin: 5px 0;--%>
<%--        background: #f8f9fa; /* 항목 배경색 */--%>
<%--        border: 1px solid #ddd; /* 항목 테두리 */--%>
<%--        border-radius: 3px; /* 항목 모서리 둥글게 */--%>
<%--        cursor: pointer; /* 클릭 가능한 아이콘 */--%>
<%--        transition: background 0.3s ease; /* 배경색 전환 효과 */--%>
<%--    }--%>

<%--    .service-modal-item:hover,--%>
<%--    .place-modal-item:hover {--%>
<%--        background: #e9ecef; /* 마우스 오버 시 배경색 변경 */--%>
<%--    }--%>
<%--</style>--%>

<%-- gosu.jsp Modal Page --%>

<%-- 서비스 모달(service-modal) --%>
<div id="service-modal-base-container">
    <div id="service-modal">
        <br>
        <div class="modal-content">
            <button type="button" id="close-serviceModal">Close</button>
            <c:forEach var="list" items="${list}">
                <div class="service-modal-item" data-value="${list.categoryName}">${list.categoryName}</div>
            </c:forEach>
            <%--
            <div class="service-modal-item" data-value="3D모델링">3D모델링</div>
            <div class="service-modal-item" data-value="ERP개발">ERP개발</div>
            <div class="service-modal-item" data-value="데이터가공및라벨링">데이터가공및라벨링</div>
            <div class="service-modal-item" data-value="데이터분석레슨">데이터분석레슨</div>
            <div class="service-modal-item" data-value="3D모델링/캐드(CAD)레슨">3D모델링/캐드(CAD)레슨</div>--%>
        </div>
    </div>
</div>

<%-- 지역 모달 창 (place-modal) --%>
<div id="place-modal-base-container">
    <div id="place-modal">
        <br>
        <div class="modal-content">
            <div class="place-modal-item seoul-upper" data-group="seoul">서울<button class="toggle-btn">펼치기</button></div>
                <div class="place-modal-item seoul-lower" data-group="seoul" data-value="구로구">구로구</div>
                <div class="place-modal-item seoul-lower" data-group="seoul" data-value="종로구">종로구</div>
                <div class="place-modal-item seoul-lower" data-group="seoul" data-value="마포구">마포구</div>
            <div class="place-modal-item" data-value="경기">경기</div>
            <div class="place-modal-item" data-value="인천">인천</div>
            <div class="place-modal-item" data-value="대구">대구</div>
            <div class="place-modal-item" data-value="제주">제주</div>
            <button type="button" id="close-placeModal">Close</button>
        </div>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        // 서비스 모달 열기 버튼 클릭 시 모달 보이기
        document.getElementById('service-modal-open').addEventListener('click', function () {
            document.getElementById('service-modal-base-container').style.display = 'block';
            document.getElementById('service-modal').style.display = 'block';
        });

        // 지역 모달 열기 버튼 클릭 시 모달 보이기
        document.getElementById('place-modal-open').addEventListener('click', function () {
            document.getElementById('place-modal-base-container').style.display = 'block';
            document.getElementById('place-modal').style.display = 'block';
        });

        // 서비스 모달 닫기 버튼 클릭 시 모달 숨기기
        document.getElementById('close-serviceModal').addEventListener('click', function () {
            document.getElementById('service-modal-base-container').style.display = 'none';
            document.getElementById('service-modal').style.display = 'none';
        });

        // 지역 모달 닫기 버튼 클릭 시 모달 숨기기
        document.getElementById('close-placeModal').addEventListener('click', function () {
            document.getElementById('place-modal-base-container').style.display = 'none';
            document.getElementById('place-modal').style.display = 'none';
        });

        // 서울 상위 항목 클릭 시 하위 항목 표시/숨기기
        // document.querySelectorAll('.seoul-upper').forEach(function(upper) {
        //     upper.querySelector('.toggle-btn').addEventListener('click', function() {
        //         var group = upper.getAttribute('data-group'); // 클릭된 상위 요소의 data-group 속성 값을 가져옵니다.
        //
        //         // 같은 group을 가진 모든 `seoul-lower` 요소를 선택하여 display 속성을 토글합니다.
        //         document.querySelectorAll('.seoul-lower').forEach(function(lower) {
        //             if (lower.getAttribute('data-group') === group) {
        //                 // 현재 display 상태를 체크하여 토글
        //                 lower.style.display = lower.style.display === 'block' ? 'none' : 'block';
        //             }
        //         });
        //     });
        // });

        // 서비스 모달 내의 항목 클릭 시
        document.querySelectorAll('.service-modal-item').forEach(function (item) {
            item.addEventListener('click', function () {
                var value = item.getAttribute('data-value');
                var modalDataIn = document.getElementById('modalDataIn');
                var newItem = document.createElement('div');
                newItem.innerText = value;
                modalDataIn.appendChild(newItem);
                document.getElementById('service-modal-base-container').style.display = 'none';
                document.getElementById('service-modal').style.display = 'none';
            });
        });

        // 지역 모달 내의 항목 클릭 시

        document.querySelectorAll('.place-modal-item').forEach(function(item) {
            item.addEventListener('click', function(event) {
                // 클릭된 요소가 toggle-btn인지 확인
                if (event.target.classList.contains('toggle-btn')) {
                    var group = item.getAttribute('data-group');
                    // 같은 group을 가진 모든 `seoul-lower` 요소를 선택하여 display 속성을 토글합니다.
                    document.querySelectorAll('.seoul-lower').forEach(function(lower) {
                        if (lower.getAttribute('data-group') === group) {
                            lower.style.display = lower.style.display === 'block' ? 'none' : 'block';
                        }
                    });
                } else {
                    // toggle-btn이 아닌 경우에는 기존 동작 수행
                    var value = item.getAttribute('data-value');
                    var modalDataIn2 = document.getElementById('modalDataIn2');
                    var newItem = document.createElement('div');
                    newItem.innerText = value;
                    modalDataIn2.appendChild(newItem);
                    // document.getElementById('place-modal-base-container').style.display = 'none';
                    // document.getElementById('place-modal').style.display = 'none';

                    document.querySelectorAll('.seoul-lower').forEach(function(lower) {
                        lower.style.display = 'none';
                    });
                }
            });
        });
        // document.querySelectorAll('.place-modal-item').forEach(function (item) {
        //     item.addEventListener('click', function () {
        //         var value = item.getAttribute('data-value');
        //         var modalDataIn2 = document.getElementById('modalDataIn2');
        //         var newItem = document.createElement('div');
        //         newItem.innerText = value;
        //         modalDataIn2.appendChild(newItem);
        //         document.getElementById('place-modal-base-container').style.display = 'none';
        //         document.getElementById('place-modal').style.display = 'none';
        //     });
        // });
    });
</script>


<%--&lt;%&ndash; gosu.jsp Modal Page &ndash;%&gt;--%>

<%--&lt;%&ndash; 서비스 모달(service-modal) &ndash;%&gt;--%>
<%--<div id="modal-base-container">--%>
<%--    <div id="service-modal">--%>
<%--        <br>--%>
<%--        <div class="modal-content">--%>
<%--            <div class="service-modal-item" data-value="3D모델링">3D모델링</div>--%>
<%--            <div class="service-modal-item" data-value="ERP개발">ERP개발</div>--%>
<%--            <div class="service-modal-item" data-value="데이터가공및라벨링">데이터가공및라벨링</div>--%>
<%--            <div class="service-modal-item" data-value="데이터분석레슨">데이터분석레슨</div>--%>
<%--            <div class="service-modal-item" data-value="3D모델링/캐드(CAD)레슨">3D모델링/캐드(CAD)레슨</div>--%>
<%--            <button type="button" id="close-serviceModal">Close</button>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>


<%--&lt;%&ndash; 지역 모달 창 (place-modal) &ndash;%&gt;--%>
<%--<div id="modal-base-container">--%>
<%--    <div id="place-modal">--%>
<%--        <br>--%>
<%--        <div class="modal-content">--%>
<%--            <div class="place-modal-item" data-value="서울">서울</div>--%>
<%--            <div class="place-modal-item" data-value="경기">경기</div>--%>
<%--            <div class="place-modal-item" data-value="인천">인천</div>--%>
<%--            <div class="place-modal-item" data-value="대구">대구</div>--%>
<%--            <div class="place-modal-item" data-value="제주">제주</div>--%>
<%--            <button type="button" id="close-placeModal">Close</button>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<script>--%>

<%--    document.addEventListener('DOMContentLoaded', function () {--%>
<%--        // 모달 열기 버튼이 있다면 그에 대한 이벤트 리스너 추가--%>

<%--        // service-modal-open의 id값을 가진 div 클릭 시 modal창 보이기--%>
<%--        document.getElementById('service-modal-open').addEventListener('click', function () {--%>
<%--            document.getElementById('service-modal').style.display = 'block';--%>
<%--        });--%>

<%--        // place-modal-open의 id값을 지닌 div 클릭 시 modal창 보이기--%>
<%--        document.getElementById('place-modal-open').addEventListener('click', function () {--%>
<%--            document.getElementById('place-modal').style.display = 'block';--%>
<%--        });--%>

<%--        // 모달 닫기 버튼 이벤트 리스너--%>

<%--        // close-serviceModal의 id값을 지닌 div 클릭 시 service-modal 숨기기--%>
<%--        document.getElementById('close-serviceModal').addEventListener('click', function () {--%>
<%--            document.getElementById('service-modal').style.display = 'none';--%>
<%--        });--%>

<%--        // close-placeModal의 id값을 지닌 div 클릭 시 place-modal 숨기기--%>
<%--        document.getElementById('close-placeModal').addEventListener('click', function () {--%>
<%--            document.getElementById('place-modal').style.display = 'none';--%>
<%--        });--%>

<%--        // 모달 내의 각 div 클릭 이벤트 리스너--%>
<%--        document.querySelectorAll('.service-modal-item').forEach(function (item) {--%>
<%--            item.addEventListener('click', function () {--%>

<%--                var value = item.getAttribute('data-value');--%>

<%--                var modalDataIn = document.getElementById('modalDataIn');--%>
<%--                var newItem = document.createElement('div');--%>
<%--                newItem.innerText = value;--%>

<%--                modalDataIn.appendChild(newItem);--%>

<%--                document.getElementById('service-modal').style.display = 'none';--%>

<%--            });--%>
<%--        });--%>
<%--    });--%>

<%--    document.querySelectorAll('.place-modal-item').forEach(function (item) {--%>
<%--        item.addEventListener('click', function () {--%>

<%--            var value = item.getAttribute('data-value');--%>

<%--            var modalDataIn2 = document.getElementById('modalDataIn2');--%>
<%--            var newItem = document.createElement('div');--%>
<%--            newItem.innerText = value;--%>

<%--            modalDataIn2.appendChild(newItem);--%>

<%--            document.getElementById('place-modal').style.display = 'none';--%>

<%--        });--%>
<%--    });--%>
<%--</script>--%>