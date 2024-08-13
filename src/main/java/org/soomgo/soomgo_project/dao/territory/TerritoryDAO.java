package org.soomgo.soomgo_project.dao.territory;

import lombok.RequiredArgsConstructor;
import org.soomgo.soomgo_project.domain.territory.TerritoryDTO;
import org.soomgo.soomgo_project.mappers.territory.TerritoryMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class TerritoryDAO {

    private final TerritoryMapper territoryMapper;

    public List<TerritoryDTO> getTerritory () {
        return territoryMapper.getTerritory();
    }

    public List<TerritoryDTO> getTerritoryId (int id) {
        return territoryMapper.getTerritoryId(id);
    }

}
