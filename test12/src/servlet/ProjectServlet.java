package servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProjectDao;
import entity.Project;
import util.Constant;
import util.PageBean;

public class ProjectServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) {

		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		String type = request.getParameter("type");

		if (type == null) {
			searchBy(request, response);
		} else if ("add".equals(type)) {
			add(request, response);
		} else if ("showAdd".equals(type)) {
			showAdd(request, response);
		} else if ("update".equals(type)) {
			update(request, response);
		} else if ("showUpdate".equals(type)) {
			showUpdate(request, response);
		} else if ("delete".equals(type)) {
			delete(request, response);
		}

	}

	public void searchBy(HttpServletRequest request, HttpServletResponse response) {

		int ye = 1;

		if (request.getParameter("ye") != null) {
			ye = Integer.parseInt(request.getParameter("ye"));
		} else {
			ye = 1;
		}

		ProjectDao proDao = new ProjectDao();
		String name = request.getParameter("name");
		Project pro = new Project();
		pro.setName(name);
		List<Project> list = proDao.searchByCondition(pro);
		int count = list.size();
		PageBean p = new PageBean(ye, count, Constant.EMP_NUM_IN_PAGE, Constant.EMP_NUM_OF_PAGE);
		list = proDao.searchByCondition(pro, p.getBegin(), Constant.EMP_NUM_IN_PAGE);
		request.setAttribute("p", p);
		request.setAttribute("c", pro);
		request.setAttribute("key", list);
		try {
			request.getRequestDispatcher("WEB-INF/pro/project.jsp").forward(request, response);
		} catch (IOException e) {

			e.printStackTrace();
		} catch (ServletException e) {

			e.printStackTrace();
		}
	}

	public void showAdd(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.getRequestDispatcher("WEB-INF/pro/add.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void add(HttpServletRequest request, HttpServletResponse response) {

		String name = request.getParameter("name");

		ProjectDao proDao = new ProjectDao();
		boolean flag = proDao.add(name);
		try {
			if (flag) {
				// ÷ÿ∂®œÚ
				response.sendRedirect("pro");
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void update(HttpServletRequest request, HttpServletResponse response) {

		Project pro = new Project();
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		pro.setName(name);
		pro.setId(id);
		ProjectDao proDao = new ProjectDao();
		boolean flag = proDao.update(pro);
		if (flag) {
			try {
				response.sendRedirect("pro");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public void showUpdate(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		ProjectDao proDao = new ProjectDao();
		List<Project> list = proDao.searchById(id);
		request.setAttribute("update", list);
		try {
			request.getRequestDispatcher("WEB-INF/pro/update.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void delete(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println(id);
		ProjectDao proDao = new ProjectDao();

		boolean flag = proDao.delete(id);
		if (flag) {
			try {
				response.sendRedirect("pro");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) {
		doGet(request, response);
	}
}
