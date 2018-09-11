package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import entity.Project;

public class ProjectDao extends BaseDao {
	// Statement stat;
	// PreparedStatement pstat;
	// ResultSet rs;

	public List<Project> search() {
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		List<Project> list = new ArrayList<>();
		try {
			conn = getConntion();
			stat = conn.createStatement();
			// 5.利用sql语句查询
			rs = stat.executeQuery("select name from project");
			// 6.处理结果集
			while (rs.next()) {
				Project pro = new Project();
				pro.setName(rs.getString("name"));
				list.add(pro);
			}
			// 7.关闭
			closeAll(conn, stat, rs);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 条件查询
	 */
	public List<Project> searchByCondition(Project condition) {
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		List<Project> list = new ArrayList<>();
		try {

			conn = getConntion();
			stat = conn.createStatement();
			String where = " where 1=1 ";
			if (condition.getName() != null && !condition.getName().equals("")) {
				where += " and name='" + condition.getName() + "'";
			}

			String sql = "select * from project " + where;
			rs = stat.executeQuery(sql);

			// 6.处理结果集
			while (rs.next()) {
				Project pro = new Project();
				pro.setId(rs.getInt("id"));
				pro.setName(rs.getString("name"));
				list.add(pro);
			}
			// 7.关闭
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public List<Project> searchByCondition(Project condition, int begin, int size) {
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		List<Project> list = new ArrayList<>();
		try {

			conn = getConntion();
			stat = conn.createStatement();
			String where = " where 1=1 ";
			if (condition.getName() != null && !condition.getName().equals("")) {
				where += " and name='" + condition.getName() + "'";
			}

			String sql = "select * from project " + where + " limit " + begin + "," + size + "";
			// System.out.println(sql);
			rs = stat.executeQuery(sql);

			// 6.处理结果集
			while (rs.next()) {
				Project pro = new Project();
				pro.setId(rs.getInt("id"));
				pro.setName(rs.getString("name"));
				list.add(pro);
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
			String sql = "insert into project(name) values('" + name + "')";
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
	public boolean update(Project pro) {
		boolean flag = false;
		Connection conn = null;
		Statement stat = null;

		try {
			conn = getConntion();
			// 4.建立Statement
			stat = conn.createStatement();
			// 5.执行sql语句并得到结果
			int rs = stat.executeUpdate("update project set name='" + pro.getName() + "' where id=" + pro.getId() + "");

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

	public List<Project> searchById(int id) {
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;

		List<Project> list = new ArrayList<>();

		try {
			conn = getConntion();
			stat = conn.createStatement();
			rs = stat.executeQuery("select * from project where id in(" + id + ")");
			while (rs.next()) {
				Project pro = new Project();
				pro.setId(rs.getInt("id"));
				pro.setName(rs.getString("name"));

				list.add(pro);
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
			String sql = "delete from project where id in(" + id + ")";
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

	public List<String> searchPro(List<Integer> list) {
		List<String> list2 = new ArrayList<>();
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;

		conn = getConntion();
		try {
			stat = conn.createStatement();

			for (int i = 0; i < list.size(); i++) {
				String sql = "select name from project where id=" + list.get(i);
				rs = stat.executeQuery(sql);
				if (rs.next()) {
					list2.add(rs.getString(1));
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list2;
	}

}
