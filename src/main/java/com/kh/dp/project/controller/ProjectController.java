package com.kh.dp.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.dp.project.model.service.ProjectService;
import com.kh.dp.project.model.vo.Project;

@Controller
public class ProjectController {
	
	@Autowired
	ProjectService projectService;
	
	@RequestMapping("/project/projectMain.do")
	public String ProjectView(Model model) {
		
		List<Map<String,String>> projectList = projectService.selectProjectList();
		model.addAttribute("projectList",projectList);
		
		return "project/projectMain";
	}
	
	@RequestMapping(value="/project/projectMain", method=RequestMethod.POST)
	public Map<String,String> insertMenu(@RequestBody Project project){
		String msg  = projectService.insertProject(project)>0?"프로젝트 생성 완료":"프로젝트 생성 실패";
		
		//리턴타입도 json변환가능한 map 전송함.
		//String 전송하면 에러! -> 클라이언트에서 json parse error!
		Map<String,String> map = new HashMap<>();
		map.put("msg", msg);
		return map;
	}
	
	
	@RequestMapping("/project/projectPage.do")
	public String ProjectPageView(Model model) {
		
		List<Map<String,String>> memoList = projectService.selectMemoList();
		model.addAttribute("memoList",memoList);
		
		return "project/projectPage";
	}
	
	@RequestMapping(value="/project/projectPage.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> updateMemo(@RequestParam(value="saveMemo", required=false) String saveMemo){
		System.out.println("메모:" + saveMemo);
		String msg  = projectService.updateMemo(saveMemo)>0?"수정 성공":"수정 실패";		
		//model.addAttribute("msg",msg);
		Map<String, Object> hmap = new HashMap<>();
		
		hmap.put("msg", msg);
		
		
		return hmap;
		
	}
	

}
