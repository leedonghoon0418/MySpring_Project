package com.myProject.www.repository;

import java.util.List;

import com.myProject.www.domain.BoardVO;

public interface BoardDAO {

	int insert(BoardVO bvo);

	long selectOneBno();

	List<BoardVO> getList();

	BoardVO getDetail(long bno);

	int update(BoardVO bvo);

	

}
