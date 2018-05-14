package com.TEAM_INFLOW.INFLOW;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.TEAM_INFLOW.INFLOW.bean.sb_Bean;
import com.TEAM_INFLOW.INFLOW.service.sb_Management;



@Controller
@SessionAttributes("login_users")
public class sb_Controller {
	
	@Autowired
	private sb_Management sbm;
	private ModelAndView mav;
	
	//글 목록 보기로 이동
		@RequestMapping(value = "/sb_list", method = RequestMethod.GET)
		public ModelAndView list() {
			mav=sbm.list();
			return mav;
		}

		//글 상세보기로 이동
		@RequestMapping(value = "/sb_content_view", method = RequestMethod.GET)
		public ModelAndView content_view(@RequestParam("sb_num") int sb_num) {
			//조회수 증가 처리
			sbm.increaseViewcnt(sb_num);
			mav=new ModelAndView();
			mav.setViewName("sb_content_view");
			mav.addObject("sb_content_view",sbm.content_view(sb_num));
			return mav;
		}

		//글 쓰기 화면으로 이동
		@RequestMapping(value = "/sb_write_view", method = RequestMethod.GET)
		public String write_view() {
			return "sb_write_view";
		}

		//답글 쓰기 화면으로 이동
		@RequestMapping(value = "/sb_re_write_view", method = RequestMethod.GET)
		public ModelAndView re_write_view(@RequestParam("sb_num") int sb_num) {
			mav=sbm.re_list(sb_num);
			return mav;

		}


		//글 쓰기(클라이언트가 쓴 내용을 DB에 반영하는 부분)
		@RequestMapping(value = "/sb_write", method = RequestMethod.POST)
		public String write(@ModelAttribute sb_Bean sbbean) {
			//글 쓰기를 위한 메소드 호출

			sbm.write(sbbean);

			//글 쓰기 완료 후 list.jsp로 리다이렉트
			return "redirect:sb_list";
		}

		//답글 쓰기(클라이언트가 쓴 내용을 DB에 반영하는 부분)
		@RequestMapping(value = "/sb_re_write", method = RequestMethod.POST)
		public String re_write(@ModelAttribute sb_Bean sbbean, @RequestParam("sb_num") int sb_num) {
			sbbean.setSb_re_ref(sb_num);
			sbm.re_write(sbbean);
			//글 쓰기 완료 후 list.jsp로 리다이렉트
			return "redirect:sb_list";
		}

		//글 수정하기로 이동
		@RequestMapping(value = "/sb_modify_view", method = RequestMethod.GET)
		public ModelAndView modify_view(@RequestParam("sb_num") int sb_num) {
			
			mav=new ModelAndView();
			mav.setViewName("sb_modify_view");
			mav.addObject("sb_content_view",sbm.content_view(sb_num));
			return mav;
		}
		
		//글 수정하기(글 상세보기에서)
		@RequestMapping(value = "/sb_modify", method = RequestMethod.POST)
		public String modify(@ModelAttribute sb_Bean sbbean, @RequestParam("sb_num") int sb_num) {
			sbm.modify(sbbean);
			return "redirect:sb_content_view?sb_num="+sb_num;
		}

		//글 삭제하기(글 상세보기에서)
		@RequestMapping(value = "/sb_delete")
		public String delete(@RequestParam("sb_num") int sb_num) {
			sbm.delete(sb_num);
			return "redirect:sb_list";
		}
}
