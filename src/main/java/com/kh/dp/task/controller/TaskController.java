package com.kh.dp.task.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.dp.task.model.service.TaskService;
import com.kh.dp.task.model.vo.Attachment;
import com.kh.dp.task.model.vo.Task;

@Controller
public class TaskController {
	
	@Autowired
	private TaskService taskService;
	
	@RequestMapping("/task/taskForm.do")
	public void taskForm() {
		// taskForm.jsp를 연결짓는다.
	}
	
	@RequestMapping("task/taskFormEnd.do")
	public String insertTask(Task task, Model model, HttpSession session,
			@RequestParam(value="upFile", required = false) MultipartFile[] upFile) {
		
		// 1. 파일 저장 경로 생성
		String saveDir = session.getServletContext().getRealPath("/resources/upload/board");
		
		List<Attachment> attachList = new ArrayList<Attachment>();
		
		// 2. 폴더 유무 확인하고 생성하기
		File dir = new File(saveDir);
		
		if(dir.exists() == false) dir.mkdirs();
		
		// 3. 파일 업로드
		for(MultipartFile f : upFile) {
			if(!f.isEmpty()) {
				// 원본이름
				String originName = f.getOriginalFilename();
				String ext = originName.substring(originName.lastIndexOf(".")+1);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
				
				int rnNum = (int)(Math.random() * 1000);
				
				// 서버 저장 후 관리할 파일명
				String renamedName = sdf.format(new Date()) + "_" + rnNum + "." + ext;
				
				// 실제 파일을 지정한 파일명으로 변환하며 데이터를 저장한다.
				try {
					f.transferTo(new File(saveDir + "/" + renamedName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				
				Attachment at = new Attachment();
				at.setOriginalFileName(originName);
				at.setRenamedFileName(renamedName);
				
				attachList.add(at);
			}
		}
		
		int result;
		
		result = taskService.insertTask(task, attachList);
		// 여기서 부터 작성
		return null;
		
	}
}