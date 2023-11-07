package com.myProject.www.repository;

import java.util.List;

import com.myProject.www.domain.BoardVO;
import com.myProject.www.domain.PagingVO;

public interface BoardDAO {

	int insert(BoardVO bvo);

	long selectOneBno();



	BoardVO getDetail(long bno);

	int update(BoardVO bvo);

	int remove(long bno);

	List<BoardVO> getList(PagingVO pgvo);



	int getTotal(PagingVO pgvo);

	int readCnt(long bno);

	

}
