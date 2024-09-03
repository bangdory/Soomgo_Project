package org.soomgo.soomgo_project.domain.request;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class ExpertVO {

    int expertNum;
    int userNum;
    String expertName;
    int categoryNum;
    String categoryName;
    int experienceYears;
    int education;
    float rating;
    int regionNum;
    String regionName;
    String img;
}
