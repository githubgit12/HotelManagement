package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import entity.Department;
import entity.Employee;

public class EmployeeDao extends BaseDao {
	public List<Employee> search() {
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		List<Employee> list = new ArrayList<>();

		try {
			conn = getConntion();
			stat = conn.createStatement();
			rs = stat.executeQuery("select e.*,d.name from employee as e left join department as d on e.id=d.id");
			while (rs.next()) {
				Employee emp = new Employee();
				emp.setId(rs.getInt("e.id"));
				emp.setName(rs.getString("e.name"));
				emp.setSex(rs.getString("sex"));
				emp.setAge(rs.getInt("age"));
				Department dep = new Department();
				dep.setName(rs.getString("d.name"));
				emp.setDep(dep);
				list.add(emp);
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

	public boolean add(Employee emp) {
		boolean flag = false;
		Connection conn = null;
		Statement stat = null;

		try {
			conn = getConntion();
			stat = conn.createStatement();
			String sql = "insert into employee(name,sex,age,d_id,pic) values('" + emp.getName() + "','" + emp.getSex()
					+ "'," + emp.getAge() + "," + (Object) emp.getDep().getId() + ",'" + emp.getPic() + "')";
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

	public boolean update(Employee emp) {
		boolean flag = false;
		Connection conn = null;
		Statement stat = null;

		try {
			conn = getConntion();
			stat = conn.createStatement();
			String sql = "update employee set name='" + emp.getName() + "',sex='" + emp.getSex() + "',age="
					+ emp.getAge() + ",d_id=" + (Object) emp.getDep().getId() + " where id=" + emp.getId() + "";
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

	public boolean updateBacth1(Employee emp, String ids) {
		boolean flag = false;
		Connection conn = null;
		Statement stat = null;

		try {
			conn = getConntion();
			stat = conn.createStatement();
			String sql = "update employee set name='" + emp.getName() + "',sex='" + emp.getSex() + "',age="
					+ emp.getAge() + " where id in(" + ids + ")";
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

	public List<Employee> searchById(int id) {
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;

		List<Employee> list = new ArrayList<>();

		try {
			conn = getConntion();
			stat = conn.createStatement();
			rs = stat.executeQuery(
					"select e.*,d.name,d.id from employee as e left join department as d on e.d_id=d.id where e.id in("
							+ id + ")");
			while (rs.next()) {
				Employee emp = new Employee();
				emp.setId(rs.getInt("id"));
				emp.setName(rs.getString("e.name"));
				emp.setSex(rs.getString("sex"));
				emp.setAge(rs.getInt("age"));
				Department dep = new Department();
				dep.setId(rs.getInt("d.id"));
				dep.setName(rs.getString("d.name"));
				emp.setDep(dep);
				list.add(emp);
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

	public List<Employee> searchById(String id) {
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;

		List<Employee> list = new ArrayList<>();

		try {
			conn = getConntion();
			stat = conn.createStatement();
			rs = stat.executeQuery("select * from employee where id in(" + id + ")");
			while (rs.next()) {
				Employee emp = new Employee();
				emp.setId(rs.getInt("id"));
				emp.setName(rs.getString("name"));
				emp.setSex(rs.getString("sex"));
				emp.setAge(rs.getInt("age"));
				list.add(emp);
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
			String sql = "delete from employee where id in(" + id + ")";
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

	public boolean deleteBatch(String id) {
		boolean flag = false;
		Connection conn = null;
		Statement stat = null;

		try {
			conn = getConntion();
			stat = conn.createStatement();
			String sql = "delete from employee where id in(" + id + ")";
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

	public boolean updateBacth2(List<Employee> list) {
		boolean flag = false;
		Connection conn = null;
		Statement stat = null;

		try {
			conn = getConntion();
			stat = conn.createStatement();
			for (int i = 0; i < list.size(); i++) {
				String sql = "update employee set name='" + list.get(i).getName() + "',sex='" + list.get(i).getSex()
						+ "',age=" + list.get(i).getAge() + ",d_id= " + list.get(i).getD_id() + " where id ="
						+ list.get(i).getId() + "";
				int rs = stat.executeUpdate(sql);
				if (rs > 0) {
					flag = true;
				}
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

	/**
	 * 定义方法，返回员工的总数量
	 */
	public int getTotal() {
		int total = 0;
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		try {
			conn = getConntion();
			stat = conn.createStatement();
			rs = stat.executeQuery("select count(*) from employee");
			while (rs.next()) {
				total = rs.getInt(1);
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

		return total;
	}

	public List<Employee> list(int begin, int size) {
		List<Employee> list = new ArrayList<Employee>();
		Connection conn = null;

		try {
			conn = getConntion();

			String sql = "select e.*,d.name from employee as e inner join department as d on e.d_id=d.id limit ?,? ";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, begin);
			ps.setInt(2, size);
			System.out.println(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Employee emp = new Employee();
				emp.setId(rs.getInt("id"));
				emp.setName(rs.getString("e.name"));
				emp.setSex(rs.getString("sex"));
				emp.setAge(rs.getInt("age"));
				Department dep = new Department();
				dep.setName(rs.getString("d.name"));
				emp.setDep(dep);
				list.add(emp);
			}

			ps.close();

			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 条件查询
	 */
	public List<Employee> searchByCondition(Employee condition) {
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		List<Employee> list = new ArrayList<>();
		try {

			conn = getConntion();
			stat = conn.createStatement();
			String where = " where 1=1 ";
			if (condition.getName() != null && !condition.getName().equals("")) {
				where += " and e.name='" + condition.getName() + "'";
			}
			if (condition.getSex() != null && !condition.getSex().equals("")) {
				where += " and sex='" + condition.getSex() + "'";
			}
			if (condition.getAge() != -1) {
				where += " and age=" + condition.getAge() + "";
			}
			if (condition.getDep().getName() != null && !condition.getDep().getName().equals("")) {
				where += " and d.name='" + condition.getDep().getName() + "'";
			}
			String sql = "select e.*,d.name,d.id from employee as e left join department as d on e.d_id=d.id" + where;
			// System.out.println(sql);
			rs = stat.executeQuery(sql);

			// 6.处理结果集
			while (rs.next()) {
				Employee emp = new Employee();
				emp.setId(rs.getInt("id"));
				emp.setName(rs.getString("e.name"));
				emp.setSex(rs.getString("sex"));
				emp.setAge(rs.getInt("age"));
				Department dep = new Department();
				dep.setId(rs.getInt("id"));
				dep.setName(rs.getString("d.name"));
				emp.setDep(dep);
				list.add(emp);
			}
			// 7.关闭
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public List<Employee> searchByCondition(Employee condition, int begin, int size) {
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		List<Employee> list = new ArrayList<>();
		try {

			conn = getConntion();
			stat = conn.createStatement();
			String where = " where 1=1 ";
			if (condition.getName() != null && !condition.getName().equals("")) {
				where += " and e.name='" + condition.getName() + "'";
			}
			if (condition.getSex() != null && !condition.getSex().equals("")) {
				where += " and sex='" + condition.getSex() + "'";
			}
			if (condition.getAge() != -1) {
				where += " and age=" + condition.getAge() + "";
			}
			if (condition.getDep().getName() != null && !condition.getDep().getName().equals("")) {
				where += " and d.name='" + condition.getDep().getName() + "'";
			}
			String sql = "select e.*,d.name from employee as e left join department as d on e.d_id=d.id" + where
					+ " limit " + begin + "," + size + "";
			// System.out.println(sql);
			rs = stat.executeQuery(sql);

			// 6.处理结果集
			while (rs.next()) {
				Employee emp = new Employee();
				emp.setId(rs.getInt("id"));
				emp.setName(rs.getString("e.name"));
				emp.setSex(rs.getString("sex"));
				emp.setAge(rs.getInt("age"));
				emp.setPic(rs.getString("pic"));
				Department dep = new Department();
				dep.setName(rs.getString("d.name"));

				emp.setDep(dep);
				list.add(emp);
			}
			// 7.关闭
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
}
