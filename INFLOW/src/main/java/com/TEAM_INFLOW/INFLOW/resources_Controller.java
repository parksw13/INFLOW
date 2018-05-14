package com.TEAM_INFLOW.INFLOW;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.TEAM_INFLOW.INFLOW.bean.resources_Bean;
import com.TEAM_INFLOW.INFLOW.service.r_Management;




@Controller
@SessionAttributes("login_users")
public class resources_Controller {

	@Autowired
	private r_Management rm;
	private ModelAndView mav;

	//제품 등록 요청 (클라이언트가 쓴 내용을 DB에 반영하는 부분)
	@RequestMapping(value = "/resources_write", method = RequestMethod.POST)
	public String write(MultipartHttpServletRequest mtfRequest) {
		//글 쓰기를 위한 메소드 호출
		resources_Bean rbean= new resources_Bean();
		String division=mtfRequest.getParameter("division");
		String r_name=mtfRequest.getParameter("r_name");
		int stock=Integer.parseInt(mtfRequest.getParameter("stock"));
		int max_stock=Integer.parseInt(mtfRequest.getParameter("max_stock"));  
		MultipartFile mf = mtfRequest.getFile("r_file");

		String path = "D:\\FINAL\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\INFLOW\\resources\\upload\\";

		String originFileName = mf.getOriginalFilename(); // 원본 파일 명
		long fileSize = mf.getSize(); // 파일 사이즈
		rbean.setDivision(division);
		rbean.setR_name(r_name);
		rbean.setStock(stock);
		rbean.setMax_stock(max_stock);
		rbean.setR_file(originFileName);

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

		rm.write(rbean);   

		//글 쓰기 완료 후 list.jsp로 리다이렉트
		return "redirect:resources_list";
	}



	//제품 등록 화면으로 이동
	@RequestMapping(value = "/resources_write_view", method = RequestMethod.GET)
	public String write_view() {
		return "resources_write";
	}

	//제품 목록 보기로 이동

	@RequestMapping(value = "/resources_list", method = RequestMethod.GET)
	public ModelAndView list_view() {
		mav = rm.list();
		return mav;
	}

	//제품 상세보기 이동

	@RequestMapping(value = "/resources_content_view", method = RequestMethod.GET)
	public ModelAndView resources_content_view(@RequestParam("code") int code) {
		mav = new ModelAndView();
		mav.setViewName("resources_content_view");
		mav.addObject("resources_content_view", rm.resources_content_view(code));
		return mav;
	}

	//제품정보 수정하기

	@RequestMapping(value = "/resources_modify", method = RequestMethod.POST)
	public String resources_modify(@ModelAttribute resources_Bean rbean) {
		rm.resources_modify(rbean);
		return "redirect:resources_list";
	}

	//제품정보 삭제하기
	@RequestMapping(value = "/resources_delete", method = RequestMethod.GET)
	public String resources_delete(@RequestParam("code") int code) {
		rm.resources_delete(code);
		return "redirect:resources_list";
	}

	//검색 기능
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public ModelAndView search_view(@RequestParam("search") String search) {
		mav = rm.search(search);
		return mav;
	}

	// 아이디 중복 검사(AJAX)
	@RequestMapping(value = "/check_rname", method = RequestMethod.POST)
	public void check_rname(@RequestParam("r_name") String r_name, HttpServletResponse response) throws Exception{
		rm.check_rname(r_name, response);
	}
	
	





}
