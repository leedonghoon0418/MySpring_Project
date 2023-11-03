package com.myProject.www.service;

import com.myProject.www.domain.CommentVO;
import com.myProject.www.domain.PagingVO;
import com.myProject.www.handler.PagingHandler;

public interface CommentService {

	int insert(CommentVO cvo);

	PagingHandler getList(int bno, PagingVO pgvo);

}
