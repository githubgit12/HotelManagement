package com.gx.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gx.po.UserPo;

@Controller
public class Check {

	@RequestMapping("check")
	public void check(HttpServletResponse response, HttpServletRequest request) {
		//ModelAndView mv;
		UserPo user = (UserPo) request.getSession().getAttribute("user");
		if (user == null) {
			try {
				response.sendRedirect("WEB-INF/main/main.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			try {
				response.sendRedirect("WEB-INF/main/result.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
}
