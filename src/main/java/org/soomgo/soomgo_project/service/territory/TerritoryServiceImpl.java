package org.soomgo.soomgo_project.service.territory;

import lombok.RequiredArgsConstructor;
import org.soomgo.soomgo_project.dao.territory.TerritoryDAO;
import org.soomgo.soomgo_project.domain.territory.TerritoryDTO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class TerritoryServiceImpl implements TerritoryService {

    private final TerritoryDAO territoryDAO;


    @Override
    public List<TerritoryDTO> getTerritory() {
        return territoryDAO.getTerritory();
    }

    @Override
    public List<TerritoryDTO> getTerritoryId(int id) {
        return territoryDAO.getTerritoryId(id);
    }
}
