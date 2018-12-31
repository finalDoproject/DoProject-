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

import com.kh.dp.member.model.service.MemberService;
import com.kh.dp.member.model.vo.Member;
import com.kh.dp.project.model.service.ProjectService;
import com.kh.dp.project.model.vo.Memo;
import com.kh.dp.project.model.vo.Project;

@Controller
public class ProjectController {
	
	@Autowired
	ProjectService projectService;
	MemberService memberService;
	
	@RequestMapping("/project/projectMain.do")
	public String ProjectView(Model model) {
		
		List<Map<String,String>> projectList = projectService.selectProjectList();
		model.addAttribute("projectList",projectList);
		
		return "project/projectMain";
	}
	
	@RequestMapping(value="/project/projectMain", method=RequestMethod.POST)
	public Map<String,String> insertProject(@RequestBody Project project){
		System.out.println("project값 : " +project);
		String msg  = projectService.insertProject(project)>0?"프로젝트 생성 완료":"프로젝트 생성 실패";
		
	
		Map<String, String> map = new HashMap<>();
		map.put("msg", msg);	
		return map;
	}
	
	@RequestMapping(value="/project/projectPage.do", method=RequestMethod.GET)
	public String ProjectPageView(@RequestParam int pno, @RequestParam int mno, Model model) {
		
		Project project = projectService.selectOneProject(pno);
		model.addAttribute("project",project);
		
		
		Map<String,Object> map = new HashMap<>();
		map.put("pno", pno);
		map.put("mno", mno);
		
		List<Map<String,String>> memoList = projectService.selectMemoList(map);
		model.addAttribute("memoList",memoList);
		
		return "project/projectPage";
	}

	
	@RequestMapping(value="/project/{nickname}", method=RequestMethod.GET)
	public Member findUserView(@RequestParam String nickname,Model model) {
		Member m = memberService.selectOneNickname(nickname);
		model.addAttribute("member", m);
		if(m==null) m = new Member();
		return m;
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
