document.addEventListener('DOMContentLoaded', function () {

    // 별점 색칠 페이지 로딩 시 실행

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
    document.getElementById('service-modal-open').addEventListener('click', function () {
        document.getElementById('service-modal-base-container').style.display = 'block';
        document.getElementById('service-modal').style.display = 'block';
        document.getElementById('service-changeService-btn').style.color = '#1AA69D';
    });

    // 지역 모달 열기 버튼 클릭 시 모달 보이기
    document.getElementById('place-modal-open').addEventListener('click', function () {
        document.getElementById('place-modal-base-container').style.display = 'block';
        document.getElementById('place-modal').style.display = 'block';
        document.getElementById('place-changePlace-btn').style.color = '#1AA69D';
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

    // 지역 모달 전체보기 클릭 시 모달 창 리셋
    document.getElementById('reset-place-modal').addEventListener('click', function () {
        const url = '/community/listAll'
        fetchData(url, fetchProcessing);
        document.getElementById('place-modal-base-container').style.display = 'none';
        document.getElementById('place-modal').style.display = 'none';
        document.getElementById('community-place-modal').style.background = '#F2F2F2';
        document.getElementById('community-place-modal').style.color = 'black';
        const placeModalOpen = document.getElementById('place-modal-open');
        placeModalOpen.innerText = '';
        const div = document.createElement('div');
        div.innerHTML = '지역 <i class="bi bi-chevron-down"></i>';
        placeModalOpen.appendChild(div);
    });

    // 서비스 모달 전체보기 클릭 시 모달 창 리셋
    document.getElementById('reset-service-modal').addEventListener('click', function () {
        const url = '/community/listAll'
        fetchData(url, fetchProcessing);
        document.getElementById('service-modal-base-container').style.display = 'none';
        document.getElementById('service-modal').style.display = 'none';
        document.getElementById('community-service-modal').style.background = '#F2F2F2';
        document.getElementById('community-service-modal').style.color = 'black';
        const serviceModalOpen = document.getElementById('service-modal-open');
        serviceModalOpen.innerText = '';
        const div = document.createElement('div');
        div.innerHTML = '서비스 <i class="bi bi-chevron-down"></i>';
        serviceModalOpen.appendChild(div);
    });

    // 서비스 모달 내의 항목 클릭 시
    document.querySelectorAll('.service-modal-item').forEach(function (item) {
        item.addEventListener('click', function () {
            const values = item.getAttribute('data-value');
            const [categoryNum, categoryName] = values.split('|');
            const serviceModalOpen = document.getElementById('service-modal-open');
            serviceModalOpen.innerText = '';
            const newItem = document.createElement('div');

            serviceModalOpen.setAttribute('data-value', categoryNum);

            const place = document.getElementById('place-modal-open');

            const placeValue = place.getAttribute('data-value');

            console.log(placeValue)

            if (placeValue !== null) {
                const url = '/community/listAll?categoryNum=' + encodeURIComponent(categoryNum) + '&no=' + encodeURIComponent(placeValue);
                console.log(url);
                fetchData(url, fetchProcessing);
            } else {
                const url = '/community/listAll?categoryNum=' + encodeURIComponent(categoryNum);
                console.log(url);
                fetchData(url, fetchProcessing);
            }

            newItem.innerHTML = categoryName + '<i class="bi bi-chevron-down"></i>';
            newItem.setAttribute('categoryNum', categoryNum);
            serviceModalOpen.appendChild(newItem);


            document.getElementById('service-modal-base-container').style.display = 'none';
            document.getElementById('service-modal').style.display = 'none';
            document.getElementById('community-service-modal').style.background = 'black';
            document.getElementById('community-service-modal').style.color = 'white';
        });
    });


    // 지역 모달 내의 항목 클릭 시

    document.querySelectorAll('.place-modal-addDiv').forEach(function (div) {
        div.setAttribute('data-expanded', 'false');

        div.addEventListener('click', function (event) {
            const target = event.target;

            if (target.classList.contains('toggle-btn')) {
                const item = target.closest('.place-modal-item');
                const isExpanded = item.getAttribute('data-expanded') === 'true';
                const dataDiv = item.nextElementSibling;


                if (isExpanded) {
                    dataDiv.style.display = 'none';
                    item.setAttribute('data-expanded', 'false');
                    target.innerHTML = '<i class="bi bi-caret-down"></i>';
                } else {
                    const value = item.getAttribute('data-value');
                    const [no, id, state, district] = value.split("|"); // 배열 비구조화 할당
                    console.log('테스트용 value: ' + value);

                    fetch('/community/listAll/place?id=' + id)
                        .then(response => response.json())
                        .then(data => {
                            dataDiv.innerText = '';

                            data.forEach(dataItem => {
                                const setValues = dataItem.no + '|' + dataItem.id + '|' + dataItem.state + '|' + dataItem.district;
                                console.log('setValues: ' + dataItem.no + '|' + dataItem.id + '|' + dataItem.state + '|' + dataItem.district);
                                const newItem = document.createElement('span');
                                newItem.classList.add('place-modal-item');
                                newItem.setAttribute('data-value', setValues);
                                newItem.textContent = dataItem.district;
                                dataDiv.appendChild(newItem);
                            });

                            dataDiv.style.display = 'block';
                            item.setAttribute('data-expanded', 'true');
                            target.innerHTML = '<i class="bi bi-caret-up"></i>';
                        }).catch(error => console.error('Error fetching data: ' + error));
                }

            } else if (target.classList.contains('place-modal-item')) {
                console.log(target.getAttribute('data-value'));
                const value = target.getAttribute('data-value');
                const [no, id, state, district] = value.split("|"); // 배열 비구조화 할당
                console.log('value: ' + value);

                console.log('no: ' + no);
                console.log('id: ' + id);
                console.log('state: ' + state);
                console.log('district: ' + district);

                const service = document.getElementById('service-modal-open');

                const serviceValue = service.getAttribute('data-value');

                console.log('serviceValue: ' + serviceValue);

                if (serviceValue !== null) {
                    const url = '/community/listAll?categoryNum=' + encodeURIComponent(serviceValue) + '&no=' + encodeURIComponent(no);
                    console.log(url);
                    fetchData(url, fetchProcessing);
                } else {
                    const url = '/community/listAll?no=' + encodeURIComponent(no);
                    fetchData(url, fetchProcessing);
                }


                const placeModalOpen = document.getElementById('place-modal-open');
                placeModalOpen.setAttribute('data-value', no);

// 새 div 요소 생성
                const newItem = document.createElement('div');

// 새 내용 설정
                if (district === '') {
                    newItem.innerHTML = state + '<i class="bi bi-chevron-down"></i>';
                } else {
                    newItem.innerHTML = district + '<i class="bi bi-chevron-down"></i>';
                }
                console.log('no: ' + no);
                newItem.setAttribute('data-value', no);

// 생성한 새 div를 기존 요소에 추가
                placeModalOpen.innerHTML = '';
                placeModalOpen.appendChild(newItem);

                document.getElementById('place-modal-base-container').style.display = 'none';
                document.getElementById('place-modal').style.display = 'none';
                document.getElementById('community-place-modal').style.background = 'black';
                document.getElementById('community-place-modal').style.color = 'white';

            }
        });
    });

});

function fetchData(url, fetchProcessing) {
    console.log('fetchData_url: ' + url);
    fetch(url,{
        method: 'GET',
        headers: {
            'Accept': 'application/json'
        }
    })
        .then(response => response.json())
        .then(data => {
            console.log('fetchData_data: ' , JSON.stringify(data, null, 2));
            fetchProcessing(data);  // 데이터를 처리하는 콜백 함수 호출
        })
        .catch(error => {
            console.error('Error fetching data:', error);
        });
}

function fetchProcessing(pageResult) {
    const communityList = document.getElementById('community-list');
    communityList.innerHTML = ''; // 기존 내용 지우기

    // pageResult가 객체인지 확인
    if (pageResult && Array.isArray(pageResult.content)) {
        pageResult.content.forEach(item => {
            // 새로운 div 요소 생성
            const itemGroupDiv = document.createElement('div');
            itemGroupDiv.classList.add('community-board-content');
            itemGroupDiv.setAttribute('data-rating', item.id);

            //제목 div 생성
            const titleDiv = document.createElement('div');
            titleDiv.classList.add('board-title');
            titleDiv.textContent = item.title || '제목없음';

            // 내용 div 생성
            const contentDiv = document.createElement('div');
            contentDiv.classList.add('board-content');
            contentDiv.textContent = item.content || '내용없음';

            // 작성자와 날짜 div 생성
            const metaDiv = document.createElement('div');
            metaDiv.classList.add('baord-meta');
            metaDiv.textContent = `작성자: `+ item.author + `|| '작성자없음', 날짜: `+ item.date + `|| 날짜없음`;

            // 내용 div에 추가
            itemGroupDiv.appendChild(titleDiv);
            itemGroupDiv.appendChild(contentDiv);
            itemGroupDiv.appendChild(metaDiv);

            // 생성한 div를 community-list에 추가
            communityList.appendChild(itemGroupDiv);
        });
    }
}



