package com.TEAM_INFLOW.INFLOW.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.TEAM_INFLOW.INFLOW.bean.qna_Bean;
import com.TEAM_INFLOW.INFLOW.bean.reply_Bean;




@Repository
public class qna_Dao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public int write(qna_Bean qnabean) {
		return sqlSession.insert("qna_Bean.write", qnabean);
	}
	public List<qna_Bean> list(){
		return sqlSession.selectList("qna_Bean.boardlist");
	}
	public void increaseViewcnt(int qna_num) {
		sqlSession.update("qna_Bean.increaseViewcnt", qna_num);
	}
	public qna_Bean content_view(int qna_num) {
		return sqlSession.selectOne("qna_Bean.view", qna_num);
	}
	public int modify(qna_Bean qnabean) {
		return sqlSession.update("qna_Bean.modify", qnabean);
	}
	public int delete(int qna_num) {
		return sqlSession.delete("qna_Bean.delete", qna_num);
	}
	
	public int reply(reply_Bean rebean) {
		return sqlSession.insert("reply_Bean.reply", rebean);
	}
	
	public List<reply_Bean> reply_list(int qna_num){
		return sqlSession.selectList("reply_Bean.replylist", qna_num);
	}
	
	public int reply_delete(int reply_num) {
		return sqlSession.delete("reply_Bean.reply_delete", reply_num);
	}

}
