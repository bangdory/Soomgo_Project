package org.soomgo.soomgo_project.service.userpage;

import org.soomgo.soomgo_project.domain.expert.ExpertDTO;
import org.soomgo.soomgo_project.domain.expert.ExpertPortfolioDTO;
import org.soomgo.soomgo_project.domain.expert.ExpertPortfolioImageDTO;
import org.soomgo.soomgo_project.domain.territory.TerritoryDTO;

import java.util.List;
public interface ProfileService {
    ExpertDTO getExpertProfile(int user_num);
    void updateExpertIntro(ExpertDTO expertDTO);
    void updateExpertYears(ExpertDTO expertDTO);
    ExpertPortfolioDTO getExpertPortfolio(int expert_num);

    void addPortfolioImages(int portfolio_num, List<String> images);
    void createExpertPortfolio(ExpertPortfolioDTO expertPortfolioDTO);
    List<ExpertPortfolioDTO> getExpertPortfolios(int expert_num);
    ExpertPortfolioDTO findPortfolioDetails(int portfolio_num);
    void updateRegion(ExpertDTO expertDTO);

    TerritoryDTO getTerritoryabc(int no);
    List<ExpertPortfolioImageDTO> findPortfolioImgs(int portfolio_num);
}
