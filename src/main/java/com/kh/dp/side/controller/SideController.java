package com.kh.dp.side.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.dp.side.model.service.SideService;
import com.kh.dp.side.model.vo.Join;
import com.kh.dp.side.model.vo.Matching;

@Controller
public class SideController {

	@Autowired
    private SideService sideService;
	
		// 스케줄 매칭 요청 완료. DB로 향하는 메소드
		@RequestMapping("/project/matching.do")
		public ModelAndView matching(@RequestParam String title,
									 @RequestParam Date startDate,
									 @RequestParam Date endDate,
									 @RequestParam String[] mNickname,
									 @RequestParam int pno,
									 @RequestParam int mno) 
		{
			ModelAndView mv = new ModelAndView();
			
			Matching matcing = new Matching(title, startDate, endDate);
			int result = sideService.insertMatching(matcing);
			
			
			String loc = "/project/projectPage.do?pno="+pno+"&mno="+mno;
			String msg = "스케줄 매칭 요청 완료";
			
			for(int i=0; i<mNickname.length; i++) {
			int reulst2 = sideService.insertMember(Integer.parseInt(mNickname[i]));
			int result3 = sideService.insertMySelf(mno);
			}
			
			mv.addObject("loc", loc).addObject("msg", msg);
			mv.setViewName("common/msg");
			
			return mv;
			
		}
	
	// 요일/시간 DB로 향하는 메소드
	// @ResponseBody와 HttpMessageConverter 활용하기
	@RequestMapping("/project/matchingDT.do")
	@ResponseBody
	public int matchingDT(@RequestParam int dtNo,
						  @RequestParam int requestNo,
						  @RequestParam int mNo ) {

		Join join = new Join(mNo, dtNo, requestNo);
		
		int result = sideService.insertMatchingDT(join);
		
		return result;
	}
	
	// 요일/시간 DB 불러오는 메소드
	// @ResponseBody와 HttpMessageConverter 활용하기
	
	@RequestMapping("/project/browseDT.do")
	@ResponseBody
	public List<Join> browseDT(
						@RequestParam int requestNo,
						@RequestParam int mNo) {
		
		List DateTime = sideService.browseDT(mNo, requestNo);
		
		System.out.println(DateTime+", requestNo : " + requestNo + ", mNo : " + mNo);
		return DateTime;
	}
	
	
	
	
	
	
	
	
	
}
