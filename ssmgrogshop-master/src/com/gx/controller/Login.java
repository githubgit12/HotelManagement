package com.gx.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.druid.util.StringUtils;
import com.gx.po.StayRegisterPo;
import com.gx.po.UserPo;
import com.gx.service.StayRegisterService;
import com.gx.service.UserService;
import com.gx.util.MemoryData;

@Controller
@RequestMapping("/Login")
public class Login {

	@Autowired
	private UserService userService;

	@Autowired
	private StayRegisterService stayRegisterService;

	@RequestMapping("/tologin")
	public String tologin() {
		return "/login/login";
	}

	@RequestMapping("/showregister")
	public String showRegister() {
		return "/login/register";
	}

	@RequestMapping("/toregister")
	public ModelAndView toRegister(UserPo user) {
		ModelAndView mv = null;
		Boolean flag1 = userService.selectUserName(user.getUserName());
		if (flag1 == false) {
			Boolean flag = userService.insertUser(user);
			if (flag == true) {
				mv = new ModelAndView("/login/login");
			}
		} else {
			mv = new ModelAndView("/login/register");
			mv.addObject("mes", "用户名已经存在");
		}
		return mv;
	}

	@RequestMapping("/tomain")
	public ModelAndView tomain(HttpServletRequest request, HttpServletResponse response, UserPo user) {
		ModelAndView mv = null;
		double zongFeiYongOne = 0;
		double zongFeiYongTwo = 0;
		UserPo u = userService.selectLogin(user);
		List<StayRegisterPo> list = stayRegisterService.selectAll();
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getReceiveTargetID() == 2) {
				zongFeiYongOne += list.get(i).getSumConst();
			} else {
				zongFeiYongTwo += list.get(i).getSumConst();
			}
		}
		if (u != null) {
			// 2将admin存放到Session中
			request.getSession().setAttribute("user", u);
			// 3在sessionIDMap中存放此用户sessionID
			String sessionID = request.getRequestedSessionId();
			String user1 = u.getUserName();
			if (!MemoryData.getSessionIDMap().containsKey(user1)) { // 不存在，首次登陆，放入Map
				MemoryData.getSessionIDMap().put(user1, sessionID);

			} else if (MemoryData.getSessionIDMap().containsKey(user1)
					&& !StringUtils.equals(sessionID, MemoryData.getSessionIDMap().get(user1))) {
				MemoryData.getSessionIDMap().remove(user1);
				MemoryData.getSessionIDMap().put(user1, sessionID);

			}
			mv = new ModelAndView("/main/main");
		} else {
			mv = new ModelAndView("/login/login");
		}
		mv.addObject("zongFeiYongOne", zongFeiYongOne);
		mv.addObject("zongFeiYongTwo", zongFeiYongTwo);
		return mv;
	}

}
