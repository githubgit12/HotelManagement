package servlet;

import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import entity.User;
import util.CreateMD5;
import util.RandomNumber;
import util.ValidateCade;

public class UserServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) {
		String type = request.getParameter("type");
		if (type == null) {
			showLogin(request, response);
		} else if ("doLogin".equals(type)) {
			doLogin(request, response);
		} else if ("showRegister".equals(type)) {
			showRegister(request, response);
		} else if ("register".equals(type)) {
			register(request, response);
		} else if ("randomImage".equals(type)) {
			randomImage(request, response);
		}

	}

	public void showLogin(HttpServletRequest request, HttpServletResponse response) {
		try {
			String name = "";
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				for (int i = 0; i < cookies.length; i++) {
					if ("username".equals(cookies[i].getName())) {
						name = cookies[i].getValue();
					}
				}
			}
			request.setAttribute("name", name);
			request.getRequestDispatcher("WEB-INF/user/login.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void doLogin(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();

			String name = request.getParameter("username");
			String pwd = request.getParameter("password");
			String code = request.getParameter("code");
			if (code.equals(session.getAttribute("rand"))) {
				User user = new User();
				user.setUsername(name);
				user.setPassword(CreateMD5.getMD5(pwd));
				UserDao ud = new UserDao();
				boolean flag = ud.search(user);

				if (flag) {

					session.setAttribute("user", name);
					Cookie cookie = new Cookie("username", name);
					// 以秒为单位
					cookie.setMaxAge(60);
					response.addCookie(cookie);

					request.setAttribute("user1", user);
					request.getRequestDispatcher("WEB-INF/index/index.jsp").forward(request, response);
					// response.sendRedirect("index");
				} else {

					request.setAttribute("mes", "用户名或密码错误");
					request.getRequestDispatcher("WEB-INF/user/login.jsp").forward(request, response);
				}
			} else {
				request.setAttribute("mes", "验证码错误");
				request.getRequestDispatcher("WEB-INF/user/login.jsp").forward(request, response);
			}
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void showRegister(HttpServletRequest request, HttpServletResponse response) {

		try {
			request.getRequestDispatcher("WEB-INF/user/register.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void register(HttpServletRequest request, HttpServletResponse response) {
		User user = new User();
		String name = request.getParameter("username");

		String pwd = request.getParameter("password");
		UserDao userDao = new UserDao();
		int count = userDao.search(name);
		if (count == 0) {
			user.setUsername(name);
			user.setPassword(CreateMD5.getMD5(pwd));
			boolean flag = userDao.add(user);
			if (flag) {
				try {
					request.getRequestDispatcher("WEB-INF/user/success.jsp").forward(request, response);
				} catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} else {

			try {
				request.setAttribute("re", "用户名已经存在");
				request.getRequestDispatcher("WEB-INF/user/register.jsp").forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		// 主动销毁这个对象，以提高效率，如果不销毁也可以，java的垃圾回收机制会销毁
		// userDao=null;

	}

	public void randomImage(HttpServletRequest request, HttpServletResponse response) {
		RandomNumber rn = new RandomNumber();
		try {
			// 设置页面不缓存
			response.setHeader("Pragma", "No-cache");
			response.setHeader("CacheControl", "no-cache");
			response.setDateHeader("Expires", 0);
			ValidateCade vc = rn.generateImage();
			ServletOutputStream outStream;

			outStream = response.getOutputStream();
			// 输出图像到界面
			ImageIO.write(vc.getImage(), "JPEG", outStream);

			outStream.close();

			request.getSession().setAttribute("rand", vc.getRand());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) {
		doGet(request, response);
	}
}
