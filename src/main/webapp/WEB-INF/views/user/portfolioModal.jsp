<!-- /WEB-INF/views/user/portfolioModal.jsp -->
<div id="portfolioModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span> <!-- 닫기 버튼 -->
        <img src="${portfolio.thumbnail}" alt="Thumbnail" style="max-width: 100%; height: auto;">
        <p>제목: ${portfolio.title}</p>
        <p>설명: ${portfolio.description}</p>
        <p>가격: ${portfolio.total_price}</p>
        <p>작업 기간: ${portfolio.duration}</p>
        <!-- 다른 필요한 내용들 -->
    </div>
</div>
