<%@ page language="java" import="java.util.*,java.sql.*,org.jbit.news.bean.*" pageEncoding="gbk"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<title>�����й�</title>
	
	<link href="CSS/main.css" rel="stylesheet" type="text/css" />
	<script language="javascript">
		function check(){
			var login_username = document.getElementById("uname");
			var login_password = document.getElementById("upwd");
			if(login_username.value == ""){
				alert("�û�������Ϊ�գ����������룡");
				login_username.focus();	
				return false;
			}else if(login_password.value == ""){
				alert("���벻��Ϊ�գ����������룡");
				login_password.focus();
				return false
			}
			return true;
		}
		
		function focusOnLogin(){
			var login_username = document.getElementById("uname");
			if( login_username != null )
				login_username.focus();	
		}
	</script>
</head>
<body onload="focusOnLogin()">
<div id="header">
	<div id="top_login">
	<c:if test="${sessionScope.admin == null}">
		<form action="util/do_login.jsp" method="post" onsubmit="return check()">
			<input type="text" id="uname"  name="uname" value="" class="login_input" />
			<label> ��&#160;&#160;�� </label>
			<input type="password" id="upwd" name="upwd" value="" class="login_input" />
			<input type="submit" class="login_sub" value="��¼" />
			<label id="error"> </label>
			<img src="Images/friend_logo.gif" alt="Google" id="friend_logo" />
		</form>
	</c:if>
	<c:if test="${sessionScope.admin != null}">
		��ӭ����${sessionScope.admin} &nbsp; &nbsp; &nbsp;<a href="newspages/admin.jsp">��¼����̨</a> &nbsp; <a href="util/do_logout.jsp">�˳�</a>
	</c:if>
  </div>
  <div id="nav">
    <div id="logo"> <img src="Images/logo.jpg" alt="�����й�" /> </div>
    <div id="a_b01"> <img src="Images/a_b01.gif" alt="" /> </div>
    <!--mainnav end-->
  </div>
</div>

