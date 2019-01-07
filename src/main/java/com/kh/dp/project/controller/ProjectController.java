package com.kh.dp.project.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import com.kh.dp.member.model.service.MemberService;
import com.kh.dp.member.model.vo.Member;
import com.kh.dp.project.model.service.ProjectService;
import com.kh.dp.project.model.vo.Project;
import com.kh.dp.side.model.service.SideService;
import com.kh.dp.side.model.vo.MatchingInfo;
import com.kh.dp.task.model.service.TaskService;

import net.sf.json.JSONArray;

@Controller
public class ProjectController {
	
	@Autowired
	ProjectService projectService;
	MemberService memberService;
	@Autowired
	SideService sideService;
	
	@Autowired
	private TaskService taskService;
	
	@RequestMapping("/project/projectMain.do")

	public String ProjectView(Model model, @RequestParam("mno") int mno) {
		
		List<Map<String,String>> projectList = projectService.selectProjectList(mno);

		List<Map<String,String>> alarmList = projectService.selectAlarmList(mno);
		//List<Project> OneProjectLv = projectService.selectOneProjectLv(pno);
		//List<Project> OneProject = projectService.selectOneProject(pno);
		
		model.addAttribute("projectList",projectList);
		model.addAttribute("alarmList", alarmList);
		//model.addAttribute("OneProjectLv", OneProjectLv);

		
		return "project/projectMain";
	}
	
	
	
