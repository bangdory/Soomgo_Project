//package org.soomgo.soomgo_project.mappers;
//
//
//import lombok.extern.log4j.Log4j2;
//import org.junit.jupiter.api.Test;
//import org.junit.jupiter.api.extension.ExtendWith;
//import org.soomgo.soomgo_project.domain.community.CommunityBoardDTO;
//import org.soomgo.soomgo_project.mappers.community.CommunityBoardMapper;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit.jupiter.SpringExtension;
//
//import java.util.List;
//
//@ExtendWith(SpringExtension.class)
//@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
//@Log4j2
//public class CommunityBoardTest {
//    @Autowired(required = false)
//    CommunityBoardMapper communityBoardMapper;
//
//    @Test
//    public void testCreate(){
//        CommunityBoardDTO communityBoardDTO = new CommunityBoardDTO();
//
//        communityBoardDTO.setBoard_no(1);
//        communityBoardDTO.setCb_title("타이틀1");
//        communityBoardDTO.setCb_content("내용1");
//        //communityBoardDTO.setCb_file("{\"file_path\": \"C:/Users/J.Y/Desktop/새 폴더/바탕화면/072021-Ruined_MissFortune-Splash.jpg\"}");
//        communityBoardDTO.setCb_file(null);
//        communityBoardDTO.setUser_num(1);
//        communityBoardDTO.setCategoryNum(1);
//        communityBoardDTO.setCb_addr(1);
//
//        log.info("count: " + communityBoardMapper.create(communityBoardDTO));
//        log.info("cb_no: " + communityBoardDTO.getCb_no());
//        log.info("board_no: " + communityBoardDTO.getBoard_no());
//    }
//
//    @Test
//    public void testUpdate(){
//        CommunityBoardDTO communityBoardDTO = new CommunityBoardDTO();
//
//        communityBoardDTO.setCb_no(5);
//        communityBoardDTO.setCb_title("수정하기");
//        communityBoardDTO.setCb_content("수정했다");
//        //communityBoardDTO.setCb_file("{\"file_path\": \"C:/Users/J.Y/Desktop/새 폴더/바탕화면/072021-Ruined_MissFortune-Splash.jpg\"}");
//        communityBoardDTO.setCb_file(null);
//        int updateCount = communityBoardMapper.update(communityBoardDTO);
//
//        log.info("update: "+updateCount);
//    }
//
//    @Test
//    public void testDelete(){
//        communityBoardMapper.delete(3);
//
//    }
//
//    @Test
//    public void testRead(){
//        log.info(communityBoardMapper.read(1).toString());
//    }
//
//    @Test
//    public void testListAll(){
//        List<CommunityBoardDTO> list = communityBoardMapper.listAll();
//        log.info(list.toString());
//    }
//
//    @Test
//    public void testListByBoardNo(){
//        log.info(communityBoardMapper.listByBoardNo(1).toString());
//    }
//}
