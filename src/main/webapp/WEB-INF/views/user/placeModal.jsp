<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--<!-- Modal -->--%>
<%--<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">--%>
<%--    <div class="modal-dialog">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <h1 class="modal-title fs-5" id="exampleModalLabel">선호 지역 선택</h1>--%>
<%--                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
<%--            </div>--%>
<%--            <div class="modal-body">--%>
<%--                <c:forEach var="tList" items="${territory}">--%>
<%--                    <div class="place-modal-addDiv">--%>

<%--                        <div class="div-container">--%>
<%--                    <span class="place-modal-item"--%>
<%--                          data-value="${tList.no}|${tList.id}|${tList.state}|${tList.district}">${tList.state}--%>
<%--                    </span>--%>
<%--                            <span class="toggle-btn-container">--%>
<%--                        <button class="modal-toggle-btn"><i class="bi bi-chevron-bar-down"></i></button>--%>
<%--                        </span>--%>
<%--                        </div>--%>


<%--                        <div class="addData-container">--%>
<%--                            <span class="place-modal-data"></span>--%>
<%--                        </div>--%>

<%--                    </div>--%>
<%--                </c:forEach>--%>
<%--            </div>--%>
<%--            <div class="modal-footer">--%>
<%--                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<%-- 지역 모달 창 (place-modal) --%>
<div id="place-modal-base-container">
    <div id="place-modal">
        <div class="modal-content">
            <div class="close-service-modal">
                <i id="close-placeModal" class="bi bi-x"></i>
            </div>
            <c:forEach var="tList" items="${territory}">
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
