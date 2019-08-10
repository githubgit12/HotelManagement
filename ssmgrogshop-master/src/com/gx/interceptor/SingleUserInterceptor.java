package com.gx.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.gx.po.UserPo;
import com.gx.util.MemoryData;

public class SingleUserInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		String url = request.getRequestURI();
	    System.out.println(url);
		// 如果拦截到的是登录的页面的话放行
		if (url.indexOf("tologin.do") >= 0 || url.indexOf("tomain.do") >= 0 || url.indexOf("showregister.do")>=0 
				|| url.indexOf("toregister.do")>=0) {
			return true;
		}
		// 如果是其他请求地址，进行拦截
		UserPo user = (UserPo) request.getSession().getAttribute("user");
		if (user != null) {
			String sessionid = MemoryData.getSessionIDMap().get(user.getUserName());

			// 如果用户名存在放行（即登录放行）

			if (sessionid.equals(request.getSession().getId())) {
				return true;
			} else { // 如果请求的sessionID和此账号Map中存放的sessionID不一致，跳转到登陆页

				// 判断如果是异步请求，设置响应头 sessionstatus为timeout，自动跳转，否则重定向
				if (request.getHeader("x-requested-with") != null
						&& request.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")) {
					response.setHeader("sessionstatus", "timeout");
					return false;
				} else {
					String indexurl = request.getContextPath() + "/Login/tologin.do";
					response.sendRedirect(indexurl);
					//request.getRequestDispatcher(request.getContextPath() + "/index.jsp").forward(request, response);
					return false;
				}
			}
		}
		// 如果session中没有user，跳转到登陆页
//		String indexurl = request.getContextPath() + "/Login/tologin.do";
//		response.sendRedirect(indexurl);
		request.getRequestDispatcher(request.getContextPath() + "/index.jsp").forward(request, response);
		return false;
	}

}
