package com.TEAM_INFLOW.INFLOW.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.TEAM_INFLOW.INFLOW.bean.nb_Bean;
import com.TEAM_INFLOW.INFLOW.dao.nb_Dao;

@Service
public class nb_Management {
	
	@Autowired
	private nb_Dao nbdao;
	private ModelAndView mav;
	
	//글 쓰기
	public ModelAndView write(nb_Bean nbbean) {
		mav=new ModelAndView();
		int result=nbdao.write(nbbean);
		if(result==0) {
			mav.setViewName("home");
		}else {
			mav.setViewName("nb_list");
		}
		return mav;
	}
		
	//목록 보기를 위한 처리
	public ModelAndView list() {
		mav=new ModelAndView();
		List<nb_Bean> boardlist=nbdao.list();
		mav.addObject("board_list", boardlist);
		mav.setViewName("nb_list");
		return mav;
	}
	
	//조회수 증가를 위한 처리
	public void increaseViewcnt(int nb_num) {
		nbdao.increaseViewcnt(nb_num);
	}
	
	//글 상세보기를 위한 처리
	public nb_Bean content_view(int nb_num) {
		return nbdao.content_view(nb_num);
	}
	
	//글 수정을 위한 처리
	public void modify(nb_Bean nbbean) {
		nbdao.modify(nbbean);
		
	}
	
	//글 삭제를 위한 처리
	public void delete(int nb_num) {
		nbdao.delete(nb_num);
		
	}
	
}
	
	
	
	

