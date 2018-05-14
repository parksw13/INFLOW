package com.TEAM_INFLOW.INFLOW.service;

import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.TEAM_INFLOW.INFLOW.bean.attended_Bean;
import com.TEAM_INFLOW.INFLOW.dao.attended_Dao;


@Service
public class attended_Management {

	@Autowired
	private attended_Dao adao;
	private ModelAndView mav;

	public void early_signup(attended_Bean atbean) {
		adao.early_signup(atbean);
	}

	public void early(attended_Bean atbean) {
		adao.early(atbean);
	}

	public void attend(attended_Bean atbean) throws ParseException {
		SimpleDateFormat f = new SimpleDateFormat("HH:mm", Locale.KOREA); 
		//d1에 저장된 시간이 지나면 지각이 처리
		Date d1 = f.parse("08:30"); 
		//d2는 출석체크를 한 시간
		Date d2 = f.parse(atbean.getAttended_date2());
		//d2와 d1을 빼서 그 값이 0보다 작거나 같으면 출석 아니면 지각
		if(d2.getTime()-d1.getTime()>0) {
			adao.tardy(atbean);
			System.out.println(atbean.getAttended_date2());
			System.out.println(atbean.getStudent_id());
		}else{
			adao.attend(atbean);
			System.out.println(atbean.getAttended_date2());
			System.out.println(atbean.getStudent_id());
		}
	}
	public ModelAndView list(){
		mav = new ModelAndView();
		List<attended_Bean> attendList = adao.list();
		mav.addObject("attend_list", attendList);
		mav.setViewName("attended");
		return mav;
	}

	public int insert() {
		int insert=adao.insert();

		if(insert>0) {
			return insert;
		}
		else {
			return   update();
		}
	}
	public int update() {
		int update=adao.update();
		return update;
	}

	public void check(HttpServletResponse response) throws Exception {
		int check=adao.check();
		response.setContentType("text/html;charset=utf-8");

		PrintWriter out = response.getWriter();
		if(check>0) {
			out.println("<script>");
			out.println("alert('이미 등록하였습니다!');");
			out.println("location.href='main'");
			out.println("</script>");
			out.close();
		}else{
			insert();
			update();
			out.println("<script>");
			out.println("alert('다음날 출석부가 등록되었습니다.');");
			out.println("location.href='main'");
			out.println("</script>");
			out.close();

		}
	}
}