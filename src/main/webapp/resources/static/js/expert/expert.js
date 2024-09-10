document.addEventListener('DOMContentLoaded', function () {

    // 별점 색칠 페이지 로딩 시 실행
    updateRatings();

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
        const url = '/expert/expertList/search'
        fetchData(url, fetchProcessing);
        document.getElementById('place-modal-base-container').style.display = 'none';
        document.getElementById('place-modal').style.display = 'none';
        document.getElementById('gosu-place-modal').style.background = '#F2F2F2';
        document.getElementById('gosu-place-modal').style.color = 'black';
        const placeModalOpen = document.getElementById('place-modal-open');
        placeModalOpen.innerText = '';
        const div = document.createElement('div');
        div.innerHTML = '지역 <i class="bi bi-chevron-down"></i>';
        placeModalOpen.appendChild(div);
    });

    // 서비스 모달 전체보기 클릭 시 모달 창 리셋
    document.getElementById('reset-service-modal').addEventListener('click', function () {
        const url = '/expert/expertList/search'
        fetchData(url, fetchProcessing);
        document.getElementById('service-modal-base-container').style.display = 'none';
        document.getElementById('service-modal').style.display = 'none';
        document.getElementById('gosu-service-modal').style.background = '#F2F2F2';
        document.getElementById('gosu-service-modal').style.color = 'black';
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
                const url = '/expert/expertList/search?categoryNum=' + encodeURIComponent(categoryNum) + '&no=' + encodeURIComponent(placeValue);
                console.log(url);
                fetchData(url, fetchProcessing);
            } else {
                const url = '/expert/expertList/search?categoryNum=' + encodeURIComponent(categoryNum);
                console.log(url);
                fetchData(url, fetchProcessing);
            }

            newItem.innerHTML = categoryName + '<i class="bi bi-chevron-down"></i>';
            newItem.setAttribute('categoryNum', categoryNum);
            serviceModalOpen.appendChild(newItem);


            document.getElementById('service-modal-base-container').style.display = 'none';
            document.getElementById('service-modal').style.display = 'none';
            document.getElementById('gosu-service-modal').style.background = 'black';
            document.getElementById('gosu-service-modal').style.color = 'white';
        });
    });


    // 지역 모달 내의 항목 클릭 시

    document.querySelectorAll('.place-modal-addDiv').forEach(function (div) {
        div.setAttribute('data-expanded', 'false');

        div.addEventListener('click', function (event) {
            const target = event.target;

            if (target.classList.contains('modal-toggle-btn')) {
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

                    fetch('/expert/expertFind/place?id=' + id)
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
                    const url = '/expert/expertList/search?categoryNum=' + encodeURIComponent(serviceValue) + '&no=' + encodeURIComponent(no);
                    console.log(url);
                    fetchData(url, fetchProcessing);
                } else {
                    const url = '/expert/expertList/search?no=' + encodeURIComponent(no);
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
                document.getElementById('gosu-place-modal').style.background = 'black';
                document.getElementById('gosu-place-modal').style.color = 'white';

            }
        });
    });
    const pagingList = document.getElementById('paging-list');

    pagingList.addEventListener('click', event => {
        const target = event.target.closest('a');

        if (target) {
            const page = target.getAttribute('data-page');
            const categoryNum = document.getElementById('service-modal-open').getAttribute('data-value');
            const no = document.getElementById('place-modal-open').getAttribute('data-value');
            console.log('page: ' + page);
            console.log('categoryNum: ' + categoryNum);
            console.log('no: ' + no);
            const size = 10; // 페이지 당 항목 수

            // 기본 URL
            let url = '/expert/expertList/search?page=' + encodeURIComponent(page) + '&size=' + encodeURIComponent(size);

            // categoryNum이 null이 아닐 경우 URL에 추가
            if (categoryNum !== null) {
                url += '&categoryNum=' + encodeURIComponent(categoryNum);
            }

            // no가 null이 아닐 경우 URL에 추가
            if (no !== null) {
                url += '&no=' + encodeURIComponent(no);
            }
            console.log('url: ' + url);

            fetchData(url, fetchProcessing);
        }
    });

});

function fetchData(url, fetchProcessing) {
    console.log('fetchData_url: ' + url);
    fetch(url)
        .then(response => response.json())
        .then(data => {
            console.log('fetchData_data: ' + data);
            fetchProcessing(data);  // 데이터를 처리하는 콜백 함수 호출
        })
        .catch(error => {
            console.error('Error fetching data:', error);
        });
}

