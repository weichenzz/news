package org.jbit.news.dao;

import java.util.List;
import java.util.Map;

public interface NewsDao{
	//��ȡ��������
	public List getAllnews();
	//ͨ����ҳ��ȡ��������
	public List getAllnewsByPage(int page_info_no, int page_no);
	//ͨ����ҳ��ȡѡ�������µ���������
	public List getAllnewsByPageAndTid(int page_info_no, int page_no, String tid);
	//����������Ŀ
	public int countNews();
	//ͨ������id��ȡ����
	public Map getNewsByNid(String nid);
	//��ȡѡ����������������
	public List getNewByTid(String tid);
	//����ѡ�������
	public int updateNews(Map news);
	//�������
	public int addNews(Map news);
	//ɾ������
	public int deleteNews(String nid);
	//����������ʾ����
	public List getNewsByType(int page_info_no, int page_no);
}
