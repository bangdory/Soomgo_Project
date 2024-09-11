package org.soomgo.soomgo_project.domain.expert;

import lombok.Data;

@Data
public class ExpertDTO {

    int expertNum;
    int userNum;
    int categoryNum;
    int experienceYears;
    int education;
    float rating;
    int region;
    String introduce;
    String contact_start;
    String contact_end;
    String employees;

}
