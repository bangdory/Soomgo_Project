package org.soomgo.soomgo_project.domain.request;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class DataList {
    private List<RequestDTO> Requestlist = new ArrayList<>();

    private List<TerritoryDTO> listTerritory = new ArrayList<>();
}
