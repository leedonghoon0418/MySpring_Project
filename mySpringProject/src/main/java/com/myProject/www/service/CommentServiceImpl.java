package com.myProject.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myProject.www.domain.CommentVO;
import com.myProject.www.domain.PagingVO;
import com.myProject.www.handler.PagingHandler;
import com.myProject.www.repository.CommentDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CommentServiceImpl implements CommentService{

	@Inject
	private CommentDAO cdao;

	@Override
	public int insert(CommentVO cvo) {
		// TODO Auto-generated method stub
		return cdao.insert(cvo);
	}

	@Override
	public PagingHandler getList(int bno, PagingVO pgvo) {
		
		int totalCount = cdao.selectOneTotalCount(bno);
		List<CommentVO> list = cdao.getCommentListPaging(bno,pgvo);
		log.info(list+"comment list");
		PagingHandler ph = new PagingHandler(pgvo, totalCount, list);
		
		
		return ph;
	}

	@Override
	public int removeComment(int cno) {
		// TODO Auto-generated method stub
		return cdao.removeComment(cno);
	}

	@Override
	public int updateComment(CommentVO cvo) {
		// TODO Auto-generated method stub
		return cdao.updateComment(cvo);
	}
}
