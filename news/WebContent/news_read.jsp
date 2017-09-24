<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@page import="org.jbit.news.bean.Comment"%>
<jsp:useBean id="nd" beanName="org.jbit.news.dao.impl.NewsDaoImpl" type="org.jbit.news.dao.NewsDao" />
<jsp:useBean id="nbl" beanName="org.jbit.news.biz.impl.NewsBizImpl" type="org.jbit.news.biz.NewsBiz" />
<jsp:setProperty property="nd" name="nbl" value="<%=nd %>"/>
<jsp:useBean id="cd" beanName="org.jbit.news.dao.impl.CommentsDaoImpl" type="org.jbit.news.dao.CommentsDao" />
<jsp:useBean id="cbl" beanName="org.jbit.news.biz.impl.CommentsBizImpl" type="org.jbit.news.biz.CommentsBiz" />
<jsp:setProperty property="cd" name="cbl" value="<%=cd %>"/>
<jsp:include page="index-elements/index_top.jsp" />
<link href="CSS/read.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function checkComment(){
		var cauthor = document.getElementById("cauthor");
		var content = document.getElementById("ccontent");
		if(cauthor.value == ""){
			alert("�û�������Ϊ�գ���");
			return false;
		}else if(content.value == ""){
			alert("�������ݲ���Ϊ�գ���");
			return false;
		}
		return true;
	}
</script>
<%
	String nid = request.getParameter("nid");
	Map map = nbl.findNewsByNid(nid);
	String cip = request.getRemoteAddr();
	List comments = cbl.findCommentsByNid(nid);
	request.setAttribute("news_view",map);
	request.setAttribute("comments_view",comments);
%>
<div id="container">
  <jsp:include page="index-elements/index_sidebar.jsp"></jsp:include>
  <div class="main">
    <div class="class_type"> <img src="Images/class_type.gif" alt="��������" /> </div>
    <div class="content">
      <ul class="classlist">
        <table width="80%" align="center">
          <tr width="100%">
            <td colspan="2" align="center">${news_view.ntitle}</td>
          </tr>
          <tr>
            <td colspan="2"><hr />
            </td>
          </tr>
          <tr>
            <td align="center">���ߣ�${news_view.nauthor}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              ���ͣ�<a href="index.jsp?tid=${news_view.ntid}">${news_view.tname}</a></td>
            <td align="left">����ʱ�䣺${news_view.ncreatedate}</td>
          </tr>
          <tr>
            <td align="right"><strong>ժҪ��${news_view.nsummary}</strong></td>
          </tr>
          <tr>
            <td colspan="2" align="center"><img src="${news_view.npicpath}" /></td>
          </tr>
          <tr>
            <td colspan="2">${news_view.ncontent}</td>
          </tr>
          <tr>
            <td colspan="2"><hr />
            </td>
          </tr>
        </table>
      </ul>
      <ul class="classlist">
        <table width="80%" align="center">
        <c:set var="comments_num" value="<%=comments.size() %>" />
        <c:if test="${comments_num <= 0}">
       	 <td colspan="6"> �������ۣ� </td>
          <tr>
            <td colspan="6"><hr />
            </td>
          </tr>
        </c:if>
        <c:if test="${comments_num > 0}">
        	<c:forEach var="comment" items="${comments_view}">
				<tr>
				    <td> �����ˣ� </td>
				    <td>${comment.cauthor}</td>
					<td> IP�� </td>
					<td>${comment.cip}</td>
					<td> ����ʱ�䣺 </td>
					<td>${comment.cdate}</td>
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
      </ul>
      <ul class="classlist">
        <form action="util/do_add_comment.jsp?nid=${news_view.nid}" method="post" onSubmit="return checkComment()">
          <table width="80%" align="center">
            <tr>
              <td> �� �� </td>
            </tr>
            <tr>
              <td> �û����� </td>
              <td><input id="cauthor" name="cauthor" value="��һ����ʲôҲû����"/>
                IP��
                <input name="cip" value="<%=cip %>" readonly="readonly"/>
              </td>
            </tr>
            <tr>
              <td colspan="2"><textarea name="ccontent" cols="70" rows="10"></textarea>
              </td>
            </tr>
            <td><input name="submit" value="��  ��" type="submit"/>
              </td>
          </table>
        </form>
      </ul>
    </div>
  </div>
</div>
<%
	request.removeAttribute("news_view");
	request.removeAttribute("comments_view");
%>
<jsp:include page="index-elements/index_bottom.html" />
