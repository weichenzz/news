<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<c:if test="${sessionScope.admin == null}">
	<script type="text/javascript">
		alert("��ǰҳ��������ޣ������µ�¼�����˻���");
		open("../index.jsp","_self");	
	</script>
</c:if>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<title>���ŷ���ϵͳ�����̨</title>
<link href="../CSS/admin.css" rel="stylesheet" type="text/css" />
<div id="header">
  <div id="welcome">��ӭʹ�����Ź���ϵͳ��</div>
  <div id="nav">
    <div id="logo"><img src="../Images/logo.jpg" alt="�����й�" /></div>
    <div id="a_b01"><img src="../Images/a_b01.gif" alt="" /></div>
  </div>
</div>
<div id="admin_bar">
  <div id="status">����Ա�� ��¼  &#160;&#160;&#160;&#160; <a href="../util/do_logout.jsp">login out</a></div>
  <div id="channel"> </div>
</div>
</head>
<body>
