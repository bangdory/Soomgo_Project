package org.soomgo.soomgo_project.domain.expert;

import lombok.Data;

@Data
public class ExpertDTO {

    int expert_num;
    int user_num;
    int category_num;
    int experience_years;
    int education;
    String img;
    float rating;
    String profile_intro;
}
