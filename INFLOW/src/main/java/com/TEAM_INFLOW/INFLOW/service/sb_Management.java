package com.TEAM_INFLOW.INFLOW.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.TEAM_INFLOW.INFLOW.bean.sb_Bean;
import com.TEAM_INFLOW.INFLOW.dao.sb_Dao;




@Service
public class sb_Management {
	
	@Autowired
	private sb_Dao sbdao;
	private ModelAndView mav;
	
	//글 쓰기
	public ModelAndView write(sb_Bean sbbean) {
		mav=new ModelAndView();
		int result=sbdao.write(sbbean);
		if(result==0) {
			mav.setViewName("home");
		}else {
			mav.setViewName("sb_list");
		}
		return mav;
	}
		
	//목록 보기를 위한 처리
	public ModelAndView list() {
		mav=new ModelAndView();
		List<sb_Bean> boardlist=sbdao.list();
		mav.addObject("board_list", boardlist);
		mav.setViewName("sb_list");
		return mav;
	}
	// 답글 쓰기 페이지
		public ModelAndView re_list(int sb_num) {
			mav=new ModelAndView();
			mav.addObject("ree_num", sb_num);
			mav.setViewName("sb_re_write_view");
			return mav;
		}
	
	//조회수 증가를 위한 처리
	public void increaseViewcnt(int sb_num) {
		sbdao.increaseViewcnt(sb_num);
	}
	
	//글 상세보기를 위한 처리
	public sb_Bean content_view(int sb_num) {
		return sbdao.content_view(sb_num);
	}
	
	//글 수정을 위한 처리
	public void modify(sb_Bean sbbean) {
		sbdao.modify(sbbean);
		
	}
	
	//글 삭제를 위한 처리
	public void delete(int sb_num) {
		sbdao.delete(sb_num);
		
	}

	//답글 쓰기
	public ModelAndView re_write(sb_Bean sbbean) {
		mav=new ModelAndView();
		int result=sbdao.re_write(sbbean);
		if(result==0) {
			mav.setViewName("home");
		}else {
			mav.setViewName("sb_list");
		}
		return mav;
		}

	
	}
	
	
	
	

