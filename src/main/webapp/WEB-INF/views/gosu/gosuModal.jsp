<%--
  Created by IntelliJ IDEA.
  User: bemsu
  Date: 2024-08-08
  Time: 오후 2:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link href="${pageContext.request.contextPath}/resources/static/css/gosu/modalStyle.css" rel="stylesheet">
<%-- gosu.jsp Modal Page --%>

<%-- 서비스 모달(service-modal) --%>
<div id="service-modal-base-container">
    <div id="service-modal">
        <br>
        <div class="modal-content">
            <button type="button" id="close-serviceModal">Close</button>
            <c:forEach var="cList" items="${CategoryList}">
                <div class="service-modal-item" data-value="${cList.categoryName}">${cList.categoryName}</div>
            </c:forEach>
        </div>
    </div>
</div>

<%-- 지역 모달 창 (place-modal) --%>
<div id="place-modal-base-container">
    <div id="place-modal">
        <br>
        <div class="modal-content">
            <button type="button" id="close-placeModal">Close</button>
            <c:forEach var="tList" items="${TerritoryList}">
                <div class="place-modal-addDiv">
                    <span class="place-modal-item" data-value="${tList.state}|${tList.id}|${tList.district}">${tList.state}<button class="toggle-btn">▽</button></span>
                    <span class="place-modal-data"></span>
                </div>
            </c:forEach>

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

        document.querySelectorAll('.place-modal-addDiv').forEach(function(div) {
            div.setAttribute('data-expanded', 'false');

            div.addEventListener('click', function(event) {
                const target = event.target;

                if (target.classList.contains('toggle-btn')) {
                    const item = target.closest('.place-modal-item');
                    const isExpanded = item.getAttribute('data-expanded') === 'true';
                    const dataDiv = item.nextElementSibling;

                    if (isExpanded) {
                        dataDiv.style.display = 'none';
                        item.setAttribute('data-expanded', 'false');
                        target.textContent = '▽';
                    } else {
                        const value = item.getAttribute('data-value');
                        const [state, id] = value.split("|"); // 배열 비구조화 할당
                        const setValues = state + '|' + id;

                        fetch('/gosu/gosuFind/place?id=' + id)
                            .then(response => response.json())
                            .then(data => {
                                dataDiv.innerText = '';

                                data.forEach(dataItem => {
                                    const newItem = document.createElement('span');
                                    newItem.classList.add('place-modal-item');
                                    const setValue = setValues + '|' + dataItem.district;
                                    newItem.setAttribute('data-value', setValue);
                                    newItem.textContent = dataItem.district;
                                    dataDiv.appendChild(newItem);
                                });

                                dataDiv.style.display = 'block';
                                item.setAttribute('data-expanded', 'true');
                                target.textContent = '△';
                            }).catch(error => console.error('Error fetching data: ' + error));
                    }
                } else if (target.classList.contains('place-modal-item')) {
                    const value = target.getAttribute('data-value');
                    const [state, id, district] = value.split("|"); // 배열 비구조화 할당

                    console.log(district);

                    if (district === '') {

                        const placeModalData = document.getElementById('placeModalData');
                        const newItem = document.createElement('div');
                        newItem.textContent = state;
                        placeModalData.appendChild(newItem);
                    } else {

                        const placeModalData = document.getElementById('placeModalData');
                        const newItem = document.createElement('div');
                        newItem.textContent = district;
                        placeModalData.appendChild(newItem);
                    }




                    document.getElementById('place-modal-base-container').style.display = 'none';
                    document.getElementById('place-modal').style.display = 'none';
                }
            });
        });
    });
</script>
