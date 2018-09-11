package servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import dao.DepartmentDao;
import dao.EmployeeDao;
import entity.Department;
import entity.Employee;
import net.sf.json.JSONArray;
import util.Constant;
import util.PageBean;

public class EmployeeServlet extends HttpServlet {

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
			addEmployee(request, response);
		} else if ("showAdd".equals(type)) {
			showAdd(request, response);
		} else if ("update".equals(type)) {
			update(request, response);
		} else if ("showUpdate".equals(type)) {
			showUpdate(request, response);
		} else if ("delete".equals(type)) {
			deleteEmployee(request, response);
		} else if ("deleteBatch".equals(type)) {
			deleteBatch(request, response);
		} else if ("showUpdateBatch1".equals(type)) {
			showUpdateBatch1(request, response);
		} else if ("updateBatch1".equals(type)) {
			updateBatch1(request, response);
		} else if ("showUpdateBatch2".equals(type)) {
			showUpdateBatch2(request, response);
		} else if ("updateBatch2".equals(type)) {
			updateBatch2(request, response);
		} else if ("updateBatch3".equals(type)) {
			updateBatch3(request, response);
		} else if ("showAdd2".equals(type)) {
			showAdd2(request, response);
		} else if ("add2".equals(type)) {
			add2(request, response);
		} else if ("upload".equals(type)) {
			upload(request, response);
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

		EmployeeDao empDao = new EmployeeDao();
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String depart = request.getParameter("depart");
		int age = -1;
		if (request.getParameter("age") != null && !"".equals(request.getParameter("age"))) {
			age = Integer.parseInt(request.getParameter("age"));
		}
		Employee emp = new Employee();
		emp.setName(name);
		emp.setSex(sex);
		emp.setAge(age);
		Department dep = new Department();
		dep.setName(depart);
		emp.setDep(dep);
		List<Employee> list = empDao.searchByCondition(emp);
		int count = list.size();
		PageBean p = new PageBean(ye, count, Constant.EMP_NUM_IN_PAGE, Constant.EMP_NUM_OF_PAGE);
		list = empDao.searchByCondition(emp, p.getBegin(), Constant.EMP_NUM_IN_PAGE);
		request.setAttribute("p", p);
		request.setAttribute("c", emp);
		request.setAttribute("key", list);
		DepartmentDao depDao = new DepartmentDao();
		List<Department> list2 = depDao.search();
		request.setAttribute("dep", list2);

		try {
			request.getRequestDispatcher("WEB-INF/emp/employee.jsp").forward(request, response);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void addEmployee(HttpServletRequest request, HttpServletResponse response) {
		try {
			String name = "";
			String sex = "";
			int age = 0;
			int depId = 0;
			String pic = "";
			// String path = request.getServletContext().getRealPath("/") + "/pic";
			// System.out.println(path);
			String path = "f:/head/";
			// 为该请求创建一个DiskFileItemFactory对象，通过它来解析请求。执行解析后，所有的表单项目都保存在一个List中。
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			// 前台form表单提交的文件都存在list集合中
			List<FileItem> items = upload.parseRequest(request);

			for (int i = 0; i < items.size(); i++) {
				FileItem item = items.get(i);
				if (item.getFieldName().equals("myFile")) {
					UUID uuid = UUID.randomUUID();
					String houzhui = item.getName().substring(item.getName().lastIndexOf("."));
					pic = uuid.toString() + houzhui;
					File savedFile = new File(path, pic);
					item.write(savedFile);
				}
				if (item.getFieldName().equals("name")) {
					name = new String(item.getString().getBytes("ISO-8859-1"), "utf-8");
				}
				if (item.getFieldName().equals("sex")) {
					sex = new String(item.getString().getBytes("ISO-8859-1"), "utf-8");
				}
				if (item.getFieldName().equals("age")) {
					age = new Integer(item.getString());

				}
				if (item.getFieldName().equals("depID")) {
					// if ("".equals(new String(item.getString().getBytes("ISO-8859-1"), "utf-8"))
					// && new String(item.getString().getBytes("ISO-8859-1"), "utf-8") != null) {
					depId = Integer.parseInt(new String(item.getString()));
					// }
					System.out.println(depId);
				}
			}
			Employee emp = new Employee();
			emp.setName(name);
			emp.setSex(sex);
			emp.setAge(age);
			Department dep = new Department();
			dep.setId(depId);
			emp.setDep(dep);
			emp.setPic(pic);
			EmployeeDao empDao = new EmployeeDao();
			boolean flag = empDao.add(emp);
			if (flag) {
				response.sendRedirect("emp");
			}
		} catch (FileUploadException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void upload(HttpServletRequest request, HttpServletResponse response) {
		try {

			String pic = "";
			// String path = request.getServletContext().getRealPath("/") + "/pic";
			// System.out.println(path);
			String path = "f:/head/";
			// 为该请求创建一个DiskFileItemFactory对象，通过它来解析请求。执行解析后，所有的表单项目都保存在一个List中。
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			// 前台form表单提交的文件都存在list集合中
			List<FileItem> items = upload.parseRequest(request);

			for (int i = 0; i < items.size(); i++) {
				FileItem item = items.get(i);
				if (item.getFieldName().equals("myFile")) {
					UUID uuid = UUID.randomUUID();
					String houzhui = item.getName().substring(item.getName().lastIndexOf("."));
					pic = uuid.toString() + houzhui;
					File savedFile = new File(path, pic);
					item.write(savedFile);
				}
			}
			PrintWriter out = response.getWriter();
			out.print(pic);
		} catch (FileUploadException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void add2(HttpServletRequest request, HttpServletResponse response) {

		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		int age = Integer.parseInt(request.getParameter("age"));
		Integer depID = null;
		if (!"".equals(request.getParameter("depID")) && request.getParameter("depID") != null) {
			depID = Integer.parseInt(request.getParameter("depID"));
		}
		String pic = request.getParameter("photo");
		Employee emp = new Employee();
		emp.setName(name);
		emp.setSex(sex);
		emp.setAge(age);
		emp.setPic(pic);
		Department dep = new Department();
		dep.setId(depID);
		emp.setDep(dep);
		// int id = depDao.searchId(depart);
		EmployeeDao empDao = new EmployeeDao();
		boolean flag = empDao.add(emp);
		try {
			if (flag) {
				// 重定向
				response.sendRedirect("emp");
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void showAdd(HttpServletRequest request, HttpServletResponse response) {
		DepartmentDao depDao = new DepartmentDao();
		List<Department> list2 = depDao.search();
		request.setAttribute("dep", list2);

		try {
			request.getRequestDispatcher("WEB-INF/emp/empadd.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void showAdd2(HttpServletRequest request, HttpServletResponse response) {
		DepartmentDao depDao = new DepartmentDao();
		List<Department> list2 = depDao.search();
		request.setAttribute("dep", list2);

		try {
			request.getRequestDispatcher("WEB-INF/emp/empadd2.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void update(HttpServletRequest request, HttpServletResponse response) {

		Employee emp = new Employee();
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		int age = Integer.parseInt(request.getParameter("age"));

		// 判空
		Integer depID = null;
		if (!"".equals(request.getParameter("depID")) && request.getParameter("depID") != null) {
			depID = Integer.parseInt(request.getParameter("depID"));
		}
		emp.setName(name);
		emp.setSex(sex);
		emp.setAge(age);
		emp.setId(id);
		Department dep = new Department();
		dep.setId(depID);
		emp.setDep(dep);
		EmployeeDao empDao = new EmployeeDao();
		boolean flag = empDao.update(emp);
		if (flag) {
			try {
				response.sendRedirect("emp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public void showUpdate(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		EmployeeDao empDao = new EmployeeDao();
		List<Employee> list = empDao.searchById(id);
		request.setAttribute("update", list);
		DepartmentDao depDao = new DepartmentDao();
		List<Department> list2 = depDao.search();
		request.setAttribute("dep", list2);
		try {
			request.getRequestDispatcher("WEB-INF/emp/empupdate.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void deleteEmployee(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("ids"));
		EmployeeDao empDao = new EmployeeDao();

		boolean flag = empDao.delete(id);
		if (flag) {
			try {
				response.sendRedirect("emp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public void showUpdateBatch1(HttpServletRequest request, HttpServletResponse response) {
		String ids = request.getParameter("ids");
		EmployeeDao empDao = new EmployeeDao();
		List<Employee> list = empDao.searchById(ids);
		request.setAttribute("updateBatch", list.get(0));
		request.setAttribute("ids", ids);
		try {
			request.getRequestDispatcher("WEB-INF/emp/empupdateBacth.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void showUpdateBatch2(HttpServletRequest request, HttpServletResponse response) {
		String ids = request.getParameter("ids");
		EmployeeDao empDao = new EmployeeDao();
		List<Employee> list = empDao.searchById(ids);
		request.setAttribute("updateBatch", list);
		try {
			request.getRequestDispatcher("WEB-INF/emp/empupdateBacth2.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void updateBatch1(HttpServletRequest request, HttpServletResponse response) {

		Employee emp = new Employee();
		String ids = request.getParameter("ids");
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		int age = Integer.parseInt(request.getParameter("age"));
		emp.setName(name);
		emp.setSex(sex);
		emp.setAge(age);
		EmployeeDao empDao = new EmployeeDao();
		boolean flag = empDao.updateBacth1(emp, ids);
		if (flag) {
			try {
				response.sendRedirect("emp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public void updateBatch2(HttpServletRequest request, HttpServletResponse response) {

		String emps = request.getParameter("emps");
		String[] temp = emps.split(";");
		List<Employee> list = new ArrayList<>();
		for (int i = 0; i < temp.length; i++) {
			String[] temp1 = temp[i].split(",");
			Employee emp = new Employee();

			emp.setId(Integer.parseInt(temp1[0]));
			emp.setName(temp1[1]);
			emp.setSex(temp1[2]);
			emp.setAge(Integer.parseInt(temp1[3]));
			list.add(emp);
		}
		EmployeeDao empDao = new EmployeeDao();
		boolean flag = empDao.updateBacth2(list);
		if (flag) {
			try {
				response.sendRedirect("emp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();

			}
		}
	}

	public void updateBatch3(HttpServletRequest request, HttpServletResponse response) {

		String emps = request.getParameter("emps");
		JSONArray jsonArray = JSONArray.fromObject(emps);
		List<Employee> list = (List<Employee>) jsonArray.toCollection(jsonArray, Employee.class);
		EmployeeDao empDao = new EmployeeDao();
		boolean flag = empDao.updateBacth2(list);
		if (flag) {
			try {
				response.sendRedirect("emp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();

			}
		}
	}

	public void deleteBatch(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("ids");
		System.out.println(id);
		EmployeeDao empDao = new EmployeeDao();

		boolean flag = empDao.deleteBatch(id);
		if (flag) {
			try {
				response.sendRedirect("emp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
