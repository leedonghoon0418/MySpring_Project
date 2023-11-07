package com.myProject.www.service;

import java.util.List;

import com.myProject.www.domain.BoardDTO;
import com.myProject.www.domain.BoardVO;
import com.myProject.www.domain.PagingVO;

public interface BoardService {

	int register(BoardDTO boardDTO);



	BoardDTO getDetail(long bno);

	int postModify(BoardDTO boardDTO);

	int fileRemove(String uuid);

	int remove(long bno);

	List<BoardVO> getList(PagingVO pgvo);

	int getTotal(PagingVO pgvo);

	int readcnt(long bno);

	



}
