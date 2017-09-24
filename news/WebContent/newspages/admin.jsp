<%@ page language="java" import="java.util.*,java.sql.*,org.jbit.news.bean.*" pageEncoding="gbk"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<jsp:useBean id="nd" beanName="org.jbit.news.dao.impl.NewsDaoImpl" type="org.jbit.news.dao.NewsDao" />
<jsp:useBean id="nbl" beanName="org.jbit.news.biz.impl.NewsBizImpl" type="org.jbit.news.biz.NewsBiz" />
<jsp:setProperty property="nd" name="nbl" value="<%=nd %>"/>
<jsp:include page="console_element/top.jsp" />
<script language="javascript">
	function clickdel(){
		return confirm("ɾ������ȷ��");
	}	
</script>
<%
	//���÷�ҳ��������
	int total_news = nbl.countNews();
	int page_news = 5;
	int total_page = (total_news+page_news - 1)/page_news;
	String page_no_str = request.getParameter("page_no");
	int page_no = 1;
	if(page_no_str != null)
		page_no = Integer.valueOf(page_no_str);
	request.setAttribute("page_no", page_no);
	request.setAttribute("total_page", total_page);
%>
<%
	List news_list = nbl.findNewsByPage(page_news,page_no,"-getTypes");
	request.setAttribute("news_list",news_list);
%>
<div id="main">
  <jsp:include page="console_element/left.html" />
  <div id="opt_area">
    <ul class="classlist">
    	<c:set value="" var="tempNtname" />
    	<c:forEach var="news" items="${news_list}">    		
    		<c:if test="${news.tname != tempNtname}">
    			<c:set value="${news.tname}" var="tempNtname" />
    			<li class='space'><strong>${news.tname}</strong></li>
    		</c:if>
    		<li>${news.ntitle}<span> ���ߣ�${news.nauthor}&#160;&#160;&#160;&#160; <a href='news_modify.jsp?nid=${news.nid}'>�޸�</a> &#160;&#160;&#160;&#160; <a href='../util/do_delete_news.jsp?nid=${news.nid}' onclick='return clickdel()'>ɾ��</a> </span> </li>
    	</c:forEach>
    	<c:if test="${page_no == 1}">
      		<p align="right"> ��ǰҳ��:[1/${total_page }]&nbsp; <a href="admin.jsp?page_no=2">��һҳ&nbsp;&nbsp;</a> <a href="admin.jsp?page_no=${total_page }">ĩҳ</a> </p>
      	</c:if>
      	<c:if test="${page_no == total_page && page_no != 1}">
      		<p align="right"> ��ǰҳ��:[${total_page }/${total_page }]&nbsp; <a href="admin.jsp?page_no=1">��ҳ</a><a href="admin.jsp?page_no=${total_page-1 }">&nbsp;&nbsp;��һҳ</a></p>
      	</c:if>
      	<c:if test="${page_no < total_page && page_no > 1}">
      		<p align="right"> ��ǰҳ��:[${page_no}/${total_page }]&nbsp;&nbsp; <a href="admin.jsp?page_no=1">��ҳ</a><a href="admin.jsp?page_no=${page_no-1}">&nbsp;&nbsp;��һҳ</a><a href="admin.jsp?page_no=${page_no+1}">&nbsp;&nbsp;��һҳ</a> <a href="admin.jsp?page_no=${total_page }">&nbsp;&nbsp;ĩҳ</a></p>
      	</c:if>	
    </ul>
  </div>
</div>
<%
	request.removeAttribute("page_no");
	request.removeAttribute("total_page");
	request.removeAttribute("news_list");
%>
<jsp:include page="console_element/bottom.html" />
