package com.TEAM_INFLOW.INFLOW.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.TEAM_INFLOW.INFLOW.bean.sb_Bean;




@Repository
public class sb_Dao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public int write(sb_Bean sbbean) {
		return sqlSession.insert("sb_Bean.write", sbbean);
	}
	public List<sb_Bean> list(){
		return sqlSession.selectList("sb_Bean.boardlist");
	}
	public void increaseViewcnt(int sb_num) {
		sqlSession.update("sb_Bean.increaseViewcnt", sb_num);
	}
	public sb_Bean content_view(int sb_num) {
		return sqlSession.selectOne("sb_Bean.view", sb_num);
	}
	public int modify(sb_Bean sbbean) {
		return sqlSession.update("sb_Bean.modify", sbbean);
	}
	public int delete(int sb_num) {
		return sqlSession.delete("sb_Bean.delete", sb_num);
	}
	public int re_write(sb_Bean sbbean) {
		return sqlSession.insert("sb_Bean.re_write", sbbean);
	}

}
