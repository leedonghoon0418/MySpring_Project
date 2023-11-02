package com.myProject.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myProject.www.domain.BoardDTO;
import com.myProject.www.domain.BoardVO;
import com.myProject.www.domain.FileVO;
import com.myProject.www.repository.BoardDAO;
import com.myProject.www.repository.FileDAO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BoardServiceImpl implements BoardService{

	@Inject
	private BoardDAO bdao;
	
	@Inject
	private FileDAO fdao;

	@Override
	public int register(BoardDTO bdto) {
		int isUp = bdao.insert(bdto.getBvo());
		
		if(bdto.getFlist() == null) {
			isUp *= 1;
			return isUp;
		}
		if(isUp > 0 && bdto.getFlist().size() > 0) {
			long bno = bdao.selectOneBno();
			
			for(FileVO fvo : bdto.getFlist()) {
				fvo.setBno(bno);
				isUp *= fdao.insertFile(fvo);
			}
		}
		
		return isUp;
	}

	@Override
	public List<BoardVO> getList() {
		// TODO Auto-generated method stub
		return bdao.getList();
	}

	@Override
	public BoardDTO getDetail(long bno) {
		
		BoardVO bvo = bdao.getDetail(bno);
		List<FileVO> flist = fdao.getFileList(bno);
		
		return new BoardDTO(bvo,flist);
	}

	@Override
	public int postModify(BoardDTO bdto) {
		int isUp = bdao.update(bdto.getBvo());
		
		if(bdto.getFlist() == null) {
			isUp *= 1;
			return isUp;
		}
		if(isUp > 0 && bdto.getFlist().size() > 0) {
			long bno = bdto.getBvo().getBno();
			for(FileVO fvo : bdto.getFlist()) {
				fvo.setBno(bno);
				isUp *= fdao.insertFile(fvo);
			}
		}
		
		return isUp;
	}

	@Override
	public int fileRemove(String uuid) {
		int isOk = fdao.fileRemove(uuid);
		return isOk;
	}

	

	
}
