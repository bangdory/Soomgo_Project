package org.soomgo.soomgo_project.dao.userpage;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.soomgo.soomgo_project.mappers.userpage.ProfileMapper;
import org.soomgo.soomgo_project.domain.expert.ExpertDTO;
import org.soomgo.soomgo_project.domain.expert.ExpertPortfolioDTO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor

@Log4j2
public class ProfileDAO {
    private final ProfileMapper profileMapper;

    public ExpertDTO findExpertProfile(int userNum) {
        return profileMapper.findExpertProfile(userNum);
    }

    public void updateExpertIntro(ExpertDTO expertDTO) {
        profileMapper.updateExpertIntro(expertDTO);
    }

    public void updateExpertYears(ExpertDTO expertDTO) {
        profileMapper.updateExpertYears(expertDTO);
    }

    public ExpertPortfolioDTO findExpertPortfolio(int expert_num) {
        return profileMapper.findExpertPortfolio(expert_num);
    }

    public void insertPortfolioImages(int portfolio_num, List<String> images) {
        profileMapper.insertPortfolioImages(portfolio_num, images);
    }

    public void createExpertPortfolio(ExpertPortfolioDTO expertPortfolioDTO) {
        profileMapper.createExpertPortfolio(expertPortfolioDTO);
    }
    public List<ExpertPortfolioDTO> getExpertPortfolios(int expert_num) {
        return profileMapper.getExpertPortfolios(expert_num);
    }
}
