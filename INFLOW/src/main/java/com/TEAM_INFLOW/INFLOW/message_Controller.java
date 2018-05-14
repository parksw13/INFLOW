package com.TEAM_INFLOW.INFLOW;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import org.springframework.web.servlet.ModelAndView;


import com.TEAM_INFLOW.INFLOW.bean.message_Bean;
import com.TEAM_INFLOW.INFLOW.service.message_Management;


@Controller
@SessionAttributes("login_users")
public class message_Controller {
	

	@Autowired
	private message_Management mm;
	private ModelAndView mav;

	//글 목록 보기로 이동
		@RequestMapping(value = "/message_sendlist", method = RequestMethod.GET)
		public ModelAndView sendlist() {
			mav=mm.sendlist();
			return mav;
			}
		//글 목록 보기로 이동
		@RequestMapping(value = "/message_relist", method = RequestMethod.GET)
		public ModelAndView relist() {
			mav=mm.relist();
			return mav;
			}
		
		//글 상세보기로 이동
		@RequestMapping(value = "/m_content_view", method = RequestMethod.GET)
		public ModelAndView content_view(@RequestParam("m_num") int m_num) {
			//조회수 증가 처리
			mav=new ModelAndView();
			mav.setViewName("m_content_view");
			mav.addObject("m_content_view",mm.content_view(m_num));
			return mav;
			}
			
		//글 쓰기 화면으로 이동
		@RequestMapping(value = "/m_write_view", method = RequestMethod.GET)
		public String write_view() {

			return "message_write";
		}
		
		
		//글 쓰기(클라이언트가 쓴 내용을 DB에 반영하는 부분)
		@RequestMapping(value = "/m_write", method = RequestMethod.POST)
		public String write(@ModelAttribute message_Bean mbean) {
			//글 쓰기를 위한 메소드 호출
			mm.write(mbean);
			
			//글 쓰기 완료 후 list.jsp로 리다이렉트
			return "redirect:message_sendlist";
		}

		//글 삭제하기(글 상세보기에서)
		@RequestMapping(value = "/m_delete")
		public String delete(@RequestParam("m_num") int m_num) {
			mm.delete(m_num);
			return "redirect:message_sendlist";
		}
}