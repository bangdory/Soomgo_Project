package org.soomgo.soomgo_project.service.userpage;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.soomgo.soomgo_project.dao.user.ProfileDAO;
import org.soomgo.soomgo_project.domain.expert.ExpertDTO;
import org.soomgo.soomgo_project.domain.expert.ExpertPortfolioDTO;
import org.soomgo.soomgo_project.domain.expert.ExpertPortfolioImageDTO;
import org.soomgo.soomgo_project.domain.territory.TerritoryDTO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor

@Log4j2
public class ProfileServiceImpl implements ProfileService {
    private final ProfileDAO profileDAO;

    @Override
    public ExpertDTO getExpertProfile(int user_num) {

        return profileDAO.findExpertProfile(user_num);
    }

    @Override
    public void updateExpertIntro(ExpertDTO expertDTO) {
        profileDAO.updateExpertIntro(expertDTO);
    }

    @Override
    public void updateExpertYears(ExpertDTO expertDTO) {
        profileDAO.updateExpertYears(expertDTO);
    }

    @Override
    public ExpertPortfolioDTO getExpertPortfolio(int expert_num) {
        return profileDAO.findExpertPortfolio(expert_num);
    }

    @Override
    public void addPortfolioImages(int portfolio_num, List<String> images) {
        profileDAO.insertPortfolioImages(portfolio_num, images);
    }

    @Override
    public void createExpertPortfolio(ExpertPortfolioDTO expertPortfolioDTO) {
        profileDAO.createExpertPortfolio(expertPortfolioDTO);
    }
    @Override
    public List<ExpertPortfolioDTO> getExpertPortfolios(int expert_num) {
        List<ExpertPortfolioDTO> expertPortfolios = profileDAO.getExpertPortfolios(expert_num);
        log.info("전달된 파라미터 -> "+ expert_num);
        log.info("DAO 전달 리스트!!!" + expertPortfolios);
        // return profileDAO.getExpertPortfolios(expert_num);
        return expertPortfolios;
    }
    @Override
    public ExpertPortfolioDTO findPortfolioDetails(int portfolio_num) {
        return profileDAO.findPortfolioDetails(portfolio_num);
    }
    @Override
    public void updateRegion(ExpertDTO expertDTO) {
        profileDAO.updateRegion(expertDTO);
    }
    @Override
    public TerritoryDTO getTerritoryabc(int no) {
        return profileDAO.getTerritoryabc(no);
    }
    @Override
    public List<ExpertPortfolioImageDTO> findPortfolioImgs(int portfolio_num) {
        return profileDAO.findPortfolioImgs(portfolio_num);
    }
}
