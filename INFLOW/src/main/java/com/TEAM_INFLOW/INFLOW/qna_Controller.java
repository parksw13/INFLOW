package com.TEAM_INFLOW.INFLOW;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.TEAM_INFLOW.INFLOW.bean.qna_Bean;
import com.TEAM_INFLOW.INFLOW.bean.reply_Bean;
import com.TEAM_INFLOW.INFLOW.service.qna_Management;





@Controller
@SessionAttributes("login_users")
public class qna_Controller {
	
	@Autowired
	private qna_Management qnam;
	private ModelAndView mav;
	
	//글 목록 보기로 이동
		@RequestMapping(value = "/qna_list", method = RequestMethod.GET)
		public ModelAndView list() {
			mav=qnam.list();
			return mav;
			}
		
		//글 상세보기로 이동
		@RequestMapping(value = "/qna_content_view", method = RequestMethod.GET)
		public ModelAndView content_view(@RequestParam("qna_num") int qna_num) {
			//조회수 증가 처리
			qnam.increaseViewcnt(qna_num);
			mav=new ModelAndView();
			mav.addObject("qna_content_view",qnam.content_view(qna_num));
			mav.addObject("reply_list", qnam.reply_list(qna_num));
			mav.setViewName("qna_content_view");
			return mav;
			}
			
		//글 쓰기 화면으로 이동
		@RequestMapping(value = "/qna_write_view", method = RequestMethod.GET)
		public String write_view() {

			return "qna_write_view";
		}
		
		//글 수정 화면으로 이동
			@RequestMapping(value = "/qna_modify_view", method = RequestMethod.GET)
			public ModelAndView modify_view(@RequestParam("qna_num") int qna_num) {
				
				mav=new ModelAndView();
				mav.addObject("qna_content_view",qnam.content_view(qna_num));
				
				mav.setViewName("qna_modify_view");
				return mav;
				
			}
		
		//글 쓰기(클라이언트가 쓴 내용을 DB에 반영하는 부분)
		@RequestMapping(value = "/qna_write", method = RequestMethod.POST)
		public String write(@ModelAttribute qna_Bean qnabean) {
			//글 쓰기를 위한 메소드 호출
			qnam.write(qnabean);
			
			//글 쓰기 완료 후 list.jsp로 리다이렉트
			return "redirect:qna_list";
		}

		//글 수정하기(글 상세보기에서)	
		@RequestMapping(value = "/qna_modify", method = RequestMethod.POST)
		public String modify(@ModelAttribute qna_Bean qnabean, @RequestParam("qna_num") int qna_num) {
			qnam.modify(qnabean);
			return "redirect:qna_content_view?qna_num="+qna_num;
		}
		
		//글 삭제하기(글 상세보기에서)
		@RequestMapping(value = "/qna_delete")
		public String delete(@RequestParam("qna_num") int qna_num) {
			qnam.delete(qna_num);
			return "redirect:qna_list";
		}
		
		//댓글 달기
		@RequestMapping(value = "/reply", method = RequestMethod.POST)
		public String reply(HttpServletRequest request) {
			
			int b_num=Integer.parseInt(request.getParameter("qna_num"));
			String contents=request.getParameter("reply_contents");
			String writer=request.getParameter("reply_writer");

			reply_Bean rebean= new reply_Bean();
			rebean.setB_num(b_num);
			rebean.setReply_contents(contents);
			rebean.setReply_writer(writer);
			qnam.reply(rebean);
			return "redirect:qna_content_view?qna_num="+b_num;
			
		}
		
	//댓글 삭제하기
		@RequestMapping(value = "/reply_delete")
		public String reply_delete(@RequestParam("reply_num") int reply_num, @RequestParam("qna_num") int qna_num) {
			qnam.reply_delete(reply_num);
			return "redirect:qna_content_view?qna_num="+qna_num;
		}
}
