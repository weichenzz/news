<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="gbk"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@page import="java.text.SimpleDateFormat"%>
<jsp:useBean id="cd" beanName="org.jbit.news.dao.impl.CommentsDaoImpl" type="org.jbit.news.dao.CommentsDao" />
<jsp:useBean id="cbl" beanName="org.jbit.news.biz.impl.CommentsBizImpl" type="org.jbit.news.biz.CommentsBiz" />
<jsp:setProperty property="cd" name="cbl" value="<%=cd %>"/>
<%
	request.setCharacterEncoding("gbk");
	String cauthor = request.getParameter("cauthor");
	String cnid = request.getParameter("nid");
	String cip = request.getParameter("cip");
	String ccontent = request.getParameter("ccontent");
	java.util.Date date = new java.util.Date();
	Timestamp cdate = new Timestamp(date.getTime());
	Map comment  = new HashMap();
	comment.put("cnid",cnid);
	comment.put("ccontent",ccontent);
	comment.put("cdate",cdate);
	comment.put("cip",cip);
	comment.put("cauthor",cauthor);	
	int i = cbl.addComment(comment);
	request.setAttribute("isAddComment", i);
%>
<c:if test="${isAddComment > 0}">
	<script type="text/javascript">
		alert("�Ѿ��ɹ�������ۣ����ȷ�Ϸ���ԭ��ҳ��");
		open("../news_read.jsp?nid=<%=cnid%>","_self");	
	</script>
</c:if>
<c:if test="${isAddComment <= 0}">
	<script type="text/javascript">
		alert("�������ʧ�ܣ�����ϵ����Ա����ԭ�򣡵��ȷ�Ϸ���ԭ��ҳ��");
		open("../news_read.jsp?nid=<%=cnid%>","_self");	
	</script>
</c:if>
<%request.removeAttribute("isAddComment"); %>
