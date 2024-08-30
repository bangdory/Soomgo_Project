document.addEventListener('DOMContentLoaded', function () {
    // .category-link 요소에 클릭 이벤트 리스너 추가
    document.querySelectorAll('#category-list-1 a').forEach(function (link) {
        link.addEventListener('click', function (event) {
            event.preventDefault(); // 기본 링크 동작 방지

            // 클릭된 링크의 data-id 값 가져오기
            var id = this.getAttribute('data-id');

            // AJAX 요청
            fetch('/category/list/ajax?id=' + id)
                .then(response => response.json())
                .then(data => {
                    // list2를 업데이트
                    var list2 = document.getElementById('category-list-2');
                    list2.innerHTML = ''; // 기존 내용을 지우기

                    // 새로운 데이터를 추가
                    data.forEach(item => {
                        // <li> 요소 생성
                        var listItem = document.createElement('li');
                        // <a> 요소 생성
                        var link = document.createElement('a');
                        // <a> 요소의 href 값 기본값 지정
                        link.href = '#'; // 링크 기본 URL 설정
                        link.textContent = item.categoryName; // 링크 텍스트 설정

                        // <li> 요소에 <a> 요소 추가
                        listItem.appendChild(link);

                        // <ul> 요소에 <li> 요소 추가
                        list2.appendChild(listItem);
                    });
                })
                .catch(error => console.error('Error:', error));
        });
    });
});