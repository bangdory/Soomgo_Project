document.addEventListener('DOMContentLoaded', function () {
    // .category-link 요소에 클릭 이벤트 리스너 추가
    document.querySelectorAll('#category-list-1 a').forEach(function (link) {
        link.addEventListener('click', function (event) {
            event.preventDefault(); // 기본 링크 동작 방지


            // 클릭된 링크의 data-id 값 가져오기
            var id = this.getAttribute('data-id');

            document.querySelectorAll('#category-list-1 a.category-link').forEach(function (item) {
                item.style.backgroundColor = "white"; // 배경색을 흰색으로 설정

                document.getElementById('listAll').style.backgroundColor = "white";

            });

            this.style.backgroundColor = "#ccc";

            if (id === '0') {

                fetch('/category/list/ajax2?id=' + id)
                    .then(response => response.json())
                    .then(data => {

                        console.log(data);

                        console.log(data.category);
                        console.log(data.subCategory);

                        createCategorySection(data.category, data.subCategory);

                    }).catch(error => console.log(error));

            } else if (id !== '0') {
                console.log("id: " + id);

                fetch('/category/list/ajax?id=' + id)
                    .then(response => response.json())
                    .then(data => {

                        var containerDiv = document.querySelector('.clear-right');

                        containerDiv.innerHTML = '';

                        var subContainerDiv = document.createElement('div');
                        subContainerDiv.classList.add('category-list-2-sub-container');

                        // listUl을 업데이트

                        var listUl = document.createElement('ul');
                        listUl.setAttribute('id', 'category-list-2-sub')
                        listUl.classList.add('category-list2', 'otherwise-control')

                        // 새로운 데이터를 추가
                        data.forEach(item => {
                            // <li> 요소 생성
                            var listItem = document.createElement('li');
                            // <a> 요소 생성
                            var link = document.createElement('a');
                            link.classList.add('category-link', 'api-alink')


                            // <a> 요소의 href 값 기본값 지정
                            link.href = '#'; // 링크 기본 URL 설정
                            link.textContent = item.categoryName; // 링크 텍스트 설정

                            // <li> 요소에 <a> 요소 추가
                            listItem.appendChild(link);

                            // <ul> 요소에 <li> 요소 추가
                            listUl.appendChild(listItem);
                        });

                        subContainerDiv.appendChild(listUl);
                        containerDiv.appendChild(subContainerDiv);
                    })
                    .catch(error => console.error('Error:', error));

            }

            // AJAX 요청
        });
    });
});

function createCategorySection(categories, subcategories) {
    // 'category-right-section-container'를 찾습니다.
    const clearDiv = document.querySelector('.clear-right');

    // 기존 내용을 삭제
    clearDiv.innerHTML = '';

    const containerDiv = document.createElement('div');
    containerDiv.setAttribute('id', 'category-right-section-container');
    containerDiv.classList.add('category-right-section-container');


    categories.forEach(category => {
        // 새로운 서브 컨테이너를 생성합니다.
        const subContainerDiv = document.createElement('div');
        subContainerDiv.classList.add('category-right-section-sub-container');

        // 카테고리 이름을 표시할 div를 생성합니다.
        const nameDiv = document.createElement('div');
        nameDiv.classList.add('category-name-word');
        nameDiv.textContent = category.categoryName;
        subContainerDiv.appendChild(nameDiv);

        // ul 요소를 생성합니다.
        const listUl = document.createElement('ul');
        listUl.id = 'category-list-2-main';
        listUl.classList.add('category-list-2', 'category-listAll-ul', 'category-for-ul');

        // 서브 카테고리를 추가합니다.
        subcategories.forEach(subcategory => {
            if (category.id === subcategory.id) {
                const listItem = document.createElement('li');
                const link = document.createElement('a');
                link.href = '#';
                link.classList.add('category-link');
                link.textContent = subcategory.categoryName;
                listItem.appendChild(link);
                listUl.appendChild(listItem);
            }
        });

        // ul 요소를 서브 컨테이너에 추가합니다.
        subContainerDiv.appendChild(listUl);

        // 서브 컨테이너를 메인 컨테이너에 추가합니다.
        containerDiv.appendChild(subContainerDiv);
        clearDiv.appendChild(containerDiv)
    });
}