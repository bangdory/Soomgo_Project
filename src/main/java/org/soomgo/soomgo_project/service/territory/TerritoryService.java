package org.soomgo.soomgo_project.service.territory;

import org.soomgo.soomgo_project.domain.territory.TerritoryDTO;

import java.util.List;

public interface TerritoryService {

    List<TerritoryDTO> getTerritory();

    List<TerritoryDTO> getTerritoryId(int id);

}
