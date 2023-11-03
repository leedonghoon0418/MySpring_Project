package com.myProject.www.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.myProject.www.domain.CommentVO;
import com.myProject.www.domain.PagingVO;
import com.myProject.www.handler.PagingHandler;
import com.myProject.www.service.CommentService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/comment/**")
public class CommentController {
	
	@Inject
	private CommentService csv;
	
	@PostMapping(value= "/post", consumes="application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> postComment(@RequestBody CommentVO cvo){
		log.info("cvo >>>>>>>>>>>>>>>>>"+cvo);
		int isOk = csv.insert(cvo);
		
		return isOk > 0 ? new ResponseEntity<String>("1",HttpStatus.OK) :
			new ResponseEntity<String>("0",HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value = "/{bno}/{page}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<PagingHandler> commnetList(@PathVariable("bno") int bno, @PathVariable("page") int page){
		PagingVO pgvo = new PagingVO(bno,5);
		
		return new ResponseEntity<PagingHandler> (csv.getList(bno,pgvo),HttpStatus.OK);
	}
	
}
