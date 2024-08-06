package org.soomgo.soomgo_project.dao;

import org.soomgo.soomgo_project.domain.BoardDTO;
import org.soomgo.soomgo_project.mappers.BoardMapper;
import org.springframework.stereotype.Repository;


@Repository
public class BoardDAO {

    private final BoardMapper boardMapper;

    public BoardDAO(BoardMapper boardMapper) {
        this.boardMapper = boardMapper;
    }

    public BoardDTO getBoard(){
        return boardMapper.getBoard();
    }

}
