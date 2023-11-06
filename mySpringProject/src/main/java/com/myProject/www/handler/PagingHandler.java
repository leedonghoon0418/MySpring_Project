package com.myProject.www.handler;

import java.util.List;

import javax.inject.Inject;

import com.myProject.www.domain.CommentVO;
import com.myProject.www.domain.PagingVO;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PagingHandler {

	@Inject
	private PagingVO pgvo;
	
	private int startPage;
	private int endPage;
	private boolean prev,next;
	private int totalCount;
	private int realEndPage;
	
	private List<CommentVO> cmtList;
	
	public PagingHandler(PagingVO pgvo, int totalCount) {
		this.pgvo = pgvo;
		this.totalCount = totalCount;
		
		this.endPage = (int)Math.ceil((pgvo.getPageNo() / (double)pgvo.getQty())) * pgvo.getQty();
		this.startPage = endPage-9;
		
		this.realEndPage = (int)Math.ceil(totalCount / (double) pgvo.getQty());
		
		if(realEndPage < endPage) {
			this.endPage = realEndPage;
		}
		this.prev = startPage > 1;
		this.next = endPage < realEndPage;
	}
	
	public PagingHandler(PagingVO pgvo, int totalCount, List<CommentVO> cmtList) {
		this(pgvo, totalCount);
		this.cmtList = cmtList;
	}
	
	
	
	
}
