package com.TEAM_INFLOW.INFLOW;

import java.io.File;
import java.io.IOException;

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

import com.TEAM_INFLOW.INFLOW.bean.sr_Bean;
import com.TEAM_INFLOW.INFLOW.service.sr_Management;


@Controller
@SessionAttributes("login_users")
public class sr_Controller {
	
	@Autowired
	private sr_Management srm;
	private ModelAndView mav;
	
	//글 목록 보기로 이동
		@RequestMapping(value = "/sr_list", method = RequestMethod.GET)
		public ModelAndView list() {
			mav=srm.list();
			return mav;
		}

		//글 상세보기로 이동
		@RequestMapping(value = "/sr_content_view", method = RequestMethod.GET)
		public ModelAndView content_view(@RequestParam("sr_num") int sr_num) {
			//조회수 증가 처리
			srm.increaseViewcnt(sr_num);
			mav=new ModelAndView();
			mav.setViewName("sr_content_view");
			mav.addObject("sr_content_view",srm.content_view(sr_num));
			return mav;
		}

		//글 쓰기 화면으로 이동
		@RequestMapping(value = "/sr_write_view", method = RequestMethod.GET)
		public String write_view() {

			return "sr_write_view";
		}

		//글 쓰기(클라이언트가 쓴 내용을 DB에 반영하는 부분)
		@RequestMapping(value = "/sr_write", method = RequestMethod.POST)
		public String write(MultipartHttpServletRequest mtfRequest) {
			//글 쓰기를 위한 메소드 호출
			sr_Bean srbean= new sr_Bean();
			String contents=mtfRequest.getParameter("sr_contents");
			String writer=mtfRequest.getParameter("sr_writer");
			String title=mtfRequest.getParameter("sr_title");    
			MultipartFile mf = mtfRequest.getFile("sr_upload");

			String path = "D:\\FINAL\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\INFLOW\\resources\\upload\\";	 
			
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명
			long fileSize = mf.getSize(); // 파일 사이즈
			srbean.setSr_contents(contents);
			srbean.setSr_title(title);
			srbean.setSr_writer(writer);
			srbean.setSr_upload(originFileName);

			String safeFile = path + originFileName;

			try {
				mf.transferTo(new File(safeFile));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			srm.write(srbean);   
			//글 쓰기 완료 후 list.jsp로 리다이렉트
			return "redirect:sr_list";
		}

		//글 수정하기로 이동
		@RequestMapping(value = "/sr_modify_view", method = RequestMethod.GET)
		public ModelAndView modify_view(@RequestParam("sr_num") int sr_num) {

			mav=new ModelAndView();
			mav.setViewName("sr_modify_view");
			mav.addObject("sr_content_view",srm.content_view(sr_num));
			return mav;
		}

		//글 수정하기(글 상세보기에서)
		@RequestMapping(value = "/sr_modify", method = RequestMethod.POST)
		public String modify(@ModelAttribute sr_Bean srbean, @RequestParam("sr_num") int sr_num) {
			srm.modify(srbean);
			return "redirect:sr_content_view?sr_num="+sr_num;
		}

		//글 삭제하기(글 상세보기에서)
		@RequestMapping(value = "/sr_delete")
		public String delete(@RequestParam("sr_num") int sr_num) {
			srm.delete(sr_num);
			return "redirect:sr_list";
		}

		//파일 다운로드
		@RequestMapping(value = "/file_down")
		public ModelAndView download(@RequestParam("sr_upload") String sr_upload) {
			mav=new ModelAndView();
			mav.addObject("file_name", sr_upload);
			mav.setViewName("file_down");
			return mav;
		}
}
