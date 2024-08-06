package org.soomgo.soomgo_project.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.soomgo.soomgo_project.dao.BoardDAO;
import org.soomgo.soomgo_project.domain.BoardDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {

    private static final Logger log = LoggerFactory.getLogger(BoardServiceImpl.class);
    private final BoardDAO boardDAO;

    @Autowired
    public BoardServiceImpl(BoardDAO boardDAO) {
        this.boardDAO = boardDAO;
    }

    @Override
    public BoardDTO getBoard() {
//        System.out.println("BoardServiceImpl : " + boardDAO.getBoard().toString());
        return boardDAO.getBoard();
    }


}
