<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="gbk"%>
<%
	String uname = request.getParameter("uname");
	String password = request.getParameter("upwd");
	Class.forName("com.mysql.jdbc.Driver");	//�������ݿ�����
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/newsdb", "root", "root");
	String sql = "select * from USER where uname=? and upwd=?";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1,uname);
	ps.setString(2,password);
	ResultSet rs = ps.executeQuery();
	if(!rs.next()){
		rs.close();
		ps.close();
		con.close();
%>
<script type="text/javascript">
	alert("�û���������������µ�¼");
	open("../index.jsp","_self");	
</script>
<%
	}else{
		rs.close();
		ps.close();
		con.close();
		session.setAttribute("admin",uname);
		response.sendRedirect("../index.jsp");
	}
%>
