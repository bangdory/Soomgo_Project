package org.soomgo.soomgo_project.domain.expert;

import lombok.Data;
import java.util.ArrayList;
import java.util.List;

@Data
public class ExpertPortfolioDTO {
    private int portfolio_num;
    private int expert_num;
    private int category_num;
    private String title;
    private String thumbnail;
    private int total_price;
    private int work_year;
    private int duration;
    private String duration_value;
    private String description;

    // 여러 이미지를 저장하기 위한 필드
    private List<String> imagePaths = new ArrayList<>();

    // 이미지 추가 메서드
    public void addImage(String imagePath) {
        this.imagePaths.add(imagePath);
    }

    // 이미지를 리스트로 반환하는 메서드
    public List<String> getImagePaths() {
        return this.imagePaths;
    }
}
