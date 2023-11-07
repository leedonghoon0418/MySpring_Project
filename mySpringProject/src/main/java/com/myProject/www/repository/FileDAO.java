package com.myProject.www.repository;

import java.util.List;

import com.myProject.www.domain.FileVO;

public interface FileDAO {

	int insertFile(FileVO fvo);

	List<FileVO> getFileList(long bno);

	int updateFile(FileVO fvo);

	int fileRemove(String uuid);

	void remove(long bno);

	void hasFile();

	List<FileVO> selectFlist();

}