function fetchProcessing(pageResult) {
    const gosuList = document.getElementById('gosu-list');
    gosuList.innerHTML = ''; // 기존 내용 지우기

    // pageResult가 객체인지 확인
    if (pageResult && Array.isArray(pageResult.content)) {
        pageResult.content.forEach(item => {
            // 새로운 div 요소 생성
            const itemGroupDiv = document.createElement('div');
            itemGroupDiv.classList.add('gosu-list-item-group');
            itemGroupDiv.setAttribute('data-rating', item.rating);

            // 이미지 div 생성
            const imgDiv = document.createElement('div');
            imgDiv.classList.add('gosu-list-item', 'gosu-img');
            const img = document.createElement('img');
            img.src = '/resources/static/img/1.jpg'; // 이미지 URL
            imgDiv.appendChild(img);

            // 내용 div 생성
            const contentDiv = document.createElement('div');
            contentDiv.classList.add('gosu-item-contents');

            // 고수 이름
            const nameDiv = document.createElement('div');
            nameDiv.classList.add('gosu-list-item', 'gosu-name');
            nameDiv.textContent = item.expertName || '고수 이름 예정';

            // 고수 경험 연수
            const experienceDiv = document.createElement('div');
            experienceDiv.classList.add('gosu-list-item', 'gosu-experience');
            experienceDiv.textContent = `고수의 experienceYears : ${item.experienceYears || '정보 없음'}`;

            // 고수 별점
            const ratingDiv = document.createElement('div');
            ratingDiv.classList.add('gosu-list-item', 'gosu-rating');
            const ratingInnerDiv = document.createElement('div');
            ratingInnerDiv.classList.add('rating');

            for (let i = 0; i < 5; i++) {
                const star = document.createElement('i');
                star.classList.add('fa', 'fa-star', 'star');
                if (i < item.rating) {
                    star.classList.add('rated'); // 적절한 클래스 추가 (선택 사항)
                }
                ratingInnerDiv.appendChild(star);
            }
            const ratingSpan = document.createElement('span');
            ratingSpan.classList.add('gosu-rating');

            const rating = `${item.rating}`;
            console.log('rating: ' + rating);

            ratingSpan.textContent = `(${item.rating || '정보 없음'})`;
            ratingInnerDiv.appendChild(ratingSpan);
            ratingDiv.appendChild(ratingInnerDiv);

            // 고수 소개 내용
            const contentDescriptionDiv = document.createElement('div');
            contentDescriptionDiv.classList.add('gosu-list-item', 'gosu-content');
            contentDescriptionDiv.textContent = item.description || '고수 소개 내용 예정';

            // 내용 div에 추가
            contentDiv.appendChild(nameDiv);
            contentDiv.appendChild(experienceDiv);
            contentDiv.appendChild(ratingDiv);
            contentDiv.appendChild(contentDescriptionDiv);

            // itemGroupDiv에 추가
            itemGroupDiv.appendChild(imgDiv);
            itemGroupDiv.appendChild(contentDiv);

            // 생성한 div를 gosu-list에 추가
            gosuList.appendChild(itemGroupDiv);
        });

        // 별점 업데이트
        updateRatings()

        gosuList.classList.add('gosu-list-sub-container');

        updatePagingLinks(pageResult);

    } else {
        console.error('pageResult.content가 배열이 아닙니다.', pageResult);
    }
}

function updateRatings() {
    const ratingGroups = document.querySelectorAll('.gosu-list-item-group');

    ratingGroups.forEach(group => {
        // 데이터에서 rating을 소수점 1자리로 파싱합니다.
        let rating = parseFloat(group.getAttribute('data-rating'));

        // 소수점 0.5 이상이면 올림, 0.5 미만이면 내림
        if (rating % 1 >= 0.5) {
            rating = Math.ceil(rating); // 소수점이 .5 이상이면 올림
        } else {
            rating = Math.floor(rating); // 소수점이 .5 미만이면 내림
        }

        const stars = group.querySelectorAll('.star');

        stars.forEach((star, index) => {
            if (index < rating) {
                star.classList.add('filled');
            } else {
                star.classList.remove('filled');
            }
        });
    });
}

function updatePagingLinks(pageResult) {
    const pagingList = document.getElementById('paging-list');
    const currentPage = pageResult.currentPage;
    const totalPages = pageResult.totalPages;
    const pageGroupSize = 5; // 페이지 그룹의 크기

    pagingList.innerHTML = ''; // 기존 페이지 링크 지우기

    // 이전 페이지 버튼
    if (currentPage > 1) {
        const prevLi = document.createElement('li');
        const prevA = document.createElement('a');
        prevA.href = '#';
        prevA.setAttribute('data-page', currentPage - 1);
        prevA.textContent = '이전';
        prevLi.appendChild(prevA);
        pagingList.appendChild(prevLi);
    }

    // 페이지 그룹 계산
    const currentGroup = Math.ceil(currentPage / pageGroupSize);
    const startPage = (currentGroup - 1) * pageGroupSize + 1;
    const endPage = Math.min(totalPages, currentGroup * pageGroupSize);

    // 페이지 번호 버튼
    for (let page = startPage; page <= endPage; page++) {
        const li = document.createElement('li');
        if (page === currentPage) {
            const strong = document.createElement('strong');
            strong.textContent = page;
            li.appendChild(strong);
        } else {
            const a = document.createElement('a');
            a.href = '#';
            a.setAttribute('data-page', page);
            a.textContent = page;
            li.appendChild(a);
        }
        pagingList.appendChild(li);
    }

    // 다음 페이지 버튼
    if (currentPage < totalPages) {
        const nextLi = document.createElement('li');
        const nextA = document.createElement('a');
        nextA.href = '#';
        nextA.setAttribute('data-page', currentPage + 1);
        nextA.textContent = '다음';
        nextLi.appendChild(nextA);
        pagingList.appendChild(nextLi);
    }
}