package org.soomgo.soomgo_project.domain.expert;


import lombok.Data;

import java.util.List;

@Data
public class PageResult<T> {
    private List<T> content;
    private int totalElements;
    private int totalPages;
    private int currentPage;
    private int size;

    // 생성자
    public PageResult(List<T> content, int totalElements, int currentPage, int size) {
        this.content = content;
        this.totalElements = totalElements;
        this.currentPage = currentPage;
        this.size = size;
        this.totalPages = (int) Math.ceil((double) totalElements / size);
    }
}