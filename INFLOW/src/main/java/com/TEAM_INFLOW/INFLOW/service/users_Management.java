package com.TEAM_INFLOW.INFLOW.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.TEAM_INFLOW.INFLOW.bean.users_Bean;
import com.TEAM_INFLOW.INFLOW.dao.class_Dao;
import com.TEAM_INFLOW.INFLOW.dao.users_Dao;


@Service
public class users_Management {

	@Autowired
	private class_Dao classdao;
	@Autowired
	private users_Dao uDao;
	private ModelAndView mav;


	//회원가입 처리를 위한 메소드
	public ModelAndView join(HttpServletResponse response, users_Bean ub) throws Exception {

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		int count=classdao.classcount(ub.getClass_name());
		System.out.println(count);	
		int maxnum=classdao.maxcount(ub.getClass_name());
		System.out.println(maxnum);
		//회원가입 성공, 실패여부 판단을 위한 처리 부분
		if(count>=maxnum) {
			out.println("<script>");
			out.println("alert('클래스 정원이 가득찼습니다.');");
			out.println("location.href='join';");
			out.println("</script>");
			out.close();
			return mav;
		}
		else if(uDao.check_id(ub.getId())==1) {
			out.println("<script>");
			out.println("alert('동일한 아이디가 있습니다.');");
			out.println("location.href='join';");
			out.println("</script>");
			out.close();
			return mav;
		} else if (uDao.check_email(ub.getEmail()) == 1) {
			out.println("<script>");
			out.println("alert('동일한 이메일이 있습니다.');");
			out.println("location.href='join';");
			out.println("</script>");
			out.close();
			return mav;
		} 
		else {
			uDao.join(ub);
			
			return mav;
		}
	}

	// 아이디 중복 검사(AJAX)
	public void check_id(String id, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(uDao.check_id(id));
		out.close();
	}

	// 이메일 중복 검사(AJAX)

	public void check_email(String email, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(uDao.check_email(email));
		out.close();
	}


	//로그인 처리(service)
	public ModelAndView login(String id, String pw)  {
		users_Bean users=new users_Bean(id,pw);
		users_Bean loginUsers=uDao.login(users);
		mav=new ModelAndView();
		if(loginUsers!=null) {
			//id, password가 맞으면 해당 데이터를 login_member라는 속성에 담고 main.jsp로 이동
			mav.addObject("login_users", loginUsers);
			mav.setViewName("main");
			return mav;
		}
		//id, password가 틀리면 loginForm.jsp


		mav.setViewName("loginForm");


		return mav;

	}



	//아이디, 비밀번호 확인 처리
	public void loginCheck(String id, String pw, HttpServletResponse response) throws IOException {
		users_Bean users=new users_Bean(id,pw);
		users=uDao.loginCheck(users);
		if(users==null)
			response.getWriter().print("1"); //해당 아이디 사용 가능
		else
			response.getWriter().print("0"); //해당 아이디 사용 불가
	}

	//회원정보 상세보기
	public users_Bean usersView(String id) {
		return uDao.usersView(id);

	}
	//(수정가능)회원정보 상세보기
	public users_Bean usersEdit(String id) {
		return uDao.usersEdit(id);

	}
	//회원정보 수정 처리
	public ModelAndView edit(users_Bean ub) {
		uDao.edit(ub);
		return mav;
	}

	//회원프로필사진 수정 처리
	public ModelAndView profile_edit(users_Bean ub) {
		uDao.profile_edit(ub);
		return mav;
	}

	//아이디 찾기 처리
	public users_Bean find_id(HttpServletResponse response, String email) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		users_Bean id = uDao.find_id(email);

		if (id == null) {
			out.println("<script>");
			out.println("alert('해당 이메일 주소로 가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return id;
		}
	}

	//비밀번호찾기 메일 발송 처리
	public void send_mail(users_Bean ub, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";		
		String hostSMTPid = "parksw13@naver.com"; // 본인의 아이디 입력		
		String hostSMTPpwd = "sw0909SW!"; // 비밀번호 입력

		// 보내는 사람 EMail, 제목, 내용 
		String fromEmail = "parksw13@naver.com"; // 보내는 사람 eamil
		String fromName = "INFLOW";  // 보내는 사람 이름
		String subject = ""; // 제목
		String park = ""; //내용


		if(div.equals("find_pw")) {
			subject = "INFLOW 임시 비밀번호 입니다.";
			park += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			park += "<h3 style='color: blue;'>";
			park += ub.getId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			park += "<p>임시 비밀번호 : ";
			park += ub.getPw() + "</p></div>";
		}


		// 받는 사람 E-Mail 주소
		String mail = ub.getEmail();  // 받는 사람 email

		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465);	// SMTP 포트 번호 입력

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(park); // 본문 내용
			email.send();			
		} catch (Exception e) {
			System.out.println("메일발송 실패: "+ e);
		}

	}

	//비밀번호 찾기 처리
	public void find_pw(HttpServletResponse response, users_Bean ub) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();	
		System.out.println(ub.getId());
		// 아이디가 없으면
		if(uDao.check_id(ub.getId()) == 0) {
			out.print("아이디가 없습니다.");
			out.close();
		}
		// 가입에 사용한 이메일이 아니면
		else if(!ub.getEmail().equals(uDao.usersView(ub.getId()).getEmail() ) )  {
			out.print("잘못된 이메일 입니다.");
			out.close();

		}else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			ub.setPw(pw);
			// 비밀번호 변경
			uDao.update_pw(ub);
			// 비밀번호 변경 메일 발송
			send_mail(ub, "find_pw");

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}

	//회원목록 보기
	public ModelAndView list() {
		mav=new ModelAndView();
		List<users_Bean> userslist=uDao.list();
		mav.addObject("users_list", userslist);
		mav.setViewName("usersList");
		return mav;
	}

	//회원 삭제
	public void users_delete(String id) {
		uDao.users_delete(id);

	}

	//유저 검색
	public ModelAndView usersearch(String usersearch) {
		mav = new ModelAndView();
		List<users_Bean> searchList = uDao.usersearch(usersearch);
		mav.addObject("users_list", searchList);
		mav.setViewName("usersList");
		return mav;
	}



}


