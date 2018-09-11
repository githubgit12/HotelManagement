package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import entity.Project;

public class ManagerProjectDao extends BaseDao {
	// Statement stat;
	// PreparedStatement pstat;
	// ResultSet rs;

	public List<Project> search(int depId) {
		List<Project> list = new ArrayList<>();
		// 2.利用反射，加载数据库驱动
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		try {
			conn = getConntion();
			stat = conn.createStatement();
			// 5.利用sql语句查询
			rs = stat.executeQuery("select p_name, p_id from v_dep_pro where d_id=" + depId + "");
			while (rs.next()) {
				Project pro = new Project();
				pro.setId(rs.getInt("p_id"));
				pro.setName(rs.getString("p_name"));
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

	public List<Project> searchByCondition(int depId) {
		List<Project> list = new ArrayList<>();
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		// 2.利用反射，加载数据库驱动

		try {

			conn = getConntion();
			stat = conn.createStatement();
			String sql = "select * from project where id not in(select p_id  from r_dep_pro as r left JOIN project as p on r.p_id = p.id where r.d_id="
					+ depId + ")";
			rs = stat.executeQuery(sql);
			while (rs.next()) {
				Project pro = new Project();
				pro.setId(rs.getInt("id"));
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

	public boolean add(int dId, int pId) {
		boolean flag = false;
		Connection conn = null;
		Statement stat = null;

		try {
			conn = getConntion();
			// 4.建立Statement
			stat = conn.createStatement();
			// 5.执行sql语句并得到结果

			int rs = stat.executeUpdate("insert into r_dep_pro(d_id,p_id) values(" + dId + "," + pId + ")");

			// 6.对结果集进行处理
			if (rs > 0) {
				flag = true;
			}
			// 7.关闭
			closeAll(conn, stat, null);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	/**
	 * 数据的添加
	 */
	public boolean add(int dId, String pIds) {
		boolean flag = false;
		Connection conn = null;
		Statement stat = null;

		int rs = 0;
		try {
			conn = getConntion();
			// 4.建立Statement
			String[] temp = pIds.split(",");
			for (int i = 0; i < temp.length; i++) {
				stat = conn.createStatement();
				// 5.执行sql语句并得到结果

				int pId = Integer.parseInt(temp[i]);
				rs = stat.executeUpdate("insert into r_dep_pro(d_id,p_id) values(" + dId + "," + pId + ")");
			}
			// 6.对结果集进行处理
			if (rs > 0) {
				flag = true;
			}
			// 7.关闭
			closeAll(conn, stat, null);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	/*
	 * 数据的删除
	 */
	public boolean delete(int pId, int dId) {
		boolean flag = false;
		Connection conn = null;
		Statement stat = null;

		try {
			conn = getConntion();
			// 4.建立Statement
			stat = conn.createStatement();
			String sql = "delete from r_dep_pro where p_id=" + pId + " and d_id=" + dId + "";

			int rs = stat.executeUpdate(sql);
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

	public boolean delete(String pIds, int dId) {
		boolean flag = false;
		Connection conn = null;
		Statement stat = null;

		int rs = 0;
		try {
			conn = getConntion();
			String[] temp = pIds.split(",");
			for (int i = 0; i < temp.length; i++) {
				stat = conn.createStatement();
				// 5.执行sql语句并得到结果

				int pId = Integer.parseInt(temp[i]);
				String sql = "delete from r_dep_pro where p_id=" + pId + " and d_id=" + dId + "";

				rs = stat.executeUpdate(sql);
			}
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

	public String search1(int pId) {
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		String name = "";
		try {
			conn = getConntion();
			stat = conn.createStatement();
			// 5.利用sql语句查询
			rs = stat.executeQuery("select name from project where id=" + pId + "");
			// 6.处理结果集
			while (rs.next()) {

				name = rs.getString("name");

			}
			// 7.关闭
			closeAll(conn, stat, rs);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return name;
	}

}
