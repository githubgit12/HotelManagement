package servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DepartmentDao;
import entity.Department;
import util.Constant;
import util.PageBean;

public class DepartmentServlet extends HttpServlet {

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

		DepartmentDao depDao = new DepartmentDao();
		String name = request.getParameter("name");
		Department dep = new Department();
		dep.setName(name);
		List<Department> list = depDao.searchByCondition(dep);
		int count = list.size();
		PageBean p = new PageBean(ye, count, Constant.EMP_NUM_IN_PAGE, Constant.EMP_NUM_OF_PAGE);
		list = depDao.searchByCondition(dep, p.getBegin(), Constant.EMP_NUM_IN_PAGE);
		request.setAttribute("p", p);
		request.setAttribute("c", dep);
		request.setAttribute("key", list);
		try {
			request.getRequestDispatcher("WEB-INF/dep/department.jsp").forward(request, response);
		} catch (IOException e) {

			e.printStackTrace();
		} catch (ServletException e) {

			e.printStackTrace();
		}
	}

	public void showAdd(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.getRequestDispatcher("WEB-INF/dep/depadd.jsp").forward(request, response);
		} catch (ServletException e) {

			e.printStackTrace();
		} catch (IOException e) {

			e.printStackTrace();
		}
	}

	public void add(HttpServletRequest request, HttpServletResponse response) {

		String name = request.getParameter("name");

		DepartmentDao depDao = new DepartmentDao();
		boolean flag = depDao.add(name);
		try {
			if (flag) {
				// ÷ÿ∂®œÚ
				response.sendRedirect("dep");
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void update(HttpServletRequest request, HttpServletResponse response) {

		Department dep = new Department();
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		dep.setName(name);
		dep.setId(id);
		DepartmentDao depDao = new DepartmentDao();
		boolean flag = depDao.update(dep);

		if (flag) {
			try {
				request.setAttribute("depId", id);
				response.sendRedirect("dep");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public void showUpdate(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		DepartmentDao depDao = new DepartmentDao();
		List<Department> list = depDao.searchById(id);
		request.setAttribute("update", list);
		try {
			request.getRequestDispatcher("WEB-INF/dep/update.jsp").forward(request, response);
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

		DepartmentDao depDao = new DepartmentDao();

		boolean flag = depDao.delete(id);
		if (flag) {
			try {
				response.sendRedirect("dep");
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
