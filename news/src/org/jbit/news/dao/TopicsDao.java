package org.jbit.news.dao;

import java.util.List;
import java.util.Map;

public interface TopicsDao{
	//��ȡ��������
	public List getAllTopics();
	//ͨ��tid��ȡ����
	public Map getTopicByTname(String tname);
	//ͨ��tidɾ������
	public int deleteTopic(String tid);
	//ͨ����ҳ��ȡ��������
	public List getAllTopicsByPage(int page_info_no, int page_no);
	//����������Ŀ
	public int countTopics();
	//��������
	public int updateTopic(Map topic);
	//�������
	public int addTopic(Map topic);
}