package com.TEAM_INFLOW.INFLOW.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.TEAM_INFLOW.INFLOW.bean.message_Bean;
import com.TEAM_INFLOW.INFLOW.dao.message_dao;


@Service
public class message_Management {
	
	@Autowired
	private message_dao mdao;
	private ModelAndView mav;
	
	//글 쓰기
	public ModelAndView write(message_Bean mbean) {
		mav = new ModelAndView();
		int result = mdao.write(mbean);
		if(result == 0) {
			mav.setViewName("home");
		}
		else {
			mav.setViewName("message_sendlist");
		}
		
		return mav;
		
	}
	
	//목록 보기를 위한 처리
	public ModelAndView sendlist() {
		mav = new ModelAndView();
		List<message_Bean> messageList = mdao.list();
		mav.addObject("message_list", messageList);
		mav.setViewName("message_sendlist");
		return mav;
	}
	//목록 보기를 위한 처리
		public ModelAndView relist() {
			mav = new ModelAndView();
			List<message_Bean> messageList = mdao.list();
			mav.addObject("message_list", messageList);
			mav.setViewName("message_relist");
			return mav;
		}
  
	   //글 상세보기를 위한 처리
	   public message_Bean content_view(int m_num) {
	      return mdao.content_view(m_num);
	   }

	   //글 삭제를 위한 처리
	   public void delete(int m_num) {
		   mdao.delete(m_num);
	      
	   }


}
