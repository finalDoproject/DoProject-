package com.kh.dp.task.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.dp.task.model.exception.TaskException;
import com.kh.dp.task.model.service.TaskService;
import com.kh.dp.task.model.vo.Attachment;
import com.kh.dp.task.model.vo.Task;

@Controller
public class TaskController {
	
	@Autowired
	private TaskService taskService;
	
	private Task task;
	
	@RequestMapping("/task/taskList.do")
	public String selectTaskList() {
		
		return "task/taskList";
	}
	
	@RequestMapping("/task/taskForm.do")
	public void taskForm() {
		// taskForm.jsp를 연결짓는다.
	}
	
	@RequestMapping("/task/taskFormEnd.do")
	public String insertTask(Task task, Model model, HttpSession session,
			HttpServletRequest request,
			@RequestParam(value="upFile", required = false) MultipartFile[] upFile,
			@RequestParam int mno, @RequestParam int pno 
			/*@RequestParam(value="startdate", required=false) String startdate,
			@RequestParam(value="enddate", required=false) String enddate*/) {
		
		task.setTpno(pno);
		System.out.println("pno, mno : " +pno+", " + mno);
		/*String tTitle = request.getParameter("tTitle");*/
		// 1. 파일 저장 경로 생성
		String saveDir = session.getServletContext().getRealPath("/resources/upload/task");
		
		List<Attachment> attachList = new ArrayList<Attachment>();
		
		// 2. 폴더 유무 확인하고 생성하기
		File dir = new File(saveDir);
		
		System.out.println("폴더있니?" + dir.exists());
		
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
				String renamedName = sdf.format(new java.util.Date()) + "_" + rnNum + "." + ext;
				
				// 실제 파일을 지정한 파일명으로 변환하며 데이터를 저장한다.
				try {
					f.transferTo(new File(saveDir + "/" + renamedName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				
				Attachment at = new Attachment();
				at.setFoldname(originName);
				at.setFnewname(renamedName);
				at.setFpath(saveDir);
				at.setFtno(task.getTno());
				attachList.add(at);
			}
		}
		System.out.println("Attachment값:" + attachList);
	
		
		
		int result;
		
		try {
			result = taskService.insertTask(task, attachList);	
		} catch(Exception e) {
			throw new TaskException("게시글 등록 오류");
		}
		String loc = "/task/taskList.do";
		String msg = "";
		
		if(result > 0) {
			msg = "게시글 등록 성공!";
			/*loc = "/task/taskView.do?no="+task.getTno();*/
			loc = "/project/projectPage.do?mno="+ mno +"&pno=" + pno;
			
		}else {
			msg = "게시글 등록 실패";
		}
		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "common/msg";
	}
	 
	
	@RequestMapping("/task/taskView.do")
	public String selectOneTask(@RequestParam int no, Model model) {
		model.addAttribute("task", taskService.selectOneTask(no)).
		addAttribute("attachmentList", taskService.selectOneAttachment(no));
		
		return "task/taskView";
	}
	
	@RequestMapping(value="/task/taskUpdateView.do", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> updateViewTask(@RequestParam("tno") String tno) {
		System.out.println("tno: " + tno);
		int tno1 = Integer.parseInt(tno);
		System.out.println("tno: " + tno1);
		Map<String, Object> map = new HashMap<>();
		Task task = taskService.selectOneTask(tno1);
		Attachment attach = taskService.selectOneAttachment(tno1);
		if(attach != null) {
			map.put("attach", attach);
		}
		System.out.println("attach" + attach);
		map.put("task", task);
		return map;
	}
	
	@RequestMapping("/task/taskUpdate.do")
	public String updateTask( Task task, Model model, HttpSession session,
								HttpServletRequest request, @RequestParam(value="upFile", required = false) MultipartFile[] upFile,
								@RequestParam int mno, @RequestParam int pno 
			/*@RequestParam(value="startdate", required=false) String startdate,
			@RequestParam(value="enddate", required=false) String enddate*/) {
		
		task.setTpno(pno);
		System.out.println("pno, mno : " +pno+", " + mno);
		/*String tTitle = request.getParameter("tTitle");*/
		// 1. 파일 저장 경로 생성
		String saveDir = session.getServletContext().getRealPath("/resources/upload/task");
		Attachment at = new Attachment();
		
		if(upFile != null) {
		
		// 2. 폴더 유무 확인하고 생성하기
		File dir = new File(saveDir);
		
		System.out.println("폴더있니?" + dir.exists());
		
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
				String renamedName = sdf.format(new java.util.Date()) + "_" + rnNum + "." + ext;
				
				// 실제 파일을 지정한 파일명으로 변환하며 데이터를 저장한다.
				try {
					f.transferTo(new File(saveDir + "/" + renamedName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				
				
				at.setFoldname(originName);
				at.setFnewname(renamedName);
				at.setFpath(saveDir);
				at.setFtno(task.getTno());
			}
		}
		}
		System.out.println("Attachment값:" + at);
	
		
		
		int result;
		
		try {
			result = taskService.updateTask(task, at);	
		} catch(Exception e) {
			throw new TaskException("게시글 등록 오류");
		}
		String loc = "/task/taskList.do";
		String msg = "";
		
		if(result > 0) {
			msg = "게시글 등록 성공!";
			/*loc = "/task/taskView.do?no="+task.getTno();*/
			loc = "/project/projectPage.do?mno="+ mno +"&pno=" + pno;
			
		}else {
			msg = "게시글 등록 실패";
		}
		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "common/msg";
	
	}
	
	@RequestMapping("/task/taskdelete.do")
	public String deleteTask(@RequestParam int tno ,@RequestParam int mno, @RequestParam int pno , Model model) {
		
		int result = taskService.deleteTask(tno);
		String msg = "";
		String loc = "";
		if(result > 0) {
			msg = "글이 삭제되었습니다.";
			loc = "/project/projectPage.do?mno="+ mno +"&pno=" + pno;
		}else {
			msg = "삭제 중 에러발생 관리자에게 문의해주세요";
		}
		model.addAttribute("msg", msg).addAttribute("loc",loc);
		return "common/msg";
	}
	
	@RequestMapping(value="/task/deleteAttach.do", method=RequestMethod.GET)
	@ResponseBody
	public Map<String,String> deleteAttach(@RequestParam int tno) {
		
		Map<String, String> hmap = new HashMap<>();
		int result = taskService.deleteAttach(tno);
		
		String msg = "";
		if(result > 0) {
			msg = "첨부파일 삭제 성공";
		}
		hmap.put("msg", msg);
		return hmap;
	}
			
			
}