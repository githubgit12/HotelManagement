package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import entity.Department;

public class DepartmentDao extends BaseDao {

	// PreparedStatement pstat;

	public List<Department> search() {
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		List<Department> list = new ArrayList<>();
		try {
			conn = getConntion();
			stat = conn.createStatement();
			// 5.利用sql语句查询
			rs = stat.executeQuery("select * from department");
			// 6.处理结果集
			while (rs.next()) {
				Department dep = new Department();
				dep.setId(rs.getInt("id"));
				dep.setName(rs.getString("name"));
				list.add(dep);
			}
			// 7.关闭
			closeAll(conn, stat, rs);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public Department search1(int dId) {
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		Department dep = new Department();
		try {
			conn = getConntion();
			stat = conn.createStatement();
			// 5.利用sql语句查询
			rs = stat.executeQuery("select * from department where id=" + dId);
			// 6.处理结果集
			while (rs.next()) {

				dep.setId(rs.getInt("id"));
				dep.setName(rs.getString("name"));

			}
			// 7.关闭
			closeAll(conn, stat, rs);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dep;
	}

	public int searchId(String depart) {
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		int id = 0;
		try {
			conn = getConntion();
			stat = conn.createStatement();
			// 5.利用sql语句查询
			rs = stat.executeQuery("select id from department where name='" + depart + "'");
			// 6.处理结果集
			while (rs.next()) {
				id = rs.getInt(1);
			}
			// 7.关闭
			closeAll(conn, stat, rs);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;
	}

	/**
	 * 条件查询
	 */
	public List<Department> searchByCondition(Department condition) {
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;

		List<Department> list = new ArrayList<>();
		try {

			conn = getConntion();
			stat = conn.createStatement();
			String where = " where 1=1 ";
			if (condition.getName() != null && !condition.getName().equals("")) {
				where += " and name='" + condition.getName() + "'";
			}

			String sql = "select * from Department " + where;
			// System.out.println(sql);
			rs = stat.executeQuery(sql);

			// 6.处理结果集
			while (rs.next()) {
				Department dep = new Department();
				dep.setId(rs.getInt("id"));
				dep.setName(rs.getString("name"));
				dep.setEmpCount(rs.getInt("emp_count"));
				list.add(dep);
			}
			// 7.关闭
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public List<Department> searchByCondition(Department condition, int begin, int size) {
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		List<Department> list = new ArrayList<>();
		try {

			conn = getConntion();
			stat = conn.createStatement();
			String where = " where 1=1 ";
			if (condition.getName() != null && !condition.getName().equals("")) {
				where += " and name='" + condition.getName() + "'";
			}

			String sql = "select * from Department " + where + " limit " + begin + "," + size + "";
			// System.out.println(sql);
			rs = stat.executeQuery(sql);

			// 6.处理结果集
			while (rs.next()) {
				Department dep = new Department();
				dep.setId(rs.getInt("id"));
				dep.setName(rs.getString("name"));
				dep.setEmpCount(rs.getInt("emp_count"));
				list.add(dep);
			}
			// 7.关闭
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public boolean add(String name) {
		boolean flag = false;
		Connection conn = null;
		Statement stat = null;

		try {
			conn = getConntion();
			stat = conn.createStatement();
			String sql = "insert into department(name) values('" + name + "')";
			int rs = stat.executeUpdate(sql);
			if (rs > 0) {
				flag = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return flag;
	}

	/*
	 * 数据的修改
	 */
	public boolean update(Department dep) {
		Connection conn = null;
		Statement stat = null;

		boolean flag = false;
		try {
			conn = getConntion();
			// 4.建立Statement
			stat = conn.createStatement();
			// 5.执行sql语句并得到结果
			int rs = stat
					.executeUpdate("update department set name='" + dep.getName() + "' where id=" + dep.getId() + "");

			if (rs > 0) {
				flag = true;
			}
			// 7.关闭
			closeAll(conn, stat, null);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	public List<Department> searchById(int id) {
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;

		List<Department> list = new ArrayList<>();

		try {
			conn = getConntion();
			stat = conn.createStatement();
			rs = stat.executeQuery("select * from department where id in(" + id + ")");
			while (rs.next()) {
				Department dep = new Department();
				dep.setId(rs.getInt("id"));
				dep.setName(rs.getString("name"));
				dep.setEmpCount(rs.getInt("emp_count"));
				list.add(dep);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public boolean delete(int id) {
		boolean flag = false;
		Connection conn = null;
		Statement stat = null;

		try {
			conn = getConntion();
			stat = conn.createStatement();
			String sql = "delete from department where id in(" + id + ")";
			int rs = stat.executeUpdate(sql);
			if (rs > 0) {
				flag = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return flag;
	}
}
