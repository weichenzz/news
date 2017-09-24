<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="gbk"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<jsp:include page="console_element/top.jsp" />
<jsp:useBean id="nd" beanName="org.jbit.news.dao.impl.NewsDaoImpl" type="org.jbit.news.dao.NewsDao" />
<jsp:useBean id="nbl" beanName="org.jbit.news.biz.impl.NewsBizImpl" type="org.jbit.news.biz.NewsBiz" />
<jsp:setProperty property="nd" name="nbl" value="<%=nd %>"/>
<jsp:useBean id="cd" beanName="org.jbit.news.dao.impl.CommentsDaoImpl" type="org.jbit.news.dao.CommentsDao" />
<jsp:useBean id="cbl" beanName="org.jbit.news.biz.impl.CommentsBizImpl" type="org.jbit.news.biz.CommentsBiz" />
<jsp:setProperty property="cd" name="cbl" value="<%=cd %>"/>
<jsp:useBean id="td" beanName="org.jbit.news.dao.impl.TopicsDaoImpl" type="org.jbit.news.dao.TopicsDao" />
<jsp:useBean id="tbl" beanName="org.jbit.news.biz.impl.TopicBizImpl" type="org.jbit.news.biz.TopicBiz" />
<jsp:setProperty property="td" name="tbl" value="<%=td %>"/>
<script type="text/javascript">
	function check(){
		var ntitle = document.getElementById("ntitle");
		var nauthor = document.getElementById("nauthor");
		var nsummary = document.getElementById("nsummary");
		var ncontent = document.getElementById("ncontent");
		
		if(ntitle.value == ""){
			alert("���ⲻ��Ϊ�գ���");
			ntitle.focus();
			return false;
		}else if(nauthor.value == ""){
			alert("���߲���Ϊ�գ���");
			nauthor.focus();
			return false;
		}else if(nsummary.value == ""){
			alert("ժҪ����Ϊ�գ���");
			nsummary.focus();
			return false;
		}else if(ncontent.value == ""){
			alert("���ݲ���Ϊ�գ���");
			ncontent.focus();
			return false;
		}		
		return true;
	}
</script>
<%
	String nid = request.getParameter("nid");
	Map news = nbl.findNewsByNid(nid);
	List topics = tbl.findTopicsByPage(0,0);
	List comments = cbl.findCommentsByNid(nid);
	request.setAttribute("news",news);
	request.setAttribute("topics",topics);
	request.setAttribute("comments",comments);
%>
<div id="main">
  <jsp:include page="console_element/left.html" />
  <div id="opt_area">
    <h1 id="opt_type"> �޸����ţ� </h1>
    <form action="../util/do_update_news.jsp" method="post" enctype="multipart/form-data" onsubmit="return check()">
      <p>
        <label> ���� </label>
        <select name="ntid">
        	<c:forEach var="topic" items="${topics}">
        		<c:if test="${news.tname == topic.tname}">
        			<option value='${topic.tid}' selected="selected">${topic.tname}</option>
        		</c:if>
        		<option value='${topic.tid}'>${topic.tname}</option>
        	</c:forEach>
        </select>
        <input type="hidden" name="nid" value="<%=nid %>" />
      </p>
      <p>
        <label> ���� </label>
        <input name="ntitle" type="text" class="opt_input" value="${news.ntitle}"/>
      </p>
      <p>
        <label> ���� </label>
        <input name="nauthor" type="text" class="opt_input" value="${news.nauthor}"/>
      </p>
      <p>
        <label> ժҪ </label>
        <textarea name="nsummary" cols="40" rows="3">${news.nsummary}</textarea>
      </p>
      <p>
        <label> ���� </label>
        <textarea name="ncontent" cols="70" rows="10">${news.ncontent}</textarea>
      </p>
      <p>
        <label> �ϴ�ͼƬ </label>
        <input name="file" type="file" class="opt_input" />
      </p>
      <input type="submit" value="�ύ" class="opt_sub" />
      <input type="reset" value="����" class="opt_sub" />
    </form>
    <h1 id="opt_type">
		�޸��������ۣ�
	</h1>
      <table width="80%" align="left">
      <c:set var="comments_num" value="<%=comments.size() %>" />
      <c:if test="${comments_num <= 0}">
      	<td colspan="6"> �������ۣ� </td>
         <tr>
           <td colspan="6"><hr />
           </td>
         </tr>
      </c:if>
      <c:if test="${comments_num > 0}">
      	<c:forEach var="comment" items="${comments}">
	      	<tr>
	          <td> �����ˣ� </td>
	          <td>${comment.cauthor}</td>
	          <td> IP�� </td>
	          <td>${comment.cip}</td>
	          <td> ����ʱ�䣺 </td>
	          <td>${comment.cdate}</td>
	          <td><a href="../util/do_delete_comments.jsp?cid=${comment.cid}&cnid=${comment.cnid}">ɾ��</a></td>
	        </tr>
	        <tr>
	          <td colspan="6">${comment.ccontent}</td>
	        </tr>
	        <tr>
	          <td colspan="6"><hr />
	          </td>
	        </tr>
		</c:forEach>
      </c:if>
      </table>
  </div>
</div>
<%
	request.removeAttribute("news");
	request.removeAttribute("topics");
	request.removeAttribute("comments"); 
%>
<jsp:include page="console_element/bottom.html" />
