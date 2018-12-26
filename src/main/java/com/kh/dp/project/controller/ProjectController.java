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
import org.springframework.web.servlet.ModelAndView;

import com.kh.dp.project.model.service.ProjectService;
import com.kh.dp.project.model.vo.Memo;

@Controller
public class ProjectController {
	
	@Autowired
	ProjectService projectService;
	
	@RequestMapping("/project/projectMain.do")
	public String ProjectView() {
		
		return null;
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
