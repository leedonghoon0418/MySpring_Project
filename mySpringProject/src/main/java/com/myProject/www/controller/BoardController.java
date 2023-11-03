package com.myProject.www.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


import com.myProject.www.domain.BoardDTO;
import com.myProject.www.domain.BoardVO;
import com.myProject.www.domain.FileVO;
import com.myProject.www.domain.PagingVO;
import com.myProject.www.handler.FileHandler;
import com.myProject.www.handler.PagingHandler;
import com.myProject.www.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/board/**")
public class BoardController {
	
	@Inject
	private BoardService bsv;
	
	@Inject
	private FileHandler fh;
	
	@GetMapping("/register")
	public void register() {}
	@PostMapping("/register")
	public String getRegister(BoardVO bvo, @RequestParam(name="files", required = false)MultipartFile[] files) {
		
		List<FileVO> flist = null;
		if(files[0].getSize() > 0) {
			flist = fh.uploadFiles(files);
		}
		int isOk = bsv.register(new BoardDTO(bvo,flist));
		
		return "index";
	}
	
	@GetMapping("/list")
	public String getList(Model m, PagingVO pgvo) {
		
		List<BoardVO> list = bsv.getList(pgvo);
		
		m.addAttribute("bvo",list);
				
		
		int totalCount = bsv.getTotal(pgvo);
		
		PagingHandler ph = new PagingHandler(pgvo, totalCount);
		m.addAttribute("ph",ph);
		
		return "/board/list";
	}
	
	@GetMapping("/detail")
	public String detail(Model m, @RequestParam("bno") long bno) {
		
		BoardDTO bdto = bsv.getDetail(bno);
		
		
		m.addAttribute("bvo",bdto.getBvo());
		m.addAttribute("flist",bdto.getFlist());
		return "/board/detail";
	}
	
	@GetMapping("/modify")
	public String modify(Model m,@RequestParam("bno") long bno) {
		BoardDTO bdto = bsv.getDetail(bno);
		
		
		m.addAttribute("bvo",bdto.getBvo());
		m.addAttribute("flist",bdto.getFlist());
		
		return "/board/modify";
	}
	@PostMapping("/modify")
	public String postModify(BoardVO bvo, @RequestParam(name="files", required = false)MultipartFile[] files) {
		List<FileVO> flist = new ArrayList<FileVO>();
		
		if(files[0].getSize() > 0) {
			flist = fh.uploadFiles(files);
		}
		int isOk = bsv.postModify(new BoardDTO(bvo,flist));
		
		return "index";
	}
	@GetMapping("/remove")
	public String remove(@RequestParam("bno") long bno) {
		int isOk = bsv.remove(bno);
		
		
		return "index";
	}
	
	
	
	@DeleteMapping(value="/file/{uuid}" , produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> deleteFile(@PathVariable("uuid")String uuid) {
		int isOk = bsv.fileRemove(uuid);
		return isOk > 0 ? new ResponseEntity<String>("1",HttpStatus.OK) : new ResponseEntity<String>("0",HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
