package com.TEAM_INFLOW.INFLOW.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.TEAM_INFLOW.INFLOW.bean.c_Bean;

@Repository
public class c_Dao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//일정 등록
	public int write(c_Bean cbean) {
		return sqlSession.insert("c_Bean.write", cbean);
	}
	
	//일정 목록보기
	public List<c_Bean> list(){
		return sqlSession.selectList("c_Bean.clist");
	}
	
	//일정 삭제
	public int delete(int c_num) {
		return sqlSession.delete("c_Bean.delete", c_num);
		  }
	//일정상세보기
	public c_Bean contents_view(int c_num) {
	    return sqlSession.selectOne("c_Bean.view", c_num);
	   }

}
