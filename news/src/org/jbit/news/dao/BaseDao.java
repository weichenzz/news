package org.jbit.news.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BaseDao {

	protected Connection con;
	protected PreparedStatement ps;
	protected ResultSet rs;

	// ��ȡ����
	public boolean openConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver"); // �������ݿ�����
			con = DriverManager.getConnection("jdbc:mysql://localhost/newsdb", "root", "root");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	// ִ��delete����
	public int executDelete(String sql) {
		openConnection();
		int delete_rows = 0;
		try {
			ps = con.prepareStatement(sql);
			delete_rows = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeResource();
		}
		return delete_rows;
	}

	// �ر���Դ
	public boolean closeResource() {

		try {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (con != null)
				con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

}
