package com.TEAM_INFLOW.INFLOW.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.TEAM_INFLOW.INFLOW.bean.sr_Bean;




@Repository
public class sr_Dao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public int write(sr_Bean srbean) {
		return sqlSession.insert("sr_Bean.write", srbean);
	}
	public List<sr_Bean> list(){
		return sqlSession.selectList("sr_Bean.boardlist");
	}
	public void increaseViewcnt(int sr_num) {
		sqlSession.update("sr_Bean.increaseViewcnt", sr_num);
	}
	public sr_Bean content_view(int sr_num) {
		return sqlSession.selectOne("sr_Bean.view", sr_num);
	}
	public int modify(sr_Bean srbean) {
		return sqlSession.update("sr_Bean.modify", srbean);
	}
	public int delete(int sr_num) {
		return sqlSession.delete("sr_Bean.delete", sr_num);
	}
	
}
