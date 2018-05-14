package com.TEAM_INFLOW.INFLOW;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.TEAM_INFLOW.INFLOW.bean.c_Bean;
import com.TEAM_INFLOW.INFLOW.service.c_Management;

@Controller
@SessionAttributes("login_users")
public class calendar_Controller {
	
	@Autowired
	private c_Management cm;
	private ModelAndView mav;

	//일정 등록 뷰페이지 이동
	@RequestMapping(value = "/calendar_write_view", method = RequestMethod.GET)
	public String calendar_write() {
		
		return "calendar_write_view";
	}
	
	//일정 등록 하기(클라이언트가 쓴 내용을 DB에 반영하는 부분)
		@RequestMapping(value = "/calendar_write", method = RequestMethod.POST)
		public ModelAndView write(@RequestParam("c_title")String title,
								  @RequestParam("c_contents")String contents,
								  @RequestParam("c_start_date")String start_date, 
								  @RequestParam("c_end_date")String end_date) {
			
			c_Bean cbean = new c_Bean();
			cbean.setC_title(title);
			cbean.setC_contents(contents);
			cbean.setC_start_date(start_date);
			cbean.setC_end_date(end_date);
			//글 쓰기를 위한 메소드 호출
			mav=cm.write(cbean);
			//글 쓰기 완료 후 list.jsp로 리다이렉트s
			return mav;
		}
		
	//일정 목록 보기로 이동
		@RequestMapping(value = "/calendar_main", method = RequestMethod.GET)
		public ModelAndView calendar_list() {
			mav=cm.list();
			return mav;
			}
		
	//일정 등록 뷰페이지 이동
		@RequestMapping(value = "/calendar_delete", method = RequestMethod.GET)
		public String calendar_delete() {
			
			return "calendar_delete";
		}

		
	//일정 삭제
		@RequestMapping(value = "/delete", method = RequestMethod.GET)
		public String resources_delete(@RequestParam("c_num") int c_num) {
			cm.delete(c_num);
			return "redirect:calendar_main";
		}
	
	//일정 상세보기 이동
		
		@RequestMapping(value = "/calendar_contents_view", method = RequestMethod.GET)
		public ModelAndView calendar_contents_view(@RequestParam("c_num") int c_num) {
			mav = new ModelAndView();
			mav.addObject("contents_view", cm.contents_view(c_num));
			mav.setViewName("calendar_contents_view");
			return mav;
		}
		
	
}
