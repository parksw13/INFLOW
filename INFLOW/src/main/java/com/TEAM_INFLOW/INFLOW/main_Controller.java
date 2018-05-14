package com.TEAM_INFLOW.INFLOW;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;


import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


import com.TEAM_INFLOW.INFLOW.bean.users_Bean;

import com.TEAM_INFLOW.INFLOW.service.class_Management;

import com.TEAM_INFLOW.INFLOW.service.users_Management;

@Controller
@SessionAttributes("login_users")
public class main_Controller {

	@Autowired
	private users_Management um;

	@Autowired
	private class_Management csm;
	private ModelAndView mav;

	//실행시 초기화면
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {

		return "main_view";
	}
	
	@RequestMapping(value = "/main_view", method = RequestMethod.GET)
	public String main() {

		return "main_view";
	}

	//회원가입 화면
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public ModelAndView join() {
		mav=csm.joinlist();
		return mav;
	}


	// 아이디 중복 검사(AJAX)
	@RequestMapping(value = "/check_id", method = RequestMethod.POST)
	public void check_id(@RequestParam("id") String id, HttpServletResponse response) throws Exception{
		um.check_id(id, response);
	}

	// 이메일 중복 검사(AJAX)
	@RequestMapping(value = "/check_email", method = RequestMethod.POST)
	public void check_email(@RequestParam("email") String email, HttpServletResponse response) throws Exception{
		um.check_email(email, response);
	}

	//회원가입 처리
	@RequestMapping(value = "/joinInsert", method = RequestMethod.POST)
	public ModelAndView join(MultipartHttpServletRequest mtfRequest, HttpServletResponse response) throws Exception {

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		users_Bean ub= new users_Bean();
		String id=mtfRequest.getParameter("id");
		String pw=mtfRequest.getParameter("pw");
		String name=mtfRequest.getParameter("name");
		String addr=mtfRequest.getParameter("addr");
		String num=mtfRequest.getParameter("num");
		String tel=mtfRequest.getParameter("tel");
		String grade=mtfRequest.getParameter("grade");
		MultipartFile mf=mtfRequest.getFile("profile_img");
		String email=mtfRequest.getParameter("email");
		String class_name=mtfRequest.getParameter("class_name");

		String path = "D:\\FINAL\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\INFLOW\\resources\\upload\\";

		String originFileName = mf.getOriginalFilename(); // 원본 파일 명
		long fileSize = mf.getSize(); // 파일 사이즈
		ub.setId(id);
		ub.setPw(pw);
		ub.setName(name);
		ub.setAddr(addr);
		ub.setNum(num);
		ub.setTel(tel);
		ub.setGrade(grade);
		ub.setProfile_img(originFileName);
		ub.setEmail(email);
		ub.setClass_name(class_name);


		System.out.println("originFileName : " + originFileName);
		System.out.println("fileSize : " + fileSize);

		String safeFile = path + originFileName;

		try {
			mf.transferTo(new File(safeFile));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		mav=um.join(response,ub);   

		out.println("<script>");
		out.println("alert('회원등록이 완료되었습니다.');");
		out.println("location.href='main';");
		out.println("</script>");
		out.close();

		return mav;
	}

	//로그인 처리(controller)
	@RequestMapping(value = "/loginForm", method = RequestMethod.POST)
	public ModelAndView login(
			@RequestParam("id") String id,
			@RequestParam("pw") String pw){				
		mav=um.login(id,pw);
		return mav;
	}

	//아이디, 비밀번호 확인 처리
	@RequestMapping(value="/loginCheck", method= RequestMethod.POST)
	public void loginCheck(HttpServletResponse response,
			@RequestParam("id") String id,
			@RequestParam("pw") String pw) throws IOException {
		//Service클래스의 idOverlap 메소드 호출
		um.loginCheck(id,pw,response);
	}

	//로그아웃 처리
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(SessionStatus sessionStatus) {
		sessionStatus.setComplete(); 
		return "redirect:/";
	}

	//회원정보 상세보기
	@RequestMapping(value = "/usersView", method = RequestMethod.POST)
	public ModelAndView usersView(@RequestParam("id") String id) {
		mav=new ModelAndView();
		mav.setViewName("usersView");
		mav.addObject("usersView",um.usersView(id));
		return mav;
	}

	//(수정가능한) 회원정보 상세보기
	@RequestMapping(value = "/usersEdit", method = RequestMethod.POST)
	public ModelAndView usersEdit(@RequestParam("id") String id) {
		mav=new ModelAndView();
		mav.setViewName("usersEdit");
		mav.addObject("usersEdit",um.usersEdit(id));
		return mav;
	}

	//회원정보 수정처리
	@RequestMapping(value= "/edit", method=RequestMethod.POST)
	public ModelAndView Edit(users_Bean ub) { 	
		mav=um.edit(ub);
		mav.setViewName("usersView");
		mav.addObject("usersView",ub);

		return mav;
	}

	//회원프로필 사진 수정처리
	@RequestMapping(value= "/profile_edit", method=RequestMethod.POST)
	public ModelAndView profile_edit(
			MultipartHttpServletRequest mtfRequest) {
		System.out.println("사진변경");
		users_Bean ub= new users_Bean();
		String id=mtfRequest.getParameter("id");
		MultipartFile mf=mtfRequest.getFile("profile_img");


		String path = "D:\\FINAL\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\INFLOW\\resources\\upload\\";

		String originFileName = mf.getOriginalFilename(); // 원본 파일 명
		long fileSize = mf.getSize(); // 파일 사이즈
		ub.setId(id);
		ub.setProfile_img(originFileName);


		System.out.println("originFileName : " + originFileName);
		System.out.println("fileSize : " + fileSize);

		String safeFile = path + originFileName;

		try {
			mf.transferTo(new File(safeFile));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}


		mav=um.profile_edit(ub);
		mav.setViewName("usersEdit");
		mav.addObject("usersEdit",um.usersEdit(id));
		return mav;
	}

	//아이디찾기 폼
	@RequestMapping(value = "/find_id_form", method = RequestMethod.GET)
	public String find_id_form() throws Exception{
		return "findIDForm";
	}

	//아이디찾기 처리
	@RequestMapping(value = "/find_id", method = RequestMethod.POST)
	public ModelAndView find_id(HttpServletResponse response,
			@RequestParam("email") String email) throws Exception{

		mav=new ModelAndView();
		mav.setViewName("findIDView");
		mav.addObject("findIDView",um.find_id(response, email));

		return mav;
	}

	//비밀번호 찾기 폼
	@RequestMapping(value = "/find_pw_form", method = RequestMethod.GET)
	public String find_pw_form() throws Exception{
		return "findPWForm";
	}

	//비밀번호 찾기 처리
	@RequestMapping(value = "/find_pw", method = RequestMethod.POST)
	public void find_pw(@ModelAttribute users_Bean ub, HttpServletResponse response) throws Exception{
		um.find_pw(response, ub);
	}



	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {

		return "loginForm";
	}


	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {

		return "main";
	}
	//회원 목록 보기로 이동
	@RequestMapping(value = "/usersList", method = RequestMethod.GET)
	public ModelAndView userList() {
		mav=um.list();
		return mav;
	}

	//회원 삭제
	@RequestMapping(value = "/users_delete")
	public String users_delete(@RequestParam("id") String id) {
		um.users_delete(id);
		return "redirect:usersList";
	}

	//유저 검색 기능
	@RequestMapping(value = "/usersearch", method = RequestMethod.GET)
	public ModelAndView search_view(@RequestParam("usersearch") String usersearch) {
		mav = um.usersearch(usersearch);
		return mav;
	}

}