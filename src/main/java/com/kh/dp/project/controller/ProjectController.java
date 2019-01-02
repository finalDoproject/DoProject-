package com.kh.dp.project.controller;

import java.util.ArrayList;
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
import com.kh.dp.project.model.vo.Project;
import com.kh.dp.side.model.service.SideService;
import com.kh.dp.side.model.vo.MatchingInfo;

@Controller
public class ProjectController {
	
	@Autowired
	ProjectService projectService;
	MemberService memberService;
	@Autowired
	SideService sideService;
	
	@RequestMapping("/project/projectMain.do")

	public String ProjectView(Model model, @RequestParam("mno") int mno) {
		
		List<Map<String,String>> projectList = projectService.selectProjectList(mno);
		List<Map<String,String>> alarmList = projectService.selectAlarmList(mno);
		

		model.addAttribute("projectList",projectList);
		model.addAttribute("alarmList", alarmList);
		
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
		ArrayList<Map<String, String>> memberList =
				new ArrayList<Map<String, String>>(projectService.selectProjectIntoMember(pno));
		model.addAttribute("project",project);
		model.addAttribute("memberList", memberList);
		
		// 스케줄 매칭 인원 불러오기 메소드
		List<Member> mArr =  sideService.browseMember(pno);
		model.addAttribute("project",project).addAttribute("mArr", mArr);
		
		Map<String,Object> map = new HashMap<>();
		map.put("pno", pno);
		map.put("mno", mno);
		
		List<Map<String,String>> memoList = projectService.selectMemoList(map);
		model.addAttribute("memoList",memoList);
		

		// 메모가 없을 때 DB에서 메모 새로 만들어줘야함 ㅠㅠ
		// if(memoList==null) memoList = projectService.insertMemo(map);
		// 스케줄 매칭 요청 리스트 불러오기
		List<MatchingInfo> sArr = sideService.browseMatchingInfo(mno);
		model.addAttribute("sArr", sArr);
		
		model.addAttribute("memberNo", mno);
		
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
	public Map<String,String> updateMemo(@RequestParam int pno, @RequestParam int mno,
										@RequestParam(value="saveMemo", required=false) String saveMemo){
		System.out.println("메모:" + saveMemo);
		
		Map<String,Object> map = new HashMap<>();
		map.put("saveMemo", saveMemo);
		map.put("pno", pno);
		map.put("mno", mno);
		
		String msg = projectService.updateMemo(map)>0?"메모 저장":"저장 실패";

		Map<String, String> hmap = new HashMap<>();
		hmap.put("msg", msg);
		return hmap;
		
	}
	
	@RequestMapping(value="/project/leaveProject.do", method=RequestMethod.GET)
	public String deleteProject(Model model, @RequestParam("pno") int pno,@RequestParam("mno") int mno) {
		
		projectService.deleteLeaveProject(pno, mno);
		
		List<Map<String,String>> projectList = projectService.selectProjectList(mno);
		List<Map<String,String>> alarmList = projectService.selectAlarmList(mno);
		
		model.addAttribute("projectList",projectList);
		model.addAttribute("alarmList", alarmList);
		
		return "project/projectMain";
	}
	
	@RequestMapping(value="/project/exile.do", method=RequestMethod.GET)
	public String deleteMemberFromProject(Model model, @RequestParam("pno") int pno,@RequestParam("mno") int mno) {
		
		projectService.deleteMemberFromProject(pno, mno);
		
		Project project = projectService.selectOneProject(pno);
		ArrayList<Map<String, String>> memberList =
				new ArrayList<Map<String, String>>(projectService.selectProjectIntoMember(pno));
		model.addAttribute("project",project);
		model.addAttribute("memberList", memberList);
				
		return "project/projectPage";
	}

}
