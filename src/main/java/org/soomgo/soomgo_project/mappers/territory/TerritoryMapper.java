package org.soomgo.soomgo_project.mappers.territory;

import org.apache.ibatis.annotations.Mapper;
import org.soomgo.soomgo_project.domain.territory.TerritoryDTO;

import java.util.List;

@Mapper
public interface TerritoryMapper {

    List<TerritoryDTO> getTerritory();

    List<TerritoryDTO> getTerritoryId(int id);

    TerritoryDTO getTerritoryByNo(int id);
}
