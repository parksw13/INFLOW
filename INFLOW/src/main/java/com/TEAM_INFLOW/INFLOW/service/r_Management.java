package com.TEAM_INFLOW.INFLOW.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.TEAM_INFLOW.INFLOW.bean.resources_Bean;
import com.TEAM_INFLOW.INFLOW.dao.r_Dao;



@Service
public class r_Management {

	@Autowired
	private r_Dao rdao;
	private ModelAndView mav;

	//제품 등록 처리
	public ModelAndView write(resources_Bean rbean) {
		mav = new ModelAndView();
		int result = rdao.write(rbean);
		if(result == 0) {
			mav.setViewName("home");
		}
		else {
			mav.setViewName("resources_list");
		}

		return mav;

	}

	//제품 목록 보기를 위한 처리
	public ModelAndView list() {
		mav = new ModelAndView();
		List<resources_Bean> resourcesList = rdao.list();
		mav.addObject("resources_list", resourcesList);
		mav.setViewName("resources_list");
		return mav;
	}

	//제품 상세보기를 위한 처리
	public resources_Bean resources_content_view(int code) {
		return rdao.resources_content_view(code);
	}	

	//제품 수정을 위한 처리
	public void resources_modify(resources_Bean rbean) {
		rdao.modify(rbean);

	}   

	//제품 삭제를 위한 처리
	public void resources_delete(int code) {
		rdao.delete(code);

	}

	public ModelAndView search(String search) {
		mav = new ModelAndView();
		List<resources_Bean> searchList = rdao.search(search);
		mav.addObject("resources_list", searchList);
		mav.setViewName("resources_list");
		return mav;
	}

	public void check_rname(String r_name, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(rdao.check_rname(r_name));
		out.close();
	}
	
	



}
