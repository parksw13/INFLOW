package com.TEAM_INFLOW.INFLOW;

import java.text.ParseException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.TEAM_INFLOW.INFLOW.bean.attended_Bean;
import com.TEAM_INFLOW.INFLOW.service.attended_Management;

@Controller
@SessionAttributes("login_users")
public class attended_Controller {

   @Autowired
   private attended_Management am;
   private ModelAndView mav;

   @RequestMapping(value = "/insert_attended", method = RequestMethod.GET)
   public String insert_attened(HttpServletResponse response) throws Exception {
      am.check(response);
      /*am.insert();*/
      /*am.update();*/
      return "main";
   }

   @RequestMapping(value = "/attended", method = RequestMethod.GET)
   public ModelAndView attened() {
      mav=am.list();
      return mav; //list.jsp濡?由щ떎?대젆??   
      }
   //異쒖꽍?섍린
   @RequestMapping(value = "/attend", method = RequestMethod.GET)
   public String attend(HttpServletRequest request) throws ParseException {
      attended_Bean atbean = new attended_Bean();
      atbean.setAttended_date2(request.getParameter("attended_date2"));
      atbean.setStudent_id(request.getParameter("student_id"));
      am.attend(atbean);
      return "redirect:main";
   }
   //議고눜 ?좎껌
   @RequestMapping(value = "early", method = RequestMethod.GET)
   public String Early(@ModelAttribute attended_Bean atbean) {
      am.early(atbean);
      return "redirect:main";
   }
   //議고눜 ?뱀씤
   @RequestMapping(value = "early_signup", method = RequestMethod.GET)
   public String Early_signup(@ModelAttribute attended_Bean atbean) {
      am.early_signup(atbean);
      return "redirect:main";
   }

}