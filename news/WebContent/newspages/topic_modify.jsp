<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URL"%>
<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<jsp:include page="console_element/top.jsp" />
<script type="text/javascript">
	function check(){
		var tname = document.getElementById("tname");

		if(tname.value == ""){
			alert("�������������ƣ���");
			tname.focus();
			return false;
		}		
		return true;
	}
</script>
<%
	String tname = request.getParameter("tname");
%>
<div id="main">
  <jsp:include page="console_element/left.html" />
  <div id="opt_area">
    <h1 id="opt_type"> ������⣺ </h1>
    <form action="../util/do_update_topic.jsp" method="post" onsubmit="return check()">
      <p>
        <label> �������� </label>
        <input name="tname" type="text" class="opt_input" value="<%=tname %>"/>
        <input name="tid" type="hidden" value="<%=request.getParameter("tid") %>">
      </p>
      <input name="action" type="hidden" value="addtopic">
      <input type="submit" value="�ύ" class="opt_sub" />
      <input type="reset" value="����" class="opt_sub" />
    </form>
  </div>
</div>
<jsp:include page="console_element/bottom.html" />
