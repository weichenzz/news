package org.jbit.news.dao;

import java.util.List;
import java.util.Map;

public interface CommentsDao{
	//ͨ��nid��������
	public List getCommentsByNid(String nid);
	//ͨ��cidɾ������
	public int deleteComment(String cid);
	//������������
	public int countComments(String nid);
	//�������
	public int addComment(Map comment);
}
