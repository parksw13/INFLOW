package com.TEAM_INFLOW.INFLOW.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.TEAM_INFLOW.INFLOW.bean.resources_Bean;



@Repository
public class r_Dao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	//제품 등록
	public int write(resources_Bean rbean) {
		return sqlSession.insert("resources_Bean.write", rbean);
	}

	//제품 목록 보기
	public List<resources_Bean> list() {
		return sqlSession.selectList("resources_Bean.resourcesList");
	}

	//상세 보기
	public resources_Bean resources_content_view(int code) {
		return sqlSession.selectOne("resources_Bean.view", code);
	}

	//글 수정
	public int modify(resources_Bean rbean) {
		return sqlSession.update("resources_Bean.modify", rbean);
	}

	//글 삭제
	public int delete(int code) {
		return sqlSession.delete("resources_Bean.delete", code);
	}
	//
	public List<resources_Bean> search(String search) {
		return sqlSession.selectList("resources_Bean.searchList", search);
	}

	public int check_rname(String r_name) throws Exception{
		return sqlSession.selectOne("resources_Bean.check_rname", r_name);
	}

	



}
