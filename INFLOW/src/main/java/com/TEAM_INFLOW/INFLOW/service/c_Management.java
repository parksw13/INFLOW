package com.TEAM_INFLOW.INFLOW.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.TEAM_INFLOW.INFLOW.bean.c_Bean;
import com.TEAM_INFLOW.INFLOW.dao.c_Dao;



@Service
public class c_Management {
	
	@Autowired
	private c_Dao cdao;
	private ModelAndView mav;
	
	//글 쓰기
	public ModelAndView write(c_Bean cbean) {
		mav=new ModelAndView();
		int result=cdao.write(cbean);
		if(result==0) {
			mav.setViewName("home");
		}else {
			mav.setViewName("redirect:calendar_main");
		}
		return mav;
	}
	
	//목록 보기를 위한 처리
		public ModelAndView list() {
			mav=new ModelAndView();
			List<c_Bean> clist=cdao.list();
			mav.addObject("c_list", clist);
			mav.setViewName("calendar_main");
			return mav;
		}
	//일정 삭제
		public void delete(int c_num) {
			cdao.delete(c_num);
		}
		
	//일정 상세보기를 위한 처리
		public c_Bean contents_view(int c_num) {
		   return cdao.contents_view(c_num);
		   }

}
