package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import entity.User;

public class UserDao extends BaseDao {

	public boolean search(User user) {
		boolean flag = false;
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		PreparedStatement pstat = null;
		try {
			conn = getConntion();
			String sql = "select * from user where username=?  and password=?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, user.getUsername());
			pstat.setString(2, user.getPassword());
			rs = pstat.executeQuery();
			if (rs.next()) {
				flag = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		closeAll(conn, pstat, rs);

		return flag;
	}

	public boolean add(User user) {
		boolean flag = false;
		Connection conn = null;
		Statement stat = null;

		int rs = 0;
		try {
			conn = getConntion();

			stat = conn.createStatement();
			String sql = "insert into user(username,password) values('" + user.getUsername() + "','"
					+ user.getPassword() + "')";
			rs = stat.executeUpdate(sql);
			if (rs > 0) {
				flag = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return flag;
	}

	public int search(String username) {
		int count = 0;
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		try {
			conn = getConntion();
			stat = conn.createStatement();
			rs = stat.executeQuery("select count(id) from user where username='" + username + "'");
			if (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		closeAll(conn, stat, rs);

		return count;
	}
}