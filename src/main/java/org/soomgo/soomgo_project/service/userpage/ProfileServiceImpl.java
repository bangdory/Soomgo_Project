package org.soomgo.soomgo_project.service.userpage;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.soomgo.soomgo_project.dao.userpage.ProfileDAO;
import org.soomgo.soomgo_project.domain.expert.ExpertDTO;
import org.soomgo.soomgo_project.domain.expert.ExpertPortfolioDTO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor

@Log4j2
public class ProfileServiceImpl implements ProfileService {
    private final ProfileDAO profileDAO;

    @Override
    public ExpertDTO getExpertProfile(int user_num) {
        log.info("Profile Imple 받은 user num"+user_num);
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

    public List<ExpertPortfolioDTO> getExpertPortfolios(int expert_num) {

        return profileDAO.getExpertPortfolios(expert_num);

    }
}
