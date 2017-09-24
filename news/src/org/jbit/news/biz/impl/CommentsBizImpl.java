package org.jbit.news.biz.impl;

import java.util.List;
import java.util.Map;

import org.jbit.news.biz.CommentsBiz;
import org.jbit.news.dao.CommentsDao;
import org.jbit.news.dao.impl.CommentsDaoImpl;

public class CommentsBizImpl implements CommentsBiz {

	CommentsDao cd;
	public CommentsDao getCd() {
		return cd;
	}

	public void setCd(CommentsDao cd) {
		this.cd = cd;
	}

	public int deleteComment(String cid) {
		 return cd.deleteComment(cid);
	}

	public List findCommentsByNid(String nid) {
		//dao送上来的原始数据
		List list=cd.getCommentsByNid(nid);
		//对原始数据进行业务上的逻辑处理
		//...
		return list;
	}

	public int countComments(String nid) {
		return cd.countComments(nid);
	}

	public int addComment(Map comment) {
		return cd.addComment(comment);
	}
}
