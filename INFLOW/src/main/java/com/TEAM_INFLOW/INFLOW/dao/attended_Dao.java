package com.TEAM_INFLOW.INFLOW.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.TEAM_INFLOW.INFLOW.bean.attended_Bean;

@Repository
public class attended_Dao {

   @Autowired
   private SqlSessionTemplate sqlSession;

   public int early_signup(attended_Bean atbean) {
      return sqlSession.update("attended_Bean.early_signup",atbean);

   }

   public int early(attended_Bean atbean) {
      return sqlSession.update("attended_Bean.early",atbean);
   }

   public int attend(attended_Bean atbean) {
      return sqlSession.update("attended_Bean.attend",atbean);   
   }

   public int tardy(attended_Bean atbean) {
      return sqlSession.update("attended_Bean.tardy",atbean);   
   }

   public List<attended_Bean> list() {
      return sqlSession.selectList("attended_Bean.list");
   }

   public int insert() {
      return sqlSession.insert("attended_Bean.insert_attend");
   }
   public int update() {
      return sqlSession.update("attended_Bean.update_attend");
   }

   public int check() {
      return sqlSession.selectOne("attended_Bean.check");
   }
}