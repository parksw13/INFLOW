package com.TEAM_INFLOW.INFLOW.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.TEAM_INFLOW.INFLOW.bean.message_Bean;


@Repository
public class message_dao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//글쓰기
	public int write(message_Bean mbean) {
		return sqlSession.insert("message_Bean.write", mbean);
	}
	
	//글목록 보기
	public List<message_Bean> list() {
		return sqlSession.selectList("message_Bean.boardlist");
	}
	
	//상세 보기
	public message_Bean content_view(int m_num) {
	    return sqlSession.selectOne("message_Bean.view", m_num);
	   }
	//글 삭제
	public int delete(int m_num) {
	   return sqlSession.delete("message_Bean.delete", m_num);
	   }

}
