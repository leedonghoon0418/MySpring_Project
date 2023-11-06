package com.myProject.www.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.myProject.www.domain.CommentVO;
import com.myProject.www.domain.PagingVO;

public interface CommentDAO {

	int insert(CommentVO cvo);

	int selectOneTotalCount(int bno);

	List<CommentVO> getCommentListPaging(@Param("bno") int bno,@Param("pgvo") PagingVO pgvo);

	int removeComment(int cno);

	int updateComment(CommentVO cvo);

	
}
