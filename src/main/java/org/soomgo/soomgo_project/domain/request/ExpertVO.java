package org.soomgo.soomgo_project.domain.request;

import lombok.Data;

@Data
public class ExpertVO {

    int expertNum;
    int userNum;
    String expertName;
    int categoryNum;
    String categoryName;
    int experienceYears;
    int education;
    float rating;
    int region;
    String regionName;
    String img;
}
