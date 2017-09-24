<%@ page language="java" import="java.util.*,java.sql.*,org.jbit.news.bean.*" pageEncoding="gbk"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<jsp:include page="console_element/top.jsp" />
<jsp:useBean id="td" beanName="org.jbit.news.dao.impl.TopicsDaoImpl" type="org.jbit.news.dao.TopicsDao" />
<jsp:useBean id="tbl" beanName="org.jbit.news.biz.impl.TopicBizImpl" type="org.jbit.news.biz.TopicBiz" />
<jsp:setProperty property="td" name="tbl" value="<%=td %>"/>
<script language="javascript">
	function clickdel(){
		return confirm("ɾ���������µ�����Ҳ��ɾ����ȷ��ɾ����");
	}	
</script>
<%
	//���÷�ҳ��������
	int total_news = tbl.countTopics();
	int page_news = 6;
	int total_page = total_news/page_news + 1;
	String page_no_str = request.getParameter("page_no");
	int page_no = 1;
	if(page_no_str != null)
		page_no = Integer.valueOf(page_no_str);
	request.setAttribute("page_no", page_no);
	request.setAttribute("total_page", total_page);
%>
<%
	List topic_list = tbl.findTopicsByPage(page_news, page_no);
	request.setAttribute("topic_list", topic_list);
%>
<div id="main">
  <jsp:include page="console_element/left.html" />
  <div id="opt_area">
    <ul class="classlist">
    	<c:forEach var="topic" items="${topic_list}">
    		<li> &#160;&#160;&#160;&#160; ${topic.tname}&#160;&#160;&#160;&#160; <a href='topic_modify.jsp?tid=${topic.tid}&tname=${topic.tname}'>�޸�</a> &#160;&#160;&#160;&#160; <a href='../util/do_delete_topics.jsp?tid=${topic.tid}'  onclick='return clickdel()'>ɾ��</a> </li>
    	</c:forEach>
    	<c:if test="${page_no == 1}">
      		<p align="right"> ��ǰҳ��:[1/${total_page }]&nbsp; <a href="topic_list.jsp?page_no=2">��һҳ&nbsp;&nbsp;</a> <a href="topic_list.jsp?page_no=${total_page }">ĩҳ</a> </p>
      	</c:if>
      	<c:if test="${page_no == total_page}">
      		<p align="right"> ��ǰҳ��:[${total_page }/${total_page }]&nbsp; <a href="topic_list.jsp?page_no=1">��ҳ</a><a href="topic_list.jsp?page_no=${total_page-1 }">&nbsp;&nbsp;��һҳ</a></p>
      	</c:if>
      	<c:if test="${page_no < total_page && page_no > 1}">
      		<p align="right"> ��ǰҳ��:[${page_no}/${total_page }]&nbsp;&nbsp; <a href="topic_list.jsp?page_no=1">��ҳ</a><a href="topic_list.jsp?page_no=${page_no-1}">&nbsp;&nbsp;��һҳ</a><a href="topic_list.jsp?page_no=${page_no+1}">&nbsp;&nbsp;��һҳ</a> <a href="topic_list.jsp?page_no=${total_page }">&nbsp;&nbsp;ĩҳ</a></p>
      	</c:if>	
    </ul>
  </div>
</div>
<%
	request.removeAttribute("topic_list"); 
%>
<jsp:include page="console_element/bottom.html" />
