<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="gbk"%>
<jsp:useBean id="cd" beanName="org.jbit.news.dao.impl.CommentsDaoImpl" type="org.jbit.news.dao.CommentsDao" />
<jsp:useBean id="cbl" beanName="org.jbit.news.biz.impl.CommentsBizImpl" type="org.jbit.news.biz.CommentsBiz" />
<jsp:setProperty property="cd" name="cbl" value="<%=cd %>"/>
<%
	request.setCharacterEncoding("gbk");
	String cid = request.getParameter("cid");
	int i = cbl.deleteComment(cid);
	if(i > 0){	
%>
<script type="text/javascript">
	alert("�Ѿ��ɹ�ɾ�����ۣ����ȷ�Ϸ���ԭ��ҳ��");
	open("../newspages/news_modify.jsp?nid=<%=request.getParameter("cnid")%>","_self");	
</script>
<%
	}else{
%>
<script type="text/javascript">
	alert("ɾ������ʧ�ܣ�����ϵ����Ա����ԭ�򣡵��ȷ�Ϸ���ԭ��ҳ��");
	open("../newspages/news_modify.jsp?nid=<%=request.getParameter("cnid")%>","_self");	
</script>
<%	
	}
%>
