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
import dao.ProjectDao;
import dao.ScoreDao;
import entity.Department;
import entity.Employee;
import entity.Project;
import entity.Score;
import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import util.Constant;
import util.PageBean;

public class ScoreServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");

			response.setContentType("text/html;charset=UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		String type = request.getParameter("type");

		if (type == null) {
			searchBy(request, response);
		} else if ("save".equals(type)) {
			save(request, response);
		} else if ("save1".equals(type)) {
			save1(request, response);
		} else if ("manager".equals(type)) {
			manager(request, response);
		} else if ("input".equals(type)) {
			input(request, response);
		} else if ("searchPro".equals(type)) {
			searchPro(request, response);
		}
	}

	public void searchPro(HttpServletRequest request, HttpServletResponse response) {
		try {
			PrintWriter out = response.getWriter();

			String depName = request.getParameter("depName");
			DepartmentDao depDao = new DepartmentDao();
			int depId = depDao.searchId(depName);
			ScoreDao scDao = new ScoreDao();
			List<Integer> list = scDao.searchProByDepId(depId);
			ProjectDao proDao = new ProjectDao();
			List<String> list2 = proDao.searchPro(list);
			// for (int i = 0; i < list2.size(); i++) {
			// System.out.println(list2.get(i));
			// }
			JSONArray jsonArray = JSONArray.fromObject(list2);
			// System.out.println(jsonArray.toString());
			out.print(jsonArray);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) {
		doGet(request, response);
	}

	public void searchBy(HttpServletRequest request, HttpServletResponse response) {

		int ye = 1;

		if (request.getParameter("ye") != null) {
			ye = Integer.parseInt(request.getParameter("ye"));
		} else {
			ye = 1;
		}

		ScoreDao scDao = new ScoreDao();
		String empName = request.getParameter("empName");
		String depName = request.getParameter("depName");
		String proName = request.getParameter("proName");

		String grade = request.getParameter("grade");
		int value = -1;
		if (request.getParameter("value") != null && !"".equals(request.getParameter("value"))) {
			value = Integer.parseInt(request.getParameter("value"));
		}

		Score sc = new Score();
		Employee emp = new Employee();
		emp.setName(empName);
		Department dep = new Department();
		dep.setName(depName);

		emp.setDep(dep);
		sc.setEmp(emp);
		Project pro = new Project();
		pro.setName(proName);
		sc.setPro(pro);
		sc.setValue(value);
		sc.setGrade(grade);
		List<Score> list = scDao.searchByCondition(sc);
		int count = list.size();
		PageBean p = new PageBean(ye, count, Constant.EMP_NUM_IN_PAGE, Constant.EMP_NUM_OF_PAGE);
		list = scDao.searchByCondition(sc, p.getBegin(), Constant.EMP_NUM_IN_PAGE);
		request.setAttribute("p", p);
		request.setAttribute("sc", sc);
		request.setAttribute("key", list);
		DepartmentDao depDao = new DepartmentDao();
		List<Department> searchdep = depDao.search();
		request.setAttribute("dep", searchdep);
		ProjectDao proDao = new ProjectDao();
		List<Project> searchpro = proDao.search();
		request.setAttribute("pro", searchpro);
		List<Score> searchGrade = scDao.searchGrade();
		request.setAttribute("grade", searchGrade);

		try {
			request.getRequestDispatcher("WEB-INF/sc/score.jsp").forward(request, response);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void manager(HttpServletRequest request, HttpServletResponse response) {

		int ye = 1;

		if (request.getParameter("ye") != null) {
			ye = Integer.parseInt(request.getParameter("ye"));
		} else {
			ye = 1;
		}

		ScoreDao scDao = new ScoreDao();
		String empName = request.getParameter("empName");
		String depName = request.getParameter("depName");
		String proName = request.getParameter("proName");
		String grade = request.getParameter("grade");
		int value = -1;
		if (request.getParameter("value") != null && !"".equals(request.getParameter("value"))) {
			value = Integer.parseInt(request.getParameter("value"));
		}
		Score sc = new Score();
		Employee emp = new Employee();
		emp.setName(empName);
		Department dep = new Department();
		dep.setName(depName);
		emp.setDep(dep);
		sc.setEmp(emp);
		Project pro = new Project();
		pro.setName(proName);
		sc.setPro(pro);
		sc.setValue(value);
		sc.setGrade(grade);
		List<Score> list = scDao.searchByCondition(sc);
		int count = list.size();
		PageBean p = new PageBean(ye, count, Constant.EMP_NUM_IN_PAGE, Constant.EMP_NUM_OF_PAGE);
		list = scDao.searchByCondition(sc, p.getBegin(), Constant.EMP_NUM_IN_PAGE);
		request.setAttribute("p", p);
		request.setAttribute("sc", sc);
		request.setAttribute("key", list);
		DepartmentDao depDao = new DepartmentDao();
		List<Department> searchdep = depDao.search();
		request.setAttribute("dep", searchdep);
		ProjectDao proDao = new ProjectDao();
		List<Project> searchpro = proDao.search();
		request.setAttribute("pro", searchpro);
		List<Score> searchGrade = scDao.searchGrade();
		request.setAttribute("grade", searchGrade);

		try {
			request.getRequestDispatcher("WEB-INF/sc/scoreManager.jsp").forward(request, response);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void save(HttpServletRequest request, HttpServletResponse response) {

		String scs = request.getParameter("scs");
		JSONArray jsonArray = JSONArray.fromObject(scs);
		List<Score> list = (List<Score>) jsonArray.toCollection(jsonArray, Score.class);
		ScoreDao scDao = new ScoreDao();
		boolean flag = scDao.save(list);
		if (flag) {
			try {
				response.sendRedirect("sc");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();

			}
		}
	}

	public void save1(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();

			int value = Integer.parseInt(request.getParameter("value"));
			int e_id = Integer.parseInt(request.getParameter("e_id"));

			ScoreDao scDao = new ScoreDao();
			boolean flag = scDao.save1(value, e_id);
			// String grade = scDao.search(value);

			// out.println(flag + "," + grade);

		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}

	public void input(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();

			int id = Integer.parseInt(request.getParameter("id"));
			int value = Integer.parseInt(request.getParameter("value"));
			ScoreDao scDao = new ScoreDao();
			boolean flag = false;
			Score sc = new Score();
			sc.setValue(value);
			if (id == 0) {
				int empId = Integer.parseInt(request.getParameter("empId"));
				int proId = Integer.parseInt(request.getParameter("proId"));

				Employee emp = new Employee();
				emp.setId(empId);
				sc.setEmp(emp);
				Project pro = new Project();
				pro.setId(proId);
				sc.setPro(pro);
				id = scDao.addValue(sc);
				if (id > 0) {
					flag = true;
				}
				sc.setId(id);
			} else {
				sc.setId(id);
				flag = scDao.update(sc);
			}
			Score score = scDao.search(id);
			if (flag) {
				JSON json = JSONObject.fromObject(score);
				out.print(json);
			} else {
				out.print(false);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
