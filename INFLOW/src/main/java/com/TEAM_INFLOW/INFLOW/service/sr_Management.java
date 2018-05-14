package com.TEAM_INFLOW.INFLOW.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.TEAM_INFLOW.INFLOW.bean.sr_Bean;
import com.TEAM_INFLOW.INFLOW.dao.sr_Dao;






@Service
public class sr_Management {
	
	@Autowired
	private sr_Dao srdao;
	private ModelAndView mav;
	
	//글 쓰기
	public ModelAndView write(sr_Bean srbean) {
		mav=new ModelAndView();
		int result=srdao.write(srbean);
		if(result==0) {
			mav.setViewName("home");
		}else {
			mav.setViewName("sr_list");
		}
		return mav;
	}
		
	//목록 보기를 위한 처리
	public ModelAndView list() {
		mav=new ModelAndView();
		List<sr_Bean> boardlist=srdao.list();
		mav.addObject("board_list", boardlist);
		mav.setViewName("sr_list");
		return mav;
	}
	
	//조회수 증가를 위한 처리
	public void increaseViewcnt(int sr_num) {
		srdao.increaseViewcnt(sr_num);
	}
	
	//글 상세보기를 위한 처리
	public sr_Bean content_view(int sr_num) {
		return srdao.content_view(sr_num);
	}
	
	//글 수정을 위한 처리
	public void modify(sr_Bean srbean) {
		srdao.modify(srbean);
		
	}
	
	//글 삭제를 위한 처리
	public void delete(int sr_num) {
		srdao.delete(sr_num);
		
	}
	
}
	
	
	
	

