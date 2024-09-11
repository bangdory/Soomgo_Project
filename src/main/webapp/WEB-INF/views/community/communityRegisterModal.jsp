<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link href="${pageContext.request.contextPath}/resources/static/css/expert/modalStyle.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<!-- 서비스 모달(service-modal) -->
<div id="service-modal-base-container">
    <div id="service-modal">
        <div class="modal-content">
            <div class="change-modal-container">
                <div id="service-changeService-btn">서비스</div>
                <div id="service-changePlace-btn">지역</div>
            </div>
            <div class="close-serviceModal">
                <i id="close-serviceModal" class="bi bi-x"></i>
            </div>
            <c:forEach var="cList" items="${CategoryList}">
                <div class="service-modal-item" data-value="${cList.categoryName}">${cList.categoryName}</div>
            </c:forEach>
        </div>
    </div>
</div>

<!-- 지역 모달 창 (place-modal) -->
<div id="place-modal-base-container">
    <div id="place-modal">
        <div class="modal-content">
            <div class="change-modal-container">
                <div id="place-changeService-btn">서비스</div>
                <div id="place-changePlace-btn">지역</div>
            </div>
            <div class="close-placeModal">
                <i id="close-placeModal" class="bi bi-x"></i>
            </div>
            <c:forEach var="tList" items="${TerritoryList}">
                <div class="place-modal-addDiv">
                    <span class="place-modal-item"
                          data-value="${tList.no}|${tList.id}|${tList.state}|${tList.district}">${tList.state}
                        <span class="toggle-btn-container">
                        <button class="modal-toggle-btn"><i class="bi bi-caret-down"></i></button>
                        </span>
                    </span>
                    <span class="place-modal-data" style="display: none;"></span>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        // 서비스 모달에서 지역 클릭 시 지역 모달창
        document.getElementById('service-changePlace-btn').addEventListener('click', function () {
            const serviceModalBaseContainer = document.getElementById('service-modal-base-container');
            const serviceStyle = serviceModalBaseContainer.style.display;
            const isVisible = serviceStyle === 'block';


            if (isVisible) {
                serviceModalBaseContainer.style.display = 'none';
                document.getElementById('place-modal-base-container').style.display = 'block';
                document.getElementById('place-modal').style.display = 'block';
                document.getElementById('place-changePlace-btn').style.color = '#1AA69D';

            } else {
                document.getElementById('place-modal-base-container').style.display = 'block';
                document.getElementById('place-modal').style.display = 'block';
            }
        });

        // 지역 모달 창에서 서비스 클릭 시 서비스 모달 창 보이기
        document.getElementById('place-changeService-btn').addEventListener('click', function () {

            const placeModalBaseContainer = document.getElementById('place-modal-base-container');
            const placeStyle = placeModalBaseContainer.style.display;
            const isVisible = placeStyle === 'block';

            if (isVisible) {
                placeModalBaseContainer.style.display = 'none';
                document.getElementById('service-modal-base-container').style.display = 'block';
                document.getElementById('service-modal').style.display = 'block';
                document.getElementById('service-changeService-btn').style.color = '#1AA69D';
            } else {
                document.getElementById('service-modal-base-container').style.display = 'block';
                document.getElementById('service-modal').style.display = 'block';
            }
        });


        // 서비스 모달 열기 버튼 클릭 시 모달 보이기
        document.getElementById('service-modal-open')?.addEventListener('click', function () {
            document.getElementById('service-modal-base-container').style.display = 'block';
            document.getElementById('service-modal').style.display = 'block';
            document.getElementById('service-changeService-btn').style.color = '#1AA69D';
        });

        // 지역 모달 열기 버튼 클릭 시 모달 보이기
        document.getElementById('place-modal-open')?.addEventListener('click', function () {
            document.getElementById('place-modal-base-container').style.display = 'block';
            document.getElementById('place-modal').style.display = 'block';
            document.getElementById('place-changePlace-btn').style.color = '#1AA69D';
        });

        // 서비스 모달 닫기 버튼 클릭 시 모달 숨기기
        document.getElementById('close-serviceModal')?.addEventListener('click', function () {
            document.getElementById('service-modal-base-container').style.display = 'none';
            document.getElementById('service-modal').style.display = 'none';
        });

        // 지역 모달 닫기 버튼 클릭 시 모달 숨기기
        document.getElementById('close-placeModal')?.addEventListener('click', function () {
            document.getElementById('place-modal-base-container').style.display = 'none';
            document.getElementById('place-modal').style.display = 'none';
        });

        // 서비스 모달 내의 항목 클릭 시
        document.querySelectorAll('.service-modal-item').forEach(function (item) {
            item.addEventListener('click', function () {
                var categoryName = item.getAttribute('data-value');

                // 서버에 categoryName 전송해서 categoryNum 받기
                fetch('/community/categoryNum?categoryName=' + encodeURIComponent(categoryName),{
                    method: 'GET',
                    headers: {
                        'Accept': 'application/json'
                    }
                })
                    .then(response => {
                        if (!response.ok) {
                            throw new Error('Network response was not ok');
                        }
                        return response.text();
                    })
                    .then(data => {
                        var categoryNum = parseInt(data, 10); // 서버 응답에서 categoryNum 추출
                        console.log('****category Number : ', categoryNum);

                        var existingCategoryNum = document.getElementById('categoryNum');
                        if (existingCategoryNum) {
                            existingCategoryNum.remove();
                        }

                        var newCategoryNumInput1 = document.createElement('input');
                        newCategoryNumInput1.type = 'hidden';
                        newCategoryNumInput1.id = 'categoryNum';
                        newCategoryNumInput1.name = 'categoryNum';
                        document.querySelector('form').appendChild(newCategoryNumInput1);



                        var categoryNumInput = document.getElementById('categoryNum');
                        if (categoryNumInput) {
                            categoryNumInput.value = categoryNum; // categoryNum을 폼 필드에 설정
                        } else {
                            console.error('Element with ID "categoryNum" not found');
                        }

                        // id가 service-modal-open인 요소에 categoryName과 categoryNum 업데이트
                        var modalDataIn = document.getElementById('service-modal-open');
                        if (modalDataIn) {
                            modalDataIn.innerText = categoryName;  // Update modalDataIn with selected value
                            modalDataIn.setAttribute('data-categoryNum', categoryNum);
                        } else {
                            console.error('Element with ID "service-modal-open" not found');
                        }

                        // 모달 숨기기
                        var serviceModalBaseContainer = document.getElementById('service-modal-base-container');
                        var serviceModal = document.getElementById('service-modal');
                        if (serviceModalBaseContainer && serviceModal) {
                            serviceModalBaseContainer.style.display = 'none';
                            serviceModal.style.display = 'none';
                        } else {
                            console.error('Modal elements not found');
                        }
                    })
                    .catch(error => console.error('Error fetching category number: ', error));
            });
        });


        // 지역 모달 내의 항목 클릭 시
        document.querySelectorAll('.place-modal-addDiv').forEach(function (div) {
            div.setAttribute('data-expanded', 'false');

            div.addEventListener('click', function (event) {
                const target = event.target;

                if (target.classList.contains('modal-toggle-btn')) {
                    const item = target.closest('.place-modal-addDiv')//.querySelector('.place-modal-item');
                    const dataDiv = item.nextElementSibling;
                    const isExpanded = div.getAttribute('data-expanded') === 'true';

                    if (isExpanded) {
                        dataDiv.style.display = 'none';
                        div.setAttribute('data-expanded', 'false');
                        target.innerHTML = '<i class="bi bi-caret-down"></i>';
                    } else {
                        const value = item.querySelector('.place-modal-item').getAttribute('data-value');
                        const [no, id, state, district] = value.split("|"); // 배열 비구조화 할당
                        console.log('테스트용 value: ' + value);

                        fetch('/community/register/place?id=' + id, {
                            method: 'GET',
                            headers: {
                                'Accept': 'application/json'
                            }
                        })
                            .then(response => response.json())
                            .then(data => {
                                dataDiv.innerText = '';

                                data.forEach(dataItem => {
                                    const newItem = document.createElement('span');
                                    newItem.classList.add('place-modal-item');
                                    const setValues = dataItem.no + '|' + dataItem.id + '|' + dataItem.state + '|' + dataItem.district;
                                    newItem.setAttribute('data-value', setValues);
                                    newItem.textContent = dataItem.district;
                                    dataDiv.appendChild(newItem);
                                });

                                dataDiv.style.display = 'block'; // Show expanded data
                                div.setAttribute('data-expanded', 'true');

                                target.innerHTML = '<i class="bi bi-caret-up"></i>';
                            }).catch(error => console.error('데이터 가져오다가 에러남: ' + error));
                    }
                } else if (target.classList.contains('place-modal-item')) {
                    console.log(target.getAttribute('data-value'));
                    const value = target.getAttribute('data-value');
                    const [no, id, state, district] = value.split("|"); // 배열 비구조화 할당

                    var existingCbAddr = document.getElementById('cb_addr');
                    if (existingCbAddr) {
                        existingCbAddr.remove();
                    }

                    const newCbAddrInput = document.createElement('input');
                    newCbAddrInput.type = 'hidden';
                    newCbAddrInput.id = 'cb_addr';
                    newCbAddrInput.name = 'cb_addr';
                    newCbAddrInput.value = no; // 선택된 지역의 no 값을 설정합니다.

                    document.querySelector('form').appendChild(newCbAddrInput);


                    const cbAddrInput = document.getElementById('cb_addr');
                    if (cbAddrInput) {
                            cbAddrInput.value = no; // 선택된 지역의 no 값을 설정합니다.
                    } else {
                        console.error('Element with ID "cb_addr" not found');
                    }


                    console.log('value: ' + value);

                    console.log('no: ' + no);
                    console.log('id: ' + id);
                    console.log('state: ' + state);
                    console.log('district: ' + district);


                    const placeModalData = document.getElementById('place-modal-open');
                    placeModalData.innerHTML = ''; // Clear previous data
                    const newItem = document.createElement('div');
                    newItem.textContent = (!district === '') ? state : state+' '+district;
                    placeModalData.appendChild(newItem);

                    document.getElementById('place-modal-base-container').style.display = 'none';
                    document.getElementById('place-modal').style.display = 'none';
                }
            });
        });
    });
</script>
