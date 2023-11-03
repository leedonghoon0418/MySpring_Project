package com.myProject.www.service;

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
		// TODO Auto-generated method stub
		return null;
	}
}
