package com.gx.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gx.page.Page;
import com.gx.po.UserPo;
import com.gx.service.UserService;

@Controller
@RequestMapping("/userManage")
public class userManage {
	@Autowired
	private UserService userService;

	@RequestMapping("/tolist")
	public ModelAndView tolist(HttpServletRequest request, Integer currentPage, String txtname) {
		ModelAndView mv = null;
		mv = new ModelAndView("/userManage/list");
		Page<UserPo> vo = new Page<UserPo>();
		if (currentPage == null) {
			currentPage = 1;
		} else if (currentPage == 0) {
			currentPage = 1;
		}
		if (txtname == null) {
			txtname = "";
		}
		vo.setCurrentPage(currentPage);
		vo = this.userService.pageFuzzyselect(txtname, vo);
		mv.addObject("list", vo);
		mv.addObject("txtname", txtname);
		return mv;
	}

	@RequestMapping("/toupdate")
	public ModelAndView toUpdate(int id) {
		ModelAndView mv = null;
		UserPo userPo = userService.selectById(id);
		mv = new ModelAndView("/userManage/update");
		mv.addObject("userPo", userPo);
		return mv;
	}

	@RequestMapping("/update")
	public ModelAndView update(UserPo userPo) {
		ModelAndView mv = null;
		// System.out.println(userPo.getId() + userPo.getUserName() +
		// userPo.getPassword());
		Boolean flag = userService.updateById(userPo);
		mv = new ModelAndView("redirect:/userManage/tolist.do");
		return mv;
	}

	@RequestMapping("/delete")
	public ModelAndView delete(String id) {
		ModelAndView mv = null;
		String[] FenGe = id.split(",");
		for (int i = 0; i < FenGe.length; i++) {
			userService.deleteById(Integer.parseInt(FenGe[i]));
		}
		mv = new ModelAndView("redirect:/userManage/tolist.do");
		return mv;
	}
}
