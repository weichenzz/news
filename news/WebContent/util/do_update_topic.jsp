<%@ page language="java" import="java.util.*,java.sql.*,com.jspsmart.upload.*" pageEncoding="gbk"%>
<%@page import="java.text.SimpleDateFormat"%>
<jsp:useBean id="td" beanName="org.jbit.news.dao.impl.TopicsDaoImpl" type="org.jbit.news.dao.TopicsDao" />
<jsp:useBean id="tbl" beanName="org.jbit.news.biz.impl.TopicBizImpl" type="org.jbit.news.biz.TopicBiz" />
<jsp:setProperty property="td" name="tbl" value="<%=td %>"/>
<%	
	request.setCharacterEncoding("gbk");
	String tid = request.getParameter("tid");
	String tname = request.getParameter("tname");
	Map topic = new HashMap();
	topic.put("tid",tid);
	topic.put("tname",tname);
	int i = tbl.updateTopic(topic);
	if(i > 0){	
%>
<script type="text/javascript">
	alert("�Ѿ��ɹ��������⣬���ȷ�Ϸ��������б�");
	open("../newspages/topic_list.jsp","_self");	
</script>
<%}else{
%>
<script type="text/javascript">
	alert("��������ʧ�ܣ����ȷ�Ϸ��������б�");
	open("../newspages/topic_list.jsp","_self");	
</script>
<%
}
%>
