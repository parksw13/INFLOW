package com.TEAM_INFLOW.INFLOW;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.TEAM_INFLOW.INFLOW.bean.class_Bean;
import com.TEAM_INFLOW.INFLOW.service.class_Management;


@Controller
@SessionAttributes("login_users")
public class class_Controller {

	@Autowired
	private class_Management csm;
	private ModelAndView mav;

	//클래스 리스트
	@RequestMapping(value = "/class_list", method = RequestMethod.GET)
	public ModelAndView list() {
		mav=csm.list();
		return mav;
	}

	@RequestMapping(value = "/class_write_view", method = RequestMethod.GET)
	public String write_view() {
		return "class_write_view";
	}
	@RequestMapping(value = "/class_modify_view", method = RequestMethod.GET)
	public ModelAndView content_view(@RequestParam("class_name") String class_name) {
		class_Bean classbean = new class_Bean();
		mav=new ModelAndView();
		classbean.setStudent_count(csm.student_count(class_name));
		mav.setViewName("class_modify_view");
		mav.addObject("contents_view",csm.content_view(class_name));
		mav.addObject("count", classbean);
		return mav;
		}
	
	@RequestMapping(value = "/class_contents_view", method = RequestMethod.GET)
	public ModelAndView view(@RequestParam("class_name") String class_name) {
		class_Bean classbean = new class_Bean();
		mav=new ModelAndView();
		classbean.setStudent_count(csm.student_count(class_name));
		mav.setViewName("class_contents_view");
		mav.addObject("contents_view", csm.content_view(class_name));
		mav.addObject("count", classbean);
		return mav;
		}
	
	//클래스 수정하기
	@RequestMapping(value = "/class_modify", method = RequestMethod.POST)
	public String modify(@ModelAttribute class_Bean classbean) {
		csm.modify(classbean);
		return "redirect:class_list";
	}

	//클래스 등록(클라이언트가 쓴 내용을 DB에 반영하는 부분)
	@RequestMapping(value = "/class_write", method = RequestMethod.POST)
	public String write(@ModelAttribute class_Bean classbean) {
		//글 쓰기를 위한 메소드 호출

		csm.write(classbean);

		//클래스 등록 완료 후 class_view.jsp로 리다이렉트
		return "redirect:class_list";
	}

	//클래스 삭제
	@RequestMapping(value = "/class_delete")
	public String delete(@RequestParam("class_name") String class_name) {
		csm.delete(class_name);
		return "redirect:class_list";
	}


}
