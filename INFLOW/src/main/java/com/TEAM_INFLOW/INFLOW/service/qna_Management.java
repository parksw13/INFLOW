package com.TEAM_INFLOW.INFLOW.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.TEAM_INFLOW.INFLOW.bean.qna_Bean;
import com.TEAM_INFLOW.INFLOW.bean.reply_Bean;
import com.TEAM_INFLOW.INFLOW.dao.qna_Dao;

@Service
public class qna_Management {
	
	@Autowired
	private qna_Dao qnadao;
	private ModelAndView mav;
	
	//글 쓰기
	public ModelAndView write(qna_Bean qnabean) {
		mav=new ModelAndView();
		int result=qnadao.write(qnabean);
		if(result==0) {
			mav.setViewName("home");
		}else {
			mav.setViewName("qna_list");
		}
		return mav;
	}
		
	//목록 보기를 위한 처리
	public ModelAndView list() {
		mav=new ModelAndView();
		List<qna_Bean> boardlist=qnadao.list();
		mav.addObject("board_list", boardlist);
		mav.setViewName("qna_list");
		return mav;
	}
	
	//조회수 증가를 위한 처리
	public void increaseViewcnt(int qna_num) {
		qnadao.increaseViewcnt(qna_num);
	}
	
	//글 상세보기를 위한 처리
	public qna_Bean content_view(int qna_num) {
		return qnadao.content_view(qna_num);
	}
	
	//글 수정을 위한 처리
	public void modify(qna_Bean qnabean) {
		qnadao.modify(qnabean);
		
	}
	
	//글 삭제를 위한 처리
	public void delete(int qna_num) {
		qnadao.delete(qna_num);
		
	}
	
	//댓글 작성
	public ModelAndView reply(reply_Bean rebean) {
		mav=new ModelAndView();
		int result=qnadao.reply(rebean);
		
		if(result==0) {
			mav.setViewName("home");
		}else {
			mav.setViewName("qna_content_view?qna_num="+rebean.getB_num());
		}
		return mav;	
	}
	
	//댓글 목록 보기를 위한 처리
		public List<reply_Bean> reply_list(int qna_num) {
			List<reply_Bean> replyList=qnadao.reply_list(qna_num);
			return replyList;
		}
		
	//글 삭제를 위한 처리
		public void reply_delete(int reply_num) {
			qnadao.reply_delete(reply_num);
			
		}
	
}
	
	
	
	

