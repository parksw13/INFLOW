package com.TEAM_INFLOW.INFLOW;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.TEAM_INFLOW.INFLOW.bean.nb_Bean;
import com.TEAM_INFLOW.INFLOW.service.nb_Management;




@Controller
@SessionAttributes("login_users")
public class nb_Controller {
	
	@Autowired
	private nb_Management nbm;
	private ModelAndView mav;
	
	//글 목록 보기
	@RequestMapping(value = "/nb_list", method = RequestMethod.GET)
	public ModelAndView list() {
		mav=nbm.list();
		return mav;
	}

	//글 상세보기로 이동
	@RequestMapping(value = "/nb_content_view", method = RequestMethod.GET)
	public ModelAndView content_view(@RequestParam("nb_num") int nb_num) {
		//조회수 증가 처리
		nbm.increaseViewcnt(nb_num);
		mav=new ModelAndView();
		mav.setViewName("nb_content_view");
		mav.addObject("nb_content_view",nbm.content_view(nb_num));
		return mav;
	}

	//글 수정하기로 이동
	@RequestMapping(value = "/nb_modify_view", method = RequestMethod.GET)
	public ModelAndView modify_view(@RequestParam("nb_num") int nb_num) {

		mav=new ModelAndView();
		mav.addObject("nb_content_view",nbm.content_view(nb_num));
		mav.setViewName("nb_modify_view");
		return mav;
	}

	//글 쓰기 화면으로 이동
	@RequestMapping(value = "/nb_write_view", method = RequestMethod.GET)
	public String write_view() {

		return "nb_write_view";
	}


	//글 쓰기(클라이언트가 쓴 내용을 DB에 반영하는 부분)
	@RequestMapping(value = "/nb_write", method = RequestMethod.POST)
	public String write(@ModelAttribute nb_Bean nbbean) {
		//글 쓰기를 위한 메소드 호출
		nbm.write(nbbean);

		//글 쓰기 완료 후 list.jsp로 리다이렉트
		return "redirect:nb_list";
	}

	//글 수정하기(글 상세보기에서)
	@RequestMapping(value = "/nb_modify", method = RequestMethod.POST)
	public String modify(@ModelAttribute nb_Bean nbbean, @RequestParam("nb_num") int nb_num ) {
		nbm.modify(nbbean);
		return "redirect:nb_content_view?nb_num="+nb_num;
	}

	//글 삭제하기(글 상세보기에서)
	@RequestMapping(value = "/nb_delete")
	public String delete(@RequestParam("nb_num") int nb_num) {
		nbm.delete(nb_num);
		return "redirect:nb_list";
	}
}
