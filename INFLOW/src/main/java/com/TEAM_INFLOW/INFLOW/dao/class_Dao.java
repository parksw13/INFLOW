package com.TEAM_INFLOW.INFLOW.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.TEAM_INFLOW.INFLOW.bean.class_Bean;


@Repository
public class class_Dao {
	
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	public List<class_Bean> list(){
		return sqlSession.selectList("class_Bean.class_list");
	}
	
	public int write(class_Bean classbean) {
		return sqlSession.insert("class_Bean.class_write", classbean);
	}
	
	public int modify(class_Bean classbean) {
		return sqlSession.update("class_Bean.class_modify", classbean);
	}
	
	
	public int delete(String class_name) {
		return sqlSession.delete("class_Bean.class_delete", class_name);
	}
	
	public class_Bean content_view(String class_name) {
		return sqlSession.selectOne("class_Bean.class_view", class_name);
	}

	public int classcount(String class_name) {
		return sqlSession.selectOne("class_Bean.class_count", class_name);
	}

	public int maxcount(String class_name) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("class_Bean.class_max", class_name);
	}

}