	@RequestMapping(value="/project/projectMainLv", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> insertProject(
			@RequestParam(value="jsonStr", required=false) String projectStr,
			@RequestParam(value="jsonArr", required=false) String pjLevelStr){
		
		Project project = new Gson().fromJson(projectStr, Project.class);
		List<Project> pjLevel = new Gson().fromJson(pjLevelStr, new TypeToken<List<Project>>(){}.getType());
		
		System.out.println("project값 : " +project);
		System.out.println("pjLevel값 : " +pjLevel);
		String msg  = projectService.insertProject(project)>0?"프로젝트 생성 완료":"프로젝트 생성 실패";
		String msg1  = projectService.insertProjectLv(pjLevel)>0?"레벨 생성 완료":"레벨 생성 실패";
		
	
		Map<String, String> hmap = new HashMap<>();
		hmap.put("msg", msg);	
		hmap.put("msg1", msg1);	
		return hmap;
	}
	
	@RequestMapping(value="/project/projectPage.do", method=RequestMethod.GET)
	public String ProjectPageView(@RequestParam int pno, @RequestParam int mno, Model model) {
		
		Project project = projectService.selectOneProject(pno);
		ArrayList<Map<String, String>> memberList =
				new ArrayList<Map<String, String>>(projectService.selectProjectIntoMember(pno));
		//List<Map<String,String>> alarmList = projectService.selectAlarmList(mno);
		model.addAttribute("project",project);
		model.addAttribute("memberList", memberList);
		//model.addAttribute("alarmList", alarmList);
		
		// 스케줄 매칭 인원 불러오기 메소드
		List<Member> mArr =  sideService.browseMember(pno);
		model.addAttribute("project",project).addAttribute("mArr", mArr);
		
		Map<String,Object> map = new HashMap<>();
		map.put("pno", pno);
		map.put("mno", mno);
		
		List<Map<String,String>> memoList = projectService.selectMemoList(map);
		model.addAttribute("memoList",memoList);
		

		// 스케줄 매칭 요청 리스트 불러오기
		List<MatchingInfo> sArr = sideService.browseMatchingInfo(mno);
		model.addAttribute("sArr", sArr);
		model.addAttribute("memberNo", mno);
		
		
		// task List
		ArrayList<Map<String, String>> tasklist = 
				new ArrayList<Map<String, String>>(taskService.selectListTask(pno));
		System.out.println("tasklist"+ tasklist);
		model.addAttribute("tasklist", tasklist);
		
		return "project/projectPage";
	}

	
	/*@RequestMapping(value="/project/{nickname}", method=RequestMethod.GET)
	public Member findUserView(@RequestParam String nickname,Model model) {
		System.out.println("nickname:" + nickname);
		Member m = memberService.selectOneNickname(nickname);
		model.addAttribute("member", m);
		if(m==null) m = new Member();
		return m;
	}*/
	
	
	
	
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
	public String leaveProject(Model model, @RequestParam("pno") int pno,@RequestParam("mno") int mno,@RequestParam("pmno") int pmno) {
		
		int result = projectService.deleteLeaveProject(pno, mno); 
		if(result > 0) {
			projectService.insertLeaveAlarm(pmno, pno, mno);
		}
		// 프로젝트 추방됬을 때 성공적으로 나갔으면, alarm 테이블에 데이터 추가
		
		//List<Map<String,String>> projectList = projectService.selectProjectList(mno);
		//List<Map<String,String>> alarmList = projectService.selectAlarmList(mno);
		
		//model.addAttribute("projectList",projectList);
		//model.addAttribute("alarmList", alarmList);
		
		//return "project/projectMain";
		/*Project project = projectService.selectOneProject(pno);
		ArrayList<Map<String, String>> memberList =
				new ArrayList<Map<String, String>>(projectService.selectProjectIntoMember(pno));
		model.addAttribute("project",project);
		model.addAttribute("memberList", memberList);*/
		List<Map<String,String>> projectList = projectService.selectProjectList(mno);
		model.addAttribute("projectList",projectList);
				
		return "project/projectMain";
	}
	
	@RequestMapping(value="/project/exile.do", method=RequestMethod.GET)
	public @ResponseBody Map<String, String> deleteMemberFromProject(Model model, @RequestParam("pno") int pno,@RequestParam("mno") int mno,@RequestParam("mmno") int mmno) {

		int result = projectService.deleteMemberFromProject(pno, mno);
		String msg = "";
		
		if(result > 0) {
			// 성공
			// 알림에 데이터 삽입
			if(projectService.insertExileAlarm(mno, pno) > 0) {
				msg += "성공적으로 추방했습니다.";				
			}
		}else {
			msg += "추방에 실패했습니다. 관리자에게 문의하세요.";
		}
		
		/*Project project = projectService.selectOneProject(pno);
		ArrayList<Map<String, String>> memberList =
				new ArrayList<Map<String, String>>(projectService.selectProjectIntoMember(pno));
		model.addAttribute("project",project);
		model.addAttribute("memberList", memberList);*/
		
		Map<String, String> msgMap = new HashMap<String, String>();
		msgMap.put("msg", msg);
		
		return msgMap;
	}
	
	@RequestMapping(value="/project/deleteProject.do", method=RequestMethod.GET)
	public String deleteProject(Model model, @RequestParam("pno") int pno,@RequestParam("mno") int mno) {
		
		System.out.println(projectService.deleteProject(pno));
		
		List<Map<String,String>> projectList = projectService.selectProjectList(mno);
		//List<Map<String,String>> alarmList = projectService.selectAlarmList(mno);
		
		model.addAttribute("projectList",projectList);
		//model.addAttribute("alarmList", alarmList);
		
		return "project/projectMain";
	}

	@RequestMapping(value="/project/searchMember.do", method=RequestMethod.GET)
	public @ResponseBody List<Member> selectSearchMember(@RequestParam(required=true) String userNick, HttpServletResponse response) throws Exception {
		
		List<Member> m = projectService.selectSearchMember(userNick);
		
		return m;
		
	}
	/*inviteProject.do?pno="+pno+"&mno="+mno;*/
	@RequestMapping(value="/project/inviteProject.do", method=RequestMethod.GET)
	public @ResponseBody Map<String, String> insertInviteProject(@RequestParam("pno") int pno,@RequestParam("mno") int mno) {
		
		int result = 0;
		String msg = "";
		
		if(projectService.selectSearchPM(pno, mno) != null) {
		// pno, mno를 통해 project_member 테이블에 값이 있으면(!=null) 초대 불가능
			msg += "이미 프로젝트에 참여중인 회원입니다.";
		}else {
		// 없으면 projectService.insertInviteProject(pno, mno); 실행
			result = projectService.insertInviteProject(pno, mno);
			if(result != 0) {
				msg += "성공적으로 초대했습니다.";
			} else {
				msg += "초대에 실패했습니다. 관리자에게 문의하세요.";
			}
		}
		
		Map<String, String> msgMap = new HashMap<String, String>();
		msgMap.put("msg", msg);
		
		return msgMap;
	}
	
	@RequestMapping(value="/project/searchMemberList.do", method=RequestMethod.GET)
	public @ResponseBody List<Member> selectSearchMember(@RequestParam(required=true) int pno, HttpServletResponse response) throws Exception {
		
		List<Member> m = projectService.selectSearchMember(pno);
		
		return m;
		
	}
	
	
}
