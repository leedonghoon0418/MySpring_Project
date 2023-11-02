package com.myProject.www.service;

import java.util.List;

import com.myProject.www.domain.BoardDTO;
import com.myProject.www.domain.BoardVO;

public interface BoardService {

	int register(BoardDTO boardDTO);

	List<BoardVO> getList();

	BoardDTO getDetail(long bno);

	int postModify(BoardDTO boardDTO);

	int fileRemove(String uuid);

	



}
