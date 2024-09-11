package org.soomgo.soomgo_project.mappers.user;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.soomgo.soomgo_project.domain.expert.ExpertDTO;
import org.soomgo.soomgo_project.domain.expert.ExpertPortfolioDTO;

import java.util.List;

@Mapper
public interface ProfileMapper {
    ExpertDTO findExpertProfile(@Param("user_num") int userNum);
    void updateExpertIntro(ExpertDTO expertDTO);
    void updateExpertYears(ExpertDTO expertDTO);
    ExpertPortfolioDTO findExpertPortfolio(@Param("expert_num") int expertNum);

    void createExpertPortfolio(ExpertPortfolioDTO expertPortfolioDTO);

    void insertPortfolioImages(@Param("portfolio_num") int portfolioNum, @Param("images") List<String> images);
    List<ExpertPortfolioDTO> getExpertPortfolios(@Param("expert_num") int expert_num);
}
