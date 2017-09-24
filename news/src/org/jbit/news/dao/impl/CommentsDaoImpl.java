package org.jbit.news.dao.impl;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.jbit.news.bean.Comment;
import org.jbit.news.dao.BaseDao;
import org.jbit.news.dao.CommentsDao;

public class CommentsDaoImpl extends BaseDao implements CommentsDao {

	// ͨ��nid��������
	public List getCommentsByNid(String nid) {
		openConnection();
		List list = new ArrayList();
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd HH:mm");
		String sql = "select * from comment" + " where cnid = " + nid + " order by cdate desc";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Comment comment = new Comment();
				comment.setCid(String.valueOf(rs.getInt("cid")));
				comment.setCnid(String.valueOf(rs.getInt("cnid")));
				comment.setCauthor(rs.getString("cauthor"));
				comment.setCip(rs.getString("cip"));
				comment.setCcontent(rs.getString("ccontent"));
				comment.setCdate(sdf.format(rs.getObject("cdate")));
				list.add(comment);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeResource();
		}
		return list;
	}

	public int deleteComment(String cid) {
		openConnection();
		String sql = "delete from comment where cid=" + cid;
		int i = 0;
		try {
			ps = con.prepareStatement(sql);
			i = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeResource();
		}
		return i;
	}

	public int countComments(String nid) {
		openConnection();
		int count = 0;
		String sql = "select count(*)" + " from comment where cnid = " + nid;
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				count = rs.getInt("");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeResource();
		}
		return count;
	}

	public int addComment(Map comment) {
		openConnection();

		String sql = "select max(cid) cid from comment ";
		int maxid = 0;
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery(sql);
			if (rs.next()) {
				maxid = rs.getInt("cid") + 1;
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

		int i = 0;
		sql = "insert into comment values(?,?,?,?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setObject(1, maxid);
			ps.setObject(2, comment.get("cnid"));
			ps.setObject(3, comment.get("ccontent"));
			ps.setObject(4, comment.get("cdate"));
			ps.setObject(5, comment.get("cip"));
			ps.setObject(6, comment.get("cauthor"));
			i = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeResource();
		}
		return i;
	}
}
