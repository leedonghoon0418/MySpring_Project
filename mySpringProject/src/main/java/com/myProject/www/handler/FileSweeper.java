package com.myProject.www.handler;

import java.io.File;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.joda.time.LocalDate;
import org.springframework.scheduling.annotation.Scheduled;

import com.myProject.www.domain.FileVO;
import com.myProject.www.repository.FileDAO;

public class FileSweeper {

	private final String BASE_PATH = "D:\\_myweb\\_java\\fileupload\\";
	
	@Inject
	private FileDAO fdao;
	
	@Scheduled(cron = "0 0 15 47 * *")
	public void fileSweeper() {
		
		List<FileVO> dbList = fdao.selectFlist();
		List<String> currFiles = new ArrayList<String>();
		
		for(FileVO fvo : dbList) {
			String filePath = fvo.getSaveDir()+"\\"+fvo.getUuid();
			String fileName = fvo.getFileName();
			currFiles.add(BASE_PATH+filePath+"_"+fileName);
			if(fvo.getFileType() > 0) {
				currFiles.add(BASE_PATH+filePath+"_th_"+fileName);
			}
		}
		LocalDate now = LocalDate.now();
		String today = now.toString();
		today = today.replace("-", File.separator);
		
		
		File dir = Paths.get(BASE_PATH+today).toFile();
		File[] allFileObject = dir.listFiles();
		
		for(File file : allFileObject) {
			String storedFileName = file.toPath().toString();
			if(currFiles.contains(storedFileName)) {
				file.delete();
			}
		}
	}
}

