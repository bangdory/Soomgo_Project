package org.soomgo.soomgo_project.dao;

import org.soomgo.soomgo_project.domain.BoardDTO;
import org.soomgo.soomgo_project.mappers.BoardMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BoardDAO {

    private final BoardMapper boardMapper;

    public BoardDAO(BoardMapper boardMapper) {
        this.boardMapper = boardMapper;
    }

    public BoardDTO getBoard(){
        System.out.println("BoardDAO : " + boardMapper.getBoard().toString());
        return boardMapper.getBoard();
    }

}
