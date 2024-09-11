<%--
  Created by IntelliJ IDEA.
  User: bemsu
  Date: 2024-08-08
  Time: 오후 2:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- gosu.jsp Modal Page --%>

<%-- 서비스 모달(service-modal) --%>
<div id="service-modal-base-container">
    <div id="service-modal">
        <div class="modal-content">
            <div class="change-modal-container">
                <div id="service-changeService-btn">서비스</div>
                <div id="service-changePlace-btn">지역</div>
            </div>
            <div class="close-service-modal">
                <i id="close-serviceModal" class="bi bi-x"></i>
            </div>
            <div>
                <div class="service-modal-item" id="reset-service-modal">전체보기</div>
            </div>
            <c:forEach var="cList" items="${CategoryList}">
                <div class="service-modal-item"
                     data-value="${cList.categoryNum}|${cList.categoryName}">${cList.categoryName}</div>
            </c:forEach>
        </div>
    </div>
</div>

<%-- 지역 모달 창 (place-modal) --%>
<div id="place-modal-base-container">
    <div id="place-modal">
        <div class="modal-content">
            <div class="change-modal-container">
                <div id="place-changeService-btn">서비스</div>
                <div id="place-changePlace-btn">지역</div>
            </div>
            <div class="close-service-modal">
                <i id="close-placeModal" class="bi bi-x"></i>
            </div>
                    <span class="place-modal-item" id="reset-place-modal">전체보기</span>
            <c:forEach var="tList" items="${TerritoryList}">
                <div class="place-modal-addDiv">
                    <span class="place-modal-item"
                          data-value="${tList.no}|${tList.id}|${tList.state}|${tList.district}">${tList.state}
                        <span class="toggle-btn-container">
                        <button class="modal-toggle-btn"><i class="bi bi-caret-down"></i></button>
                        </span>
                    </span>
                    <span class="place-modal-data"></span>
                </div>
            </c:forEach>

        </div>
    </div>
</div>
