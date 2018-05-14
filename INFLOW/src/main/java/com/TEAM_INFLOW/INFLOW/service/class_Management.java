package com.TEAM_INFLOW.INFLOW.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.TEAM_INFLOW.INFLOW.bean.class_Bean;
import com.TEAM_INFLOW.INFLOW.dao.class_Dao;

@Service
public class class_Management {
	
	@Autowired
	private class_Dao classdao;
	private ModelAndView mav;
	
	//글 쓰기
	public ModelAndView write(class_Bean classbean) {
		mav=new ModelAndView();
		int result=classdao.write(classbean);
		if(result==0) {
			mav.setViewName("main");
		}else {
			mav.setViewName("redirect:class_list");
		}
		return mav;
	}
	
	//목록 보기를 위한 처리
	public ModelAndView list() {
		mav=new ModelAndView();
		List<class_Bean> classlist=classdao.list();
		mav.addObject("class_list", classlist);
		mav.setViewName("class_list");
		return mav;
	}
	
	public ModelAndView joinlist() {
		mav=new ModelAndView();
		List<class_Bean> classlist=classdao.list();
		System.out.println(classlist);
		mav.addObject("list", classlist);
		mav.setViewName("joinForm");
		return mav;
	}

	public void modify(class_Bean classbean) {
		classdao.modify(classbean);
		
	}
	
	public void delete(String class_name) {
		classdao.delete(class_name);
		
	}
	public class_Bean content_view(String class_name) {
		return classdao.content_view(class_name);
	}
	
	public int student_count(String class_name) {
		return classdao.classcount(class_name);
	}

}
