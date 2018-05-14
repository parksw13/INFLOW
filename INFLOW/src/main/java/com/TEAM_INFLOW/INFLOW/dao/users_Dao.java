package com.TEAM_INFLOW.INFLOW.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.TEAM_INFLOW.INFLOW.bean.users_Bean;



@Repository
public class users_Dao {

	@Autowired
	private SqlSessionTemplate sqlSession;


	//회원가입 처리
	public int join(users_Bean ub) {
		return sqlSession.insert("users_Bean.usersInsert", ub);
	}

	// 아이디 중복 검사
	public int check_id(String id) throws Exception{
		return sqlSession.selectOne("users_Bean.check_id", id);
	}

	// 이메일 중복 검사
	public int check_email(String email) throws Exception{
		return sqlSession.selectOne("users_Bean.check_email", email);
	}

	//로그인처리(dao)
	public users_Bean login(users_Bean ub) {
		return sqlSession.selectOne("users_Bean.login",ub);
	}


	//아이디, 비밀번호 확인하여 로그인처리
	public users_Bean loginCheck(users_Bean ub) {
		return sqlSession.selectOne("users_Bean.loginCheck", ub);
	}

	//회원정보 보기
	public users_Bean usersView(String id) {
		return sqlSession.selectOne("users_Bean.view", id);

	}
	//(수정가능)회원정보 보기
	public users_Bean usersEdit(String id) {
		return sqlSession.selectOne("users_Bean.editview", id);

	}
	//회원정보 수정 처리
	public int edit(users_Bean ub) {
		return sqlSession.update("users_Bean.edit", ub);

	}
	//회원프로필사진 수정 처리
	public int profile_edit(users_Bean ub) {
		return sqlSession.update("users_Bean.profile_edit", ub);

	}

	//아이디찾기 처리
	public users_Bean find_id(String email) {
		return sqlSession.selectOne("users_Bean.find_id", email);
	}

	//임시비밀번호로 변경
	public int update_pw(users_Bean ub) throws Exception{
		return sqlSession.update("users_Bean.update_pw", ub);
	}

	//회원목록보기
	public List<users_Bean> list() {
		return sqlSession.selectList("users_Bean.userslist");
	}

	//회원삭제
	public void users_delete(String id) {
		sqlSession.delete("users_Bean.users_delete", id);
	}

	//유저 검색
	public List<users_Bean> usersearch(String usersearch) {
		return sqlSession.selectList("users_Bean.searchList", usersearch);
	}








}
