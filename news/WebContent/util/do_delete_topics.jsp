<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="gbk"%>
<jsp:useBean id="td" beanName="org.jbit.news.dao.impl.TopicsDaoImpl" type="org.jbit.news.dao.TopicsDao" />
<jsp:useBean id="tbl" beanName="org.jbit.news.biz.impl.TopicBizImpl" type="org.jbit.news.biz.TopicBiz" />
<jsp:setProperty property="td" name="tbl" value="<%=td %>"/>
<%
	request.setCharacterEncoding("gbk");
	String tid = request.getParameter("tid");
	int i = tbl.deleteTopic(tid);
	if(i > 0){	
%>
<script type="text/javascript">
	alert("�Ѿ��ɹ�ɾ�����⣬���ȷ�Ϸ���ԭ��ҳ��");
	open("../newspages/topic_list.jsp","_self");	
</script>
<%
	}else{
%>
<script type="text/javascript">
	alert("ɾ������ʧ�ܣ�����ϵ����Ա����ԭ�򣡵��ȷ�Ϸ���ԭ��ҳ��");
	open("../newspages/topic_list.jsp","_self");	
</script>
<%	
	}
%>
