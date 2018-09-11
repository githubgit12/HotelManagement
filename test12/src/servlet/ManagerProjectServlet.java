package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DepartmentDao;
import dao.ManagerProjectDao;
import entity.Department;
import entity.Project;

public class ManagerProjectServlet extends HttpServlet {

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
		} else if ("addProName".equals(type)) {
			addProName(request, response);
		} else if ("deletePro".equals(type)) {
			deletePro(request, response);
		} else if ("m2".equals(type)) {
			searchBy2(request, response);
		} else if ("addProName2".equals(type)) {
			addProName2(request, response);
		} else if ("deletePro2".equals(type)) {
			deletePro2(request, response);
		} else if ("m3".equals(type)) {
			searchBy3(request, response);
		} else if ("addProName3".equals(type)) {
			addProName3(request, response);
		} else if ("deletePro3".equals(type)) {
			deletePro3(request, response);
		} else if ("m4".equals(type)) {
			searchBy4(request, response);
		} else if ("m5".equals(type)) {
			searchBy5(request, response);
		} else if ("addProName4".equals(type)) {
			addProName4(request, response);
		} else if ("deletePro4".equals(type)) {
			deletePro4(request, response);
		} else if ("m6".equals(type)) {
			searchBy6(request, response);
		}

	}

	public void searchBy2(HttpServletRequest request, HttpServletResponse response) {
		int depId = Integer.parseInt(request.getParameter("depId"));
		ManagerProjectDao mproDao = new ManagerProjectDao();
		List<Project> list = mproDao.search(depId);
		List<Project> list2 = mproDao.searchByCondition(depId);
		DepartmentDao depDao = new DepartmentDao();
		Department dep = depDao.search1(depId);
		request.setAttribute("proList", list);
		request.setAttribute("depNo", list2);
		request.setAttribute("dep", dep);
		try {
			request.getRequestDispatcher("WEB-INF/mpro/mproject2.jsp").forward(request, response);
		} catch (IOException e) {

			e.printStackTrace();
		} catch (ServletException e) {

			e.printStackTrace();
		}
	}

	public void searchBy(HttpServletRequest request, HttpServletResponse response) {
		int depId = Integer.parseInt(request.getParameter("depId"));
		ManagerProjectDao mproDao = new ManagerProjectDao();
		List<Project> list = mproDao.search(depId);
		List<Project> list2 = mproDao.searchByCondition(depId);
		DepartmentDao depDao = new DepartmentDao();
		Department dep = depDao.search1(depId);
		request.setAttribute("proList", list);
		request.setAttribute("depNo", list2);
		request.setAttribute("dep", dep);
		try {
			request.getRequestDispatcher("WEB-INF/mpro/mproject.jsp").forward(request, response);
		} catch (IOException e) {

			e.printStackTrace();
		} catch (ServletException e) {

			e.printStackTrace();
		}
	}

	public void searchBy3(HttpServletRequest request, HttpServletResponse response) {
		int depId = Integer.parseInt(request.getParameter("depId"));
		ManagerProjectDao mproDao = new ManagerProjectDao();
		List<Project> list = mproDao.search(depId);
		List<Project> list2 = mproDao.searchByCondition(depId);
		DepartmentDao depDao = new DepartmentDao();
		Department dep = depDao.search1(depId);
		request.setAttribute("proList", list);
		request.setAttribute("depNo", list2);
		request.setAttribute("dep", dep);
		try {
			request.getRequestDispatcher("WEB-INF/mpro/mproject3.jsp").forward(request, response);
		} catch (IOException e) {

			e.printStackTrace();
		} catch (ServletException e) {

			e.printStackTrace();
		}
	}

	public void searchBy4(HttpServletRequest request, HttpServletResponse response) {
		int depId = Integer.parseInt(request.getParameter("depId"));
		ManagerProjectDao mproDao = new ManagerProjectDao();
		List<Project> list = mproDao.search(depId);
		List<Project> list2 = mproDao.searchByCondition(depId);
		DepartmentDao depDao = new DepartmentDao();
		Department dep = depDao.search1(depId);
		request.setAttribute("proList", list);
		request.setAttribute("depNo", list2);
		request.setAttribute("dep", dep);
		try {
			request.getRequestDispatcher("WEB-INF/mpro/mproject4.jsp").forward(request, response);
		} catch (IOException e) {

			e.printStackTrace();
		} catch (ServletException e) {

			e.printStackTrace();
		}
	}

	public void searchBy5(HttpServletRequest request, HttpServletResponse response) {
		int depId = Integer.parseInt(request.getParameter("depId"));
		ManagerProjectDao mproDao = new ManagerProjectDao();
		List<Project> list = mproDao.search(depId);
		List<Project> list2 = mproDao.searchByCondition(depId);
		DepartmentDao depDao = new DepartmentDao();
		Department dep = depDao.search1(depId);
		request.setAttribute("proList", list);
		request.setAttribute("depNo", list2);
		request.setAttribute("dep", dep);
		try {
			request.getRequestDispatcher("WEB-INF/mpro/mproject5.jsp").forward(request, response);
		} catch (IOException e) {

			e.printStackTrace();
		} catch (ServletException e) {

			e.printStackTrace();
		}
	}

	public void searchBy6(HttpServletRequest request, HttpServletResponse response) {
		int depId = Integer.parseInt(request.getParameter("depId"));
		ManagerProjectDao mproDao = new ManagerProjectDao();
		List<Project> list = mproDao.search(depId);
		List<Project> list2 = mproDao.searchByCondition(depId);
		DepartmentDao depDao = new DepartmentDao();
		Department dep = depDao.search1(depId);
		request.setAttribute("proList", list);
		request.setAttribute("depNo", list2);
		request.setAttribute("dep", dep);
		try {

			try {
				request.getRequestDispatcher("WEB-INF/mpro/mproject6.jsp").forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (IOException e) {

			e.printStackTrace();
		}
	}

	public void addProName(HttpServletRequest request, HttpServletResponse response) {
		try {
			int dId = Integer.parseInt(request.getParameter("dId"));

			int pId = Integer.parseInt(request.getParameter("pId"));

			ManagerProjectDao mproDao = new ManagerProjectDao();
			boolean flag = mproDao.add(dId, pId);
			if (flag) {

				response.sendRedirect("mpro?depId=" + dId);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void addProName2(HttpServletRequest request, HttpServletResponse response) {
		try {
			PrintWriter out = response.getWriter();
			int dId = Integer.parseInt(request.getParameter("dId"));

			int pId = Integer.parseInt(request.getParameter("pId"));

			ManagerProjectDao mproDao = new ManagerProjectDao();
			boolean flag = mproDao.add(dId, pId);
			out.print(flag);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void addProName3(HttpServletRequest request, HttpServletResponse response) {
		try {
			PrintWriter out = response.getWriter();
			int dId = Integer.parseInt(request.getParameter("dId"));

			int pId = Integer.parseInt(request.getParameter("pId"));

			ManagerProjectDao mproDao = new ManagerProjectDao();

			boolean flag = mproDao.add(dId, pId);

			out.print(flag);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void addProName4(HttpServletRequest request, HttpServletResponse response) {
		try {
			PrintWriter out = response.getWriter();
			int dId = Integer.parseInt(request.getParameter("dId"));

			String pId = request.getParameter("pId");

			ManagerProjectDao mproDao = new ManagerProjectDao();

			boolean flag = mproDao.add(dId, pId);

			out.print(flag);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void deletePro(HttpServletRequest request, HttpServletResponse response) {
		try {

			int pId = Integer.parseInt(request.getParameter("pId"));
			int dId = Integer.parseInt(request.getParameter("dId"));
			ManagerProjectDao mproDao = new ManagerProjectDao();
			boolean flag = mproDao.delete(pId, dId);
			if (flag) {

				response.sendRedirect("mpro?depId=" + dId);
			}
		} catch (

		IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void deletePro2(HttpServletRequest request, HttpServletResponse response) {
		try {
			PrintWriter out = response.getWriter();
			int pId = Integer.parseInt(request.getParameter("pId"));
			int dId = Integer.parseInt(request.getParameter("dId"));
			ManagerProjectDao mproDao = new ManagerProjectDao();
			boolean flag = mproDao.delete(pId, dId);
			out.print(flag);
		} catch (

		IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void deletePro3(HttpServletRequest request, HttpServletResponse response) {
		try {
			PrintWriter out = response.getWriter();
			int pId = Integer.parseInt(request.getParameter("pId"));
			int dId = Integer.parseInt(request.getParameter("dId"));
			ManagerProjectDao mproDao = new ManagerProjectDao();
			boolean flag = mproDao.delete(pId, dId);
			out.print(flag);
		} catch (

		IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void deletePro4(HttpServletRequest request, HttpServletResponse response) {
		try {
			PrintWriter out = response.getWriter();
			String pId = request.getParameter("pId");
			int dId = Integer.parseInt(request.getParameter("dId"));
			ManagerProjectDao mproDao = new ManagerProjectDao();
			boolean flag = mproDao.delete(pId, dId);
			out.print(flag);
		} catch (

		IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) {
		doGet(request, response);
	}
}
