package com.TEAM_INFLOW.INFLOW.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.TEAM_INFLOW.INFLOW.bean.nb_Bean;


@Repository
public class nb_Dao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int write(nb_Bean nbbean) {
		return sqlSession.insert("nb_Bean.write", nbbean);
	}
	public List<nb_Bean> list(){
		return sqlSession.selectList("nb_Bean.boardlist");
	}
	public void increaseViewcnt(int nb_num) {
		sqlSession.update("nb_Bean.increaseViewcnt", nb_num);
	}
	public nb_Bean content_view(int nb_num) {
		return sqlSession.selectOne("nb_Bean.view", nb_num);
	}
	public int modify(nb_Bean nbbean) {
		return sqlSession.update("nb_Bean.modify", nbbean);
	}
	public int delete(int nb_num) {
		return sqlSession.delete("nb_Bean.delete", nb_num);
	}

}
